<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>发布新闻</title>
    <script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>

    <style>
        .editor-container {
            width: 80%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<h1>发布新闻</h1>
<form action="publishNews" method="POST" enctype="multipart/form-data">
    <div class="editor-container">
        <label for="title">新闻标题：</label>
        <input type="text" id="title" name="title" required style="width:100%;" placeholder="请输入新闻标题">
        <label for="category">新闻类型：</label>
        <input type="text" id="category" name="category" required style="width:100%;" placeholder="请输入新闻类型">

        <label for="author">作者：</label>
        <input type="text" id="author" name="author" required style="width:100%;" placeholder="请输入新闻作者">

        <label for="content" style="display:block; margin-top:20px;">新闻内容：</label>
        <textarea id="content" name="content" required></textarea>

        <button type="submit" style="margin-top:20px;">发布新闻</button>
    </div>
</form>

<script>
    CKEDITOR.replace('content', {
        filebrowserImageUploadUrl: '/uploadImage',
        filebrowserUploadMethod: 'form',
        filebrowserBrowseUrl: '/browser/browse.php',
        on: {
            instanceReady: function(evt) {
                // 当编辑器准备就绪时，绑定事件
                console.log('CKEditor 已加载');
            },
            fileUploadResponse: function(evt) {
                // 在图片上传后，检查响应
                var response = evt.data.fileLoader.xhr.responseText;
                console.log('上传响应: ', response);

                var jsonResponse = JSON.parse(response);  // 解析 JSON 响应
                if (jsonResponse.uploaded === 1) {
                    // 如果上传成功，插入图片
                    var imageUrl = jsonResponse.url;
                    var imageTag = '<img src="' + imageUrl + '" />';
                    this.insertHtml(imageTag);  // 插入 HTML
                } else {
                    alert('图片上传失败！');
                }
            }
        }
    });


</script>
</body>
</html>
