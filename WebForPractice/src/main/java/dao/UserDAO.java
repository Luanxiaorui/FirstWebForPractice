package dao;

import Bean.User;

public class UserDAO extends BaseDAO{

    public User check(String username, String password, String role) {
        String sql = "select * from users where personal_id=? and password=? and role=?";
        return baseQuerySingle(User.class, sql, username, password, role);
    }
    public User selectByUserId(String userId) {
        String sql = "select * from users where personal_id=?";
        return baseQuerySingle(User.class, sql, userId);
    }


}
