<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- saved from url=(0070)http://www.17sucai.com/preview/757225/2017-05-26/jdjiemian/index.html# -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title></title>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all">

</head>
<style>
    .layui-input {
        width: 500px;
    }
</style>
<body>
<div id="father">
    <div id="head">
        <ul class="layui-nav">
            <li class="layui-nav-item"><a href="/main">回到首页</a></li>
        </ul>
    </div>
    <div id="content" style="width:100%;text-align:center">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>个人信息</legend>
        </fieldset>
        <div id="formDan" style="margin: 0 auto;width: 30%;height:700px">
            <form class="layui-form" action="">
                <input type="hidden" id="userId" value="${userInfo.id}">
                <div class="layui-form-item">
                    <label class="layui-form-label">昵称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="nick_name" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input" value="${userInfo.nick_name}"/>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">学号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="user_code" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input" value="${userInfo.user_code}"/>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">专业</label>
                    <div class="layui-input-inline">
                        <input type="text" name="major" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input" value="${userInfo.major}"/>
                    </div>
                </div>
                <div class=" layui-form-item">
                    <label class="layui-form-label">院系</label>
                    <div class="layui-input-inline">
                        <input type="text" name="college" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input" value="${userInfo.college}"/>
                    </div>
                </div>
                <div class=" layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
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
                form.verify({
                    title: function (value) {
                        if (value.length < 5) {
                            return '标题至少得5个字符啊';
                        }
                    }
                    , pass: [/(.+){4}$/, '密码必须4位']
                    , content: function (value) {
                        layedit.sync(editIndex);
                    }
                });
            }

        });
        //监听提交
        form.on('submit(demo1)', function (data) {
            $.ajax({
                contentType: 'application/json;charset=UTF-8',
                dataType: "JSON",
                type: 'POST',
                url: 'user/editUserInfo',
                data: JSON.stringify({
                    id: $("#userId").val(),
                    user_code: data.field.user_code,
                    major: data.field.major,
                    college: data.field.college,
                    nick_name: data.field.nick_name
                }),
                success: function (data) {
                    window.location.href = "/main";
                }
            })


            return false;
        });
    });
</script>
</body>
</html>