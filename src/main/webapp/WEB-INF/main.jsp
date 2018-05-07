<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>文件管理系统</title>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="/build/css/app.css" media="all">
</head>
<body>
<div class="layui-layout layui-layout-admin kit-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">资源共享平台</div>
        <div class="layui-logo kit-logo-mobile">K</div>
        <ul class="layui-nav layui-layout-right kit-nav">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <c:if test="${empty userInfo}">
                        shabizjj
                    </c:if>
                    <c:if test="${not empty userInfo}">
                        ${userInfo.nick_name}
                    </c:if>
                </a>
                <dl class="layui-nav-child">
                    <c:if test="${empty userInfo}">
                        <dd><a href="/login">去登陆</a></dd>
                    </c:if>
                    <c:if test="${not empty userInfo}">
                        <dd><a href="/user">基本资料</a></dd>
                    </c:if>
                </dl>
            </li>

        </ul>
    </div>

    <div class="layui-side layui-bg-black kit-side">
        <div class="layui-side-scroll">
            <div class="kit-side-fold"><i class="fa fa-navicon" aria-hidden="true"></i></div>
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="kitNavbar" kit-navbar>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span> 基本元素</span></a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" kit-target
                               data-options="{url:'test.html',icon:'&#xe6c6;',title:'表格',id:'1'}">
                                <i class="layui-icon">&#xe6c6;</i><span> 表格</span></a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span> 组件</span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" kit-target
                               data-options="{url:'navbar.html',icon:'&#xe658;',title:'Navbar',id:'6'}"><i
                                class="layui-icon">&#xe658;</i><span> Navbar</span></a></dd>
                        <dd><a href="javascript:;" kit-target
                               data-options="{url:'tab.html',icon:'&#xe658;',title:'TAB',id:'7'}"><i class="layui-icon">&#xe658;</i><span> Tab</span></a>
                        </dd>
                        <dd><a href="javascript:;" kit-target
                               data-options="{url:'onelevel.html',icon:'&#xe658;',title:'OneLevel',id:'50'}"><i
                                class="layui-icon">&#xe658;</i><span> OneLevel</span></a></dd>
                        <dd><a href="javascript:;" kit-target
                               data-options="{url:'app.html',icon:'&#xe658;',title:'App',id:'8'}"><i class="layui-icon">&#xe658;</i><span> app.js主入口</span></a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-url="/components/table/table.html" data-name="table" kit-loader><i
                            class="fa fa-plug" aria-hidden="true"></i><span> 表格(page)</span></a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-url="/views/form.html" data-name="form" kit-loader><i class="fa fa-plug"
                                                                                                      aria-hidden="true"></i><span> 表单(page)</span></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-body" id="container">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">主体内容加载中,请稍等...</div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        2017 &copy;
        <a href="http://kit.zhengjinfan.cn/">kit.zhengjinfan.cn/</a> MIT license

    </div>
</div>
<script src="/plugins/layui/layui.js"></script>
<script>
    var message;
    layui.config({
        base: '/build/js/'
    }).use(['app', 'message'], function () {
        var app = layui.app,
            $ = layui.jquery,
            layer = layui.layer;
        //将message设置为全局以便子页面调用
        message = layui.message;
        //主入口
        app.set({
            type: 'iframe'
        }).init();

    });
</script>
</body>
</html>
