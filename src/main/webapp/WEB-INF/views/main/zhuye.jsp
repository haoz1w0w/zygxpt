<%--
  Created by IntelliJ IDEA.
  User: Raytine
  Date: 2018/4/7
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="static/css/daohangstyle.css">
</head>
<style>
    #nav {
        margin-top: 50px;
        background-color: #eeeeee;
        height: 100%;
        width: 50%;
        float: left;
        padding: 5px;
    }

    #section {
        height: 100%;
        width: 50%;
        float: left;
    }

</style>
<body>
<div id="header">
    <ul class="nav blue">
        <li><a href="">所有资源</a></li>
        <li><a href="">我的资源</a></li>
        <li><a href="">我的分享</a></li>
        <li><a href="">下载记录</a></li>
        <li><a href="">上传记录</a></li>
    </ul>
</div>
<div id="mid">
    <div id="nav">
    </div>
    <div id="section">

    </div>

</div>


<div id="footer">
</div>
<script type="text/javascript" src="/static/jQuery/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/static/jQuery/jquery-nav.js"></script>
<script type="text/javascript" src="js/jquery-nav.js"></script>
</body>
</html>
