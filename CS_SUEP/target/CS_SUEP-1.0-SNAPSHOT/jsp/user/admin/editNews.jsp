<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑新闻</title>
    <script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
</head>
<body>
<h1>编辑新闻</h1>
<form action="updateNews" method="POST">
    <input type="hidden" name="newsId" value="${news.news_id}"> <!-- 隐藏新闻ID，提交时使用 -->

    <label for="title">新闻标题：</label>
    <input type="text" id="title" name="title" value="${news.title}" required style="width:100%;" placeholder="请输入新闻标题">

    <label for="content" style="display:block; margin-top:20px;">新闻内容：</label>
    <textarea id="content" name="content" required>${news.content}</textarea>

    <button type="submit" style="margin-top:20px;">提交更新</button>
</form>

<script>
    // 初始化 CKEditor 富文本编辑器
    CKEDITOR.replace('content');
</script>
</body>
</html>
