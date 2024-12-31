package servlet;

import dao.LoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Bean.User;

import java.io.IOException;

@WebServlet("/admin_login")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        System.out.println("doPost_AdminLoginServlet");
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String personalId = req.getParameter("personalId");
        String password = req.getParameter("password");

        LoginDAO loginDAO = new LoginDAO();

        try {
            boolean isExists = loginDAO.isExists("admin", personalId);
            if (!isExists) {
                resp.getWriter().println("<script type=\"text/javascript\">");
                resp.getWriter().println("alert('不存在该用户');");
                resp.getWriter().println("window.location.href = 'admin_login.jsp';");
                resp.getWriter().println("</script>");
            } else {
                User user = loginDAO.getUser("admin", personalId, password);
                if (user.getPassword().equals(password)) {
                    HttpSession session = req.getSession();
                    session.setAttribute("admin_user", user);
                    resp.sendRedirect(req.getContextPath() + "/adminSuper");

                } else {
                    resp.getWriter().println("<script type=\"text/javascript\">");
                    resp.getWriter().println("alert('用户名或密码错误');");
                    resp.getWriter().println("window.location.href = 'admin_login.jsp';");   // 重定向回原页面
                    resp.getWriter().println("</script>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
