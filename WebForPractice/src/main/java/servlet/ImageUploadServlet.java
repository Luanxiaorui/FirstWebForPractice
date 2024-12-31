package servlet;

import com.google.gson.JsonObject;
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

@WebServlet("/uploadImage")
@MultipartConfig
public class ImageUploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost_ImageUploadServlet");
        // 获取上传的图片文件
        Part filePart = request.getPart("upload");
        String fileName = filePart.getSubmittedFileName();
        System.out.println(fileName);

        // 目标存储路径
        String uploadDir = getServletContext().getRealPath("/uploads");
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs();  // 如果目录不存在，创建目录
        }

        // 保存文件
        String filePath = uploadDir + "/" + fileName;
        File file = new File(filePath);
        try (InputStream inputStream = filePart.getInputStream()) {
            Files.copy(inputStream, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }

        // 返回文件的URL以供CKEditor插入
//        String fileUrl = "/uploads/" + fileName;
        String fileUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/uploads/" + fileName;
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("uploaded", 1);
        jsonResponse.addProperty("fileName", fileName);
        jsonResponse.addProperty("url", fileUrl);

        System.out.println(jsonResponse.toString());
        // 设置响应类型为JSON
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
    }
}
