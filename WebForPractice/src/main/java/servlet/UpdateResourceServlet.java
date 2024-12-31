package servlet;

import Bean.Resource;
import dao.ResourceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;


/*
 * @description: 在编辑新闻界面点击“发布”按钮并确认后执行发布逻辑
 */
@WebServlet("/updateResource")
public class UpdateResourceServlet extends HttpServlet {
    ResourceDAO resourceDAO;
    @Override
    public void init() throws ServletException {
        resourceDAO = new ResourceDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("doPost_UpdateResourceServlet");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String resource_id = request.getParameter("resource_id");
        String title = request.getParameter("title");
        String file_path = request.getParameter("file_path");
        String upload_date = request.getParameter("upload_date");
        String description = request.getParameter("description");

        new Resource();
        Resource resource = Resource.builder()
                .resource_id(Integer.valueOf(resource_id))
                .upload_date(Timestamp.valueOf(upload_date))
                .title(title)
                .file_path(file_path).description(description).build();


        if (resourceDAO.updateResource(resource)) {
            response.getWriter().write("<script>alert('发布成功！'); window.location.href='adminSuper?pageContent=resourceEdit';</script>");
        } else {
            response.getWriter().write("<script>alert('发布失败，请稍后重试。'); window.history.back();</script>");
        }
    }
}
