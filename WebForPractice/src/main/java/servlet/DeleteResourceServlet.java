package servlet;

import dao.NewsDAO;
import dao.ResourceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.desktop.SystemEventListener;
import java.io.IOException;

@WebServlet("/resource_delete")
public class DeleteResourceServlet extends HttpServlet {
    private ResourceDAO resourceDAO;

    @Override
    public void init() throws ServletException {
        resourceDAO = new ResourceDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("doGet_DeleteResourceServlet");
        String id = request.getParameter("resource_id");
        if (resourceDAO.deleteResource(id)) {
            System.out.println("resource_delete_success");
            response.getWriter().write("<script>alert('删除成功！'); window.location.href='adminSuper?pageContent=resourceEdit&page=" +request.getParameter("page") +"';</script>");
        } else {
            System.out.println("resource_delete_fail");
            response.getWriter().write("<script>alert('删除失败，请稍后重试。'); window.history.back();</script>");
        }
    }
}
