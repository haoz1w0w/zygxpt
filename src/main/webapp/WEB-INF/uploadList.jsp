<%--
  Created by IntelliJ IDEA.
  User: caoxu
  Date: 2018/5/1
  Time: 15:56
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
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<table class="layui-table" id="tableLay" lay-filter="demo">
</table>



<script src="/plugins/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script id="fileType" type="text/html">
    {{#  if(d.isFile == 2){ }}
    <div><img src="https://test-1256150574.cos.ap-beijing.myqcloud.com/%E6%96%87%E4%BB%B6.png"></div>
    {{#  } else { }}
    <div><img src="https://test-1256150574.cos.ap-beijing.myqcloud.com/%E6%96%87%E4%BB%B6%E5%A4%B9%20(2).png"></div>
    {{#  } }}
</script>

<script>
    layui.use('table', function () {
        var $ = layui.$
        var table = layui.table,
            form = layui.form;
        /**用户表格加载*/
        var tableIns = {
            elem: '#tableLay',
            id: 'table1'
            , url: '/file/queryMyUpLoadList'
            , response: {
                statusName: 'code' //数据状态的字段名称，默认：code
                , statusCode: 0 //成功的状态码，默认：0
                , msgName: 'msg' //状态信息的字段名称，默认：msg
                , countName: 'count' //数据总数的字段名称，默认：count
                , dataName: 'data' //数据列表的字段名称，默认：data
                , folederId: 1
            }
            , cellMinWidth: 80
            , width: 1200
            , cols: [[
                {checkbox: 'true', width: 150},
                {
                    field: 'pic',
                    title: '类型',
                    width: 150,
                    templet: '#fileType'
                }
                , {field: 'fileName', width: 150, title: '文件名', event: 'setSign'}
                , {
                    field: 'gmtCreate',
                    title: '创建时间',
                    width: 300,
                    templet: '<div>{{ layui.laytpl.toDateString(d.gmtCreate) }}</div>'
                },
                {
                    fixed: 'right', width: 300, align: 'center', toolbar: '#barDemo', height: 300
                }
            ]]
            , page: true
        };
        table.render(tableIns);

        //监听单元格事件
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'setSign') {
                if (data.isFile == 1) {
                    $("#test1").css("display", "block");
                    tableFileClick(data.id)
                }
                //监听工具条
                table.on('tool(demo)', function (obj) {
                    var data = obj.data;
                    if (obj.event === 'detail') {
                        layer.msg('ID：' + data.id + ' 的查看操作');
                    } else if (obj.event === 'del') {
                        layer.open({
                            type: 2,
                            title: '分享',
                            shadeClose: true,
                            shade: 0.8,
                            area: ['380px', '90%'],
                            content: '/fenxiang?fileId=' + data.id //iframe的url
                        });
                    } else if (obj.event === 'edit') {
                        var url = data.url;
                        $.ajax({
                            type: "post",
                            url: "/file/addLoadList",
                            data: {fileId: data.id, type: 2},//非常重要的一步
                            success: function (data) {
                                if (data) {
                                    window.location.href = url;
                                } else {
                                    layer.msg("请登录");
                                }

                            }

                        });
                    }
                });
            }
        });

        active = {
            getCheckData: function () { //批量删除
                var checkStatus = table.checkStatus('table1')
                    , data = checkStatus.data;
                if (data.length == 0) {
                    layer.alert("必须选中一个");
                    return;
                }
                for (var i = 0; i < data.length; i++) {
                    $.ajax({
                        type: 'POST',
                        url: 'file/delFile?fileId=' + data[i].id,
                    });
                }
                tableFileClickMyFile()
            }
            , getCheckLength: function () { //上传文件
                layer.open({
                    type: 2,
                    title: '上传文件',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['400px', '90%'],
                    content: '/upload'
                });
            },
            isAll: function () {
                //创建文件夹
                layer.open({
                    type: 2,
                    title: '创建文件夹',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['400px', '90%'],
                    content: '/mkdirFoleder'
                });
            }

        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
            var checkStatus = table.checkStatus('tableLay');
            console.log(checkStatus);
        });

        function tableFileClick(id) {
            //根据ID 重新渲染 table 数据
            tableIns.url = 'file/fileList';
            tableIns.where = {folederId: id};
            table.render(tableIns);
        }

        function tableFileClickMyFile() {
            //根据ID 重新渲染 table 数据
            tableIns.url = 'file/findMyfile';
            table.render(tableIns);
        }

        //时间戳的处理
        layui.laytpl.toDateString = function (d, format) {
            var date = new Date(d || new Date())
                , ymd = [
                this.digit(date.getFullYear(), 4)
                , this.digit(date.getMonth() + 1)
                , this.digit(date.getDate())
            ]
                , hms = [
                this.digit(date.getHours())
                , this.digit(date.getMinutes())
                , this.digit(date.getSeconds())
            ];
            format = format || 'yyyy-MM-dd HH:mm:ss';
            return format.replace(/yyyy/g, ymd[0])
                .replace(/MM/g, ymd[1])
                .replace(/dd/g, ymd[2])
                .replace(/HH/g, hms[0])
                .replace(/mm/g, hms[1])
                .replace(/ss/g, hms[2]);
        };
        //数字前置补零
        layui.laytpl.digit = function (num, length, end) {
            var str = '';
            num = String(num);
            length = length || 2;
            for (var i = num.length; i < length; i++) {
                str += '0';
            }
            return num < Math.pow(10, length) ? str + (num | 0) : num;
        };

    });

    layui.use('upload', function () {
        var upload = layui.upload;
        //执行实例
        var uploadInst = upload.render({
            elem: '#test3' //绑定元素
            , url: '/file/uploadFile' //上传接口
            , accept: 'file'
            , done: function (res) {
                //上传完毕回调
            }
            , error: function () {
                //请求异常回调
            }
        });
    });
</script>
<style type="text/css">.layui-table-fixed-r td {
    height: 58px !important;
}

.laytable-cell-1-pic { /*最后的pic为字段的field*/
    height: 100%;
    max-width: 100%;
}
</style>
</body>
</html>
