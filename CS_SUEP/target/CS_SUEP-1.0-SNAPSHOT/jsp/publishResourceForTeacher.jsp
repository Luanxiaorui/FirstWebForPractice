<%--
  Created by IntelliJ IDEA.
  User: 28016
  Date: 2024/12/31
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>发布资源</title>
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
                <li><a href="../publicMessage">公共论坛</a></li>
            </ul>
        </aside>
        <section class="news">
            <form action="../publishResource?lastPage=6" method="POST" enctype="multipart/form-data">
                <div>
                    <label for="title">资源标题：</label>
                    <input type="text" id="title" name="title" required>
                </div>
                <br>
                <div>
                    <label for="url">资源 URL：</label>
                    <input type="url" id="url" name="file_path" >
                </div>
                <br>
                <div>
                    <label for="file">上传文件：</label>
                    <input type="file" id="file" name="file">
                    <small>支持多种格式, 上传文件则无需填写url。</small>
                </div>
                <br>
                <div>
                    <label for="description">资源描述：</label>
                    <textarea id="description" name="description" rows="20" cols="100" required></textarea>
                </div>
                <br>
                <div>
                    <button type="submit">提交资源</button>
                </div>
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
