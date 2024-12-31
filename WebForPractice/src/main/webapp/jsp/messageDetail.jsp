<%--
  Created by IntelliJ IDEA.
  User: 28016
  Date: 2024/12/31
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/general_style.css">
    <style>
        .message-box {
            border: 1px solid #ddd;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
        }
        .reply-box {
            margin-left: 20px;
            border: 1px dashed #ddd;
            padding: 10px;
            margin: 10px 0;
        }
        .delete-btn {
            color: red;
            cursor: pointer;
        }
        .reply-form {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp?page=message_board.jsp");
        return;
    }
%>
<header class="header">
    <div class="logo">
        <h1>计算机科学与技术</h1>
        <p>SHANGHAI UNIVERSITY OF ELECTRIC POWER</p>
    </div>
    <nav class="navbar">
        <a href="../index.jsp"> 首页 </a>
        <a href="../news_information">新闻动态</a>
        <a href="college_overview.jsp">学校概况</a>
        <a href="../teacher_group">学科建设</a>
        <a href="../admissions_employment">招生就业</a>
        <a href="../news_information">新闻动态</a>
        <a href="public_services.jsp">公共服务</a>
        欢迎, ${sessionScope.user.name}
        <a href="/logout">退出登录</a>
    </nav>
</header>
<main class="main-content">
    <div class="content">
        <aside class="sidebar">
            <ul>
                <li><a href="../resources_list">资源下载</a></li>
                <li><a href="../jsp/message_board.jsp">留言发布板</a></li>
                <li><a href="../message">我的留言</a></li>
                <li><a href="../publicMessage">公共留言</a></li>
                <li><a href="../jsp/publishResourceForTeacher.jsp">发布资源</a></li>
            </ul>
        </aside>
        <section class="news">
            <h2>留言详情</h2>

            <div class="message-box">
                <h3>${publisher.name} 留言：</h3>
                <p>${message.content}</p>
                <p>时间：${message.created_at}</p>
            </div>

            <h3>评论区</h3>

            <div>
                <c:forEach var="reply" items="${replies}">
                    <div class="reply-box">
                        <strong>${reply.user_id} 回复：</strong>
                        <p>${reply.content}</p>
                        <p>时间：${reply.created_at}</p>
                    </div>
                </c:forEach>
            </div>

            <!-- 回复表单 -->
            <div class="reply-form">
                <form action="/reply_submit" method="post">
                    <input type="hidden" name="parent_id" value="${message.message_id}">
                    <textarea name="reply_content" placeholder="在此回复留言..." required style="width: 100%; height: 100px;"></textarea><br>
                    <input type="submit" value="回复">
                </form>
            </div>

        </section>
    </div>
</main>
<!-- 底部 -->
<footer>
    &copy; 2024 计算机学院. 版权所有.
</footer>

</body>
</html>
