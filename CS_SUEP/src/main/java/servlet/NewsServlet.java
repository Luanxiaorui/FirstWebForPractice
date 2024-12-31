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

@WebServlet("/news_information")
public class NewsServlet extends HttpServlet {
    private NewsDAO newsDAO;
    @Override
    public void init() throws ServletException {
        newsDAO = new NewsDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("doGet_news_information");

        // 获取分页参数
        String pageParam = request.getParameter("page");
        String type = request.getParameter("type");
        if (type == null || (!type.equals("校园新闻") && !type.equals("学术新闻")))
            type = "校园新闻";
        int page = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
        int pageSize = 5; // 每页显示 10 条

        // 获取新闻数据
        List<News> newsList = newsDAO.getNewsByPage(page, type, pageSize);
        int totalNewsCount = newsDAO.getTotalNewsCountByType(type);
        int totalPages = (int) Math.ceil((double) totalNewsCount / pageSize);


        // 将数据存入请求对象
        request.setAttribute("newsList", newsList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // 转发到 JSP 页面
        request.getRequestDispatcher("jsp/news_information.jsp").forward(request, response);
    }
}

