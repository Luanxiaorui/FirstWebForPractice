package dao;


import Bean.AdmissionsEmployment;

import java.util.List;

public class AdmissionEmploymentDAO extends BaseDAO {
    public List<AdmissionsEmployment> getAllAdmissionEmployment() {
        String sql = "SELECT * FROM admissions_employment ORDER BY publish_date DESC";
        return baseQuery(AdmissionsEmployment.class, sql);
    }

    public List<AdmissionsEmployment> getLatestAdmissionsEmployment(int count) {
        String sql = "SELECT * FROM admissions_employment ORDER BY publish_date DESC LIMIT ?";
        return baseQuery(AdmissionsEmployment.class, sql, count);
    }
    // 分页查询新闻
    public List<AdmissionsEmployment> getAdmissionsEmploymentByPageType(int page, String type, int pageSize) {
        String sql = "SELECT * FROM admissions_employment where type = ? ORDER BY publish_date DESC LIMIT ? OFFSET ?";
        int offset = (page - 1) * pageSize;
        return  baseQuery(AdmissionsEmployment.class, sql, type, pageSize, offset);
    }

    // 获取总新闻条数
    public int getTotalAdmissionsEmploymentCountByType(String type) {
        String sql = "SELECT COUNT(*) FROM admissions_employment where type = ?";
        return baseQuerySingle(Integer.class, sql, type);
    }

    public AdmissionsEmployment getOneAdmissionEmployment(String id) {
        String sql = "SELECT * FROM admissions_employment WHERE ae_id = ?";
        return baseQuerySingle(AdmissionsEmployment.class, sql, id);
    }
}
