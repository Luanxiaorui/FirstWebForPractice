package servlet;

import Bean.Message;
import Bean.Reply;
import Bean.User;
import dao.MessageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/message")
public class MyMessageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("MyMessageServlet doGet");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // 获取当前登录用户的ID
        String userId =  ((User)request.getSession().getAttribute("user")).getUser_id().toString();

        // 获取用户的留言和回复
        MessageDAO messageDAO = new MessageDAO();
        List<Message> messages = messageDAO.getMessagesByUserId(userId);
        List<Reply> replies = messageDAO.getReplyByUserId(userId);

        System.out.println(messages.size());
        // 将留言和回复传递给JSP页面
        request.setAttribute("messages", messages);
        request.setAttribute("replies", replies);
        request.setAttribute("userId", userId);

        // 转发到JSP页面
        request.getRequestDispatcher("jsp/myMessage.jsp").forward(request, response);
    }
}
