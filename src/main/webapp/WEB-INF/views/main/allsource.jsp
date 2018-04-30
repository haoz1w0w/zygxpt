<%--
  Created by IntelliJ IDEA.
  User: Raytine
  Date: 2018/4/15
  Time: 14:35
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
    <link rel="stylesheet" href="../../../newstatic/layui/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body class="layui-bg-green">

<div class="layui-btn-group demoTable">
    <button type="button" class="layui-btn" id="test1"style="display: none">
        <i class="layui-icon">&#xe67c;</i>上传图片
    </button>
    <input type="hidden" id="flId" value="10">
</div>


<table class="layui-table" id="tableLay" lay-filter="demo">
</table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">下载</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">分享</a>
</script>


<script src="../../../newstatic/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function () {
        var table = layui.table, form = layui.form;
        table.render({
            elem: '#tableLay'
            , url: 'http://localhost:8080/file/fileList'
            ,response: {
                statusName: 'code' //数据状态的字段名称，默认：code
                ,statusCode: 0 //成功的状态码，默认：0
                ,msgName: 'msg' //状态信息的字段名称，默认：msg
                ,countName: 'count' //数据总数的字段名称，默认：count
                ,dataName: 'data' //数据列表的字段名称，默认：data
                ,folederId:1
            }
            , cellMinWidth: 80
            , cols: [[
                {type: 'checkbox'},
                {
                    field: 'pic',
                    title: '类型',
                    width: 150,
                    templet: '<div><img src="https://test-1256150574.cos.ap-beijing.myqcloud.com/%E6%96%87%E4%BB%B6%E5%A4%B9%20(2).png"></div>'
                }
                , {field: 'fileName', title: '文件名', templet: '#usernameTpl', event: 'setSign'}
                , {
                    field: 'gmtCreate',
                    title: '创建时间',
                    templet: '<div>{{ layui.laytpl.toDateString(d.gmtCreate) }}</div>'
                }
            ]]
            , page: true

        });

        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {

        });
//        //监听单元格编辑
//        table.on('edit(demo)', function(obj){
//            var value = obj.value //得到修改后的值
//                ,data = obj.data //得到所在行所有键值
//                ,field = obj.field; //得到字段
//            layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
//            $.ajax({
//                url:"http://localhost:8080/file/fileList"
//
//            })
//        });

        //监听单元格事件
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'setSign') {
                if (data.isFile == 1) {
                    $("#test1").css("display","block");
                    table.render({
                        elem: '#tableLay'
                        , url: 'http://localhost:8080/file/fileList'
                        ,response: {
                            statusName: 'code' //数据状态的字段名称，默认：code
                            ,statusCode: 0 //成功的状态码，默认：0
                            ,msgName: 'msg' //状态信息的字段名称，默认：msg
                            ,countName: 'count' //数据总数的字段名称，默认：count
                            ,dataName: 'data' //数据列表的字段名称，默认：data
                            ,folederId:1
                        }
                        , cellMinWidth: 80
                        , cols: [[
                            {type: 'checkbox'},
                            {
                                field: 'pic',
                                title: '类型',
                                width: 150,
                                templet: '<div><img src="https://test-1256150574.cos.ap-beijing.myqcloud.com/%E6%96%87%E4%BB%B6.png"></div>'
                            }
                            , {field: 'fileName', title: '文件名', templet: '#usernameTpl'}
                            , {
                                field: 'gmtCreate',
                                title: '创建时间',
                                templet: '<div>{{ layui.laytpl.toDateString(d.gmtCreate) }}</div>'
                            }
                            , {
                                fixed: 'right', width: 178, align: 'center', toolbar: '#barDemo'
                            }
                        ]]
                        , page: true
                        , where: {folederId: data.id}
                        ,done: function(res, curr, count) {
                            //如果是异步请求数据方式，res即为你接口返回的信息。
                            //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                            console.log(res.folederId);
                            //得到当前页码
                            console.log(curr);
                            //得到数据总量
                            console.log(count);
                            $("#flId").val(res.folederId);
                        }
                    });
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
                                content: 'http://localhost:8080/fenxiang?id=' + data.id //iframe的url
                            });
                        } else if (obj.event === 'edit') {
                            window.location.href = data.url;
                        }
                    });
                }

            }
        });

        var $ = layui.$, active = {
            getCheckData: function () { //上传文件
                var checkStatus = table.checkStatus('tableLay')
                    , data = checkStatus.data;
                if (data.length > 1 || data.length < 1) {
                    layer.alert("必须选择至多一个");
                    return;
                }

                layer.alert(JSON.stringify(data));
            }
            , getCheckLength: function () { //获取选中数目
                var checkStatus = table.checkStatus('tableLay')
                    , data = checkStatus.data;
                layer.msg('选中了：' + data.length + ' 个');
            }
            , isAll: function () { //验证是否全选
                var checkStatus = table.checkStatus('tableLay');
                layer.msg(checkStatus.isAll ? '全选' : '未全选')
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
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
        layui.use('upload', function () {
            var upload = layui.upload;
            //执行实例
            var uploadInst = upload.render({
                elem: '#test1' //绑定元素
                , url: 'http://localhost:8080/file/uploadFile' //上传接口
                , done: function (res) {
                    //上传完毕回调
                }
                , error: function () {
                    //请求异常回调
                }
                , accept: 'file'
                ,data: {
                    folderId: $("#flId").val()
                }
            });
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
