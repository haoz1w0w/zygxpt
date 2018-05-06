<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

    <title>分享平台登陆</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,700);

        body, html {
            height: 100%
        }

        body {
            background: #456;
            font-family: Open Sans, sans-serif;
            transform-style: preserve-3d
        }

        .login {
            width: 96%;
            max-width: 25pc;
            margin: 0 auto;
            font-size: 1pc;
            position: relative;
            top: 50%;
            transform: translateY(-50%)
        }

        .login p, .login-header {
            margin-top: 0;
            margin-bottom: 0
        }

        .login-header {
            background: #28d;
            padding: 20px;
            font-size: 1.4em;
            font-weight: 400;
            text-align: center;
            text-transform: uppercase;
            color: #fff
        }

        .login-container {
            background: #ebebeb;
            padding: 9pt
        }

        .login p {
            padding: 9pt
        }

        .login input {
            box-sizing: border-box;
            display: block;
            width: 100%;
            border-width: 1px;
            border-style: solid;
            padding: 1pc;
            outline: 0;
            font-family: inherit;
            font-size: .95em
        }

        .login input[type=text], .login input[type=password] {
            background: #fff;
            border-color: #ccc;
            color: #555
        }

        .login input[type=text]:focus, .login input[type=password]:focus {
            border-color: #99a
        }

        .login input[type=submit] {
            background: #28d;
            border-color: transparent;
            color: #fff;
            cursor: pointer
        }

        .login input[type=submit]:focus {
            border-color: #05a
        }
    </style>
</head>
<link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all">
<body>
<div class="login">
    <h2 class="login-header">登陆资源共享</h2>
    <form class="layui-form login-container " action="">
        <div class="layui-form-item">
            <label class="layui-form-label">输入账号</label>
            <div class="layui-input-inline">
                <input type="text" name="account" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">输入密码</label>
            <div class="layui-input-inline">
                <input type="password" name="pass" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button class="layui-btn" lay-submit="" lay-filter="demo2">注册</button>
            </div>
        </div>
    </form>
</div>
<script src="/plugins/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script src="/plugins/layui/layui.js"></script>

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
                type: 'POST',
                url: 'user/login',
                data: {account: data.field.account, password: data.field.pass},
                success: function (data) {
                    console.log(data);
                    if (data) {
                        window.location.href = "/main"
                    } else {
                        layer.alert("密码不正确");
                    }
                }
            });


            return false;
        });
        //监听提交
        form.on('submit(demo2)', function (data) {

            window.location.href = "/register";

            return false;
        });
    });
</script>
</body>
</html>
