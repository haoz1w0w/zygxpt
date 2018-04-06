/**
 * Created by caoxudong on 2018/4/6.
 */
$(function () {
    //请求文件列表  append class = vdAfKMb
    var fileListUrl = "/file/fileList";
    $.get(fileListUrl,function (data) {
        for(var d = 0;d < data.length;d++){
            var fileTemple = $("#fileTemple").clone();

            var fileTempleHtml = fileTemple.html();
            fileTempleHtml = fileTempleHtml
                .replace("fileName",data[d]["folder_name"])
                .replace("fileSize","1024")
                .replace("fileDate",new Date());
            fileTemple.html(fileTempleHtml);
            fileTemple.removeAttr("id","");
            fileTemple.show();
            $(".vdAfKMb").append(fileTemple);
        }
    })
})