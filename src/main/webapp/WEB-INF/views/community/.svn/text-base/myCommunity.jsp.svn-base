<%--
  Created by IntelliJ IDEA.
  User: zhaomeng
  Date: 12-10-17
  Time: 上午9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <%@include file="../snippet/meta.jsp" %>
    <link href="css/resrc_rec_sys.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        ul,li{margin:0;padding:0}
        #scrollDiv{height:100px;min-height:25px;line-height:25px;border:#ccc 1px solid;overflow:hidden}
        #scrollDiv li{height:25px;padding-left:10px;}
    </style>
    <script src="http://img.jb51.net/jslib/jquery/jquery14.js" type="text/javascript"></script>
</head>
<body>
<div id="wrapper">
    <%@include file="../snippet/header.jsp" %>
    <div id="content">
        <div id="aside">
            <div id="aside-content">
                <div id="folder_parent" class="folder folder_selected"><p class="commu-parent-icon">管理我的社区：</p></div>
                <c:forEach items="${communities}" var="community">
                    <div class="folder folder_nodes"><p class="commu-nodes-icon"><a
                            href="community/community_detail.html?c_id=${community.id}"
                            title="${community.name}">${fn:substring(community.name,0,11)}..</a></p></div>
                </c:forEach>
            </div>
        </div>
        <div id="commu-article">
            <div id="articleL">
                <div id="articleL-content" style="overflow:hidden;position: relative;">
                    <div id="commu-dynamics" class="folder folder_selected"><p class="hot-commu-icon">社区动态：</p></div>
                    <input type="hidden" value="${pageCount}" id="pageCount"/>

                    <div style="overflow: hidden;width:${528*pageCount}px;position:relative;left:0px" id="communities">
                        <c:forEach items="${communities}" var="community" varStatus="i">
                            <c:if test="${i.index%4==0}"><ul id="commu-dyna-list" style="float:left;width: 528px"></c:if>
                            <li class="commu-dyna">
                                <a href="community/community_detail.html?c_id=${community.id}">
                                    <img class="commu-img" src="img/icon_communityImg.png"/>
                                </a>
                                <div class="commu-detail">
                                    <p class="commu-name"><a title="${community.name}"
                                                             href="community/community_detail.html?c_id=${community.id}"
                                                             style="color:black">${fn:substring(community.name,0,11)}..</a>
                                    </p>
                                    <p class="commu-subdetail">成员(${community.memberCount})
                                        话题(${community.topicCount}) 资源(${community.resourceCount})</p>
                                </div>
                                <div class="clr"></div>
                                <ul class="commu-newmsg">
                                    <c:forEach items="${community.topics}" var="topic" begin="0" end="3">
                                        <c:if test="${topic.deleteFlag==1}">
                                            <li><a href="topic/detail.html?t_id=${topic.id}"
                                                   title="${topic.authorName}${topic.role==1?"老师":"同学"}发表了新话题：${topic.topicTitle}">${topic.authorName}${topic.role==1?"老师":"同学"}发表了新话题：${fn:substring(topic.topicTitle,0,6)}..</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                                <a href="community/community_detail.html?c_id=${community.id}"><span
                                        class="toSeemore">》&nbsp;查看更多</span></a>
                            </li>
                            <c:if test="${i.index%4==3}"></ul></c:if>
                        </c:forEach>

                    </div>
                    <c:if test="${pageCount!=0 && pageCount!=1}">
                        <div id="slide_bar">
                            <a href="javascript:void(0)"><img src="http://cdn-img.easyicon.cn/png/5484/548414.gif"
                                                              width="33px" id="arrowL" style="opacity: 0.5"/></a>
                            <a href="javascript:void(0)"><img src="http://cdn-img.easyicon.cn/png/5484/548415.gif"
                                                              width="33px" id="arrowR"/></a>
                        </div>
                    </c:if>
                    <div id="scrollDiv" style="position:absolute;bottom: 20px;width: 100%">
                        <ul >
                            <c:forEach items="${allcommunities}" var="community">
                                <li><a href="community/community_detail.html?c_id=${community.id}">${community.name}</a></li>
                            </c:forEach>
                        </ul>

                    </div>
                    <div style="position:absolute;bottom:0px;width: 100%"><span id="btn1" style="color: #2772BE">向前</span>&nbsp;&nbsp;<span id="btn2" style="color: #2772BE;">向后</span></div>
                </div>

            </div>
            <div id="articleR">
                <div id="articleR-content">
                    <div id="hot-commu" class="folder folder_selected"><p class="hot-commu-icon">热门社区：</p></div>
                    <ul class="hot-commu-list">
                        <c:forEach items="${hottestCommunities}" var="community">
                            <li>
                                <img class="hot-commu-img" src="img/icon_communityImg.png"
                                     alt="${community.name}"/>

                                <div class="hot-commu-detail">
                                    <p class="hot-commu-name"><a title="${community.name}"
                                                                 href="community/community_detail.html?c_id=${community.id}">${fn:substring(community.name,0,8)}..</a>
                                    </p>

                                    <p>社区成员：${community.memberCount}人</p>

                                    <p>主题文章：${community.topicCount}篇</p>
                                </div>
                            </li>
                        </c:forEach></ul>
                </div>
            </div>
        </div>
    </div>
    <div class="clr"></div>
    <%@include file="../snippet/footer.jsp" %>
</div>
<script type="text/javascript">
    $L.wait().script("js/myCommunity.js").script("js/scroll.js");
</script>
</body>
</html>