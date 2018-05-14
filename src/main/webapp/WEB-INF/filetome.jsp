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
    <legend>分享到我的</legend>
</fieldset>
<input type="hidden" id="folderId"/>
<input type="hidden" id="tagId"/>
<form class="layui-form" action="">
    <input type="hidden" value="${id}" id="fileId">
    <div class="layui-form-item">
        <label class="layui-form-label">选择文件夹</label>
        <div class="layui-input-block">
            <select name="folderId" lay-filter="aihao" id="folederSelect">
                <c:forEach items="${foleders}" var="p">
                    <option value="${p.id}">${p.folder_name}</option>
                </c:forEach>
            </select>
        </div>
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

        //监听提交
        form.on('submit(demo1)', function (data) {
            $.ajax({
                type: 'POST',
                url: 'file/saveMyFile?fileId=' + $("#fileId").val() + '&folderId=' + data.field.folderId,
                success: function (data) {
                    layer.closeAll()
                }
            });
            return false;
        });
    });

    layui.use('upload', function () {
        var folderId = 1
        var tagId = 3;
        upload = layui.upload;
        //选完文件后不自动上传
        upload.render({
            elem: '#test8'
            , url: '/file/uploadFile'
            , auto: false
            //,multiple: true
            , bindAction: '#test9'
            , accept: 'file'
            , before: function (obj) {
                layer.load(); //上传loading
                this.data = {'folderId': $("#folederSelect").val(), 'tagId': $("#tagSelect").val()};
            }
            , choose: function (obj) {
                folderId = 1;
                tagId = 3;
                console.log(obj);
                obj.preview(function (index, file, result) {
                    var $h1 = $("<span class='layui-inline layui-upload-choose'>" + file.name + "</span>");
                    $("#choose").append($h1);
                });

            }
            , done: function (res) {
                layer.closeAll(); //关闭loading
            }
        });
    });
</script>
</body>
</html>
