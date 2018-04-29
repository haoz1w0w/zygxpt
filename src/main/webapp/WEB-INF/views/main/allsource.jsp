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


<script src="../../../newstatic/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function () {
        var table = layui.table, form = layui.form;
        ;
        table.render({
            elem: '#tableLay'
            , url: 'http://localhost:8080/file/fileList'
            , cellMinWidth: 80
            , cols: [[
                {field: 'pic', title: '类型', width: 150,templet:'<div><img src="https://test-1256150574.cos.ap-beijing.myqcloud.com/%E6%96%87%E4%BB%B6%E5%A4%B9%20(2).png"></div>'}
                , {field: 'fileName', title: '文件名', templet: '#usernameTpl',event: 'setSign'}
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
            console.log(obj)
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
                    table.render({
                        elem: '#tableLay'
                        , url: 'http://localhost:8080/file/fileList'
                        , cellMinWidth: 80
                        , cols: [[
                            {type: 'checkbox'},
                            {field: 'pic', title: '类型', width: 150,templet:'<div><img src="https://test-1256150574.cos.ap-beijing.myqcloud.com/%E6%96%87%E4%BB%B6.png"></div>'}
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
                    });
                    //监听工具条
                    table.on('tool(demo)', function (obj) {
                        var data = obj.data;
                        if (obj.event === 'detail') {
                            layer.msg('ID：' + data.id + ' 的查看操作');
                        } else if (obj.event === 'del') {
                            layer.confirm('分享', function (index) {
                                obj.del();
                                layer.close(index);
                            });
                        } else if (obj.event === 'edit') {
                            window.location.href=data.url;
                        }
                    });
                }
            }
        });

        var $ = layui.$, active = {
            getCheckData: function () { //获取选中数据
                var checkStatus = table.checkStatus('tableLay')
                    , data = checkStatus.data;
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

    });

    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: 'http://localhost:8080/file/uploadFile'
            , accept: 'file' //普通文件
            , data: {folderId: 123}
            , done: function (res) {
                console.log(res)
            }
        });
    });

</script>
<style type="text/css">.layui-table-fixed-r td{height:58px!important;}
.laytable-cell-1-pic{  /*最后的pic为字段的field*/
    height: 100%;
    max-width: 100%;
}

</style>
</body>
</html>
