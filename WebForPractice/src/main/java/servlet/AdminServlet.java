package servlet;

import Bean.Resource;
import dao.NewsDAO;
import dao.ResourceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Bean.News;
import Bean.User;


import java.io.IOException;
import java.util.List;


@WebServlet("/adminSuper")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        System.out.println("AdminServlet doGet");
        // 检查用户是否已登录并且是管理员
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("admin_user") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin_login.jsp");
            return;
        }

        User user = (User) session.getAttribute("admin_user");
        String role = user.getRole(); // 假设 User 类有 getRole() 方法
        if (!"admin".equals(role)) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "您没有访问权限");
            return;
        }


        // 获取 'page' 参数
        String pageContent = req.getParameter("pageContent");
        if (pageContent == null) {
            pageContent = "edit"; // 默认页面
        }


        // 根据 'page' 参数设置不同的数据
        if ("edit".equals(pageContent)) {
            try {
                List<News> list = new NewsDAO().getAllNews();
                String p = req.getParameter("page");
                // 计算分页相关的参数
                int pageSize = 5;  // 每页显示的新闻条数
                int currentPage = p == null ? 1 : Integer.parseInt(p);  // 当前页
                int totalNews = list.size();  // 获取总新闻条数
                int totalPages = (int) Math.ceil((double) totalNews / pageSize);  // 总页数

                List<News> newsList = list.subList((currentPage - 1) * pageSize, (currentPage - 1) * pageSize + Math.min(pageSize, totalNews - (currentPage - 1) * pageSize));

                req.setAttribute("newsList", newsList);
                req.setAttribute("totalPages", totalPages);
                req.setAttribute("currentPage", currentPage);
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("error", "无法获取新闻列表");
            }
        } else if ("resourceEdit".equals(pageContent)) {
            try {
                List<Resource> list = new ResourceDAO().selectAll();
                String p = req.getParameter("page");
                // 计算分页相关的参数
                int pageSize = 5;  // 每页显示的条数
                int currentPage = p == null ? 1 : Integer.parseInt(p);  // 当前页
                int totalResources = list.size();  // 获取总条数
                int totalPages = (int) Math.ceil((double) totalResources / pageSize);  // 总页数


                List<Resource> resourceList = list.subList((currentPage - 1) * pageSize, (currentPage - 1) * pageSize + Math.min(pageSize, totalResources - (currentPage - 1) * pageSize));

                req.setAttribute("resourceList", resourceList);
                req.setAttribute("totalPages", totalPages);
                req.setAttribute("currentPage", currentPage);
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("error", "无法获取新闻列表");
            }
        }

        // 设置当前页面
        req.setAttribute("currentPageContent", pageContent);

        // 转发到 admin.jsp
        req.getRequestDispatcher("/jsp/user/admin/admin.jsp").forward(req, resp);
    }
}
