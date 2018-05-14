<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="/build/css/app.css" media="all">
    <script src="/plugins/layui/layui.js"></script>
</head>
<body>
<div style="width: 17%;height:100%;float: left;margin-top:1%">
    <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
        <li class="layui-nav-item layui-nav-itemed">
            <a href="javascript:;">教师</a>
            <dl class="layui-nav-child" id="teachList">
            </dl>
        </li>

        <li class="layui-nav-item layui-nav-itemed">
            <a href="javascript:;">课程</a>
            <dl class="layui-nav-child" id="subject">
            </dl>
        </li>

    </ul>

</div>
<div style="width: 80%;float: left;margin-top: 4px">
    <div class="demoTable">
        根据文件名搜索文件
        <div class="layui-inline">
            <input class="layui-input" name="id" id="demoReload" autocomplete="off">
        </div>
        <button class="layui-btn" data-type="reload" id="search">搜索</button>
    </div>
    <div class="layui-btn-group demoTable">
        <button class="layui-btn" data-type="getCheckLength" id="upload">上传文件</button>
    </div>
    <table id="allSource" lay-filter="fileList"></table>
    <script type="text/html" id="barDemo">
        {{#  if(d.isFile == 2){ }}
        <a class="layui-btn layui-btn-xs" lay-event="edit">下载</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">分享到我的</a>
        {{#  } else { }}

        {{#  } }}

    </script>
</div>


<script id="fileType" type="text/html">
    {{#  if(d.isFile == 2){ }}
    <div><img src="https://test-1256150574.cos.ap-beijing.myqcloud.com/%E6%96%87%E4%BB%B6.png"></div>
    {{#  } else { }}
    <div><img src="https://test-1256150574.cos.ap-beijing.myqcloud.com/%E6%96%87%E4%BB%B6%E5%A4%B9%20(2).png"></div>
    {{#  } }}

</script>
<script src="/plugins/jquery-3.3.1/jquery-3.3.1.min.js"></script>

<script>
    var message;
    layui.config({
        base: '/build/js/'
    }).use(['table'], function () {

        var table = layui.table;

        /**用户表格加载*/
        var tableIns = {
            elem: '#allSource'
            , url: '/file/fileList'
            , response: {
                statusName: 'code' //数据状态的字段名称，默认：code
                , statusCode: 0 //成功的状态码，默认：0
                , msgName: 'msg' //状态信息的字段名称，默认：msg
                , countName: 'count' //数据总数的字段名称，默认：count
                , dataName: 'data' //数据列表的字段名称，默认：data
                , folederId: 1
            }
            , cellMinWidth: 80
            , cols: [[
                {checkbox: 'true', width: 150},
                {
                    field: 'pic',
                    title: '类型',
                    width: 150,
                    templet: '#fileType'
                }
                , {field: 'fileName', width: 150, title: '文件名', templet: '#usernameTpl', event: 'setSign'}
                , {
                    field: 'gmtCreate',
                    title: '创建时间',
                    width: 500,
                    templet: '<div>{{ layui.laytpl.toDateString(d.gmtCreate) }}</div>'
                }
                , {
                    fixed: 'right', width: 300, align: 'center', toolbar: '#barDemo', height: 300
                }
            ]]
            , page: true
        };

        table.render(tableIns);

        //bing table setSign
        table.on("tool(fileList)", function (even) {
            var evenName = even.event;
            var evenData = even.data;
            if (evenName == 'setSign') {
                if (evenData.isFile == 1) {
                    console.log(evenData.password);
                    if (evenData.password != null) {
                        layer.open({
                            content: '请输入密码:<input type="password" id="filePassword"/>'
                            , btn: ['确定', '关闭']
                            , yes: function (index, layero) {
                                var input = $("#filePassword").val();
                                if (input == evenData.password) {
                                    tableFileClick(evenData["id"])
                                } else {
                                    layer.msg('密码错误，请从新输入！！！');
                                }
                                layer.close(index);
                            }
                            , btn2: function (index, layero) {
                                layer.close(index);
                            }

                        });
                    } else {
                        tableFileClick(evenData["id"])
                    }
                    //监听工具条
                    table.on('tool(fileList)', function (obj) {
                        var data = obj.data;
                        var id=data.id;
                        if (obj.event === 'del') {
                            $.ajax({
                                type: 'POST',
                                url: 'user/loginCheck',
                                success: function (data) {
                                    if (data) {
                                        layer.open({
                                            type: 2,
                                            title: '分享到我的',
                                            shadeClose: true,
                                            shade: 0.8,
                                            area: ['400px', '90%'],
                                            content: '/fileTome?id='+id
                                        });
                                    } else {
                                        layer.msg("请登录后使用上传文件功能")
                                    }
                                }
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
            }
        })


        function tableFileClick(id) {
            //根据ID 重新渲染 table 数据
            tableIns.url = 'file/fileList';
            tableIns.where = {folederId: id};
            table.render(tableIns);
        }

        active = {
            getCheckLength: function () { //上传文件

                layer.open({
                    type: 2,
                    title: '上传文件',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['400px', '90%'],
                    content: '/upload'
                });
            }

        };
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


        //初始化加载 教师列表
        $.get("/user/findTeacherList", function (data) {
            console.log(data);
            for (var t = 0; t < data.length; t++) {
                var dd = $("<dd class='teach-term'><a>&nbsp;&nbsp;&nbsp;" + data[t]["nick_name"] + "</a></dd>")
                dd.attr("teach-id", data[t]["id"])
                $("#teachList").append(dd)
            }

            //添加教师按钮函数
            $(".teach-term").on("click", function () {
                var teachId = $(this).attr("teach-id");
                tableIns.url = "/file/findUserFile";
                tableIns.where = {userId: teachId}
                table.render(tableIns);
            })
        })

        //初始化加载 课程列表
        $.get("/file/getAllTag", function (data) {
            for (var t = 0; t < data.length; t++) {
                var dd = $("<dd class='subject-term'><a>&nbsp;&nbsp;&nbsp;" + data[t]["tag_name"] + "</a></dd>")
                dd.attr("subject-id", data[t]["id"])
                $("#subject").append(dd)
            }

            //添加教师按钮函数
            $(".subject-term").on("click", function () {
                var subject = $(this).attr("subject-id");
                tableIns.url = "file/findSubjectFiles";
                tableIns.where = {tagId: subject}
                table.render(tableIns);
            })
        })
        $('#search').on('click', function () {
            var fileName = $("#demoReload").val();
            tableIns.url = "file/findFileByFileName";
            tableIns.where = {name: fileName}
            table.render(tableIns);
        });
        $("#upload").on('click', function () {
            $.ajax({
                type: 'POST',
                url: 'user/loginCheck',
                success: function (data) {
                    if (data) {
                        layer.open({
                            type: 2,
                            title: '上传文件',
                            shadeClose: true,
                            shade: 0.8,
                            area: ['400px', '90%'],
                            content: '/uploadAll'
                        });
                    } else {
                        layer.msg("请登录后使用上传文件功能")
                    }
                }
            });

        })
    });


</script>
</body>
</html>
