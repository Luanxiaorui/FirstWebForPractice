<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>计算机学院</title>
    <!-- 引入 Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- 引入 Bootstrap JS 和 Popper.js (用于一些组件功能，如下拉菜单) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</head>
<body>
<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index.jsp">计算机学院</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">首页</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="jsp/college_overview.jsp">学院概况</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="news_information">新闻动态</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admissions_employment">招生就业</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="jsp/public_services.jsp">公共服务</a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="academic" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    学科建设
                </a>
                <ul class="dropdown-menu" aria-labelledby="academic">
                    <li><a class="dropdown-item" href="teacher_group">师资队伍</a></li>
                    <li><a class="dropdown-item" href="jsp/specialty.jsp">专业介绍</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    个人服务
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="jsp/message_board.jsp">留言板</a></li>
                    <li><a class="dropdown-item" href="resources_list">资源下载</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<!-- 轮播图 -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
    <!-- 轮播指示器 -->
    <ol class="carousel-indicators">
        <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
        <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
    </ol>

    <!-- 轮播内容 -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="photo/欢迎新同学.jpg" alt="欢迎新同学">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="photo/教学审核评估.jpg" alt="教学审核评估">
        </div>
    </div>

    <!-- 轮播控制按钮 -->
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">上一页</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">下一页</span>
    </a>
</div>



<!-- 最新新闻 -->
<div class="container mt-5">
    <h2 class="mb-4">最新新闻</h2>
    <div class="row">
        <c:forEach var="news" items="${latestNews}">
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
<%--                    <img src="${pageContext.request.contextPath}/photo/${news.imagePath}" class="card-img-top" alt="${news.title}">--%>
                    <div class="card-body">
                        <h5 class="card-title">${news.title}</h5>
                        <p class="card-text">${fn:substring(news.content, 0, 100)}...</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <a href="news_detail?id=${news.news_id}" class="btn btn-sm btn-primary">阅读更多</a>
                            <small class="text-muted">${news.publish_date}</small>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <a href="news_information" class="btn btn-secondary">查看更多新闻</a>
</div>

<!-- 快速链接 -->
<div class="container mt-5">
    <h2 class="mb-4">快速链接</h2>
    <div class="row">
        <div class="col-md-3">
            <a href="jsp/college_overview.jsp" class="btn btn-block btn-info">学院概况</a>
        </div>
        <div class="col-md-3">
            <a href="teacher_group" class="btn btn-block btn-info">学科建设</a>
        </div>
        <div class="col-md-3">
            <a href="admissions_employment" class="btn btn-block btn-info">招生就业</a>
        </div>
        <div class="col-md-3">
            <a href="jsp/public_services.jsp" class="btn btn-block btn-info">公共服务</a>
        </div>
    </div>
</div>

<!-- 底部 -->
<footer class="bg-dark text-white mt-5 p-4 text-center">
    &copy; 2024 计算机学院. 版权所有.
</footer>
</body>
</html>
