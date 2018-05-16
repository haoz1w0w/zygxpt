<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- saved from url=(0047)https://pan.baidu.com/s/1rsMue9i_QmWyZFfySXH4QQ -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=7,9,10,11">
    <meta name="renderer" content="webkit">
    <title>文件详情</title>
    <script src="../wenjianxiangqing/mod.js.下载"></script>
    <link rel="stylesheet" type="text/css" href="../wenjianxiangqing/base.css">
    <link rel="stylesheet" type="text/css" href="../wenjianxiangqing/system-core.css">
    <script src="../wenjianxiangqing/base.js.下载"></script>
    <script src="../wenjianxiangqing/system-core.js.下载"></script>

    <link rel="stylesheet" type="text/css" href="../wenjianxiangqing/function.css">


    <meta content="b31ebb7c3759312418b3645de4991aef" name="baidu-tc-verification">
    <meta content="max-age=30" http-equiv="Cache-Control">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
    <meta content="网盘,百度网盘,百度云,网络U盘,网络硬盘,免费网盘,网盘下载,网盘资源,同步,云存储,外链分享,离线下载" name="keywords">
    <meta content="百度网盘为您提供文件的网络备份、同步和分享服务。空间大、速度快、安全稳固，支持教育网加速，支持手机端。现在注册即有机会享受2T的免费存储空间" name="description">
    <link rel="stylesheet" type="text/css" href="../wenjianxiangqing/file-widget-1-icons.css">
    <link rel="stylesheet" type="text/css" href="../wenjianxiangqing/function-widget-1-icons.css">
    <script src="../wenjianxiangqing/file-widget-1-manifest.js.下载"></script>
    <script src="../wenjianxiangqing/function-widget-1-manifest.js.下载"></script>
    <script src="../wenjianxiangqing/file-widget-1-map.js.下载"></script>
    <script src="../wenjianxiangqing/function-widget-1-map.js.下载"></script>
    <style type="text/css">.icon-shareSave-gray {
        background-repeat: no-repeat;
    }

    .g-button:hover .icon-shareSave-gray {
        background-repeat: no-repeat;
    }

    .icon-shareSave-white {
        background-repeat: no-repeat;
    }

    .g-button:hover .icon-shareSave-white {
        background-repeat: no-repeat;
    }

    .icon-shareSave-blue {
        background-repeat: no-repeat;
    }

    .g-button:hover .icon-shareSave-blue {
        background-repeat: no-repeat;
    }

    .icon-unlinkShare-gray {
        background-repeat: no-repeat;
    }

    .g-button:hover .icon-unlinkShare-gray {
        background-repeat: no-repeat;
    }

    .icon-shareSave-gray {
        background-position: 0px 0px
    }

    .g-button:hover .icon-shareSave-gray {
        background-position: 0px -34px
    }

    .icon-shareSave-white {
        background-position: 0px -68px
    }

    .g-button:hover .icon-shareSave-white {
        background-position: 0px -102px
    }

    .icon-shareSave-blue {
        background-position: 0px -136px
    }

    .g-button:hover .icon-shareSave-blue {
        background-position: 0px -170px
    }

    .icon-unlinkShare-gray {
        background-position: 0px -204px
    }

    .g-button:hover .icon-unlinkShare-gray {
        background-position: 0px -238px
    }

    .icon-shareSave-gray, .g-button:hover .icon-shareSave-gray, .icon-shareSave-white, .g-button:hover .icon-shareSave-white, .icon-shareSave-blue, .g-button:hover .icon-shareSave-blue, .icon-unlinkShare-gray, .g-button:hover .icon-unlinkShare-gray {
        background-image: url(/box-static/disk-share/icons_z_85b2ffc.png?t=1523597699070)
    }</style>

    <link rel="stylesheet" type="text/css" href="../wenjianxiangqing/layout.css">
    <link rel="stylesheet" type="text/css" href="../wenjianxiangqing/share-single.css">
    <link rel="stylesheet" type="text/css" href="../wenjianxiangqing/system_95f8a99.css">
    <link rel="stylesheet" type="text/css" href="../wenjianxiangqing/page-ui_4ecbc8b.css">
    <link rel="stylesheet" type="text/css" href="../wenjianxiangqing/sync-all_6c25ae8.css">
    <style type="text/css">.activate-outer {
        display: none;
        background: #fcfaf2;
        width: 265px;
        bottom: -195px;
        z-index: 2999;
        padding: 10px;
        border: 1px solid #d4d4d4;
        border-radius: 3px;
        color: #424e67;
    }

    .activate-outer {
        right: 5px;
        position: fixed;
    }

    .activate-outer dl {
        margin-bottom: 10px;
    }

    .activate-h {
        font-size: 14px;
        font-weight: bold;
    }

    .activate-noti {
        padding: 20px;
    }

    .activate-btn, .activate-btn b {
        position: relative;
        height: 37px;
        width: 130px;
        display: block;
        text-align: center;
        line-height: 37px;
        margin: 0 auto;
        font-size: 14px;
        color: white;
        background: #fd6d65;
        text-decoration: none;
        cursor: pointer;
        padding-left: 1px;
        font-weight: normal;
    }

    .activate-btn b {
        background-position: right -711px;
    }

    .activate-btn:hover, .activate-btn:active {
        color: white;
        text-decoration: none;
    }

    .activate-btn:hover {
        background-position: 0 -763px;
    }

    .activate-btn:hover b {
        background-position: right -763px;
    }

    .activate-btn:active {
        background-position: 0 -817px;
    }

    .activate-btn:active b {
        background-position: right -817px;
    }

    .activate-qq {
        width: 280px;
    }

    .activate-qq .activate-noti {
        padding: 30px 15px;
    }

    .activate-qq .activate-btn b {
    }

    .active-disk .activate-disk-cls-btn {
        display: block;
        width: 10px;
        height: 10px;
        position: absolute;
        top: 8px;
        right: 10px;
        cursor: pointer;
        font-size: 0;
    }

    .active-disk .activate-disk-btn {
        display: block;
        width: 175px;
        height: 45px;
        position: absolute;
        top: 145px;
        left: 60px;
        cursor: pointer;
        font-size: 0;
    }</style>
    <link rel="stylesheet" type="text/css" href="../wenjianxiangqing/disk.header.css">
