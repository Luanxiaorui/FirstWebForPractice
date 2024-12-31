package servlet;

import dao.NewsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Bean.News;

import java.io.IOException;

/*
 * @description: 在编辑界面点击“编辑”按钮之后跳转到编辑新闻的界面
 */
@WebServlet("/editNews")
public class EditNewsServlet extends HttpServlet {
    private NewsDAO newsDAO;

    @Override
    public void init() {
        newsDAO = new NewsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("doGet_EditNewsServlet");
        String newsIdStr = request.getParameter("news_id");
        if (newsIdStr == null || newsIdStr.isEmpty()) {
            response.sendRedirect("/jsp/user/admin/admin.jsp?error=missing_id");
            return ;
        }

        try {
            News news = newsDAO.getOneNews(newsIdStr);
            if (news == null) {
                response.sendRedirect("/jsp/user/admin/admin.jsp?error=notfound");
                return ;
            }

            request.setAttribute("news", news);
            request.getRequestDispatcher("/jsp/user/admin/editNews.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("/jsp/user/admin/admin.jsp?error=invalid_id");
        }
    }
}
