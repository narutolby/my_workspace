<%--
  Created by IntelliJ IDEA.
  User: zhaomeng
  Date: 12-8-12
  Time: 上午10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <%@include file="../snippet/meta.jsp" %>
    <link href="css/resrc_rec_sys.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrapper">
    <%@include file="../snippet/header.jsp" %>
    <div id="content">
        <div id="aside">
            <div id="aside-content" style="min-height: 300px">
                <div id="folder_parent" class="folder folder_selected"><p id="root" class="folder-parent-icon">我的文件夹：</p></div>
            </div>
            <div id="aside-content1" class="aside-content" style="min-height: 300px;margin-top: 15px;">
                <div class="folder folder_selected folder_parent"><p class="folder-parent-icon root">我的标签：</p></div>
                <div class="folder folder_nodes"><p class="folder-nodes-icon">已关注标签</p></div>
                <div class="folder folder_nodes"><p class="folder-nodes-icon">标签推荐</p></div>
                <%--<div class="folder folder_nodes"><p class="folder-nodes-icon">添加标签</p></div>--%>
            </div>
        </div>
        <div id="content-right">
            <div class="doc_type" id="doc_type" style="display: none">
                <ul>
                    <li class="selected_type">
                        <a href="javascript:void(0)" id="all">全部
                        </a></li>
                    <li><a href="javascript:void(0)" id="pdf">
                        PDF
                    </a></li>
                    <li><a href="javascript:void(0)" id="doc|docx">
                        Word
                    </a></li>
                    <li><a href="javascript:void(0)" id="ppt|pptx|pps">
                        PPT
                    </a></li>
                    <li><a href="javascript:void(0)" id="txt">
                        Txt
                    </a></li>
                    <li><a href="javascript:void(0)" id="other">
                        其他
                    </a></li>
                </ul>
                <div class="clr"></div>
            </div>
        </div>
        <div id="article">
            <div class="doc_sort" id="doc_sort" style="display: none">
                <p class="flt_l">排序：</p>
                <input type="button" class="btn_kind btn_sortDesc" id="uploadTime" value="发布日期&nbsp;&nbsp;"/>
                <input type="button" class="btn_kind " id="resourceSize" value="文件大小&nbsp;&nbsp;"/>
                <input type="button" class="btn_kind" id="downloadTimes" value="下载次数&nbsp;&nbsp;"/>
            </div>
            <div id="upload-resource">
                <a href="elec_resrc/upload.html" class="btn_uploadS" id="upload">上传资源</a>
            </div>
            <div class="clr"></div>
            <%--<div class="folder_operation" id="folder_operation">
                <p>文件夹操作：</p>
                <input type="button" value="上一级"/>
                &lt;%&ndash;<input type="button" value="新建文件夹"/>&ndash;%&gt;
                <input type="button" value="移动"/>
                <input type="button" value="删除"/>
            </div>--%>
            <div class="clr"></div>
            <ul class="bigFolder" id="bidFolder"></ul>
            <ul class="myResrcList" id="resrc_list">
                <%-- <c:forEach items="${requestScope.pager.domainList}" var="model">
                    <%@include file="../template/myResourceTmpl.jsp"%>
                </c:forEach>--%>
            </ul>
            <ul class="tag-manage" id="tag-manage">
                <li id="my_tags"><div>
                    <div class="tag-view-type clearfix">
                        <span class="rr greyinput"><span id="edit_tag">编辑标签</span><span style="display: none;" id="exit_edit_tag">退出编辑</span></span>
                        <span class="rr greyinput" style="margin-right: 5px"> <span id="add_tag">增加标签</span></span>
                    </div>

                    <div class="">
                        <a name="科技">
                            <h2 style="padding-top:10px">科技 · · · · · · </h2>
                        </a>
                        <table class="tagCol">
                            <tbody>
                            <tr>
                                <td><a href="./科技">科技</a><b>(4069)</b></td>
                                <td><a href="./UE">UE</a><b>(3323)</b></td>
                                <td><a href="./UCD">UCD</a><b>(3027)</b></td>
                                <td><a href="./通信">通信</a><b>(2635)</b></td>
                            </tr>
                            <tr>
                                <td><a href="./交互">交互</a><b>(2519)</b></td>
                                <td><a href="./神经网络">神经网络</a><b>(979)</b></td>
                                <td><a href="./程序">程序</a><b>(853)</b></td>
                            </tr></tbody>
                        </table>
                    </div>
                    <div class="">
                        <a name="文学">
                            <h2 style="padding-top:10px">文学 · · · · · · </h2>
                        </a>
                        <table class="tagCol">
                            <tbody>
                            <tr>
                                <td><a href="./小说">小说</a><b>(2731948)</b></td>
                                <td><a href="./外国文学">外国文学</a><b>(900859)</b></td>
                                <td><a href="./文学">文学</a><b>(586797)</b></td>
                                <td><a href="./随笔">随笔</a><b>(553949)</b></td>
                            </tr>
                            <tr>
                                <td><a href="./张爱玲">张爱玲</a><b>(131060)</b></td>
                                <td><a href="./杂文">杂文</a><b>(130781)</b></td>
                                <td><a href="./儿童文学">儿童文学</a><b>(111342)</b></td>
                                <td><a href="./古典文学">古典文学</a><b>(108297)</b></td>
                            </tr>
                            <tr>
                                <td><a href="./杜拉斯">杜拉斯</a><b>(33236)</b></td>
                                <td><a href="./米兰·昆德拉">米兰·昆德拉</a><b>(32077)</b></td>
                                <td><a href="./港台">港台</a><b>(5237)</b></td>
                            </tr></tbody>
                        </table>
                    </div>

                </div></li>
                <li><div>
                <div class="article">
                <div class="tag-view-type clearfix">
                <span class="rr greyinput">分类浏览 /<a href="elec_resrc/tag_all_elec_resrc.html">热门标签</a></span>
                </div>

                <div class="">
                <div class="">
                    <a name="科技">
                        <h2 style="padding-top:10px">科技 · · · · · · </h2>
                    </a>
                    <table class="tagCol">
                        <tbody>
                        <tr>
                            <td><a href="./科普">科普</a><b>(216789)</b></td>
                            <td><a href="./互联网">互联网</a><b>(87584)</b></td>
                            <td><a href="./编程">编程</a><b>(70490)</b></td>
                            <td><a href="./科学">科学</a><b>(51244)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./交互设计">交互设计</a><b>(36175)</b></td>
                            <td><a href="./用户体验">用户体验</a><b>(28710)</b></td>
                            <td><a href="./算法">算法</a><b>(23889)</b></td>
                            <td><a href="./web">web</a><b>(15753)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./科技">科技</a><b>(4069)</b></td>
                            <td><a href="./UE">UE</a><b>(3323)</b></td>
                            <td><a href="./UCD">UCD</a><b>(3027)</b></td>
                            <td><a href="./通信">通信</a><b>(2635)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./交互">交互</a><b>(2519)</b></td>
                            <td><a href="./神经网络">神经网络</a><b>(979)</b></td>
                            <td><a href="./程序">程序</a><b>(853)</b></td>
                        </tr></tbody>
                    </table>
                </div>
                <div class="">
                    <a name="生活">
                        <h2 style="padding-top:10px">生活 · · · · · · </h2>
                    </a>
                    <table class="tagCol">
                        <tbody>
                        <tr>
                            <td><a href="./爱情">爱情</a><b>(411476)</b></td>
                            <td><a href="./旅行">旅行</a><b>(363503)</b></td>
                            <td><a href="./生活">生活</a><b>(212805)</b></td>
                            <td><a href="./励志">励志</a><b>(191607)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./摄影">摄影</a><b>(160114)</b></td>
                            <td><a href="./成长">成长</a><b>(159144)</b></td>
                            <td><a href="./心理">心理</a><b>(149636)</b></td>
                            <td><a href="./女性">女性</a><b>(106380)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./职场">职场</a><b>(104288)</b></td>
                            <td><a href="./游记">游记</a><b>(94983)</b></td>
                            <td><a href="./美食">美食</a><b>(89441)</b></td>
                            <td><a href="./教育">教育</a><b>(81274)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./灵修">灵修</a><b>(71532)</b></td>
                            <td><a href="./情感">情感</a><b>(33014)</b></td>
                            <td><a href="./健康">健康</a><b>(30154)</b></td>
                            <td><a href="./手工">手工</a><b>(25173)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./养生">养生</a><b>(19748)</b></td>
                            <td><a href="./两性">两性</a><b>(13931)</b></td>
                            <td><a href="./家居">家居</a><b>(9908)</b></td>
                            <td><a href="./人际关系">人际关系</a><b>(9202)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./自助游">自助游</a><b>(2253)</b></td>
                        </tr></tbody>
                    </table>
                </div>
                <div class="">
                    <a name="经管">
                        <h2 style="padding-top:10px">经管 · · · · · · </h2>
                    </a>
                    <table class="tagCol">
                        <tbody>
                        <tr>
                            <td><a href="./经济学">经济学</a><b>(202744)</b></td>
                            <td><a href="./管理">管理</a><b>(192581)</b></td>
                            <td><a href="./经济">经济</a><b>(163473)</b></td>
                            <td><a href="./金融">金融</a><b>(121419)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./商业">商业</a><b>(110059)</b></td>
                            <td><a href="./投资">投资</a><b>(91266)</b></td>
                            <td><a href="./营销">营销</a><b>(64813)</b></td>
                            <td><a href="./理财">理财</a><b>(39681)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./创业">创业</a><b>(37894)</b></td>
                            <td><a href="./广告">广告</a><b>(35803)</b></td>
                            <td><a href="./股票">股票</a><b>(23662)</b></td>
                            <td><a href="./企业史">企业史</a><b>(10316)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./策划">策划</a><b>(4452)</b></td>
                        </tr></tbody>
                    </table>
                </div>
                <div class="">
                    <a name="文化">
                        <h2 style="padding-top:10px">文化 · · · · · · </h2>
                    </a>
                    <table class="tagCol">
                        <tbody>
                        <tr>
                            <td><a href="./历史">历史</a><b>(872670)</b></td>
                            <td><a href="./心理学">心理学</a><b>(577631)</b></td>
                            <td><a href="./哲学">哲学</a><b>(527568)</b></td>
                            <td><a href="./传记">传记</a><b>(387522)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./文化">文化</a><b>(343625)</b></td>
                            <td><a href="./社会学">社会学</a><b>(262381)</b></td>
                            <td><a href="./设计">设计</a><b>(207798)</b></td>
                            <td><a href="./艺术">艺术</a><b>(195517)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./政治">政治</a><b>(166870)</b></td>
                            <td><a href="./社会">社会</a><b>(159076)</b></td>
                            <td><a href="./建筑">建筑</a><b>(149502)</b></td>
                            <td><a href="./宗教">宗教</a><b>(125640)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./电影">电影</a><b>(123535)</b></td>
                            <td><a href="./数学">数学</a><b>(107643)</b></td>
                            <td><a href="./政治学">政治学</a><b>(90690)</b></td>
                            <td><a href="./思想">思想</a><b>(80055)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./回忆录">回忆录</a><b>(78292)</b></td>
                            <td><a href="./国学">国学</a><b>(71672)</b></td>
                            <td><a href="./中国历史">中国历史</a><b>(67043)</b></td>
                            <td><a href="./音乐">音乐</a><b>(62090)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./人文">人文</a><b>(61671)</b></td>
                            <td><a href="./戏剧">戏剧</a><b>(55556)</b></td>
                            <td><a href="./人物传记">人物传记</a><b>(51328)</b></td>
                            <td><a href="./绘画">绘画</a><b>(38104)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./佛教">佛教</a><b>(34050)</b></td>
                            <td><a href="./艺术史">艺术史</a><b>(33955)</b></td>
                            <td><a href="./军事">军事</a><b>(29325)</b></td>
                            <td><a href="./西方哲学">西方哲学</a><b>(28306)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./二战">二战</a><b>(26236)</b></td>
                            <td><a href="./自由主义">自由主义</a><b>(25939)</b></td>
                            <td><a href="./近代史">近代史</a><b>(23507)</b></td>
                            <td><a href="./考古">考古</a><b>(20926)</b></td>
                        </tr>
                        <tr>
                            <td><a href="./美术">美术</a><b>(15435)</b></td>
                        </tr></tbody>
                    </table>
                </div>

                </div>
                </div>
                </div></li>
            </ul>
            <div id="destination" class="detail_hidden"><img src="img/icon_trash.jpg"/></div>
            <%@include file="../snippet/pagination.jsp" %>
        </div>
    </div>
    <div class="clr"></div>
    <%@include file="../snippet/footer.jsp" %>

