<%--
  Created by IntelliJ IDEA.
  User: Roy
  Date: 2024/12/22
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录界面</title>
    <link rel="stylesheet" href="../css/login_style.css">
</head>
<body>
<div class="login-container">
    <div class="login-header">
        计算机科学与技术学院<br>
    </div>
    <%
        String next_page = request.getParameter("page");
    %>
    <div class="login-form">
        <form action="/login?page=<%= next_page %>" method="post">
            <label for="username">用户名：</label>
            <input type="text" id="username" name="username" placeholder="请输入用户名">

            <label for="password">密码：</label>
            <input type="password" id="password" name="password" placeholder="请输入密码">

            <label for="usertype">用户类型：</label>
            <select id="usertype" name="usertype">
                <option value="student">学生</option>
                <option value="teacher">教师</option>
                <option value="admin">管理员</option>
            </select>

            <button type="submit">登录</button>
            <button type="reset">重置</button>
        </form>
        <c:if test="${not empty errorMessage}">
            <p style="color: red;">${errorMessage}</p>
        </c:if>
    </div>


    <div class="login-footer">
        计算机科学与技术学院
    </div>
</div>

</body>
</html>

