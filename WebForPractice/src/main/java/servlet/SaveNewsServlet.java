package servlet;

import dao.NewsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Bean.News;

import java.io.IOException;
import java.sql.Timestamp;


/*
 * @description: 在编辑新闻界面点击“发布”按钮并确认后执行发布逻辑
 */
@WebServlet("/updateNews")
public class SaveNewsServlet extends HttpServlet {
    NewsDAO newsDAO;
    @Override
    public void init() throws ServletException {
        newsDAO = new NewsDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("do_Post_saveNewsServlet");

        String newsIdStr = request.getParameter("newsId");
        String title = request.getParameter("title");
        String content = request.getParameter("content");


        News news = News.builder()
                .news_id(Integer.parseInt(newsIdStr))
                .title(title)
                .content(content)
                .build();


        if (newsDAO.updateNews(news)) {
            response.getWriter().write("<script>alert('发布成功！'); window.location.href='adminSuper?pageContent=edit';</script>");
        } else {
            response.getWriter().write("<script>alert('发布失败，请稍后重试。'); window.history.back();</script>");
        }
    }
}
