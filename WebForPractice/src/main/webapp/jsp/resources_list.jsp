<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Bean.Resource" %>
<%@ page import="dao.ResourceDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>资源下载</title>
    <link rel="stylesheet" href="../css/general_style.css">
</head>
<body>
<header class="header">
    <div class="logo">
        <h1>计算机学院</h1>
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
<%--                <li><a href="#">资源下载</a></li>--%>
                <li><a href="../jsp/message_board.jsp">留言板</a></li>
                <li><a href="../message">我的留言</a></li>
                <li><a href="../publicMessage">公共论坛</a></li>
                <li><a href="../jsp/publishResourceForTeacher.jsp">资源发布</a></li>
            </ul>
        </aside>
        <section class="news"><h2>资源下载列表</h2>

            <ul class="resource-list">
                <%
                    List<Resource> list = (List)request.getAttribute("list");
                    for (Resource resource : list) {
                %>
                <li class="resource-item">
                    <a href="<%= resource.getFile_path() %>" class="resource-title" download>
                        <%= resource.getTitle() %>
                    </a>
                    <div class="resource-details">
                        <p>上传时间: <%= resource.getUpload_date() %></p>
                    </div>
                    <a href="<%= resource.getFile_path() %>" class="btn-download" download>下载</a>
                </li>
                <%
                    }
                %>
            </ul>
        </section>
    </div>.
</main>
<!-- 底部 -->
<footer>
    &copy; 2024 计算机学院. 版权所有.
</footer>
</body>
</html>


