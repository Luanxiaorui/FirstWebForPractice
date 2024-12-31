<%--
  Created by IntelliJ IDEA.
  User: Roy
  Date: 2024/12/22
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/general_style.css">
    <title>学校服务页面</title>
    <script>
        // 切换显示内容
        function showContent(section) {
            // 隐藏所有内容
            document.querySelectorAll('.section').forEach(function (el) {
                el.style.display = 'none';
            });

            // 显示对应的部分
            document.getElementById(section).style.display = 'block';
        }
    </script>
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
        <a href="../admissions_employment">招生就业</a>
        <!-- 二级目录导航 -->
        <div class="dropdown">
            <a href="#" class="dropbtn">个人服务</a>
            <div class="dropdown-content">
                <a href="message_board.jsp">留言板</a>
                <a href="resources_list">资源下载</a>
            </div>
        </div>
    </nav>
</header>


<main class="main-content">
    <div class="content">
        <aside class="sidebar">
            <ul>
                <li><a href="javascript:void(0);" onclick="showContent('map')">学校地图</a></li>
                <li><a href="javascript:void(0);" onclick="showContent('schedule')">公交时刻表</a></li>
            </ul>
        </aside>
        <section class="news">
            <!-- 右侧内容 -->
            <div class="content">
                <!-- 地图部分 -->
                <div id="map" class="section" style="display: block;">
                    <h2>学校地图</h2>
                    <div class="map">
                        <img src="../photo/map.jpg" alt="学校地图">
                    </div>
                </div>

                <!-- 公交时刻表部分 -->
                <div id="schedule" class="section" style="display: none;">
                    <h2>公交时刻表</h2>
                    <div class="schedule">
                        <table>
                            <thead>
                            <tr>
                                <th>站点</th>
                                <th>发车时间</th>
                                <th>班次间隔</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>大学南门</td>
                                <td>07:30</td>
                                <td>15分钟</td>
                            </tr>
                            <tr>
                                <td>大学北门</td>
                                <td>07:45</td>
                                <td>20分钟</td>
                            </tr>
                            <tr>
                                <td>地铁站</td>
                                <td>08:00</td>
                                <td>30分钟</td>
                            </tr>
                            </tbody>
                        </table>
                        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    </div>
                </div>
            </div>
        </section>
    </div>
</main>
<footer>
    &copy; 2024 计算机学院. 版权所有.
</footer>
</body>
</html>





