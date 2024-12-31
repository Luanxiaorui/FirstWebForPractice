package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取当前 session 对象
        HttpSession session = request.getSession(false);

        if (session != null) {
            // 清除 session 中的用户信息
            session.invalidate();
        }

        // 重定向到登录页面
        response.sendRedirect("index.jsp");

    }
}
