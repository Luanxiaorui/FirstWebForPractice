<%--
  Created by IntelliJ IDEA.
  User: Roy
  Date: 2024/12/22
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <title>学院概括</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLR3Zk0Xmw5Mn7qkOGLFQJ61XmIbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIqR8+YB8a0tFz/3/Hsj93l13J8xQAeBlhP/7GZ2vM3Bfnhcz9" crossorigin="anonymous"></script>
  <link rel = "stylesheet" href = "../css/general_style.css">
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
    <a href="../teacher_group">学科建设</a>
    <a href="../admissions_employment">招生就业</a>
    <a href="public_services.jsp">公共服务</a>
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
        <li><a title="学院简介" href="javascript:void(0)" onclick="showContent('intro')">学院简介</a></li>
        <li><a title="学院领导" href="javascript:void(0)" onclick="showContent('leaders')">学院领导</a></li>
        <li><a title="组织机构" href="javascript:void(0)" onclick="showContent('structure')">组织机构</a></li>
        <li><a title="学院办公室" href="javascript:void(0)" onclick="showContent('office')">学院办公室</a></li>
        <li><a title="学院工会" href="javascript:void(0)" onclick="showContent('union')">学院工会</a></li>
      </ul>
    </aside>
    <section class="information">

      <!-- 内容区域 -->
      <div class="content">
        <div id="intro" class="content-box">
          <h2>计算机科学与技术学院简介</h2>
          <p>计算机科学与技术学院现设有计算机科学与技术（含卓越班）、软件工程、信息安全、数据科学与大数据技术等本科专业，拥有计算机科学与技术一级学科硕士学位点和计算机技术、人工智能、大数据技术与工程等三个方向的专业型硕士学位点；拥有“电力企业信息化与决策支持”上海市重点学科（参与）、“智能电网技术与工程”上海市教委重点学科；“计算机科学与技术”上海市人才高地、计算机科学与技术(电力企业信息化)国家“卓越工程师教...</p>
          <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        <div id="leaders" class="content-box hidden">
          <h2>计算机科学与技术学院学院--领导介绍</h2>
          <p>学院党委领导<br>书记▸ 魏建华<br>副书记▸ 温蜜<br>副书记▸ 齐永晓<br>学院行政领导<br>院长▸ 温蜜<br>常务副院长▸ 张传林<br>副院长▸ 李晋国</p>
          <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        <div id="structure" class="content-box hidden">
          <h2>计算机科学与技术学院组织结构</h2>
          <p>学院行政管理<br>党政办主任▸ 诸葛琼<br>组织员▸ 聂坤<br>教学秘书▸ 徐曼<br>科研秘书▸ 陆佳<br>学院教务▸ 毛志华<br>学院教务▸ 蒋仁志<br>学院学工团队<br>团委书记、辅导员 ▸ 卢珍<br>辅导员▸ 任祥宝<br>辅导员▸ 马安奕<br>辅导员▸ 周远航<br>辅导员▸ 孙倩倩<br>辅导员▸ 宋钰<br>辅导员▸ 张潇月</p>
        </div>
        <div id="office" class="content-box hidden">
          <h2>计算机科学与技术学院学院办公室</h2>
          <table class="table table-bordered">
            <thead class="thead-light">
            <tr>
              <th>名称</th>
              <th>地址</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>院长办公室</td>
              <td>浦东校区行政楼203室</td>
            </tr>
            <tr>
              <td>书记办公室</td>
              <td>浦东校区行政楼213室</td>
            </tr>
            <tr>
              <td>副院长办公室</td>
              <td>浦东校区行政楼205室</td>
            </tr>
            <tr>
              <td>副书记办公室</td>
              <td>浦东校区行政楼211室</td>
            </tr>
            <tr>
              <td>学院办公室</td>
              <td>浦东校区行政楼207室</td>
            </tr>
            <tr>
              <td>教务办公室</td>
              <td>浦东校区行政楼207室</td>
            </tr>
            <tr>
              <td>实验中心办公室</td>
              <td>浦东校区奋进楼204室</td>
            </tr>
            <tr>
              <td>辅导员办公室</td>
              <td>浦东校区行政楼206室</td>
            </tr>
            <tr>
              <td>教授研究室</td>
              <td>浦东校区行政楼215室</td>
            </tr>
            <tr>
              <td>计算机系办公室</td>
              <td>浦东校区行政楼210室</td>
            </tr>
            <tr>
              <td>软件工程系办公室</td>
              <td>浦东校区行政楼219室</td>
            </tr>
            <tr>
              <td>信息安全系办公室</td>
              <td>浦东校区行政楼217室</td>
            </tr>
            <tr>
              <td>计算机基础教学部办公室</td>
              <td>浦东校区行政楼208室</td>
            </tr>
            <tr>
              <td>学院教工之家</td>
              <td>浦东校区行政楼201室</td>
            </tr>
            <tr>
              <td>学院会议室</td>
              <td>浦东校区行政楼</td>
            </tr>
            </tbody>
          </table>
        </div>

        <div id="union" class="content-box hidden">
          <h2>计算机科学与技术学院学院工会</h2>
          <p>分工会主席： 于晓青<br>青年委员： 王亮亮<br>文体委员： 张伟娜<br>生活委员： 蒋仁志<br>女工委员： 张潇月</p>
          <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
      </div>
    </section>
  </div>
</main>

<script type="text/javascript">
  function showContent(id) {
    // 隐藏所有内容框
    var contents = document.getElementsByClassName('content-box');
    for (var i = 0; i < contents.length; i++) {
      contents[i].classList.add('hidden');
    }
    // 显示对应的内容框
    document.getElementById(id).classList.remove('hidden');
  }
</script>
<footer>
  &copy; 2024 计算机学院. 版权所有.
</footer>
</body>
</html>

