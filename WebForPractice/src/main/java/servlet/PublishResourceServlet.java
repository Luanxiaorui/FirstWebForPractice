package servlet;

import Bean.User;
import dao.ResourceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Objects;


/*
 * @description: 在编辑新闻界面点击“发布”按钮并确认后执行发布逻辑
 */
@WebServlet("/publishResource")
@MultipartConfig // 开启文件上传支持
public class PublishResourceServlet extends HttpServlet {
    ResourceDAO resourceDAO;

    @Override
    public void init() throws ServletException {
        resourceDAO = new ResourceDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("doPost_PublishResourceServlet");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        User user = (User) request.getSession().getAttribute("user");
        User admin = (User) request.getSession().getAttribute("admin_user");
        if (admin == null && (Objects.equals(user.getRole(), "student"))) {
            response.getWriter().write("<script>alert('你没有权限发布'); window.history.back();</script>");
            return;
        }



        String title = request.getParameter("title");
        String file_path = request.getParameter("file_path");
        String description = request.getParameter("description") == null ? "无" : request.getParameter("description");
        String lastPage = request.getParameter("lastPage");
        // 获取上传的文件
        Part filePart = request.getPart("file");

        // 处理标题为空的情况
        if (title == null || title.trim().isEmpty()) {
            response.getWriter().write("<script>alert('标题为空！'); window.history.back();</script>");
            return;
        }

        // 如果 URL 和文件都没有提供
        if ((file_path == null || file_path.trim().isEmpty()) && (filePart == null || filePart.getSize() == 0)) {
            response.getWriter().write("<script>alert('请提供文件或URL！'); window.history.back();</script>");
            return;
        }

        // 处理文件上传资源
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = filePart.getSubmittedFileName();
            String filePath = getServletContext().getRealPath("/uploads") + "/" + fileName;

            File file = new File(filePath);

            try (InputStream inputStream = filePart.getInputStream()) {
                // 将文件内容复制到指定路径
                Files.copy(inputStream, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                System.out.println("文件上传成功：" + filePath);
            }
            String url = "/uploads/" + fileName;
            resourceDAO.addResource(title, url, description);

            if (lastPage == null) {
                response.getWriter().write("<script>alert('发布成功！'); window.location.href='adminSuper?pageContent=resourcePublish';</script>");
            } else {
                response.getWriter().write("<script>alert('发布成功！'); window.history.back();</script>");
            }
            return;
        }


        if (resourceDAO.addResource(title, file_path, description)) {
            if (lastPage == null) {
                response.getWriter().write("<script>alert('发布成功！'); window.location.href='adminSuper?pageContent=resourcePublish';</script>");
            } else {
                response.getWriter().write("<script>alert('发布成功！'); window.history.back();</script>");
            }
        } else {
            response.getWriter().write("<script>alert('发布失败，请稍后重试。'); window.history.back();</script>");
        }
    }
}
