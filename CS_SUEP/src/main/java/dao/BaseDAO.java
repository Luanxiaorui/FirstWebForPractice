package dao;

import utils.JDBCUtil;

import java.lang.reflect.Field;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class BaseDAO {
    /**
     * 公共的查询方法  返回单个对象（某列）
     * @param <T> 查询结果的类型
     * @param clazz 要查询的类的Class对象，用于指定返回对象的类型
     * @param sql 查询的SQL语句，可以包含占位符
     * @param args 查询SQL语句的参数，用于替换SQL语句中的占位符
     * @return 返回查询到的对象，如果没有查询到则返回null
     */
    public <T> T baseQueryObject(Class<T> clazz, String sql, Object... args) {
        T t = null;
        Connection connection = JDBCUtil.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int rows = 0;
        try {
            // 准备语句对象
            preparedStatement = connection.prepareStatement(sql);
            // 设置语句上的参数
            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]);
            }

            // 执行查询
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                t = (T) resultSet.getObject(1);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (null != resultSet) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (null != preparedStatement) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

            }
            JDBCUtil.releaseConnection();
        }
        return t;
    }

    /**
     * 公共的查询方法  返回对象的集合
     *
     * @param clazz 实体类类名 用于反射创建对象
     * @param sql 查询的SQL语句
     * @param args SQL语句中的参数
     * @return 返回一个包含查询结果的List集合
     */
    public <T> List<T> baseQuery(Class<T> clazz, String sql, Object... args) {
        List<T> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int rows = 0;
        try {
            // 准备语句对象
            preparedStatement = connection.prepareStatement(sql);
            // 设置语句上的参数
            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]);
            }
            // 执行查询
            resultSet = preparedStatement.executeQuery();

            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();

            // 将结果集通过反射封装成实体类对象
            while (resultSet.next()) {
                // 使用反射实例化对象
                Object obj = clazz.getDeclaredConstructor().newInstance();

                for (int i = 1; i <= columnCount; i++) {
                    String columnName = metaData.getColumnLabel(i);
                    Object value = resultSet.getObject(columnName);
                    // 处理datetime类型字段和java.util.Data转换问题
                    if (value.getClass().equals(LocalDateTime.class)) {
                        value = Timestamp.valueOf((LocalDateTime) value);
                    }
                    Field field = clazz.getDeclaredField(columnName);
                    field.setAccessible(true);
                    field.set(obj, value);
                }
                list.add((T) obj);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (null != resultSet) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (null != preparedStatement) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            JDBCUtil.releaseConnection();
        }
        return list;
    }

    /**
     * 提供一个获取单个对象的方法，简化单对象查询
     * 该方法用于执行查询，并期望结果集中最多只有一条记录
     * 如果查询结果为空或有多条记录，该方法将返回null或第一条记录
     *
     * @param <T>    期望返回的对象类型
     * @param clazz  对象类的Class对象，用于指定返回对象的类型
     * @param sql    查询SQL语句，可以包含占位符参数
     * @param args   查询SQL语句中的参数，将替换SQL语句中的占位符
     * @return       返回查询结果中的第一个对象，如果没有结果则返回null
     */
    public <T> T baseQuerySingle(Class<T> clazz, String sql, Object... args) {
        if (clazz == Integer.class) {
            Connection connection = JDBCUtil.getConnection();
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
            try {
                preparedStatement = connection.prepareStatement(sql);
                // 设置语句上的参数
                for (int i = 0; i < args.length; i++) {
                    preparedStatement.setObject(i + 1, args[i]);
                }
                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    return clazz.cast(Integer.parseInt(resultSet.getString(1)));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                JDBCUtil.releaseConnection();
            }
        }
        // 执行基础查询，获取可能包含多个对象的列表
        List<T> list = baseQuery(clazz, sql, args);
        // 检查列表是否非空且非空列表
        if (list != null && !list.isEmpty()) {
            // 返回列表中的第一个对象
            return list.get(0);
        }
        // 如果列表为空或null，返回null
        return null;
    }

    /**
     * 通用的增删改方法
     *
     * @param sql SQL语句，可以是增、删、改操作
     * @param args SQL语句中的参数，用于预编译语句
     * @return 返回影响的行数，表示操作成功与否
     */
    public int baseUpdate(String sql, Object... args) {
        // 获取连接
        Connection connection = JDBCUtil.getConnection();
        PreparedStatement preparedStatement = null;
        int rows = 0;
        try {
            // 准备语句对象
            preparedStatement = connection.prepareStatement(sql);
            // 设置语句上的参数
            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]);
            }
            // 执行 增删改 executeUpdate
            rows = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (null != preparedStatement) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            JDBCUtil.releaseConnection();
        }
        // 返回的是影响数据库记录数
        return rows;
    }

}

