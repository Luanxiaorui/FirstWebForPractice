<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
    <link rel="stylesheet" href="../../../css/personal-style.css">
</head>
<body>
<div class="personal-info">
    <h2>管理员个人信息</h2>
    <table>
        <tr>
            <th>账号</th>
            <td>${sessionScope.admin_user.personal_id}</td>
        </tr>
        <tr>
            <th>姓名</th>
            <td>${sessionScope.admin_user.name}</td>
        </tr>
        <tr>
            <th>邮箱</th>
            <td>${sessionScope.admin_user.email}</td>
        </tr>
    </table>

    <div class="button-container">
        <button id="edit_info_button" onclick="editPersonalInfo('changePwd')">编辑个人信息</button>
        <button id="edit_pwd_button" onclick="changePassword('changePwd')">修改密码</button>
    </div>
</div>
</body>
</html>
