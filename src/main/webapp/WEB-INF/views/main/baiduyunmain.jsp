<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=7,9,10,11">
    <meta name="renderer" content="webkit">
    <link rel="dns-prefetch" href="https://pcs.baidu.com/">
    <link rel="dns-prefetch" href="https://pcsdata.baidu.com/">
    <link rel="dns-prefetch" href="https://passport.baidu.com/">
    <link rel="dns-prefetch" href="https://yun.baidu.com/">
    <link rel="dns-prefetch" href="https://d.pcs.baidu.com/">
    <link rel="dns-prefetch" href="https://c.pcs.baidu.com/">
    <link rel="dns-prefetch" href="https://webpush.pan.baidu.com/">
    <link rel="dns-prefetch" href="https://hm.baidu.com/">
    <link rel="shortcut icon" href="https://pan.baidu.com/box-static/disk-system/images/favicon.ico">
    <title>
        <我的></我的>
        文件
    </title>
    <script type="text/javascript">
        var dpPage = '221_116';
        var dpCustomMetrics = 'c_pd';
        var testServerTimestamp = Number('1522995819732') - (new Date().getTime());
    </script>


    <meta content="b31ebb7c3759312418b3645de4991aef" name="baidu-tc-verification">
    <meta content="max-age=30" http-equiv="Cache-Control">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
    <meta content="网盘,百度网盘,百度云,网络U盘,网络硬盘,免费网盘,网盘下载,网盘资源,同步,云存储,外链分享,离线下载" name="keywords">
    <meta content="百度网盘为您提供文件的网络备份、同步和分享服务。空间大、速度快、安全稳固，支持教育网加速，支持手机端。现在注册即有机会享受2T的免费存储空间" name="description">

    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/alpha.css">
    <style type="text/css">.icon-upload {
        color: #fff
    }

    .icon-atv {
        font-size: 18px;
        line-height: 30px;
        text-align: center;
        top: 20px
    }

    .fileicon-small-bt {
        background-repeat: no-repeat;
    }

    .fileicon-large-bt {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/BT_54_6238b9c.png) center no-repeat
    }

    .fileicon-middle-bt {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -440px -1px
    }

    .fileicon-small-dws {
        background-repeat: no-repeat;
    }

    .fileicon-large-dws {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/CAD_54_5497608.png) center no-repeat
    }

    .fileicon-middle-dws {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -120px -51px
    }

    .fileicon-small-code {
        background-repeat: no-repeat;
    }

    .fileicon-large-code {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/Code_54_cffd46f.png) center no-repeat !important
    }

    .fileicon-small-txt {
        background-repeat: no-repeat;
    }

    .fileicon-small-pdf {
        background-repeat: no-repeat;
    }

    .fileicon-small-doc {
        background-repeat: no-repeat;
    }

    .fileicon-small-ppt {
        background-repeat: no-repeat;
    }

    .fileicon-small-xls {
        background-repeat: no-repeat;
    }

    .fileicon-small-vsd {
        background-repeat: no-repeat;
    }

    .fileicon-large-txt {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/Text_54_6d41969.png) center no-repeat
    }

    .fileicon-large-pdf {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/PDF_54_ae4e37a.png) center no-repeat
    }

    .fileicon-large-doc {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/Word_54_6167687.png) center no-repeat
    }

    .fileicon-large-ppt {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/PPT_54_0b3dc6d.png) center no-repeat
    }

    .fileicon-large-xls {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/Excel_54_08289af.png) center no-repeat
    }

    .fileicon-large-vsd {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/Visio_54_c3dd4c6.png) center no-repeat
    }

    .fileicon-middle-txt {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -161px -1px
    }

    .fileicon-middle-pdf {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -41px -1px
    }

    .fileicon-middle-doc {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -81px -1px
    }

    .fileicon-middle-ppt {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -281px -1px
    }

    .fileicon-middle-xls {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -121px -1px
    }

    .fileicon-middle-rar {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -319px -51px
    }

    .fileicon-middle-zip {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -41px -52px
    }

    .fileicon-small-pic {
        background-repeat: no-repeat;
    }

    .fileicon-middle-pic {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -1px -51px
    }

    .fileicon-small-mmap {
        background-repeat: no-repeat;
    }

    .fileicon-small-xmind {
        background-repeat: no-repeat;
    }

    .fileicon-small-mm {
        background-repeat: no-repeat;
    }

    .NHcGw .AuPKyz {
        position: relative;
        height: 44px;
        line-height: 44px;
        border-bottom: 1px solid #f2f6fd;
        white-space: nowrap;
        text-overflow: ellipsis;
        background: #FFF;
    }

    .global-clearfix, .g-clearfix {
        zoom: 1;
    }

    body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, textarea, select, optgroup, option, fieldset, legend, p, blockquote, th, td {
        margin: 0;
        padding: 0;
    }

    user agent stylesheet
    dd {
        display: block;
        -webkit-margin-start: 40px;
    }

    .KPDwCE .vdAfKMb {
        font: 12px/1.5 tahoma, arial;
    }

    body, button, input, select, textarea {
        font: 12px/1.5 "Microsoft YaHei", arial, SimSun, "宋体";
        color: #666;
    }

    body, button, input, select, textarea {
        color: #666;
    }

    .global-clearfix:after, .g-clearfix:after {
        content: '.';
        display: block;
        visibility: hidden;
        height: 0;
        line-height: 0;
        font-size: 0;
        clear: both;
    }

    -webkit-scrollbar {
        width: 12px;
        height: 10px;
    }

    -webkit-scrollbar-thumb {
        height: 30px;
        background-color: #999;
        -webkit-border-radius: 7px;
        outline: 2px solid #fff;
        outline-offset: -2px;
        border: 2px solid #fff;
    }

    -webkit-scrollbar-track-piece {
        background-color: #fff;
        -webkit-border-radius: 3px;
    }

    .NHcGw .AuPKyz .ul0JKz {
        cursor: default;
        display: block;
        height: 26px;
        width: 26px;
        position: absolute;
        left: 43px;
        top: 10px;
    }

    .dir-card-small {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/card_24_ff51176.png) center no-repeat;
    }

    body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, textarea, select, optgroup, option, fieldset, legend, p, blockquote, th, td {
        margin: 0;
        padding: 0;
    }

    user agent stylesheet
    div {
        display: block;
    }

    .NHcGw .AuPKyz {
        position: relative;
        height: 44px;
        line-height: 44px;
        border-bottom: 1px solid #f2f6fd;
        white-space: nowrap;
        text-overflow: ellipsis;
        background: #FFF;
    }

    .KPDwCE .vdAfKMb {
        font: 12px/1.5 tahoma, arial;
    }

    body, button, input, select, textarea {
        font: 12px/1.5 "Microsoft YaHei", arial, SimSun, "宋体";
        color: #666;
    }

    body, button, input, select, textarea {
        color: #666;
    }

    -webkit-scrollbar {
        width: 12px;
        height: 10px;
    }

    -webkit-scrollbar-thumb {
        height: 30px;
        background-color: #999;
        -webkit-border-radius: 7px;
        outline: 2px solid #fff;
        outline-offset: -2px;
        border: 2px solid #fff;
    }

    -webkit-scrollbar-track-piece {
        background-color: #fff;
        -webkit-border-radius: 3px;
    }

    .fileicon-large-mmap {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/MMAP_54_5451eab.png) center no-repeat
    }

    .fileicon-large-xmind {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/Xmind_54_3bb4e79.png) center no-repeat
    }

    .fileicon-large-mm {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/MM_54_6380666.png) center no-repeat
    }

    .fileicon-middle-mmap {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -161px -51px
    }

    .fileicon-middle-xmind {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -201px -51px
    }

    .fileicon-middle-mm {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -241px -51px
    }

    .fileicon-small-mp3 {
        background-repeat: no-repeat;
    }

    .fileicon-large-mp3 {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/Music_54_fd75225.png) center no-repeat
    }

    .icon-play-music {
        background-repeat: no-repeat;
    }

    .g-button:hover .icon-play-music {
        background-position: -30px -30px
    }

    .fileicon-middle-mp3 {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -201px -1px
    }

    .g-button:hover .icon-edit {
        background-position: -90px -27px
    }

    .default-small {
        background-repeat: no-repeat;
    }

    .dir-multi-small {
        background-repeat: no-repeat;
    }

    .dir-multi-middle {
        background-repeat: no-repeat;
    }

    .dir-small {
        background-repeat: no-repeat;
    }

    .dir-share-small {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Share_24_f21bad6.png) center no-repeat
    }

    .dir-cang-small {
        background-repeat: no-repeat;
    }

    .dir-card-small {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/card_24_ff51176.png) center no-repeat
    }

    .dir-app-small, .dir-apps-small {
        background-repeat: no-repeat;
    }

    .dir-backup-small {
        background-repeat: no-repeat;
    }

    .default-middle {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/sprite_list_icon30_891cc19.png) -561px 0 no-repeat
    }

    .dir-middle {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/sprite_list_icon30_891cc19.png) -202px -100px no-repeat
    }

    .dir-share-middle {
        background-repeat: no-repeat;
    }

    .dir-cang-middle {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/sprite_list_icon30_891cc19.png) -82px -100px no-repeat
    }

    .dir-app-middle, .dir-apps-middle {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/sprite_list_icon30_891cc19.png) -2px -100px no-repeat
    }

    .dir-backup-middle {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/sprite_list_icon30_891cc19.png) -122px -100px no-repeat
    }

    .default-large {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Misc_54_f86ddc2.png) center no-repeat
    }

    .dir-large {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Folder_54_fe544cc.png) center no-repeat
    }

    .dir-share-large {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Share_54_142956d.png) center no-repeat
    }

    .dir-cang-large {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Collection_54_7849a8d.png) center no-repeat
    }

    .dir-card-large {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/card_54_b068d33.png) center no-repeat
    }

    .dir-app-large, .dir-apps-large {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/MyData_54_cb4dfe9.png) center no-repeat
    }

    .dir-backup-large {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/PC_54_e2efc5f.png) center no-repeat
    }

    .dir-multi-large {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/gridIcon_7165cae.png) -600px -100px no-repeat
    }

    .dir-phone-large {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Phone_54_a774466.png) center no-repeat
    }

    .dir-phone-small {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-exe {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-apk {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-psd {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-key {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-ai {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-ipa {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-vsd {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-pages {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-numbers {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-fonts {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-code {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-web {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-links {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-eps {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-swf {
        background-repeat: no-repeat;
    }

    .fileicon-sys-s-video {
        background-repeat: no-repeat;
    }

    .fileicon-sys-l-dmg, .fileicon-sys-l-exe {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/EXE_54_a0ff130.png) center no-repeat
    }

    .fileicon-sys-l-apk {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Android_54_b57a094.png) center no-repeat
    }

    .fileicon-sys-l-psd {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/PS_54_93523dc.png) center no-repeat
    }

    .fileicon-sys-l-key {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Keynote_54_96fb842.png) center no-repeat
    }

    .fileicon-sys-l-ai {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/AI_54_345b023.png) center no-repeat
    }

    .fileicon-sys-l-vsd {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Visio_54_c3dd4c6.png) center no-repeat
    }

    .fileicon-sys-l-ipa {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Apple_54_7d9656c.png) center no-repeat
    }

    .fileicon-sys-l-pages {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Pages_54_e91ce45.png) center no-repeat
    }

    .fileicon-sys-l-numbers {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Numbers_54_dac4f63.png) center no-repeat
    }

    .fileicon-sys-l-fonts {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Fonts_54_db07580.png) center no-repeat
    }

    .fileicon-sys-l-code {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Code_54_cffd46f.png) center no-repeat
    }

    .fileicon-sys-l-web {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Web_54_195198e.png) center no-repeat
    }

    .fileicon-sys-l-links {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Links_54_e5e6311.png) center no-repeat
    }

    .fileicon-sys-l-eps {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/EPS_54_3dad67a.png) center no-repeat
    }

    .fileicon-sys-l-swf {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Flash_54_1af0d00.png) center no-repeat
    }

    .fileicon-sys-l-video {
        background: url(https://pan.baidu.com/box-static/file-widget-1/sysIcon/img/Video_54_7880c8d.png) center no-repeat
    }

    .fileicon-small-video {
        background-repeat: no-repeat;
    }

    .fileicon-large-video {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/Video_54_7880c8d.png) center no-repeat
    }

    .fileicon-middle-video {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/middleListIcon_a31d29b.png) -240px -1px
    }

    .fileicon-small-zip {
        background-repeat: no-repeat;
    }

    .fileicon-large-zip {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/ZIP_54_667d9c9.png) center no-repeat
    }

    .fileicon-small-rar {
        background-repeat: no-repeat;
    }

    .fileicon-large-rar {
        background: url(https://pan.baidu.com/box-static/file-widget-1/common/RAR_54_7b7bbfb.png) center no-repeat
    }

    .fileicon-small-bt {
        background-position: -596px 0px
    }

    .fileicon-small-dws {
        background-position: -596px -34px
    }

    .fileicon-small-code {
        background-position: -596px -68px
    }

    .fileicon-small-txt {
        background-position: -596px -102px
    }

    .fileicon-small-pdf {
        background-position: -596px -136px
    }

    .fileicon-small-doc {
        background-position: -596px -170px
    }

    .fileicon-small-ppt {
        background-position: -596px -204px
    }

    .fileicon-small-xls {
        background-position: -596px -238px
    }

    .fileicon-small-vsd {
        background-position: -596px -272px
    }

    .fileicon-small-pic {
        background-position: -596px -306px
    }

    .fileicon-small-mmap {
        background-position: -596px -340px
    }

    .fileicon-small-xmind {
        background-position: -596px -374px
    }

    .fileicon-small-mm {
        background-position: -596px -408px
    }

    .fileicon-small-mp3 {
        background-position: -596px -442px
    }

    .icon-play-music {
        background-position: -361px -506px
    }

    .default-small {
        background-position: -596px -566px
    }

    .dir-multi-small {
        background-position: -500px -630px
    }

    .dir-multi-middle {
        background-position: -280px -752px
    }

    .dir-small {
        background-position: -594px -862px
    }

    .dir-cang-small {
        background-position: -594px -898px
    }

    .dir-app-small, .dir-apps-small {
        background-position: -594px -934px
    }

    .dir-backup-small {
        background-position: -594px -970px
    }

    .dir-share-middle {
        background-position: -588px -1006px
    }

    .dir-phone-small {
        background-position: -594px -1048px
    }

    .fileicon-sys-s-exe {
        background-position: -596px -1084px
    }

    .fileicon-sys-s-apk {
        background-position: -596px -1118px
    }

    .fileicon-sys-s-psd {
        background-position: -596px -1152px
    }

    .fileicon-sys-s-key {
        background-position: -596px -1186px
    }

    .fileicon-sys-s-ai {
        background-position: -596px -1220px
    }

    .fileicon-sys-s-ipa {
        background-position: -596px -1254px
    }

    .fileicon-sys-s-vsd {
        background-position: -596px -1288px
    }

    .fileicon-sys-s-pages {
        background-position: -596px -1322px
    }

    .fileicon-sys-s-numbers {
        background-position: -596px -1356px
    }

    .fileicon-sys-s-fonts {
        background-position: -596px -1390px
    }

    .fileicon-sys-s-code {
        background-position: -596px -1424px
    }

    .fileicon-sys-s-web {
        background-position: -594px -1458px
    }

    .fileicon-sys-s-links {
        background-position: -596px -1494px
    }

    .fileicon-sys-s-eps {
        background-position: -596px -1528px
    }

    .fileicon-sys-s-swf {
        background-position: -596px -1562px
    }

    .fileicon-sys-s-video {
        background-position: -596px -1596px
    }

    .fileicon-small-video {
        background-position: -596px -1630px
    }

    .fileicon-small-zip {
        background-position: -596px -1664px
    }

    .fileicon-small-rar {
        background-position: -596px -1698px
    }

    .fileicon-small-bt, .fileicon-small-dws, .fileicon-small-code, .fileicon-small-txt, .fileicon-small-pdf, .fileicon-small-doc, .fileicon-small-ppt, .fileicon-small-xls, .fileicon-small-vsd, .fileicon-small-pic, .fileicon-small-mmap, .fileicon-small-xmind, .fileicon-small-mm, .fileicon-small-mp3, .icon-play-music, .default-small, .dir-multi-small, .dir-multi-middle, .dir-small, .dir-cang-small, .dir-app-small, .dir-apps-small, .dir-backup-small, .dir-share-middle, .dir-phone-small, .fileicon-sys-s-exe, .fileicon-sys-s-apk, .fileicon-sys-s-psd, .fileicon-sys-s-key, .fileicon-sys-s-ai {
        background-image: url(https://pan.baidu.com/box-static/file-widget-1/icons_z_6ae3d28.png)
    }

    .fileicon-sys-s-ipa, .fileicon-sys-s-vsd, .fileicon-sys-s-pages, .fileicon-sys-s-numbers, .fileicon-sys-s-fonts, .fileicon-sys-s-code, .fileicon-sys-s-web, .fileicon-sys-s-links, .fileicon-sys-s-eps, .fileicon-sys-s-swf, .fileicon-sys-s-video, .fileicon-small-video, .fileicon-small-zip, .fileicon-small-rar {
        background-image: url(https://pan.baidu.com/box-static/file-widget-1/icons_z_6ae3d28.png)
    }

    .icon-online {
        background: url(https://pan.baidu.com/box-static/function-widget-1/device/img/device-online_6f31fc0.png) no-repeat
    }

    .icon-history-gray {
        background: url(https://pan.baidu.com/box-static/function-widget-1/common/plugin-icon_7318e47.png) -30px -58px no-repeat
    }

    .g-button:hover .icon-history-gray {
        background-position: -30px -58px
    }

    .icon-aside-share {
        background: url(https://pan.baidu.com/box-static/function-widget-1/common/navigator_8461603.png)
    }

    a:hover .icon-aside-share {
        background-position: -23px 0
    }

    .icon-print-gray {
        background: url(https://pan.baidu.com/box-static/function-widget-1/common/plugin-icon_7318e47.png) -180px -28px no-repeat
    }

    .g-button:hover .icon-print-gray {
        background-position: -210px -28px
    }

    .icon-beautify-gray {
        background: url(https://pan.baidu.com/box-static/function-widget-1/common/plugin-icon_7318e47.png) -60px -58px no-repeat
    }

    .g-button:hover .icon-beautify-gray {
        background-position: -90px -58px
    }

    .icon-puzzle-gray {
        background: url(https://pan.baidu.com/box-static/function-widget-1/common/plugin-icon_7318e47.png) -120px -60px no-repeat
    }

    .g-button:hover .icon-puzzle-gray {
        background-position: -150px -60px
    }

    .icon-qrCode-gray {
        background-repeat: no-repeat;
    }

    .g-button:hover .icon-qrCode-gray {
        background-repeat: no-repeat;
    }

    .icon-aside-recyclebin {
        background: url(https://pan.baidu.com/box-static/function-widget-1/common/navigator_8461603.png) 0 -22px
    }

    a:hover .icon-aside-recyclebin {
        background-position: -23px -22px
    }

    .icon-share-gray {
        background: url(https://pan.baidu.com/box-static/function-widget-1/common/plugin-icon_7318e47.png) -180px 0 no-repeat
    }

    .g-button:hover .icon-share-gray {
        background-position: -240px 0
    }

    .icon-share-blue {
        background: url(https://pan.baidu.com/box-static/function-widget-1/common/plugin-icon_7318e47.png) -210px 0 no-repeat
    }

    .icon-share-blue:hover {
        background-position: -240px 0
    }

    .icon-qrCode-gray {
        background-position: 0px 0px
    }

    .g-button:hover .icon-qrCode-gray {
        background-position: 0px -33px
    }

    .icon-qrCode-gray, .g-button:hover .icon-qrCode-gray {
        background-image: url(https://pan.baidu.com/box-static/function-widget-1/icons_z_e5c1278.png)
    }</style>

    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/function.css">
    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/context-all_dc9ada7.css">
    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/home-all_5e73eef.css">
    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/all_df12660.css">
    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/main-all_1804208.css">
    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/sync-all_6c25ae8.css">
    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/asideAppDownloads-all_65e681f.css">
    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/sync-all_6df50b9.css">
    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/activity_26dfb4a.css">
    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/quota-all_328fb3b.css">
    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/vipWarn-all_78af3d9.css">

    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/uploader-all_9bf60fd.css">
    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/rMenu_6fb4554.css">

    <link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/disk.header.css">

    <script src="/static/jQuery/jquery-3.1.1.js" type="text/javascript"></script>
    <script src="/static/js/main.js" type="text/javascript"></script>
    <style type="text/css">.context-menu {
        position: absolute;
        font-size: 13px !important;
        color: #000 !important;
        top: 0;
        left: 0;
        -moz-user-select: none;
        -o-user-select: none;
        -webkit-user-select: none;
        user-select: none
    }

    .context-menu .arrowicon {
        background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAyCAMAAACwGaE2AAAABlBMVEV6enr///+4gAnsAAAAAnRSTlP/AOW3MEoAAAAZdEVYdFNvZnR3YXJlAEFkb2JlIEltYWdlUmVhZHlxyWU8AAADImlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo3OEZDMDgxQjNGQ0UxMUU0QUU2REY5MEI4NTk2OTIxNyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo3OEZDMDgxQzNGQ0UxMUU0QUU2REY5MEI4NTk2OTIxNyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjc4RkMwODE5M0ZDRTExRTRBRTZERjkwQjg1OTY5MjE3IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjc4RkMwODFBM0ZDRTExRTRBRTZERjkwQjg1OTY5MjE3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+lu+4FAAAAEZJREFUKM/d0kEKACAIRNHf/S8dSWoz4AVyo4/QRQwrircBLbgkEaRwSAOZc7nqC6FChYr5bb75xS9pCmS29FiyLHWWyGob38gCGXhjiW4AAAAASUVORK5CYII=) right center no-repeat
    }

    .context-menu .arrowicon.list-hover, .context-menu .arrowicon.open {
        background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAyCAMAAACwGaE2AAAABlBMVEX///////9VfPVsAAAAAnRSTlP/AOW3MEoAAAAZdEVYdFNvZnR3YXJlAEFkb2JlIEltYWdlUmVhZHlxyWU8AAADImlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo4MDFBMUNGRjNGQ0UxMUU0OEJERUM0MjlEMTI1MzU1NSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo4MDFBMUQwMDNGQ0UxMUU0OEJERUM0MjlEMTI1MzU1NSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjgwMUExQ0ZEM0ZDRTExRTQ4QkRFQzQyOUQxMjUzNTU1IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjgwMUExQ0ZFM0ZDRTExRTQ4QkRFQzQyOUQxMjUzNTU1Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+VaFCGQAAAEZJREFUKM/d0kEKACAIRNHf/S8dSWoz4AVyo4/QRQwrircBLbgkEaRwSAOZc7nqC6FChYr5bb75xS9pCmS29FiyLHWWyGob38gCGXhjiW4AAAAASUVORK5CYII=)
    }

    .context-menu ul, .context-menu li {
        list-style: none;
        padding: 0;
        margin: 0;
        font-size: 13px !important;
        color: #5b667b !important
    }

    .context-menu .list {
        min-height: 23px;
        padding: 2px 0;
        position: absolute;
        background-color: #FFF;
        color: #000
    }

    .context-menu .list {
        border: 1px solid #dde0e4;
        border-radius: 5px;
        box-shadow: 0 0 8px #ccc
    }

    .context-menu .list li {
        display: list-item;
        cursor: default;
    + width: 65 px;
        height: 23px;
        line-height: 23px;
        white-space: nowrap;
        position: relative;
        z-index: 1;
        padding: 0 27px 0 20px
    }

    .context-menu .list .disable, .context-menu .list .disable:hover {
        color: #c5cbd8 !important;
        background: #FFF;
        opacity: .8;
        filter: alpha(opacity=80);
        -ms-filter: "alpha(Opacity=80)";
        filter: alpha(Opacity=80)
    }

    .context-menu .list li .icon, .context-menu .list li .icon-hover {
        position: absolute;
        display: block;
        width: 16px;
        height: 16px;
        top: 3px;
        left: 2px
    }

    .context-menu .list li .icon-hover {
        display: none
    }

    .context-menu .list li.list-hover, .context-menu .list .has-more.open {
        background-color: #4281F4;
        color: #FFF !important
    }

    .context-menu .list li.list-hover > .icon {
        display: none
    }

    .context-menu .list li.list-hover > .icon-hover {
        display: block
    }

    .context-menu .list .has-more {
        z-index: 2
    }

    .context-menu .list .has-more .list {
        display: none;
        top: -3px;
        left: 98%;
        z-index: 2;
        border-radius: 0;
        box-shadow: 0 0 0
    }

    .context-menu .list .separate, .context-menu .list .separate.list-hover {
        padding: 0;
        margin: 5px 0;
        height: 1px;
        line-height: 0;
        font-size: 0 !important;
        background-color: #e9e9e9;
        cursor: default
    }

    .context-menu .list .arrow-down {
        height: 16px;
        background-position: center -38px
    }

    .context-menu .list li:hover {
        background-color: #4281F4;
        color: #FFF !important
    }

    .context-menu .list li.separate:hover {
        background-color: #e9e9e9
    }

    .context-menu .list .arrow-up {
        height: 16px;
        background-position: center 4px
    }</style>
</head>

<body>

<link rel="stylesheet" type="text/css" href="/static/百度网盘-全部文件_files/cover.css">
<link rel="stylesheet" node-type="theme-link" type="text/css" href="/static/百度网盘-全部文件_files/diskSystem-theme.css">
<div class="frame-all" id="layoutApp">
    <div class="skin-main"></div>
    <div class="bLIW2psi" node-type="bLIW2psi">
        <div class="C5p4QSd" node-type="C5p4QSd">
            <div class="6wcBMqed" node-type="6wcBMqed">
                <div class="zVbIULO" node-type="zVbIULO">
                    <div class="frame-aside" id="layoutAside">
                        <div class="vUbV78H" node-type="vUbV78H">
                            <div class="6jqBOV" node-type="6jqBOV">
                                <div node-type="yraszboG" class="module-aside DtJtsC">
                                    <div class="KHbQCub"></div>
                                    <ul class="fOHAbxb">
                                        <li node-type="amzmjgLy" data-key="list" class="iicszX45 bHzsaPb">
                                            <a node-type="aqjyNL" path="/" class="qdjBXL nzr0YdW" hidefocus="true"
                                               href="javascript:void(0);">
<span class="text">
<span node-type="epz9Gd" class="icon icon-disk"></span>
<span node-type="dysqzlMZ">全部文件</span>
</span>
                                            </a>
                                        </li>
                                        <li node-type="amzmjgLy" data-key="pic" class="iicszX45">
                                            <a node-type="aqjyNL" class="nzr0YdW" hidefocus="true"
                                            >
<span class="text">
<span node-type="dysqzlMZ">图片</span>
</span>
                                            </a>
                                        </li>
                                        <li node-type="amzmjgLy" data-key="doc" class="iicszX45">
                                            <a node-type="aqjyNL" cat="4" class="nzr0YdW" hidefocus="true"
                                            ">
                                            <span class="text">
<span node-type="dysqzlMZ">文档</span>
</span>
                                            </a>
                                        </li>
                                        <li node-type="amzmjgLy" data-key="video" class="iicszX45">
                                            <a node-type="aqjyNL" cat="1" class="nzr0YdW" hidefocus="true">
<span class="text">
<span node-type="dysqzlMZ">视频</span>
</span>
                                            </a>
                                        </li>
                                        <li node-type="amzmjgLy" data-key="mbt" class="iicszX45">
                                            <a node-type="aqjyNL" cat="7" class="nzr0YdW" hidefocus="true">
<span class="text">
<span node-type="dysqzlMZ">种子</span>
</span>
                                            </a>
                                        </li>
                                        <li node-type="amzmjgLy" data-key="music" class="iicszX45">
                                            <a node-type="aqjyNL" cat="2" class="nzr0YdW" hidefocus="true">
<span class="text">
<span node-type="dysqzlMZ">音乐</span>
</span>
                                            </a>
                                        </li>
                                        <li node-type="amzmjgLy" data-key="other" class="iicszX45">
                                            <a node-type="aqjyNL" cat="6" class="nzr0YdW" hidefocus="true"
                                            >
<span class="text">
<span node-type="dysqzlMZ">其它</span>
</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="he03G0" style="display: block;"></div>
                                    <ul class="FvBGOQ" style="white-space: nowrap; position: relative;">
                                        <div class="button-box-mark"
                                             style="display:inline-block;*display:inline;*zoom:1;width:1px;height:1px;line-height:0;"></div>
                                        <div class="mbcjyR0"
                                             style="position:absolute;top:0;line-height:normal;padding-top:0px;">
                                            <div style="display:none;width:100%;height:100%;z-index:30;position:absolute;top:0;left:0;"></div>
                                            <a class="g-button" data-button-id="b1" data-button-index="8"
                                               title="我的分享"><span class="g-button-right"><em
                                                    class="icon icon-my-share" title="我的分享"></em><span class="text"
                                                                                                       style="width: auto;">我的分享</span></span></a><span
                                                class="g-dropdown-button tools-more" style="display: none;"><a
                                                class="g-button" data-button-id="b3" data-button-index=""
                                                title="更多"><span class="g-button-right"><em
                                                class="icon icon-more" title="更多"></em><span class="text"
                                                                                             style="width: auto;">更多</span></span></a><span
                                                class="menu" style="width: 112px;"><a style="display:none;"
                                                                                      data-menu-id="b-menu0"
                                                                                      class="g-button-menu g-menu-hasIcon"><em
                                                class="icon icon-my-share"></em>我的分享</a></span></span></div>
                                    </ul>
                                    <div class="he03G0" style="display: block;"></div>
                                    <ul class="JKEQDvb" style="white-space: nowrap; position: relative;">
                                        <div class="button-box-mark"
                                             style="display:inline-block;*display:inline;*zoom:1;width:1px;height:1px;line-height:0;"></div>
                                        <div class="gl0YVz"
                                             style="position:absolute;top:0;line-height:normal;padding-top:0px;">
                                            <div style="display:none;width:100%;height:100%;z-index:30;position:absolute;top:0;left:0;"></div>
                                            <a class="g-button" data-button-id="b5" data-button-index="9"
                                               title="回收站"><span class="g-button-right"><em
                                                    class="icon icon-delete" title="回收站"></em><span class="text"
                                                                                                    style="width: auto;">回收站</span></span></a><span
                                                class="g-dropdown-button tools-more" style="display: none;"><a
                                                class="g-button" data-button-id="b7" data-button-index=""
                                                title="更多"><span class="g-button-right"><em
                                                class="icon icon-more" title="更多"></em><span class="text"
                                                                                             style="width: auto;">更多</span></span></a><span
                                                class="menu" style="width: 112px;"><a style="display:none;"
                                                                                      data-menu-id="b-menu0"
                                                                                      class="g-button-menu g-menu-hasIcon"
                                        ><em
                                                class="icon icon-delete"></em>回收站</a></span></span></div>
                                    </ul>
                                    <div class="aside-absolute-container"
                                         style="visibility: visible; position: absolute; width: 100%; height: 150px;">
                                        <div data-index="0" node-type="layout-absolute-box"
                                             style="width: 100%; height: 50px; background:none; z-index: 2; "></div>
                                        <div data-index="1" node-type="layout-absolute-box"
                                             style="width: 100%; height: 50px; background:none; z-index: 3; ">
                                            <div node-type="ezAXQm" class="QGOvsxb" style="_visibility:visible;">
                                                <div node-type="pjzwP5Zw" class="JGDHAe">
                                                    <div class="get-capacity"><span><a node-type="nerA2pP"
                                                                                       target="_blank">           开通会员，升至2T永久容量</a></span>
                                                    </div>
                                                </div>
                                                <div node-type="lbviA9EA" class="capacityforvip"><span
                                                        class="vip-icon"></span><span>正在尊享超大空间特权</span></div>
                                                <div node-type="fsgjA03w" class="quota-over-tips"><span
                                                        node-type="hatPE5P" class="quota-over-tips-close">×</span>
                                                    <div node-type="lxw1dP hatPE5P" class="quota-over-text"></div>
                                                    <a class="quota-over-btn"
                                                       href="https://pan.baidu.com/disk/home?"></a> <em
                                                            class="quota-over-bg"></em></div>
                                            </div>
                                        </div>
                                        <div data-index="2" node-type="layout-absolute-box"
                                             style="width: 100%; height: 50px; background:none; z-index: 0; ">
                                            <div class="feNMdtb g-clearfix"><span node-type="KzGbKPb"
                                                                                  class="KzGbKPb g-clearfix"><a
                                                    node-type="ztexPG PCeHwb" node-log="guangjiaDl"
                                                    class="img-ico side-lyunguanjia"
                                                    href="https://issuecdn.baidupcs.com/issue/netdisk/yunguanjia/BaiduNetdisk_6.0.2.exe"
                                                    title="下载百度网盘PC版"><span
                                                    class="icon icon-yunguanjia"></span>PC版</a><a node-type="ztexPG"
                                                                                                  node-log="androidDl"
                                                                                                  class="img-ico side-landroid"
                                                                                                  href="https://issuecdn.baidupcs.com/issue/netdisk/apk/BaiduNetdisk_8.3.1.apk"
                                                                                                  title="下载百度网盘Android版"><span
                                                    class="icon icon-android"></span></a><a node-type="ztexPG"
                                                                                            node-log="iphoneDl"
                                                                                            class="img-ico side-liphone"
                                                                                            href="https://itunes.apple.com/cn/app/bai-du-wang-pan/id547166701?mt=8"
                                                                                            target="_blank"
                                                                                            title="下载百度网盘iPhone版"><span
                                                    class="icon icon-apple"></span></a><a node-type="wBPQwQb"
                                                                                          href="javascript:void(0);"><span
                                                    class="icon icon-more"></span></a></span>
                                                <div node-type="BbHFaQb" class="FfOIzbb">
                                                    <dl class="bsBdCxb g-clearfix">
                                                        <dt node-type="OgCcJx" class="g-clearfix"><a node-type="ztexPG"
                                                                                                     node-log="wpDl"
                                                                                                     class="img-ico side-lwp7 detail-item-block"
                                                                                                     href="https://www.windowsphone.com/zh-cn/store/app/%E7%99%BE%E5%BA%A6%E4%BA%91/59bf5640-85ae-4a6e-84f1-a61c074e667c"
                                                                                                     target="_blank"
                                                                                                     title="下载百度网盘WP版"><span
                                                                class="icon icon-win detail-item-block"></span>WP</a><a
                                                                node-type="ztexPG" node-log="ipadDl"
                                                                class="img-ico side-lipad detail-item-block"
                                                                href="https://itunes.apple.com/cn/app/bai-du-yun-hd/id554602005?mt=8"
                                                                target="_blank" title="下载百度网盘iPad版"><span
                                                                class="icon icon-iPad detail-item-block"></span>iPad</a><a
                                                                node-type="ztexPG ECLdMHb" node-log="mactongDl"
                                                                class="img-ico side-lmactong"
                                                                href="https://issuecdn.baidupcs.com/issue/netdisk/MACguanjia/BaiduNetdisk-mac-2.2.1.dmg"
                                                                title="下载百度网盘MAC版"><span
                                                                class="icon icon-mac detail-item-block"></span>Mac<br>版</a>
                                                        </dt>
                                                        <dd class="side-lqrcode"><img
                                                                src="./百度网盘-全部文件_files/baidu_app_link_small_d939588.png">扫描二维码下载
                                                        </dd>
                                                    </dl>
                                                    <em class="side-arrow"></em></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="litaLA6" node-type="litaLA6">
                <div class="0tPefbym" node-type="0tPefbym">
                    <div class="frame-main" id="layoutMain" style="display: block;">
                        <div class="Ls5fo3A" node-type="Ls5fo3A">
                            <div class="ynSpGkLL" node-type="ynSpGkLL">
                                <div class="JJ2oIYz" node-type="JJ2oIYz">
                                    <div class="DxdbeCb g-clearfix">
                                        <div class="xbalzLRy"></div>
                                        <div class="ngr021M">
                                            <div class="juzLnk tc02bA">
                                                <a style="display: none;" data-type="list" class="fzwd0Aga"
                                                   href="javascript:void(0)">
                                                    <span class="icon icon-list"></span>
                                                </a>
                                                <a data-type="grid" class="st8R4m" href="javascript:void(0)">
                                                    <span class="icon icon-grid"></span>
                                                </a>
                                            </div>
                                            <div class="EzLavy">
                                                <div node-type="jwk8PQN" class="bxujBgL" href="javascript:void(0)">
                                                    <span class="icon icon-order"></span>
                                                </div>
                                                <div node-type="sDwvAgb" class="sDwvAgb">
<span data-key="name" class="vAFAFF">
<em class="icon icon-sort-select"></em>
文件名</span>
                                                    <span data-key="size" class="vAFAFF">
<em class="icon icon-sort-select"></em>
大小</span>
                                                    <span data-key="time" class="vAFAFF ugcOHtb">
<em class="icon icon-sort-select"></em>
修改日期</span>
                                                </div>
                                            </div>
                                            <div class="OFaPaO">
                                                <div class="mzjm8e66" node-type="kyejM3X">
                                                    <form node-type="hexz62a" class="fwjg4b bij8OdG"
                                                          action="javascript: void(0)" method="get">
                                                        <input node-type="toye0VGk eurk8kvg" data-key="SEARCH_QUERY"
                                                               autocomplete="off" class="kzgl0rdb" name="q" value=""
                                                               spellchecking="off" type="text">
                                                        <span node-type="uajvlK" class="qu07Ba icon icon-search-del"
                                                              style="display: none;"></span>
                                                        <span node-type="eurk8kvg" data-key="SEARCH_BUTTON"
                                                              class="gHHsaL">
<span class="icon icon-search"></span>
</span>
                                                        <span node-type="ltzmKN" class="tuojwGX"
                                                              style="display: block;">搜索您的文件</span>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="yxrjD56" style="white-space: nowrap; position: relative;">
                                                <div class="button-box-mark"
                                                     style="display:inline-block;*display:inline;*zoom:1;width:1px;height:1px;line-height:0;"></div>
                                                <div class="tcuLAu"
                                                     style="position: absolute; top: 0px; line-height: normal; padding-top: 11px; padding-left: 0px; width: auto;">
                                                    <div style="display:none;width:100%;height:100%;z-index:30;position:absolute;top:0;left:0;"></div>
                                                    <span class="g-dropdown-button"><a
                                                            class="g-button g-button-blue blue-upload upload-wrapper"
                                                            data-button-id="b31" data-button-index="1"
                                                            href="up" title="上传"><span class="g-button-right"><em
                                                            class="icon icon-upload" title="上传"></em><span class="text"
                                                                                                           style="width: 40px;">上传</span></span>
                                                        <form class="h5-uploader-form" action="/file/uploadFile">
                                                            <input title="点击选择文件" id="h5Input0" multiple="" accept="*/*"
                                                            type="file" name="html5uploader" onchange ="uploadFilesss(this,1)"
                                                            style="position:absolute;opacity:0;top:0;left:0;width:100%;height:100%;cursor:pointer;"/>
                                                      <input class="btn btn-primary" value="提交" type="submit" />
                                                    </form>
                                                    </a><span
                                                            class="menu" style="width: 84px;"><a data-menu-id="b-menu0"
                                                                                                 class="g-button-menu  upload-wrapper"
                                                                                                 href="javascript:;">上传文件<form
                                                            class="h5-uploader-form" action="javascript:void(0);"><input
                                                            title="点击选择文件" id="h5Input1" multiple="" accept="*/*"
                                                            type="file" name="html5uploader"
                                                            style="position:absolute;opacity:0;top:0;left:0;width:100%;height:100%;cursor:pointer;"></form></a><a
                                                            data-menu-id="b-menu1" class="g-button-menu  upload-wrapper"
                                                            href="javascript:;">上传文件夹<form class="h5-uploader-form"
                                                                                           action="javascript:void(0);"><input
                                                            title="点击选择文件夹" id="h5Input2" multiple="" webkitdirectory=""
                                                            accept="*/*" type="file" name="html5uploader"
                                                            style="position:absolute;opacity:0;top:0;left:0;width:100%;height:100%;cursor:pointer;"></form></a></span></span><a
                                                        class="g-button" data-button-id="b33" data-button-index="2"
                                                        href="javascript:;" title="新建文件夹"
                                                        style="display: inline-block;"><span class="g-button-right"><em
                                                        class="icon icon-newfolder" title="新建文件夹"></em><span
                                                        class="text" style="width: auto;">新建文件夹</span></span></a><span
                                                        class="g-dropdown-button tools-more" style="display: none;"><a
                                                        class="g-button" data-button-id="b39" data-button-index=""
                                                        href="javascript:;" title="更多"><span class="g-button-right"><em
                                                        class="icon icon-more" title="更多"></em><span class="text"
                                                                                                     style="width: auto;">更多</span></span></a><span
                                                        class="menu" style="width: 70px;"><a style="display:none;"
                                                                                             data-menu-id="b-menu0"
                                                                                             class="g-button-menu g-menu-hasIcon"
                                                                                             href="javascript:;"><em
                                                        class="icon icon-upload"></em>上传</a><a style="display:none;"
                                                                                               data-menu-id="b-menu1"
                                                                                               class="g-button-menu g-menu-hasIcon"
                                                                                               href="javascript:;"><em
                                                        class="icon icon-newfolder"></em>新建文件夹</a><a
                                                        style="display:none;" data-menu-id="b-menu2"
                                                        class="g-button-menu g-menu-hasIcon" href="javascript:;"><em
                                                        class="icon icon-download"></em>离线下载</a><a style="display:none;"
                                                                                                   data-menu-id="b-menu3"
                                                                                                   class="g-button-menu g-menu-hasIcon"
                                                                                                   href="javascript:;"><em
                                                        class="icon icon-device"></em>我的设备</a></span></span></div>
                                                <div class="button-box-mark"
                                                     style="display:inline-block;*display:inline;*zoom:1;width:1px;height:1px;line-height:0;"></div>
                                                <div class="QDDOQB"
                                                     style="position: absolute; top: 0px; line-height: normal; padding-top: 11px; display: none; padding-left: 11px; width: 1346px;">
                                                    <div style="display:none;width:100%;height:100%;z-index:30;position:absolute;top:0;left:0;"></div>
                                                    <a class="g-button" data-button-id="b41" data-button-index="1"
                                                       href="javascript:;" title="分享"><span class="g-button-right"><em
                                                            class="icon icon-share" title="分享"></em><span class="text"
                                                                                                          style="width: auto;">分享</span></span></a><a
                                                        class="g-button g-button-hastips" data-button-id="b43"
                                                        data-button-index="1" href="javascript:;"
                                                        title="邀人一起管理此文件夹"><span class="g-button-right"><em
                                                        class="icon icon-sharedir" title=""></em><span class="text"
                                                                                                       style="width: auto;">共享</span></span><span
                                                        class="g-button-tips">邀人一起管理此文件夹</span></a><a class="g-button"
                                                                                                      data-button-id="b45"
                                                                                                      data-button-index="1"
                                                                                                      href="javascript:;"
                                                                                                      title="取消共享"><span
                                                        class="g-button-right"><em class="icon icon-sharedir"
                                                                                   title="取消共享"></em><span class="text"
                                                                                                           style="width: auto;">取消共享</span></span></a><a
                                                        class="g-button" data-button-id="b47" data-button-index="1"
                                                        href="javascript:;" title="退出共享"><span
                                                        class="g-button-right"><em class="icon icon-sharedir"
                                                                                   title="退出共享"></em><span class="text"
                                                                                                           style="width: auto;">退出共享</span></span></a><a
                                                        class="g-button" data-button-id="b49" data-button-index="2"
                                                        href="javascript:;" title="音乐播放"><span
                                                        class="g-button-right"><em class="icon icon-play"
                                                                                   title="音乐播放"></em><span class="text"
                                                                                                           style="width: auto;">音乐播放</span></span></a><a
                                                        class="g-button" data-button-id="b51" data-button-index="3"
                                                        href="javascript:;" title="下载"><span class="g-button-right"><em
                                                        class="icon icon-download" title="下载"></em><span class="text"
                                                                                                         style="width: auto;">下载</span></span></a><a
                                                        class="g-button" data-button-id="b53" data-button-index="5"
                                                        href="javascript:;" title="删除"><span class="g-button-right"><em
                                                        class="icon icon-delete" title="删除"></em><span class="text"
                                                                                                       style="width: auto;">删除</span></span></a><a
                                                        class="g-button" data-button-id="b55" data-button-index="8"
                                                        href="javascript:;" title="云冲印"><span class="g-button-right"><em
                                                        class="icon icon-print" title="云冲印"></em><span class="text"
                                                                                                       style="width: auto;">云冲印</span></span></a><a
                                                        class="g-button" data-button-id="b57" data-button-index="9"
                                                        href="javascript:;" title="照片电影" style="display: none;"><span
                                                        class="g-button-right"><em class="icon icon-director"
                                                                                   title="照片电影"></em><span class="text"
                                                                                                           style="width: auto;">照片电影</span></span></a><a
                                                        class="g-button" data-button-id="b59" data-button-index="9"
                                                        href="javascript:;" title="历史版本" style="display: none;"><span
                                                        class="g-button-right"><em class="icon icon-history"
                                                                                   title="历史版本"></em><span class="text"
                                                                                                           style="width: auto;">历史版本</span></span></a><a
                                                        class="g-button" data-button-id="b61" data-button-index="13"
                                                        href="javascript:;" title="美化" style="display: none;"><span
                                                        class="g-button-right"><em class="icon icon-beauty"
                                                                                   title="美化"></em><span class="text"
                                                                                                         style="width: auto;">美化</span></span></a><a
                                                        class="g-button" data-button-id="b63" data-button-index="101"
                                                        href="javascript:;" title="重命名" style="display: none;"><span
                                                        class="g-button-right"><span class="text" style="width: auto;">重命名</span></span></a><a
                                                        class="g-button" data-button-id="b65" data-button-index="102"
                                                        href="javascript:;" title="复制到" style="display: none;"><span
                                                        class="g-button-right"><span class="text" style="width: auto;">复制到</span></span></a><a
                                                        class="g-button" data-button-id="b67" data-button-index="103"
                                                        href="javascript:;" title="移动到" style="display: none;"><span
                                                        class="g-button-right"><span class="text" style="width: auto;">移动到</span></span></a><a
                                                        class="g-button" data-button-id="b69" data-button-index="103"
                                                        href="javascript:;" title="详细信息" style="display: none;"><span
                                                        class="g-button-right"><em class="icon icon-share"
                                                                                   title="详细信息"></em><span class="text"
                                                                                                           style="width: auto;">详细信息</span></span></a><span
                                                        class="g-dropdown-button" style="display: none;"><a
                                                        class="g-button" data-button-id="b71" data-button-index="104"
                                                        href="javascript:;" title="推送到云设备"><span class="g-button-right"><span
                                                        class="text" style="width: auto;">推送到云设备</span></span></a><span
                                                        class="menu" style="width: 102px;"></span></span><span
                                                        class="g-dropdown-button tools-more"
                                                        style="display: inline-block;"><a class="g-button"
                                                                                          data-button-id="b73"
                                                                                          data-button-index=""
                                                                                          href="javascript:;"
                                                                                          title="更多"><span
                                                        class="g-button-right"><em class="icon icon-more"
                                                                                   title="更多"></em><span class="text"
                                                                                                         style="width: auto;">更多</span></span></a><span
                                                        class="menu" style="width: 96px;"><a style="display:none;"
                                                                                             data-menu-id="b-menu0"
                                                                                             class="g-button-menu g-menu-hasIcon g-disabled"
                                                                                             href="javascript:;"><em
                                                        class="icon icon-share"></em>分享</a><a style="display:none;"
                                                                                              data-menu-id="b-menu1"
                                                                                              class="g-button-menu g-menu-hasIcon g-disabled"
                                                                                              href="javascript:;"><em
                                                        class="icon icon-sharedir"></em>共享</a><a style="display:none;"
                                                                                                 data-menu-id="b-menu2"
                                                                                                 class="g-button-menu g-menu-hasIcon g-disabled"
                                                                                                 href="javascript:;"><em
                                                        class="icon icon-sharedir"></em>取消共享</a><a style="display:none;"
                                                                                                   data-menu-id="b-menu3"
                                                                                                   class="g-button-menu g-menu-hasIcon g-disabled"
                                                                                                   href="javascript:;"><em
                                                        class="icon icon-sharedir"></em>退出共享</a><a style="display:none;"
                                                                                                   data-menu-id="b-menu4"
                                                                                                   class="g-button-menu g-menu-hasIcon g-disabled"
                                                                                                   href="javascript:;"><em
                                                        class="icon icon-play"></em>音乐播放</a><a style="display:none;"
                                                                                               data-menu-id="b-menu5"
                                                                                               class="g-button-menu g-menu-hasIcon g-disabled"
                                                                                               href="javascript:;"><em
                                                        class="icon icon-download"></em>下载</a><a style="display:none;"
                                                                                                 data-menu-id="b-menu6"
                                                                                                 class="g-button-menu g-menu-hasIcon g-disabled"
                                                                                                 href="javascript:;"><em
                                                        class="icon icon-delete"></em>删除</a><a style="display:none;"
                                                                                               data-menu-id="b-menu7"
                                                                                               class="g-button-menu g-menu-hasIcon g-disabled"
                                                                                               href="javascript:;"><em
                                                        class="icon icon-print"></em>云冲印</a><a style="display: block;"
                                                                                               data-menu-id="b-menu8"
                                                                                               class="g-button-menu g-menu-hasIcon g-disabled"
                                                                                               href="javascript:;"><em
                                                        class="icon icon-director"></em>照片电影</a><a
                                                        style="display: block;" data-menu-id="b-menu9"
                                                        class="g-button-menu g-menu-hasIcon g-disabled"
                                                        href="javascript:;"><em
                                                        class="icon icon-history"></em>历史版本</a><a
                                                        style="display: block;" data-menu-id="b-menu10"
                                                        class="g-button-menu g-menu-hasIcon g-disabled"
                                                        href="javascript:;"><em class="icon icon-beauty"></em>美化</a><a
                                                        style="display: block;" data-menu-id="b-menu11"
                                                        class="g-button-menu  g-disabled" href="javascript:;">重命名</a><a
                                                        style="display: block;" data-menu-id="b-menu12"
                                                        class="g-button-menu  g-disabled" href="javascript:;">复制到</a><a
                                                        style="display: block;" data-menu-id="b-menu13"
                                                        class="g-button-menu  g-disabled" href="javascript:;">移动到</a><a
                                                        style="display: block;" data-menu-id="b-menu14"
                                                        class="g-button-menu g-menu-hasIcon g-disabled"
                                                        href="javascript:;"><em
                                                        class="icon icon-share"></em>详细信息</a><span
                                                        style="display: block;" data-menu-id="b-menu15"
                                                        class="g-button-menu g-menu-hasIcon g-disabled"><span
                                                        class="g-dropdown-button g-dropdown-button-second"
                                                        menulevel="2"><a class="g-button" data-button-id="b75"
                                                                         data-button-index="104" href="javascript:;"
                                                                         title="推送到云设备"><span
                                                        class="g-button-right"><span class="text" style="width: auto;">推送到云设备</span></span></a><span
                                                        class="menu"></span></span></span></span></span></div>
                                            </div>
                                        </div>
                                        <div class="hhksz653"></div>
                                        <div class="cijgXy">
                                        </div>
                                        <div node-type="EQBfLM" class="EQBfLM g-clearfix">
                                            <a href="https://pan.baidu.com/disk/timeline" class="AbMfvg">时光轴</a>
                                            <a href="javascript:void(0);" class="AbMfvg selected">最近上传</a>
                                        </div>
                                    </div>
                                    <div class="Jfx9mB" node-type="Jfx9mB">
                                        <!--[if IE]>
                                        <iframe id="historyIFrameEmulator" style="display: none"></iframe><![endif]-->
                                        <div node-type="KPDwCE" class="KPDwCE" style="height: 773px;">
                                            <div node-type="JDeHdxb" class="JDeHdxb"><span
                                                    class="EgMMec">全部文件</span><span class="FcucHsb">已全部加载，共0个</span>
                                                <ul class="FuIxtL" node-type="FuIxtL" style="display: none;">
                                                    <li><a data-deep="-1" href="javascript:;">返回上一级</a><span
                                                            class="EKIHPEb">|</span></li>
                                                    <li node-type="tbAudfb"></li>
                                                </ul>
                                            </div>
                                            <div class="QxJxtg">
                                                <div class="xGLMIab">
                                                    <ul class="QAfdwP tvPMvPb" node-type="tvPMvPb">
                                                        <li data-key="name" class="fufHyA yfHIsP" style="width:60%;">
                                                            <div node-type="fydGNC" class="Qxyfvg fydGNC"><span
                                                                    class="zbyDdwb"></span><span
                                                                    class="MIMvNNb">全选</span><span
                                                                    class="icon NbKJexb icon-checksmall"></span></div>
                                                            <span class="text">文件名</span><span
                                                                class="xEuDywb"></span><span
                                                                class="icon aHEytd icon-up"></span><span
                                                                class="icon sFxCFbb icon-downtitle"></span></li>
                                                        <li data-key="size" class="fufHyA" style="width:16%;"><span
                                                                class="text">大小</span><span class="xEuDywb"></span><span
                                                                class="icon aHEytd icon-up"></span><span
                                                                class="icon sFxCFbb icon-downtitle"></span></li>
                                                        <li data-key="time" class="fufHyA gObdAzb MCGAxG"
                                                            style="width:23%;"><span class="text">修改日期</span><span
                                                                class="xEuDywb"></span><span
                                                                class="icon aHEytd icon-up"></span><span
                                                                class="icon sFxCFbb icon-downtitle"></span></li>
                                                    </ul>
                                                    <ul class="vwCPvP tvPMvPb" node-type="tvPMvPb"
                                                        style="display: none;">
                                                        <li class="fufHyA yfHIsP">
                                                            <div node-type="fydGNC" class="Qxyfvg fydGNC"><span
                                                                    class="zbyDdwb"></span><span
                                                                    class="MIMvNNb">全选</span><span
                                                                    class="icon NbKJexb icon-checksmall"></span></div>
                                                        </li>
                                                    </ul>
                                                    <div class="FcQMwt global-clearfix"><span class="MdLxwM"></span>
                                                        <div class="KKtwaH"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="zJMtAEb" style="">
                                                <div node-type="NHcGw" class="NHcGw"
                                                     style="overflow-y: auto; height: 715px;">
                                                    <div class="vdAfKMb" style="height: auto;">
                                                        <dd id="fileTemple" style="display: none;"
                                                            class="g-clearfix AuPKyz open-enable" _position="0"
                                                            _cmd_installed="1" _installed="1"><span node-type="EOGexf"
                                                                                                    class="EOGexf gxvMIQ"><span
                                                                class="icon NbKJexb"></span></span>
                                                            <div class="ul0JKz dir-card-small"></div>
                                                            <div class="file-name" style="width:60%">
                                                                <div class="text"><a href="javascript:void(0);"
                                                                                     class="xlytjQoP"
                                                                >fileName</a></div>
                                                                <div class="operate">
                                                                    <div class="button-box-mark"
                                                                         style="display:inline-block;*display:inline;*zoom:1;width:1px;height:1px;line-height:0;"></div>
                                                                    <div class="x-button-box"
                                                                         style="position: absolute; top: 0px; line-height: normal; visibility: visible; width: 0px; padding-left: 0px; display: none;">
                                                                        <div style="display:none;width:100%;height:100%;z-index:30;position:absolute;top:0;left:0;"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="cwlz9JR" style="width:16%">fileSize</div>
                                                            <div class="avv0n1A" style="width:23%">fileDate</div>
                                                            <div class="ihjxDO" style="width:0%"><span class="dud8NNZ"
                                                                                                       node-type="qcf8PQk"></span>
                                                            </div>
                                                        </dd>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="fyQgAEb" style="display: none;">
                                                <div node-type="BNfIyPb" class="BNfIyPb" style="height: 715px;">
                                                    <div class="JKvHJMb"></div>
                                                </div>
                                            </div>
                                            <div class="wPQwLCb" style="visibility: hidden;">
                                                <div class="gQNsDv">
                                                    <svg class="spinner" width="26px" height="26px" viewBox="0 0 66 66"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <circle class="path" fill="none" stroke-width="6"
                                                                stroke-linecap="round" cx="33" cy="33" r="30"
                                                                style="stroke:#4288ed"></circle>
                                                    </svg>
                                                </div>
                                            </div>
                                            <div class="ExFGye">
                                                <div class="nlkw0V4a"><input node-type="kqrp8eK6" class="GadHyA"
                                                                             type="text" value=""><span
                                                        node-type="ylaw0VGa" class="yuajvbQ"><em
                                                        class="icon adzkjD76"></em><em
                                                        class="icon ngyh0p5B"></em></span><span node-type="jdj8kvR"
                                                                                                 class="ie8Pgk"><em
                                                        class="icon adzkjD76"></em><em
                                                        class="icon hegqzLWk"></em></span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="Tag9Skg" node-type="Tag9Skg">
                <div class="BG47h4" node-type="BG47h4">
                    <div class="frame-main" id="layoutServiceHolder" style="display: none;"></div>
                </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
    //TODO: 百度云首页 名字
    typeof initPrefetch === 'function' && initPrefetch('6d0585a73d2525db70c1a15de95780be', '张京京');
</script>
<img style="position:absolute;top:-10px;left:-10px;width:1px;height:1px;display:none;"
     src="/static/百度网盘-全部文件_files/file">
<img style="position:absolute;top:-10px;left:-10px;width:1px;height:1px;display:none;"
     src="/static/百度网盘-全部文件_files/file(1)">
<img style="position:absolute;top:-10px;left:-10px;width:1px;height:1px;display:none;"
     src="/static/百度网盘-全部文件_files/file(2)">


<div style="display: none;">

</div>
<%--<div class="module-yun-tip red-yun-tips" style="top: 74px; left: 50%; margin-left: -66.5px;">--%>
<%--<div class="tip-inner"><span class="tip-icon icon icon-tips-caution"></span><span class="tip-msg">列表加载失败</span><span--%>
<%--class="tip-close tip-icon icon icon-tips-close"></span></div>--%>
<%--</div>--%>
<div class="dialog dialog-web-uploader   dialog-blue h5-uploader" id="web-uploader" style="width: 633px;">
    <div class="dialog-header"><h3><span class="dialog-header-title"><em class="select-text">文件上传</em></span></h3>
        <div class="dialog-control"><span class="dialog-icon dialog-close icon icon-close"><span class="sicon">×</span></span><span
                class="dialog-icon dialog-min icon icon-minimize"><span class="sicon">-</span></span></div>
    </div>
    <div class="dialog-min-header">
        <div class="header-progress"></div>
        <h3><span class="dialog-header-title"><em class="select-text">文件上传</em></span></h3>
        <div class="dialog-control"><span class="dialog-icon dialog-close icon icon-close"><span class="sicon">×</span></span><span
                class="dialog-icon dialog-back icon icon-maximizing"><span class="sicon">□</span></span></div>
        <div class="tips" style="display: block;">
            <div class="resident-caution"><span class="caution-title">警告</span><span class="caution-text">严禁利用百度网盘上传、传播暴力恐怖、色情违法及其他违法信息，一经发现将严格按照相关法律法规处理。</span><em
                    class="arrow-outer"></em><em class="arrow-inner"></em></div>
            <a class="g-button" ><span class="g-button-right">立即下载</span></a>
            <div class="text"></div>
            <em class="close">×</em></div>
    </div>
    <div class="dialog-body">
        <div class="uploader-list-wrapper">
            <div class="uploader-list-header">
                <div class="file-name">文件(夹)名</div>
                <div class="file-size">大小</div>
                <div class="file-path">上传目录</div>
                <div class="file-status">状态</div>
                <div class="file-operate">操作</div>
            </div>
            <div class="tips" style="display: block;">
                <div class="resident-caution"><span class="caution-title">警告</span><span class="caution-text">严禁利用百度网盘上传、传播暴力恐怖、色情违法及其他违法信息，一经发现将严格按照相关法律法规处理。</span><em
                        class="arrow-outer"></em><em class="arrow-inner"></em></div>
                <a class="g-button"><span class="g-button-right">立即下载</span></a>
                <div class="text"></div>
                <em class="close">×</em></div>
            <div class="uploader-list">
                <ul class="container" id="uploaderList"></ul>
            </div>
        </div>
    </div>
</div>
<div style="position:absolute;background:rgba(255,255,255,0.6);                border:3px #ccc dashed;z-index:1000000;display:none;                color:#999;font-size:40px;text-align:center;overflow:hidden;                ">
    上传文件到当前目录下
</div>
<div class="httpProxy-container" style="position:absolute;top:-9999px;">
    <div id="httpProxy" class="httpProxy" style="visibility: visible;"></div>
</div>
</body>
</html>