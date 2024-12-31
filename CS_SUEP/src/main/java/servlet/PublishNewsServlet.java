package servlet;

import dao.NewsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Bean.News;

import java.io.IOException;

@WebServlet("/publishNews")
@MultipartConfig
public class PublishNewsServlet extends HttpServlet {
    NewsDAO newsDAO;

    @Override
    public void init() throws ServletException {
        newsDAO = new NewsDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("doPost_PublishNewsServlet");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");


        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String author = request.getParameter("author");
        String category = request.getParameter("category");

        boolean insertSuccess;

        News news = News.builder()
                .title(title)
                .content(content)
                .author(author)
                .category(category)
                .build();
        insertSuccess = newsDAO.insertNewsWithoutDate(news);

        if (insertSuccess) {
            response.getWriter().write("<script>alert('发布成功！'); window.location.href='adminSuper?pageContent=edit';</script>");
        } else {
            response.getWriter().write("<script>alert('发布失败，请稍后重试。'); window.history.back();</script>");
        }
    }
}
