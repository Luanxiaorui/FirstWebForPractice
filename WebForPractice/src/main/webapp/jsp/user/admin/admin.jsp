<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>系统管理员</title>
    <link rel="stylesheet" href="../../../css/admin_user-style.css">
</head>
<body>
<div class="container">
    <aside class="sidebar">
        <ul>
            <li class="${currentPageContent == 'edit'|| currentPageContent == null ? 'active' : ''}">
                <a href="adminSuper?pageContent=edit">新闻编辑</a>
            </li>
            <li class="${currentPageContent == 'publish' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/adminSuper?pageContent=publish">新闻发布</a>
            </li>
            <li class="${currentPageContent == 'resourceEdit' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/adminSuper?pageContent=resourceEdit">资源编辑</a>
            </li>
            <li class="${currentPageContent == 'resourcePublish' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/adminSuper?pageContent=resourcePublish">资源发布</a>
            </li>
            <li class="${currentPageContent == 'personal'  ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/adminSuper?pageContent=personal">个人信息</a>
            </li>
        </ul>
    </aside>
    <main class="main-content">
        <c:choose>
            <c:when test="${empty currentPageContent || currentPageContent == 'personal'}">
                <jsp:include page="personal.jsp"/>
            </c:when>
            <c:when test="${currentPageContent == 'edit'}">
                <jsp:include page="edit.jsp"/>
            </c:when>
            <c:when test="${currentPageContent == 'publish'}">
                <jsp:include page="publishNews.jsp"/>
            </c:when>
            <c:when test="${currentPageContent == 'resourceEdit'}">
                <jsp:include page="resourceEdit.jsp"/>
            </c:when>
            <c:when test="${currentPageContent == 'resourcePublish'}">
                <jsp:include page="publishResources.jsp"/>
            </c:when>
            <c:otherwise>
                <p>页面不存在。</p>
            </c:otherwise>
        </c:choose>
    </main>
</div>
</body>
</html>
