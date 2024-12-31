package servlet;

import Bean.Message;
import dao.MessageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.util.List;

@WebServlet("/publicMessage")
public class PublicMessageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("PublicMessageServlet doGet");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 获取用户的留言和回复
        MessageDAO messageDAO = new MessageDAO();
        List<Message> messages = messageDAO.getAllMessages();

        System.out.println(messages.size());
        // 将留言和回复传递给JSP页面
        request.setAttribute("messages", messages);

        // 转发到JSP页面
        request.getRequestDispatcher("jsp/publicMessage.jsp").forward(request, response);
    }
}
