package dao;

import Bean.User;

public class LoginDAO extends BaseDAO{
    public boolean isExists(String role, String personalId) {
        return baseQuerySingle(User.class, "select * from users where role = ? and personal_id = ?", role, personalId) != null;
    }

    public User getUser(String role, String personalId, String password) {
        return baseQuerySingle(User.class, "select * from users where role = ? and personal_id = ? and password = ?", role, personalId, password);
    }


//    public static void main(String[] args) {
//        LoginDAO loginDAO = new LoginDAO();
//        System.out.println(loginDAO.isExists("admin", "10000000"));
//    }
}
