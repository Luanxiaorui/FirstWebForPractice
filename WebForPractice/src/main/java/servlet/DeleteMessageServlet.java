package servlet;

import dao.MessageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete_message")
public class DeleteMessageServlet extends HttpServlet {
    private MessageDAO messageDAO;

    @Override
    public void init() throws ServletException {
        messageDAO = new MessageDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("messageId");
        System.out.println("doGet_DeleteMessageServlet");
        if (messageDAO.deleteMessage(id)) {
            System.out.println("delete success message");
            response.getWriter().write("<script>alert('删除成功！'); window.history.back();</script>");
        } else {
            System.out.println("delete fail message");
            response.getWriter().write("<script>alert('删除失败，请稍后重试。'); window.history.back();</script>");
        }
    }
}
