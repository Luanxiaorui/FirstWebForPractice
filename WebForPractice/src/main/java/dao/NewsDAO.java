package dao;

import Bean.News;

import java.util.List;

public class NewsDAO extends BaseDAO {
    public List<News> getAllNews() {
        String sql = "SELECT * FROM news ORDER BY publish_date DESC";
        return baseQuery(News.class, sql);
    }

    public List<News> getLatestNews(int count) {
        String sql = "SELECT * FROM news ORDER BY publish_date DESC LIMIT ?";
        return baseQuery(News.class, sql, count);
    }
    // 分页查询新闻
    public List<News> getNewsByPage(int page, String type, int pageSize) {
        String sql = "SELECT * FROM news where category = ? ORDER BY publish_date DESC LIMIT ? OFFSET ?";
        int offset = (page - 1) * pageSize;
        return  baseQuery(News.class, sql, type, pageSize, offset);
    }

    // 获取总新闻条数
    public int getTotalNewsCountByType(String type) {
        String sql = "SELECT COUNT(*) FROM news where category = ?";
        return baseQuerySingle(Integer.class, sql, type);
    }

    public News getOneNews(String id) {
        String sql = "SELECT * FROM news WHERE news_id = ?";
        return baseQuerySingle(News.class, sql, id);
    }
    public boolean updateNews(News news) {
        return baseUpdate("UPDATE news SET title = ?, content = ? WHERE news_id = ?",
                news.getTitle(), news.getContent(), news.getNews_id()) > 0;
    }

    public boolean insertNewsWithoutDate(News news) {
        String sql = "insert into news (title, content, author, category) values ( ?, ?, ?, ?)";
        return baseUpdate(sql, news.getTitle(), news.getContent(), news.getAuthor(), news.getCategory()) > 0;
    }

    public boolean deleteNews(String id) {
        String sql = "DELETE FROM news WHERE news_id = ?";
        return baseUpdate(sql, id) > 0;
    }
}