</head>
<body>
<input id="downUrl" value="${file.file_url}">
<div class="frame-all" id="layoutApp">

    <div class="frame-main" id="layoutMain">
        <div class="frame-content">

            <div node-type="module" class="module-share-header">
                <div class="slide-show-header clearfix">
                    <div class="slide-show-left">
                        <h2 class="file-name" title="${file.file_name}"><em
                                class="global-icon-16 global-icon-16-rar"></em>${file.file_name}</h2>
                    </div>
                    <div class="slide-show-right">
<span class="slide-header-funcs">
</span>
                        <div class="module-share-top-bar g-clearfix">
                        </div>
                    </div>
                    <div class="cb"></div>
                    <div class="slide-show-other-infos">
                        <div class="share-file-info">
                            <span>2018-05-05 22:15</span>
                        </div>
                        <div class="share-valid-check">
                        </div>
                        <div class="slide-show-other-cns clearfix">
<span class="title-funcs">
<a class="funcs-tui" hidefocus="true" href="javascript:void(0);" id="albumTui" title="赞"><em class="tui_icon"></em><span
        class="tui-number"></span></a>
<span class="share-operate-seprate"></span>
<div class="comment-container"></div>
<span class="funcs-share-area">
</span>
</span>
                        </div>
                        <div class="cb"></div>
                    </div>
                </div>
            </div>
            <div node-type="module" class="module-share-file-main">
                <div class="share-file-viewer">

                    <div node-type="share-info-box" class="share-info-box share-info-default"><img
                            src="https://test-1256150574.cos.ap-beijing.myqcloud.com/%E6%96%87%E4%BB%B6%E5%A4%B9%20(2).png"
                            class="fileicon fileicon-large-zip" node-type="info-open-button"/>
                        <div class="unzip-box-bar"><span class="unzip-box" node-type="info-open-button"><a
                                class="g-button g-button-blue-large" data-button-id="b9" data-button-index=""
                                href="javascript:;" title="打开压缩包"><span class="g-button-right"><span class="text"
                                                                                                     style="width: auto;"
                                                                                                     id="down">下载文件</span></span></a></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ad-single-bottom ad-platform-tips" node-id="web-sharesinglebanner" id="web-single-bottom">
                <div id="cpro_u2493175">
                </div>
            </div>
        </div>
        <a href="javascript:;" name="comment_panel" id="comment_panel"></a>
    </div>

</div>
<div class="module-aside aside" id="layoutAside"></div>
</div>
<div id="ft">

    <div class="module-share-footer">
    </div>

</div>
<div id="layoutHeader">
    <div node-type="module" class="module-header" style="position: relative;z-index: 45 !important;">
        <!-- header fragment -->
        <div node-type="module-header-wrapper" class="module-header-wrapper" style="height: 62px;position:relative;">
            <dl class="xtJbHcb">
                <dt class="EHazOI"><a href="https://pan.baidu.com/" target="_self" title="百度网盘"></a></dt>
                <dd class="vyQHNyb" node-type="header-link"><span class="cMEMEF wGMtMgb" node-type="disk-home"><a
                        href="/main" target="_self" title="返回首页"
                        node-type="item-title" style="color: #1E1E1E">返回首页</a><span class="gICyHO"></span></span>
                </dd>
                <dd class="CDaavKb" node-type="header-apps"><span class="DIcOFyb" node-type="app-user-info"></span></dd>

            </dl>
        </div><!-- /header fragment --></div>
</div>
</div>


<img style="position:absolute;top:-10px;left:-10px;width:1px;height:1px;display:none;" src="../wenjianxiangqing/file">
<img style="position:absolute;top:-10px;left:-10px;width:1px;height:1px;display:none;"
     src="../wenjianxiangqing/file(1)">
<img style="position:absolute;top:-10px;left:-10px;width:1px;height:1px;display:none;"
     src="../wenjianxiangqing/file(2)">
<div style="display: none;">
    <script src="../wenjianxiangqing/h.js.下载" type="text/javascript"></script>
</div>
<div class="httpProxy-container" style="position:absolute;top:-9999px;">
    <div id="httpProxy" class="httpProxy" style="visibility: visible;"></div>
</div>
</body>
<script src="/plugins/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script>
    $("#down").click(function () {
        window.location.href = $("#downUrl").val();
    });
</script>
</html>