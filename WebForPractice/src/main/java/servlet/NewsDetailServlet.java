package servlet;

import dao.NewsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Bean.News;
import java.io.IOException;

@WebServlet("/news_detail")
public class NewsDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doGet_news_detail");

        NewsDAO newsDAO = new NewsDAO();
        News news = newsDAO.getOneNews(request.getParameter("id"));
        request.setAttribute("news", news);

        // 转发到 JSP 页面
        request.getRequestDispatcher("jsp/news_detail.jsp").forward(request, response);
    }
}

