package dao;

import Bean.News;
import Bean.Resource;

import java.util.List;

public class ResourceDAO extends BaseDAO{
    public List<Resource> selectAll(){
        String sql="select * from resources";
        return baseQuery(Resource.class, sql);
    }
    public boolean addResource(Object... args){
        String sql="insert into resources(title,file_path,description) values(?,?,?)";
        return baseUpdate(sql,args) > 0;
    }
    public boolean updateResource(String title, String path ){
        String sql="update resources set title=?,file_path=? where resource_id=?";
        return baseUpdate(sql,title, path) > 0;
    }
    public boolean deleteResource(String id){
        String sql="delete from resources where resource_id=?";
        return baseUpdate(sql,id) > 0;
    }
    public Resource selectResource(String id){
        String sql="select * from resources where resource_id=?";
        return  baseQuerySingle(Resource.class, sql, id);
    }
    public boolean updateResource(Resource resource) {
        return baseUpdate("UPDATE resources SET title = ?, file_path = ?,  upload_date = ?, description=? WHERE resource_id = ?",
                resource.getTitle(), resource.getFile_path(), resource.getUpload_date(), resource.getDescription(),  resource.getResource_id()) > 0;
    }
}
