<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
  <title>编辑新闻</title>
  <link rel="stylesheet" href="../../../css/edit-page-style.css">

  <script>
    function publishResource() {
      if (confirm('是否确认发布？')) {
        document.getElementById('action').value = 'publish';
        document.getElementById('resource-form').submit();
      }
    }
  </script>
</head>
<body>

<!-- 侧边栏 -->
<div class="sidebar">
  <div id="basic-info">基本信息</div>
  <ul style="list-style-type: none; padding: 0;">
<%--    <li>--%>
<%--      <label for="description">资源描述：</label>--%>
<%--      <input type="text" id="description" name="description" value="${resource.description}">--%>
<%--    </li>--%>
    <li id="upload-date">
      创建时间：<fmt:formatDate value="${resource.upload_date}" pattern="yyyy-MM-dd" />
    </li>
  </ul>

</div>

<!-- 主内容区域 -->
<div class="block">
  <form id="resource-form" action="updateResource" method="post">
    <input type="hidden" name="action" id="action" value="">
    <input type="hidden" name="resource_id" value="${resource.resource_id}">
    <input type="hidden" name="upload_date" value="${resource.upload_date}">
    <div class="title">
      <h2>资源题目</h2>
      <p>
        <input type="text" name="title" id="title" value="${resource.title}" required>
      </p>
    </div>
    <div class="title">
      <label for="description">资源描述：</label>
      <input type="text" id="description" name="description" value="${resource.description}">
    </div>

    <hr>

    <div class="content">
      <h3>下载路径</h3>
      <p>
        <textarea name="file_path" id="file_path" rows="10" required>${resource.file_path}</textarea>
      </p>
    </div>

    <div class="button-container">
      <button type="submit" onclick="publishResource()">发布</button>
    </div>

  </form>
</div>
</body>
</html>
