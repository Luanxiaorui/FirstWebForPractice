<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/general_style.css">
    <link rel="stylesheet" href="../css/MyMessage-style.css">
    <title>留言与回复</title>
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
                <li><a href="../publicMessage">公共留言</a></li>
            </ul>
        </aside>
        <section class="news">
            <h2>留言与回复</h2>

            <!-- 标签切换 -->
            <div>
                <button class="toggle-btn" onclick="showTab('messages')">查看我的留言</button>
                <button class="toggle-btn" onclick="showTab('replies')">查看我的回复</button>
            </div>

            <!-- 留言展示区域 -->
            <div id="messages" class="tab-content">
                <h3>我的留言</h3>
                <c:forEach var="message" items="${messages}">
                    <div class="message-box" id="message-${message.message_id}">
                        <h4>我留言：</h4>
                        <p>${message.content}</p>
                        <p>时间：${message.created_at}</p>
                        <button onclick="location.href='/message_detail?messageId=${message.message_id}'">查看详情
                        </button>
                        <button class="delete-btn" onclick="deleteMessage(${message.message_id})">删除留言</button>
                    </div>
                </c:forEach>
            </div>

            <!-- 回复展示区域 -->
            <div id="replies" class="tab-content">
                <h3>我的回复</h3>
                <c:forEach var="reply" items="${replies}">
                    <div class="reply-box" id="reply-${reply.message_id}">
                        <h4>我回复：</h4>
                        <p>${reply.content}</p>
                        <p>时间：${reply.created_at}</p>
                        <button onclick="location.href='/message_detail?messageId=${reply.message_id}'">查看详情</button>
                        <button class="delete-btn" onclick="deleteReply(${reply.message_id})">删除回复</button>
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
    // 切换显示留言或回复
    function showTab(tabName) {
        // 隐藏所有 tab 内容
        const tabs = document.querySelectorAll('.tab-content');
        tabs.forEach(tab => {
            tab.classList.remove('active');
        });

        // 显示对应的 tab 内容
        const activeTab = document.getElementById(tabName);
        if (activeTab) {
            activeTab.classList.add('active');
        }
    }

    // 删除留言
    function deleteMessage(messageId) {
        if (confirm("确认删除此留言？")) {
            location.href = '/delete_message?messageId=' + messageId;
        }
    }

    // 删除回复
    function deleteReply(replyId) {
        if (confirm("确认删除此回复？")) {
            location.href = '/delete_reply?replyId=' + replyId;
        }
    }

    // 默认显示留言 tab
    showTab('messages');
</script>
</body>
</html>

