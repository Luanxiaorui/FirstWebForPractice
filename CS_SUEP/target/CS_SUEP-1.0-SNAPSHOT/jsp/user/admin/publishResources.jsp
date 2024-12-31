<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>publish</title>
    <link rel="stylesheet" href="../../../css/publish-page-style.css">

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
<form id="resource-form" action="publishResource" method="post"  enctype="multipart/form-data">
    <div class="main-content">
        <div class="title">
            <h2>资源标题</h2>
            <p>
                <label for="title"></label>
                <input type="text" name="title" id="title" required>
            </p>
        </div>

        <hr>

        <div class="content">
            <h3>资源url</h3>
            <p>
                <label for="file_path"></label>
                <textarea name="file_path" id="file_path" rows="4"></textarea>
            </p>
        </div>

        <div>
            <label for="file">上传文件：</label>
            <input type="file" id="file" name="file">
            <small>支持多种格式, 上传文件则无需填写url。</small>
        </div>

        <div class="button-container">
            <button type="submit" onclick="publishResource()">发布</button>
        </div>
    </div>

    <div class="basic-info">
        <form id="news-info-form" method="post">
            <ul style="list-style-type: none; padding:0;">
                <li>
                    <label for="description">描述</label>
                    <input type="text" name="description" id="description" required>
                </li>
            </ul>
        </form>
    </div>
</form>
</body>
</html>
