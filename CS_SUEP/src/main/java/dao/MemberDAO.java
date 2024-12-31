package dao;

import Bean.Teacher;

import java.util.List;

public class MemberDAO extends BaseDAO{

    public List<Teacher>  getAllTeacherByType(String type){
        String sql="select * from faculty where title=?";
        return baseQuery(Teacher.class,sql,type);
    }

}
