<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Bean.News" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.NewsDAO" %>
<%@ page import="dao.MemberDAO" %>
<%@ page import="Bean.Teacher" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学科建设</title>
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
        <a href="admissions_employment">招生就业</a>
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
                <li><a href="#">教师队伍</a></li>
                <li><a href="../jsp/specialty.jsp">专业介绍</a></li>
            </ul>
        </aside>
        <section class="news">
            <%
                List<Teacher> professors = (List) request.getAttribute("教授");
                List<Teacher> vice_professors = (List) request.getAttribute("副教授");
                List<Teacher> lecturers = (List) request.getAttribute("讲师");
            %>


            <h1>教师信息</h1>
            <!-- 教授 -->
            <h2>教授</h2>
            <ul>
                <%
                    if (professors != null) {
                        int cnt = 0;
                        for (Teacher teacher : professors) {
                            cnt++;
                            out.println(">" + teacher.getName() + "&nbsp;&nbsp;&nbsp;&nbsp;");
                            if (cnt == 4) {
                                out.println("<br>");
                                cnt %= 4;
                            }
                        }
                    }
                %>
            </ul>

            <!-- 副教授 -->
            <h2>副教授</h2>
            <ul>
              <%
                if (vice_professors != null) {
                  int cnt = 0;
                  for (Teacher teacher : vice_professors) {
                    cnt++;
                    out.println(">" + teacher.getName() + "&nbsp;&nbsp;&nbsp;&nbsp;");
                    if (cnt == 4) {
                      out.println("<br>");
                      cnt %= 4;
                    }
                  }
                }
              %>

            </ul>

            <!-- 讲师 -->
            <h2>讲师</h2>
            <ul>
              <%
                if (lecturers != null) {
                  int cnt = 0;
                  for (Teacher teacher : lecturers) {
                    cnt++;
                    out.println(">" + teacher.getName() + "&nbsp;&nbsp;&nbsp;&nbsp;");
                    if (cnt == 4) {
                      out.println("<br>");
                      cnt %= 4;
                    }
                  }
                }
              %>
            </ul>

        </section>
    </div>
</main>
<!-- 底部 -->
<footer>
    &copy; 2024 计算机学院. 版权所有.
</footer>
</body>
</html>

