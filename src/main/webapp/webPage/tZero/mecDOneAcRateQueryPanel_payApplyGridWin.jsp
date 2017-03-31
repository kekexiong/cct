<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	String mno = request.getParameter("mno");
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh-hans">
<!--<![endif]-->

<head>
<meta charset="utf-8" />
<title>随行付收单管理系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=320, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<jsp:include page="../common/resource.jsp" flush="true" />

<style type="text/css">
body {
	background-color: #FFFFFF;
}
</style>

</head>

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md bodyarea" style="display:none;">

	<!-- BEGIN CONTAINER -->
	<div class="clearfix"></div>
	<div class="page-container" style="margin-top:10px;">
		<!-- BEGIN CONTENT -->
		<div class="portlet-body form">
			<div><span style="font-weight: bold; font-size: 15px; margin-left: 10px;">修改结算费率日志</span></div>
			<div class="form-body" style="overflow:hidden;">
				 <div class="portlet-body wheel">
                       <table class="table table-striped table-bordered table-hover table-checkable order-column" id="marppaGridPanel">
                           <thead>
                               <tr>
                                   <th> 序号 </th>
                                   <th> 商户编号 </th>
                                   <th> 商户名称 </th>
                                   <th> 修改前费率 </th>
                                   <th> 修改后费率 </th>
                                   <th> 操作员 </th>
                                   <th> 操作时间 </th>
                               </tr>
                           </thead>
                           <tbody>
                           </tbody>
                       </table>
                   </div>
                   <!-- 分页开始 -->
                   <div class="no-margin" id="pagination-bar">
					<div class="col-sm-4 left no-padding">
						<div class="inline fl">
							记录数共:<span id="itemCount"></span>条 当前第<span id="nowpage"></span>/<span id="toalPage"></span>页 每页显示:
						</div>
						<div class="inline fl">
							<select id="limit" class=" form-control "
								onchange="onChange4PageSize(this)">
								<option value="20" selected="selected" >10</option>
								<option value="20">20</option>
								<option value="30">30</option>
								<option value="45">45</option>
								<option value="60">60</option>
								<option value="75">75</option>
							</select>
						</div>
						<div class="inline fl">条</div>
					</div>

					<div class="col-sm-6 pull-right no-padding">


						<div id="pagination"
							class="dataTables_paginate paging_simple_numbers clearfix pull-right">
							<nobr>
								<ul class="pagination no-padding" style="float: left">
									<li class="prev "> <a href="javascript:;" onclick="javascript:pageing(1)"> 首页</a> </li>
									<li class="prev "> <a href="javascript:;" onclick="javascript:pageing('pro')"> 上一页</a> </li>
									<li class="next "><a href="javascript:;" onclick="javascript:pageing('next')">下一页</a></li>
									<li class="next "><a href="javascript:;" onclick="javascript:pageing('last')">末页</a></li>
								</ul>
								<div class="input-group pull-right col-sm-2" style="float: left;">
									<input min="1" class="form-control p" style="height: 31px; width: 80px;" type="number">
									<a href="javascript:;" class="input-group-addon" onclick="javascript:pageing($('.p').val())"><i class="fa fa-mail-forward brown"></i></a>
								</div>
							</nobr>
						</div>
					</div>
               	</div>
               	<!-- 分页结束 -->
           	</div>
			</div>
		</div>
		<!-- END CONTENT -->
	<!-- END CONTAINER -->

<script type="text/javascript">
	var sinfo = false;
</script>
	<!-- BEGIN FOOTER -->
	<jsp:include page="../common/footer.jsp" flush="true" />
	<!-- END FOOTER -->

</body>
<script type="text/javascript">
var baseURL = "<%=request.getContextPath()%>";
var mno = '<%=mno%>';
//分页默认隐藏
$("#pagination-bar").hide();

//每页多少条
var limit=10;
//当前页
var page=1;
//起始条
var start=0;
//总页数
var toalPage;
//数据列表缓存
var tableData;

//显示时间格式化
function covertTimeData(date, time) {
    return date.substring(0, 4) + "-" + date.substring(4, 6) + "-" + date.substring(6, 8) 
    		+ " " + time.substring(0, 2) + ":" + time.substring(2, 4) + ":" + time.substring(4, 6);
};

