/**
 * Created with IntelliJ IDEA.
 * User: zhang
 * Date: 13-6-17
 * Time: 下午3:07
 * To change this template use File | Settings | File Templates.
 */
(function ($, exports) {
    var ReviewResource ={

        pageNo:1,
        resources:$.template("resources",
            "<li class='li_first'>"+
                "{{if resource.coverJpg == 0}}"+
                    "<div class='pic_sysRec'><img src='img/fileIcon/${resource.resourceType}.png'/></div>"+
                "{{else}}"+
                    "<div class='pic_sysRec'><img src='swf/${resource.id}.jpg'/></div>"+
                "{{/if}}"+
                "<div class='detail_sysRec'>"+
                    "<p class='title_sysRec'>${resource.resourceRealName}</p>"+
                    "<div>"+
                        "<p class='subtitle_sysRec'>资源大小：${size} ${unit}</p>"+
                        "<div class='star_ratingCur'>"+
                            "<div>资源评分：</div>"+
                                "<ul><li><img src='img/rating_star.jpg'></li>"+
                                    "<li><img src='img/rating_star.jpg'></li>"+
                                    "<li><img src='img/rating_star.jpg'></li>"+
                                    "<li><img src='img/rating_star.jpg'></li>"+
                                    "<li><img src='img/rating_star.jpg'></li>"+
                                "</ul>"+
                                "<div>(已有100人评价)</div>"+
                        "</div>"+
                    "</div>"+
                    "<div class='clr'></div>"+
                    "<p class='cont_sysRec'>"+
                        "${resource.description}"+
                    "</p>"+
                    "<div>"+
                        "<a href='elec_resrc/preview.html?resourceId=${resource.id}' target='_blank'><input type='button' class='btn_prev' value='&nbsp;&nbsp;预览'/></a>"+
                        "<input type='button' class='btn_col' value='&nbsp;&nbsp;收藏'/>"+
                        "<input type='button' class='btn_down' value='&nbsp;&nbsp;下载'/>"+
                    "</div>"+
                "</div>"+
            "</li>"
            ),

        refresh:function(){
            //var hashStr = location.hash.replace("#","");
            $.post("elec_resrc/resourcePage.json",{pageNo:this.pageNo}, $.proxy(function(data){
                var resource = data.allResource;
                $("#resourceList").html($.tmpl("resources",resource.resourcelist));
                var li = "";
                var pageCount = resource.pageCount;
                var pageNo = resource.pageNo;

                if(pageCount > 12){
                    if(pageNo >= 11 && pageNo <= pageCount -10) {
                        for (var i = 1; i <= 2; i++) {
                            li += '<li class="btn_page ' + (i == pageNo ? "current" : "") + '"><a id="'+i+'" style="cursor:pointer">' + i + '</a> </li>';
                        }
                        li += '<li style="padding: 0 9px 0 9px;float: left;">...</li>';
                        for (var i = pageNo-4; i <= pageNo + 4; i++) {
                            li += '<li class="btn_page ' + (i == pageNo ? "current" : "") + '"><a id="'+i+'" style="cursor:pointer">' + i + '</a> </li>';
                        }
                        li += '<li style="padding: 0 9px 0 9px;float: left;">...</li>';
                        for (var i = pageCount-1; i <= pageCount; i++) {
                            li += '<li class="btn_page ' + (i == pageNo ? "current" : "") + '"><a id="'+i+'" style="cursor:pointer">' + i + '</a> </li>';
                        }
                    }
                    else if(pageNo >= 11 ){
                        for (var i = 1; i <= 2; i++) {
                            li += '<li class="btn_page ' + (i == pageNo ? "current" : "") + '"><a id="'+i+'" style="cursor:pointer">' + i + '</a> </li>';
                        }
                        li += '<li style="padding: 0 9px 0 9px;float: left;">...</li>';
                        for (var i = pageNo-4; i <= pageCount; i++) {
                            li += '<li class="btn_page ' + (i == pageNo ? "current" : "") + '"><a id="'+i+'" style="cursor:pointer">' + i + '</a> </li>';
                        }
                    }
                    else{
                        if(pageNo > 9 && pageCount > pageNo + 7){
                            for (var i = 1; i <= pageNo+4; i++) {
                                li += '<li class="btn_page ' + (i == pageNo ? "current" : "") + '"><a id="'+i+'" style="cursor:pointer">' + i + '</a> </li>';
                            }
                            li += '<li style="padding: 0 9px 0 9px;float: left;">...</li>';
                            for (var i = pageCount-1; i <= pageCount; i++) {
                                li += '<li class="btn_page ' + (i == pageNo ? "current" : "") + '"><a id="'+i+'" style="cursor:pointer">' + i + '</a> </li>';
                            }
                        }
                        else if(pageNo > 9){
                            for (var i = 1; i <= pageCount; i++) {
                                li += '<li class="btn_page ' + (i == pageNo ? "current" : "") + '"><a id="'+i+'" style="cursor:pointer">' + i + '</a> </li>';
                            }
                        }
                        else if(pageNo <= 9 && pageCount > pageNo +7){
                            for (var i = 1; i <= 9; i++) {
                                li += '<li class="btn_page ' + (i == pageNo ? "current" : "") + '"><a id="'+i+'" style="cursor:pointer">' + i + '</a> </li>';
                            }
                            if(pageNo >= 6){
                                for (var i = 10; i <= pageNo+4; i++) {
                                    li += '<li class="btn_page ' + (i == pageNo ? "current" : "") + '"><a id="'+i+'" style="cursor:pointer">' + i + '</a> </li>';
                                }
                            }

                            li += '<li style="padding: 0 9px 0 9px;float: left;">...</li>';
                            for (var i = pageCount-1; i <= pageCount; i++) {
                                li += '<li class="btn_page ' + (i == pageNo ? "current" : "") + '"><a id="'+i+'" style="cursor:pointer">' + i + '</a> </li>';
                            }
                        }
                        else{
                            for (var i = 1; i <= pageCount; i++) {
                                li += '<li class="btn_page ' + (i == pageNo ? "current" : "") + '"><a id="'+i+'" style="cursor:pointer">' + i + '</a> </li>';
                            }
                        }
                    }
                }
                else{
                    for (var i = 1; i <= pageCount; i++) {
                        li += '<li class="btn_page ' + (i == pageNo ? "current" : "") + '"><a id="'+i+'" style="cursor:pointer">' + i + '</a> </li>';
                    }
                }
                $("#pagelist").html(li);
            }));
        }

    };
    // 分页
    $(function () {
        var pageCount = $("#resourcePageCount").val();

        $("#resourcePage li a").live("click",(function(){
            var page = $(this).attr("id");
            var _pageNo = ReviewResource.pageNo;
            if(page == "prev"){
                _pageNo--;
                if(_pageNo < 1)
                    _pageNo++;
            }
            else if(page == "next"){
                _pageNo++;
                if(_pageNo > pageCount)
                    _pageNo--;
            }
            else{
                _pageNo = page;
            }
            ReviewResource.pageNo = _pageNo;
            ReviewResource.refresh();

        }));
    })
})(jQuery,window);

