package servlet;
import dao.MemberDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Bean.Teacher;


import java.io.IOException;
import java.util.List;


@WebServlet("/teacher_group")
public class TeacherServlet extends HttpServlet {
    private MemberDAO memberDAO;

    @Override
    public void init() {
        memberDAO = new MemberDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doGet_TeacherServlet");

        // 从数据库中查询数据
        List<Teacher> professors = memberDAO.getAllTeacherByType("教授");
        List<Teacher> vice_professors = memberDAO.getAllTeacherByType("副教授");
        List<Teacher> lectures = memberDAO.getAllTeacherByType("讲师");


        // 将数据存入请求对象
        request.setAttribute("教授", professors);
        request.setAttribute("副教授", vice_professors);
        request.setAttribute("讲师", lectures);

        // 转发到 JSP 页面
        request.getRequestDispatcher("jsp/teacher_group.jsp").forward(request, response);
    }
}