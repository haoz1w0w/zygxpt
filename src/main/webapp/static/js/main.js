/**
 * Created by caoxudong on 2018/4/6.
 */
$(function () {
    $("#fileTemple").on({
        mouseover : function(){
            $(this).css("background-color","blue");
            $(this).addClass("fileItem");
        } ,
        mouseout : function(){
            $(this).css("background-color","white");
            $(this).removeClass("fileItem");
        }
    }) ;



    //请求文件列表  append class = vdAfKMb
    var fileListUrl = "/file/fileList";
    $.get(fileListUrl, function (data) {
        for (var d = 0; d < data.length; d++) {
            var fileTemple = $("#fileTemple").clone(true);

            var fileTempleHtml = fileTemple.html();
            fileTempleHtml = fileTempleHtml
                .replace("fileName", data[d]["folder_name"])
                .replace("fileSize", "1024")
                .replace("fileDate", new Date());
            fileTemple.html(fileTempleHtml);
            fileTemple.removeAttr("id", "");
            fileTemple.attr("fileId",1)
            fileTemple.show();
            $(".vdAfKMb").append(fileTemple);
        }
    })
})
function uploadFilesss(obj, type) {

    $.ajaxFileUpload({
        url : "/file/uploadFile",
        secureuri : false,// 一般设置为false
        fileElementId : "fileUpload",// 文件上传表单的id <input type="file" id="fileUpload" name="file" />
        dataType : 'json',// 返回值类型 一般设置为json
        data: {'type': type},
        success : function(data) // 服务器成功响应处理函数
        {
        },
        error : function(data)// 服务器响应失败处理函数
        {
            console.log("服务器异常");
        }
    });
    return false;
}