//分页
function pageing(opp) {
    	$(window.top.document).scrollTop(0,500);
	limit=$("#limit  option:selected").text();
	 
	if(opp=='pro')
	{
		if(page>1)
		{
			page=page-1;
			start=(page-1)*limit;
		}
		else
		{
			bootbox.alert('已经是第一页');
			return;
		}
	}
	else if (opp=='next')
	{
		if(page==toalPage)
		{
			bootbox.alert('已经是最后一页');
			return;
		}
		page=page+1;
		start=(page-1)*limit;
	}
	else if (opp=='last')
	{
		 if(page == toalPage){
	            return;
	        }
		page=$("#toalPage").text();
		if(page>toalPage)
		{
			bootbox.alert('对不起没有你要跳转的页面');
			return;
		}
		else if(page<1)
		{
			bootbox.alert('对不起没有你要跳转的页面');
			return;
		}
		
		start=(page-1)*limit;
	}
	else
	{
		 if (page == 1 && opp == 1) {
             return;
         }
         
         if(opp>toalPage)
         {
             bootbox.alert('对不起没有你要跳转的页面');
             return;
         }
         else if(opp<1)
         {
             bootbox.alert('对不起没有你要跳转的页面');
             return;
         }
         page=opp*1;
         start=(page-1)*limit;
	}
	$('table > tbody').empty();
	//$("table tbody [id^='resutl_']").remove();
	reloadGrid();
}
function onChange4PageSize(select) {
	limit = select.value;
	reloadGrid();
}


function reloadGrid() {
	$('table > tbody').empty();
	App.blockUI({target:"body",boxed:!0,message:"正在加载中...",zIndex:20000});
	if(limit==0) {
		//默认10条
		limit=10;
	}
	start=(page-1)*limit;
	var url = baseURL + "/tZero/acRate/queryAcRateLog/"+mno+"?start="+start+"&limit="+limit;
	$.ajax({
        type: "GET",
        url: url,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
        	if (data) {
        		if(data.totalCount==0){
        			parent.bootbox.alert("没有查到该商户修改结算费率的记录");
        			parent.$.fancybox.close();
        			return;
        		}
        		
        		toalPage=Math.ceil(data.totalCount/limit);
    			$("#itemCount").text(data.totalCount);
    			$("#nowpage").text(page);
    			$("#toalPage").text(toalPage);
    			if (!data.totalCount || data.totalCount == 0) {
    				$("#pagination-bar").hide();
    				return;
    			}
    			if (toalPage < 2) {
    				$("#pagination").hide();
    			} else {
    				$("#pagination").show();
    			}

    			tableData = $.extend(true, {}, data);//cache
    			$("#marppaGridPanel").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	var trData = [];
                	trData.push(start + index + 1);
                	trData.push(obj.mno);
                	trData.push(obj.mnoNm);
                	trData.push(obj.rateOld+"%");
                	trData.push(obj.rate+"%");
                	trData.push(obj.cteStffNo);
                	trData.push(covertTimeData(obj.dtCte,obj.tmCte));
                	for(i=0; i < trData.length; i++){
                      	 if(trData[i] == undefined){
                      		 trData[i] = ''; 
                   	 	}
                    }
                	$("#marppaGridPanel").DataTable().row.add(trData).draw();
                /*	var tr = $("<tr></tr>").append($("<td></td>").text(start + index + 1));
                	tr.append($("<td class=\"nowrap\"></td>").text(obj.mno));
                	tr.append($("<td></td>").text(obj.mnoNm));
                	tr.append($("<td></td>").text(obj.rateOld+"%"));
                	tr.append($("<td></td>").text(obj.rate+"%"));
                	tr.append($("<td></td>").text(obj.cteStffNo));
                	tr.append($("<td></td>").text(obj.dtCte));*/
                });
                $("#pagination-bar").show();
                if (page == 1) {
                	//first page
                	$("#pagination .prev a").css({'color':'gray','cursor':'not-allowed'});
                } else {
                	$("#pagination .prev a").css({'color':'#23527c','cursor':'pointer'});
                }
                if (page == toalPage) {
                	// last page
                	$("#pagination .next a").css({'color':'gray','cursor':'not-allowed'});
                } else {
                	$("#pagination .next a").css({'color':'#23527c','cursor':'pointer'});
                }
                $(".bodyarea").show();
             	//动态设置iframe高度
           //     var currentTabId = $("#tab-bar", parent.document).children('li.active').children('a').attr('href').replace('#tab_','');
           //     setIframeHeight($('#frame_'+currentTabId,parent.document)[0]);
			}
        },
        error: function(error) {
        }
    });

}

$(function(){
    	
	
	reloadGrid(mno);
	$('.page-footer').hide();
});
</script>
</html>

