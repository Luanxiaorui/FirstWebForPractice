package servlet;
import Bean.Resource;
import dao.ResourceDAO;
import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Bean.User;

import java.io.IOException;
import java.util.List;


@WebServlet("/resources_list")
public class ResourceListServlet extends HttpServlet {
    private ResourceDAO resourceDAO;

    @Override
    public void init() {
        resourceDAO = new ResourceDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("doGet_ResourceList");
        if (request.getSession() == null || request.getSession().getAttribute("user") == null) {
            response.sendRedirect("jsp/login.jsp?page=resources_list");
            return;
        }
        List<Resource> list = resourceDAO.selectAll();
        request.setAttribute("list", list);

        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/resources_list.jsp");
        dispatcher.forward(request, response);
    }
}