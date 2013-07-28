<%--
  Created by IntelliJ IDEA.
  User: zhaomeng
  Date: 12-8-11
  Time: 下午2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <%@include file="../snippet/meta.jsp"%>
    <link href="css/resrc_rec_sys.css" rel="stylesheet" type="text/css">
    <link href="css/tag.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrapper">
<%@include file="../snippet/header.jsp"%>
<div id="content">
    <div id="aside">
        <div id="resrc_mayLike">
            <div id="title_mayLike"><p>你可能感兴趣的资源：</p></div>
            <ul>
                <li>
                    <div class="pic_mayLike"><img src="img/book_1.jpg"/></div>
                    <div class="detail_mayLike">
                        <a href="#" class="pic_title">> Java编程</a>
                        <p>   如果时光可以重来，
                            我会鼓起勇气问，我们在一起，好不好？
                            如果时光可以重来，
                            我会拿起电
                        </p>
                        <p class="align"><a class="arrow" href="#">了解更多...</a></p>
                    </div>
                    <div class="clr"></div>
                </li>
                <li>
                    <div class="pic_mayLike"><img src="img/book_1.jpg"/></div>
                    <div class="detail_mayLike">
                        <a href="#" class="pic_title">> Java编程</a>
                        <p>   如果时光可以重来，
                            我会鼓起勇气问，我们在一起，好不好？
                            如果时光可以重来，
                            我会拿起电
                        </p>
                        <p class="align"><a class="arrow" href="#">了解更多...</a></p>
                    </div>
                    <div class="clr"></div>
                </li>
                <li>
                    <div class="pic_mayLike"><img src="img/book_1.jpg"/></div>
                    <div class="detail_mayLike">
                        <a href="#" class="pic_title">> Java编程</a>
                        <p>   如果时光可以重来，
                            我会鼓起勇气问，我们在一起，好不好？
                            如果时光可以重来，
                            我会拿起电
                        </p>
                        <p class="align"><a class="arrow" href="#">了解更多...</a></p>
                    </div>
                    <div class="clr"></div>
                </li>
            </ul>
        </div>
    </div>
    <div class="doc_type" style="display: none;">
        <ul>
            <a href="javascript:void(0)"><li class="selected_type">电子资源</li></a>
            <a href="book_resrc/tag_all_book_resrc.html" ><li>图书资源</li></a>
        </ul>
        <div class="clr"></div>
    </div>
    <div id="article">
        <div class="clr"></div>

        <p id="listTitle">全部资源：（${allResource.totalCount}）</p>
        <ul id="resourceList" class="resrc_list">
            <c:forEach items="${allResource.resourcelist}" var="resourceutil">
                <li class="li_first">
                    <c:if test="${resourceutil.resource.coverJpg==0}">
                        <div class="pic_sysRec"><img src="img/fileIcon/${resourceutil.resource.resourceType}.png"/></div>
                    </c:if>
                    <c:if test="${resourceutil.resource.coverJpg==1}">
                        <div class="pic_sysRec"><img src="swf/${resourceutil.resource.id}.jpg"/></div>
                    </c:if>
                    <div class="detail_sysRec">
                        <p class="title_sysRec">${resourceutil.resource.resourceRealName}</p>
                        <div>
                            <p class="subtitle_sysRec">资源大小：${resourceutil.size} ${resourceutil.unit}</p>
                            <div class="star_ratingCur">
                                <div>资源评分：</div>
                                <ul><li><img src="img/rating_star.jpg"></li>
                                    <li><img src="img/rating_star.jpg"></li>
                                    <li><img src="img/rating_star.jpg"></li>
                                    <li><img src="img/rating_star.jpg"></li>
                                    <li><img src="img/rating_star.jpg"></li>
                                </ul>
                                <div>(已有100人评价)</div>
                                <%--<div>下载次数：</div>--%>
                                <%--<div>${resourceutil.resource.downloadTimes}</div>--%>
                            </div>
                        </div>
                        <div class="clr"></div>
                        <p class="cont_sysRec">
                                ${resourceutil.resource.description}
                        </p>
                        <div>
                            <a href="elec_resrc/preview.html?resourceId=${resourceutil.resource.id}" target="_blank"><input type="button" class="btn_prev" value="&nbsp;&nbsp;预览"/></a>
                            <input type="button" class="btn_col" value="&nbsp;&nbsp;收藏"/>
                            <a href="resourceOperation/download.html?resourceId=${resourceutil.resource.id}" ><input type="button" class="btn_down" value="&nbsp;&nbsp;下载"/>  </a>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <%@include file="../snippet/pagination.jsp"%>
        <div class="page" id="resourcePage" style="margin-bottom: 3px">
            <ul style="position:relative;text-align: center">
                <li style="float: left;"><a id="prev" style="cursor: pointer">上一页</a></li>
                <%-- <li><a href="#prev">上一页</a></li>--%>
                <li style="float: left;"><ul id="pagelist" class="main-page" id="s_p">
                    <c:forEach begin="1" end="9" var="i">
                        <li  class="btn_page ${allResource.pageNo==i?"current":""}"><a id="${i}" style="cursor: pointer">${i}</a>
                        </li>
                    </c:forEach>
                    <li style="padding: 0 9px 0 9px;float: left;">...</li>
                    <c:forEach begin="${allResource.pageCount}" end="${allResource.pageCount}" var="i">
                        <li  class="btn_page ${allResource.pageNo==i?"current":""}"><a id="${i}" style="cursor: pointer">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
                </li>
                <%-- <li><a href="#next">下一页</a></li>--%>
                <li style="float: left;"><a id="next" style="cursor: pointer">下一页</a></li>
            </ul>
        </div>
    </div>

    <input type="hidden" id="resourcePageCount" value="${allResource.pageCount}"/>
    <input type="hidden" id="resourcePageNo" value="${allResource.pageNo}"/>

</div>
<div class="clr"></div>
<%@include file="../snippet/footer.jsp"%>
</div>
</body>
<script type="text/javascript">
    $L.wait().script("js/allResource.js");
</script>
</html>