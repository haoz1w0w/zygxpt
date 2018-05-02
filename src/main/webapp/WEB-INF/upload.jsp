<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><%--
  Created by IntelliJ IDEA.
  User: Raytine
  Date: 2018/5/2
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<blockquote class="layui-elem-quote layui-text">
    鉴于小伙伴的普遍反馈，先温馨提醒两个常见“问题”：1. <a href="/doc/base/faq.html#form" target="_blank">为什么select/checkbox/radio没显示？</a> 2. <a
        href="/doc/modules/form.html#render" target="_blank">动态添加的表单元素如何更新？</a>
</blockquote>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>上传文件</legend>
</fieldset>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">选择文件夹</label>
        <div class="layui-input-block">
            <select name="folderId" lay-filter="aihao" id="folederSelect">
                <c:forEach items="${foleders}" var="p">
                    <option value="${p.id}">${p.folderName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择标签</label>
        <div class="layui-input-block">
            <select name="tagId" lay-filter="aihao" id="tagSelect">
                <c:forEach items="${allTag}" var="tags">
                    <option value="${tags.id}">${tags.tag_name}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-upload" style="margin-left: 70px">
        <button type="button" class="layui-btn" id="test8">选择文件</button>
    </div>
    <div class="layui-upload" style="margin-top: 30px;margin-left: 70px">
        <button type="button" class="layui-btn" id="test9">开始上传</button>
    </div>
</form>


<script src="/plugins/layui/layui.js"></script>
<script src="/plugins/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function (data) {
            layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });

    <!-- 上传文件-->
    layui.use('upload', function () {
        upload = layui.upload;
        //选完文件后不自动上传
        upload.render({
            elem: '#test8'
            , url: '/upload/'
            , auto: false
            //,multiple: true
            , bindAction: '#test9'
            , accept: 'file'
            , done: function (res) {
                console.log(res)
            }
        });
    });
    $("#test9").click(function () {
        alert("asdsad");
    })
</script>
</body>
</html>
