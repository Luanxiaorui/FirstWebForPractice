package utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtil {
    private static ThreadLocal<Connection> threadLocal = new ThreadLocal<>();

    private static final DataSource dataSource;

    // 初始化连接池
    static {
        // 可以帮助我们读取.properties配置文件
        Properties properties = new Properties();
        InputStream resourceAsStream = JDBCUtil.class.getClassLoader().getResourceAsStream("jdbc.properties");
        try {
            properties.load(resourceAsStream);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        try {
            dataSource = DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }
    /*1 向外提供连接池的方法*/
//    public static DataSource getDataSource(){
//        return dataSource;
//    }

    /**
     * 向外提供数据库连接的方法
     *
     * 本方法旨在解决数据库连接的重复创建问题，通过ThreadLocal确保每个线程仅创建并使用一个连接
     * 这样做既提高了效率，又避免了潜在的并发问题
     *
     * @return Connection 数据库连接对象
     * @throws RuntimeException 当无法获取数据库连接时抛出运行时异常，由调用者处理
     */
    public static Connection getConnection() {
        // 尝试从当前线程获取数据库连接
        Connection connection = threadLocal.get();
        // 如果当前线程没有数据库连接，则从数据源获取新的连接
        if (null == connection) {
            try {
                connection = dataSource.getConnection();
            } catch (SQLException e) {
                // 如果获取连接失败，抛出运行时异常
                throw new RuntimeException(e);
            }
            // 将新获取的连接保存到当前线程
            threadLocal.set(connection);
        }

        // 返回数据库连接
        return connection;
    }


    /**
     * 定义一个归还连接的方法 (解除和ThreadLocal之间的关联关系)
     * 此方法用于释放ThreadLocal中存储的数据库连接，以避免内存泄漏和资源未正确回收的问题
     */
    public static void releaseConnection() {
        // 从ThreadLocal中获取当前线程的数据库连接
        Connection connection = threadLocal.get();
        // 检查连接是否存在
        if (null != connection) {
            // 移除ThreadLocal中的连接，以避免内存泄漏
            threadLocal.remove();
            // 把连接设置回自动提交的连接
            try {
                connection.setAutoCommit(true);
                // 自动归还到连接池
                connection.close();
            } catch (SQLException e) {
                // 如果出现SQLException，则将其包装为RuntimeException并抛出
                throw new RuntimeException(e);
            }
        }
    }
}

