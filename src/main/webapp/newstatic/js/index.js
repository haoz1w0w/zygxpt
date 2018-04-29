/**
 * 2018年04月12日10:10:04 
 */
$(document).ready(function () {
    //点击左侧展开选项卡
    $('.first-li').click(function(){

        $(this).find('ul').show();
        $(this).siblings().find('ul').hide();
    });

    //引入全部资源页
    $('.all-source').click(function(){
        $('.right-text').load('http://localhost:8080/allSource',function(){
        })
    });
    //引入我的云资源
    $('.yun').click(function(){
        $('.right-text').load('../../../newstatic/template/yun.html',function(){

        })
    });
    //下载记录
    $('.download').click(function(){
        $('.right-text').load('../../../newstatic/template/download.html',function(){

        })
    })
    //下载记录
    $('.upload').click(function(){
        $('.right-text').load('../../../newstatic/template/upload.html',function(){

        })
    })
});