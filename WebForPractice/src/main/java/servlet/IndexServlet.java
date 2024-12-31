package servlet;

import dao.NewsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Bean.News;


import java.io.IOException;
import java.util.List;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {
    private NewsDAO newsDAO;
    @Override
    public void init() throws ServletException {
        newsDAO = new NewsDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("doGet_IndexServlet");
        // 获取新闻数据
        List<News> newsList = newsDAO.getLatestNews(5);
        // 将数据存入请求对象
        request.setAttribute("latestNews", newsList);

        // 转发到 JSP 页面
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}

