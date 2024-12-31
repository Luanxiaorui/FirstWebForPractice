package servlet;

import dao.AdmissionEmploymentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Bean.AdmissionsEmployment;


import java.io.IOException;
import java.util.List;

@WebServlet("/admissions_employment")
public class AdmissionEmploymentServlet extends HttpServlet {
    private AdmissionEmploymentDAO admissionEmploymentDAO;
    @Override
    public void init() throws ServletException {
        admissionEmploymentDAO = new AdmissionEmploymentDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("doGet_AdmissionEmployment");

        // 获取分页参数
        String pageParam = request.getParameter("page");
        String type = request.getParameter("type");
        if (type == null || (!type.equals("admission") && !type.equals("employment")))
            type = "admission";
        int page = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
        int pageSize = 5; // 每页显示 5 条

        // 获取新闻数据
        List<AdmissionsEmployment> admissionsEmploymentList = admissionEmploymentDAO.getAdmissionsEmploymentByPageType(page, type, pageSize);
        int totalNewsCount = admissionEmploymentDAO.getTotalAdmissionsEmploymentCountByType(type);
        int totalPages = (int) Math.ceil((double) totalNewsCount / pageSize);


        // 将数据存入请求对象
        request.setAttribute("admissionsEmploymentList", admissionsEmploymentList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // 转发到 JSP 页面
        request.getRequestDispatcher("jsp/admissions_employment.jsp").forward(request, response);
    }
}

