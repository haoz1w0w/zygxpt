
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
<body class="layui-bg-green">

<div class="layui-btn-group demoTable">
    <button type="button" class="layui-btn" id="test1"style="display: none">
        <i class="layui-icon">&#xe67c;</i>上传图片
    </button>
    <input type="hidden" name="field＿name" value="" id="flId">
</div>
<table class="layui-table" id="tableLay" lay-filter="demo">
    <%--<thead>--%>
    <%--<tr>--%>
    <%--&lt;%&ndash;<th lay-data="{type:'checkbox', fixed: 'right',align :'center'}"></th>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<th lay-data=""></th>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<th lay-data="{type:field:'id', width:200, sort: true, fixed: true,height:100,}">ID</th>&ndash;%&gt;--%>
    <%--<th lay-data="{field:'folder_name', width:400,height:100}">文件名</th>--%>
    <%--&lt;%&ndash;<th lay-data="{field:'gmt_create', width:80, sort: true,templet: '#createTime'}}">创建时间</th>&ndash;%&gt;--%>
    <%--<th lay-data="{field:'city', width:400}">上次修改时间</th>--%>
    <%--&lt;%&ndash;<th lay-data="{field:'sign', width:200}">签名</th>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<th lay-data="{field:'experience', width:80, sort: true}">积分</th>&ndash;%&gt;--%>

    <%--&lt;%&ndash;<th lay-data="{field:'classify', width:80}">职业</th>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<th lay-data="{field:'wealth', width:135, sort: true}">财富</th>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<th lay-data="{field:'score', width:80, sort: true, fixed: 'right'}">评分</th>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>&ndash;%&gt;--%>
    <%--</tr>--%>
    <%--</thead>--%>
</table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">下载</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">分享</a>
</script>


<script src="/plugins/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function () {
        var table = layui.table, form = layui.form;
        ;
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