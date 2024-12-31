package servlet;

import dao.NewsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/news_delete")
public class DeleteNewsServlet extends HttpServlet {
    private NewsDAO newsDAO;

    @Override
    public void init() throws ServletException {
        newsDAO = new NewsDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("news_id");
        if (newsDAO.deleteNews(id)) {
            System.out.println("delete success news");
            response.getWriter().write("<script>alert('删除成功！'); window.location.href='adminSuper?pageContent=edit&page=" +request.getParameter("page") +"';</script>");
        } else {
            System.out.println("delete fail news");
            response.getWriter().write("<script>alert('删除失败，请稍后重试。'); window.history.back();</script>");
        }
    }
}
