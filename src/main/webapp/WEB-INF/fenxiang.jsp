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


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>文件共享</legend>
</fieldset>
<input type="hidden" id="fileId" value="${file.id}"/>
<input type="hidden" id="tagId"/>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">是否加密</label>
        <div class="layui-input-block">
            <input type="radio" name="encode" value="0" title="公开" lay-filter="encode" checked>
            <input type="radio" name="encode" value="1" title="加密" lay-filter="encode">
        </div>
    </div>
    <div class="layui-form-item" id="code" style="display: none">
        <label class="layui-form-label">加密方式</label>
        <div class="layui-input-block">
            <input type="radio" name="method" value="0" title="随机生成" lay-filter="pass" checked>
            <input type="radio" name="method" value="1" title="手动输入" lay-filter="pass">
        </div>
    </div>
    <div class="layui-form-item" id="password" style="display: none">
        <label class="layui-form-label">输入密码</label>
        <div class="layui-input-inline">
            <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">请记住您的密码</div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
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
        form.on('radio(encode)', function (data) {
            console.log(data.value); //被点击的radio的value值
            if (data.value == 1) {
                $("#code").css("display", "block");
            }
        });
        form.on('radio(pass)', function (data) {
            //被点击的radio的value值
            if (data.value == 1) {
                $("#password").css("display", "block");
            }

        });
        //监听提交
        form.on('submit(demo1)', function (data) {
            $.ajax({
                type: 'POST',
                url: 'file/ResourceShare?method=' + data.field.method + "&password=" + data.field.password + "&encode=" + data.field.encode,
                success: function (data) {
                    alert("ok");
                }
            });
            layer.alert(JSON.stringify(data.field.encode), {
                title: '最终的提交信息'
            })
        });
    });
    $("input:radio[name='method']").change(function () { //拨通
        alert("asdsad");
    });
</script>
</body>
</html>
