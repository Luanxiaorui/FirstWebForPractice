package servlet;

import Bean.Resource;
import dao.ResourceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/*
 * @description: 在编辑界面点击“编辑”按钮之后跳转到编辑新闻的界面
 */
@WebServlet("/editResource")
public class EditResourceServlet extends HttpServlet {
    private ResourceDAO resourceDAO;

    @Override
    public void init() {
        resourceDAO = new ResourceDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doGet_EditResourceServlet");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String resourceId = request.getParameter("resource_id");
        if (resourceId == null || resourceId.isEmpty()) {
            response.sendRedirect("/jsp/user/admin/admin.jsp?error=missing_id");
            return ;
        }

        try {
            Resource resource = resourceDAO.selectResource(resourceId);
            if (resource == null) {
                response.sendRedirect("/jsp/user/admin/admin.jsp?error=notfound");
                return ;
            }

            request.setAttribute("resource", resource);
            request.getRequestDispatcher("/jsp/user/admin/editResource.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("/jsp/user/admin/admin.jsp?error=invalid_id");
        }
    }
}
