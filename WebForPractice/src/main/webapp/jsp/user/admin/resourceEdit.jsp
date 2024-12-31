<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>edit</title>

    <link rel="stylesheet" href="../../../css/edit-style.css">
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // 获取所有删除链接
            const deleteLinks = document.querySelectorAll('.delete-link');

            // 为每个删除链接绑定点击事件
            deleteLinks.forEach(link => {
                link.addEventListener('click', function(event) {
                    // 弹出确认框，确认删除
                    const confirmed = confirm("确定要删除这条资源吗？");

                    // 如果用户点击“取消”，阻止链接的默认行为（即删除操作）
                    if (!confirmed) {
                        event.preventDefault(); // 阻止链接的跳转
                    }
                });
            });
        });

    </script>
</head>
<body>
<div class="news-block">

    <h2>新闻</h2>
    <!-- 显示新闻列表 -->
    <table>
        <thead>
        <tr>
            <th>标题</th>
            <th>描述</th>
            <th>下载路径</th>
            <th>发布时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="resource" items="${resourceList}">
            <tr>
                <td class="long-text">${resource.title}</td>
                <td class="long-text">${resource.description}</td>
                <td class="long-text">${resource.file_path}</td>
                <td><fmt:formatDate value="${resource.upload_date}" pattern="yyyy-MM-dd" /></td>
                <td>
                    <a href="editResource?resource_id=${resource.resource_id}" target="_blank">编辑</a>
                    <a href="resource_delete?resource_id=${resource.resource_id}&page=${currentPage}" class="delete-link">删除</a>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- 翻页按钮 -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="../adminSuper?page=${currentPage - 1}&pageContent=resourceEdit">上一页</a>
        </c:if>

        <c:forEach begin="1" end="${totalPages}" var="page">
            <c:choose>
                <c:when test="${page == currentPage}">
                    <span>${page}</span>
                </c:when>
                <c:otherwise>
                    <a href="../adminSuper?page=${page}&pageContent=resourceEdit">${page}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${currentPage < totalPages}">
            <a href="../adminSuper?page=${currentPage + 1}&pageContent=resourceEdit">下一页</a>
        </c:if>
    </div>


</div>
</body>
</html>
