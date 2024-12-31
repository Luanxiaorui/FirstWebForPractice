package servlet;
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


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doPost_login");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("usertype");

        // 验证输入的合法性
        String errorMessage = null;
        User user = null;
        // 例子：判断用户名和密码是否为空
        if (username == null || username.isEmpty()) {
            errorMessage = "用户名不能为空！";
        } else if (password == null || password.isEmpty()) {
            errorMessage = "密码不能为空！";
        } else {
            // 进行进一步的合法性检查，比如判断用户名和密码是否符合要求
            user = userDAO.check(username, password, role);
            if (user == null) {
                errorMessage = "密码或账号错误";
            }
        }

        // 如果有错误消息，返回登录页面并显示错误
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/login.jsp");
            dispatcher.forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            String page = request.getParameter("page");
            String path = (page.endsWith("jsp") ?  "jsp/" : "") + page;
            response.sendRedirect(path);
        }
    }
}