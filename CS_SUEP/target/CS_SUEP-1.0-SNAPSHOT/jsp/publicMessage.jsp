<%@ page import="Bean.User" %><%--
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
    <title>公共讨论</title>
    <link rel="stylesheet" href="../css/general_style.css">
    <link rel="stylesheet" href="../css/MyMessage-style.css">
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
                <li><a href="../message">我的留言与回复</a></li>
                <li><a href="../jsp/publishResourceForTeacher.jsp">发布资源</a></li>
            </ul>
        </aside>
        <section class="news">
            <!-- 留言展示区域 -->
            <div id="messages">
                <h3>所有留言</h3>
                <c:forEach var="message" items="${messages}">
                    <div class="message-box" id="message-${message.message_id}">
                        <h4>${message.content}</h4>
                        <p>时间：${message.created_at}</p>
                        <button onclick="location.href='/message_detail?messageId=${message.message_id}'">查看详情
                        </button>
                        <%
                            User user = (User) request.getSession().getAttribute("user");
                            if (user.getRole().equals("admin")) {
                        %>
                        <button class="delete-btn" onclick="deleteMessage(${message.message_id})">删除留言</button>
                        <%
                            }
                        %>
                    </div>
                </c:forEach>
            </div>

        </section>
    </div>
</main>
<!-- 底部 -->
<footer>
    &copy; 2024 计算机学院. 版权所有.
</footer>
<script>
    // 删除留言
    function deleteMessage(messageId) {
        if (confirm("确认删除此留言？")) {
            location.href = '/delete_message?messageId=' + messageId;
        }
    }
</script>
</body>
</html>
