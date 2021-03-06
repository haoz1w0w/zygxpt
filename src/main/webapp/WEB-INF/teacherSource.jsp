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

    <form class="layui-form" action="" style="padding-top: 10px;">
        <div class="layui-form-item" style="margin-left: -29px;margin-bottom: 5px">
            <label class="layui-form-label">选择老师</label>
            <div class="layui-input-block" style="width: 10%">
                <select name="folderId" lay-filter="teacher" id="folederSelect">
                    <c:forEach items="${teacherList}" var="p">
                        <option value="${p.id}">${p.nick_name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

    </form>
    <table id="allSource" lay-filter="fileList"></table>
    <script type="text/html" id="barDemo">
        {{#  if(d.isFile == 2){ }}
        <a class="layui-btn layui-btn-xs" lay-event="edit" style="line-height: 30px">下载</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" style="line-height: 30px">保存至我的云盘</a>
        {{#  } else { }}

        {{#  } }}

    </script>


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
            , url: '/file/getAllFile'
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
                    fixed: 'right', width: 300, align: 'center', toolbar: '#barDemo', style: 'height:50px'
                }
            ]]
            , page: true
        };

        table.render(tableIns);
        //bing table setSign
        //监听工具条
        table.on('tool(fileList)', function (obj) {
            var data = obj.data;
            var id = data.id;
            if (obj.event === 'del') {
                $.ajax({
                    type: 'POST',
                    url: 'user/loginCheck',
                    success: function (data) {
                        if (data) {
                            layer.open({
                                type: 2,
                                title: '保存到我的云资源',
                                shadeClose: true,
                                shade: 0.8,
                                area: ['400px', '90%'],
                                content: '/fileTome?id=' + id
                                , end: function () {
                                    window.location.href = "/allSource"
                                }
                            });
                        } else {
                            layer.msg("请登录后使用分享功能")
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


        function tableFileClick(id) {
            //根据ID 重新渲染 table 数据
            tableIns.url = 'file/fileList';
            tableIns.where = {folederId: id};
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

                    }
                }
                //监听工具条
                table.on('tool(fileList)', function (obj) {
                    var data = obj.data;
                    var id = data.id;
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
                                        content: '/fileTome?id=' + id
                                        , end: function () {
                                            window.location.href = "/allSource"
                                        }
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
            })
        }

        active = {
            getCheckLength: function () { //上传文件

                layer.open({
                    type: 2,
                    title: '上传文件',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['400px', '90%'],
                    content: '/upload',
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
                tableIns.url = "/file/findMyFileListByUserId";
                tableIns.where = {userId: teachId}
                table.render(tableIns);
                table.on("tool(fileList)", function (even) {
                    //监听工具条
                    table.on('tool(fileList)', function (obj) {
                        var data = obj.data;
                        var id = data.id;
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
                                            content: '/fileTome?id=' + id
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
                })
            })
        })
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
            form.on('select(teacher)', function (data) {
                console.log(data);
                tableIns.url = "/file/findMyFileListByUserId";
                tableIns.where = {userId: data.value}
                table.render(tableIns);
                table.on("tool(fileList)", function (even) {
                    //监听工具条
                    table.on('tool(fileList)', function (obj) {
                        var data = obj.data;
                        var id = data.id;
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
                                            content: '/fileTome?id=' + id
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
                })
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
                        layer.alert("修改成功")
                        parent.layer.closeAll();
                    }
                });
                return false;
            });
        });

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

                        }
                    }
                    //监听工具条
                    table.on('tool(fileList)', function (obj) {
                        var data = obj.data;
                        var id = data.id;
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
                                            content: '/fileTome?id=' + id
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
                })
            })
        })
        $('#search').on('click', function () {
            $.ajax({
                type: 'POST',
                url: 'user/loginCheck',
                success: function (data) {
                    if (data) {
                        var fileName = $("#demoReload").val();
                        tableIns.url = "file/findFileByFileName";
                        tableIns.where = {name: fileName}
                        table.render(tableIns);
                    } else {
                        layer.msg("请登录后使用搜索功能")
                    }
                }
            });

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
