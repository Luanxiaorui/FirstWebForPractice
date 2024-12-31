package servlet;

import dao.MessageDAO;
import dao.UserDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/message_submit")
public class MessageSubmit extends HttpServlet {
    private MessageDAO messageDAO;

    @Override
    public void init() {
        messageDAO = new MessageDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("doPost_MessageSubmit");
        String user_id = request.getParameter("user_id");
        String content = request.getParameter("message");
        String submitType = request.getParameter("submitType");
        System.out.println(submitType);
        user_id = submitType.equals("nm") ? "666" : user_id;
        if (!(content == null || content.isEmpty()) && messageDAO.addMessage(user_id, content)) {
            response.getWriter().write("<script>alert('发布成功！'); window.location.href='jsp/message_board.jsp';</script>");
        } else {
            response.getWriter().write("<script>alert('发布失败，请稍后重试。'); window.history.back();</script>");
        }
    }
}
