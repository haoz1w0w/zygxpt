<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/4 0004
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all">
    <style type="text/css">
        #father {
            width: 100%;
            height: 500px;
            padding-top: 300px;
        }

        #center {
            padding-top: 100px;
            margin: 0px auto;
            width: 700px;
            height: 300px;
        }

        #wenben {
            margin: 0px auto;
            width: 50%;
            height: 20%;
        }
    </style>
</head>
<body>
<input type="hidden" value="${share.password}" id="pass">
<input type="hidden" value="${jiami}" id="jiami">
<div id="father">
    <div id="center">
        <c:if test="${jiami==1}">
            <div id="wenben">
                <form class="layui-form" action="" ">
                    <div class="layui-form-item" id="password">
                        <label class="layui-form-label">请输入提取密码：</label>
                        <div class="layui-input-inline">
                            <input type="password" name="password" placeholder="请输入密码" autocomplete="off"
                                   class="layui-input"
                                   id="very">
                            <button class="layui-btn" lay-submit="" lay-filter="demo2" style="margin-top: 30px">确认</button>
                        </div>

                    </div>
                </form>
            </div>

        </c:if>
    </div>

</div>
<script src="/plugins/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate
            , $ = layui.$;

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
            , pass: [/(.+){4}$/, '密码必须6到12位']
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
        form.on('submit(demo2)', function (data) {
            console.log(data.field);
            console.log($("#pass").val());
            if (data.field.password == $("#pass").val()) {
                window.location.href = "/main"

            } else {
                layer.alert("匹配不成功 请重新输入");

            }
            return false;
        });
    });
</script>

</body>
</html>