</div>
<div class="myResrc_detail">
</div>
<div id="downloadArrow" class="detail_hidden"><img src="img/icon_download.png"/></div>
<script id="myResourceTemplate" type="text/x-jquery-tmpl"></script>
<script type="text/javascript">
    $L.script("js/myResource.js").wait(function () {
                $.importTemplate("tmpl/myResource.tmpl", "myResourceTemplate");
                var _t;
                $("#resrc_list").bind("mouseover",function(event){
                    var $t = $(event.target);
                    var _li = $t.closest("li");
                    if(!_t){
                        _t = _li;
                    }else{
                       if(_t.is(_li)){
                           return;
                       }else{
                           _t.find(".resc_tip").stop(true,true).hide().end().find(".resc_tip_div").hide();
                           _t = _li;
                       }
                    }
                    var _len = _li.size();
                    if(_len==1){
                        _li.find(".resc_tip").stop(true,true).show().end().find(".resc_tip_div").show();
                    }else{
                        _li.parent("ul").find()
                    }
                });
            }
    );
</script>
<div id="add_tag_dialog" title="增加标签" style="display: none;">
    <form name="loginForm" id="loginForm" action="user/login.json" method="post">
        <div id="loginContent" style="text-align: center;margin-top: 10px">
            <div><span>增加标签:</span><input class="login" type="text" value="" name="userId"/></div>
        </div>
    </form>
</div>
</body>
</html>