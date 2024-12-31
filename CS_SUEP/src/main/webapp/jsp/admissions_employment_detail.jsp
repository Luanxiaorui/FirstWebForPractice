<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Bean.AdmissionsEmployment" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>招生就业</title>
    <link rel="stylesheet" href="../css/general_style.css">
</head>
<body>
<header class="header">
    <div class="logo">
        <h1>计算机科学与技术</h1>
        <p>SHANGHAI UNIVERSITY OF ELECTRIC POWER</p>
    </div>
    <nav class="navbar">
        <a href="../index.jsp"> 首页 </a>
        <a href="../news_information">新闻动态</a>
        <a href="../jsp/college_overview.jsp">学校概况</a>
        <a href="../teacher_group">学科建设</a>
        <a href="../jsp/public_services.jsp">公共服务</a>
        <!-- 二级目录导航 -->
        <div class="dropdown">
            <a href="#" class="dropbtn">个人服务</a>
            <div class="dropdown-content">
                <a href="../jsp/message_board.jsp">留言板</a>
                <a href="../resources_list">资源下载</a>
            </div>
        </div>
    </nav>
</header>
<main class="main-content">
    <div class="content">
        <aside class="sidebar">
            <ul>
                <li><a href="admissions_employment?type=admission">招生信息</a></li>
                <li><a href="admissions_employment?type=employment">就业信息</a></li>
            </ul>
        </aside>
        <section class="news">
            <%
                AdmissionsEmployment admissionsEmployment = (AdmissionsEmployment) request.getAttribute("admissionEmployment");
            %>

            <h3><%= admissionsEmployment.getTitle() %></h3>
            <p><%= admissionsEmployment.getContent()%></p>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </section>
    </div>
</main>
<!-- 底部 -->
<footer>
    &copy; 2024 计算机学院. 版权所有.
</footer>
</body>
</html>


