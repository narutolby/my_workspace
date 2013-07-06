<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 13-6-14
  Time: 下午9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <%@include file="../snippet/meta.jsp" %>
    <link href="css/resrc_rec_sys.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        #reviewList
        {
            font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
            width:100%;
            border-collapse:collapse;
        }

        #reviewList td, #reviewList th
        {
            font-size:1em;
            border:1px solid #98bf21;
            padding:3px 7px 2px 7px;
        }

        #reviewList th
        {
            font-size:1.1em;
            text-align:center;
            padding-top:5px;
            padding-bottom:4px;
            background-color:#A7C942;
            color:#ffffff;
        }

        #reviewList tr.alt td
        {
            color:#000000;
            background-color:#EAF2D3;
        }
        #demo {
            margin: 50px auto;
            min-height: 600px;

        }
    </style>
</head>

<body>
<div id="wrapper">
    <%@include file="../snippet/header.jsp" %>
    <div id="demo">
        <!--<input type="hidden" id="resourcePageCount" value="${pager.pageCount}"/>
        <input type="hidden" id="resourcePageNo" value="${pager.pageNo}"/>
         -->

        <table width="100%" id="reviewList">
            <thead>
            <tr>
                <!--<th>类型</th> -->
                <th>资源名称</th>
                <th>资源描述</th>
                <th>大小</th>
                <th>下载次数</th>
                <!--<th>上传人</th>-->
                <th>下载资源</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${allResource}" var="resourceutil">
                <tr class="folder folder_nodes" id="resourceTable">
                    <!--<td>${resourceutil.resource.resourceType}</td> -->
                    <td id="${resourceutil.resource.resourceRealName}">${resourceutil.resource.resourceRealName}</td>
                    <td>${resourceutil.resource.description}</td>
                    <td>${resourceutil.size} ${resourceutil.unit}</td>
                    <td>${resourceutil.resource.downloadTimes}</td>
                    <!--<td>${resourceutil.resource.uploadUser}</td> -->
                    <td><a href='resourceOperation/download.html?resourceId=${resourceutil.resource.id}'><img src="img/icon_download_small.png"/></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div id="dialog-confirm" title="审核提示">
            <p id="msg" style="display: none;">
                <span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>
                确定审核结果吗？</p>
        </div>

    </div>
    <div class="clr"></div>
    <%@include file="../snippet/footer.jsp" %>
</div>

</body>


<script type="text/javascript">

</script>
</html>