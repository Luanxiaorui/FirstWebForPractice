<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>留言板</title>
    <link rel="stylesheet" href="../css/general_style.css">
</head>
<body>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp?page=message_board.jsp");
        return ;
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
                <li><a href="../message">我的留言与回复</a></li>
                <li><a href="../jsp/publishResourceForTeacher.jsp">发布资源</a></li>
                <li><a href="../publicMessage">公共论坛</a></li>
            </ul>
        </aside>
        <section class="news">
            <h1>留言板</h1>
            <form action="/message_submit?user_id=${sessionScope.user.user_id}" method="post">
                <label for="message">留言内容:</label><br>
                <textarea id="message" name="message" required style="width: 100%; height: 200px;"></textarea><br><br>
                <input type="hidden" name="submitType" value="sm" />
                <input type="submit" value="sm" onclick="this.form.submitType.value='sm'" />
                <input type="hidden" name="submitType" value="nm" />
                <input type="submit" value="nm" onclick="this.form.submitType.value='nm'" />
            </form>
        </section>
    </div>
</main>
<!-- 底部 -->
<footer>
    &copy; 2024 计算机学院. 版权所有.
</footer>
</body>
</html>


