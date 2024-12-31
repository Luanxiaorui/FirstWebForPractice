package servlet;


import Bean.User;
import dao.MessageDAO;
import dao.ResourceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reply_submit")
public class ReplySubmitServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("doPost_ReplySubmitServlet");

        User user = (User) request.getSession().getAttribute("user");
        String UserId = user.getUser_id().toString();
        String messageId = request.getParameter("parent_id");
        String content = request.getParameter("reply_content");

        MessageDAO messageDAO = new MessageDAO();
        if (messageDAO.addReply( messageId,UserId, content)) {
            response.getWriter().write("<script>alert('发布成功！'); window.location.href='/message_detail?messageId="+ messageId+"';</script>");
        } else {
            response.getWriter().write("<script>alert('发布失败，请稍后重试。'); window.history.back();</script>");
        }
    }
}

