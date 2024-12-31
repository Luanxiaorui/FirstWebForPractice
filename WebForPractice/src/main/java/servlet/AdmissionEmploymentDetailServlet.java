package servlet;

import dao.AdmissionEmploymentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Bean.AdmissionsEmployment;

import java.io.IOException;

@WebServlet("/admissions_employment_detail")
public class AdmissionEmploymentDetailServlet extends HttpServlet {
    private AdmissionEmploymentDAO admissionEmploymentDAO;
    @Override
    public void init() throws ServletException {
        admissionEmploymentDAO = new AdmissionEmploymentDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doGet_admission_employment_detail");

        AdmissionsEmployment news = admissionEmploymentDAO.getOneAdmissionEmployment(request.getParameter("id"));
        request.setAttribute("admissionEmployment", news);

        // 转发到 JSP 页面
        request.getRequestDispatcher("jsp/admissions_employment_detail.jsp").forward(request, response);
    }
}

