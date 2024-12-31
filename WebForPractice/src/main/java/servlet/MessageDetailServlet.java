package servlet;

import Bean.Message;
import Bean.Reply;
import Bean.User;
import dao.MessageDAO;
import dao.NewsDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Bean.News;
import java.io.IOException;
import java.util.List;

@WebServlet("/message_detail")
public class MessageDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("doGet_MessageDetailServlet");

        MessageDAO dao = new MessageDAO();
        Message message = dao.getMessagesByMessageId(request.getParameter("messageId"));
        List<Reply> replies = dao.getReplyByMessageId(String.valueOf(message.getMessage_id()));
        User publisher = new UserDAO().selectByUserId(String.valueOf(message.getUser_id()));

        System.out.println(replies.size());

        request.setAttribute("message", message);
        request.setAttribute("replies", replies);
        request.setAttribute("publisher", publisher);

        // 转发到 JSP 页面
        request.getRequestDispatcher("jsp/messageDetail.jsp").forward(request, response);
    }
}

