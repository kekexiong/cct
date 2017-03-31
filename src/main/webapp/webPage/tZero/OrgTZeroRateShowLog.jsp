<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%
String mno=request.getParameter("mno");
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
    <jsp:include page="../common/resource.jsp" flush="true"/>
</head>

<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md" style="background-color:white;">
<div style="maring:5px 5px 10px 5px;"><h5 style="font-weight:bold;" >修改结算费率日志</h5></div>
    <!-- BEGIN HEADER -->
   <%--  <jsp:include page="../common/header.jsp" flush="true"/> --%>
    <!-- END HEADER -->
    
    <!-- BEGIN CONTAINER --> 
    <div class="clearfix"> </div>
    <div class="page-container">
    
    	<!-- BEGIN MENU -->
        <!-- END MENU -->
        
        <!-- BEGIN CONTENT -->
        <div class="page-content-wrapper">
		    <!-- 主体-->
		        <!-- 右边开始 -->  
		        <div class="row">
		           
		                <div class="clearfix"> </div>
		                <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-body wheel"  >
		                        <table  class="table table-striped table-bordered table-hover table-checkable order-column" id="queryMecGrid">
		                            <thead>
		                                <tr>
		                                	 <th class="nowrap">序号</th>
		                                    <th class="nowrap"> 商户编号</th>
		                                    <th class="nowrap"> 商户名称 </th>
		                                    <th class="nowrap"> 修改费率类型 </th>
		                                    <th class="nowrap"> 修改前费率</th>
		                                    <th class="nowrap"> 修改后费率</th>
		                                    <th class="nowrap"> 操作员</th>
		                                    <th class="nowrap"> 操作时间</th>
		                                </tr>
		                            </thead>
		                            <tbody> 
		                            </tbody>
		                        </table>
		                    </div>
		                    <!-- 分页开始 -->
		                    <div class="row no-margin" id="pagination-bar">
								<div class="col-sm-4 left no-padding" style="margin-left:10px">
									<div class="inline fl">
										记录数共:<span id="itemCount"></span>条 当前第<span id="nowpage"></span>/<span id="toalPage"></span>页 每页显示:
									</div>
									<div class="inline fl">
										<select id="limit" class=" form-control "
											onchange="onChange4PageSize(this)">
											<option value="10" selected="selected" >10</option>
											<option value="20">20</option>
											<option value="30">30</option>
											<option value="40">40</option>
											<option value="50">50</option>
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
	    	</div>

   
    
    <!-- BEGIN FOOTER -->
    <jsp:include page="../common/footer.jsp" flush="true"/>
    <!-- END FOOTER -->
    
    <script type="text/javascript">
    
  	//分页默认隐藏
    $("#pagination-bar").hide();
    var baseURL = "<%=request.getContextPath()%>";
    //每页多少条
    var limit=0;
    //当前页
    var page=1;
    //起始条
    var start=0;
    //总页数
    var toalPage;
    //数据列表缓存
    var tableData;

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
    		if (page == toalPage) {
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
    
    //全选列表数据
    function checkAll(checked) {
    	$("#queryMecGrid tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
     
  	
    //查询数据
    function reloadGrid() {
    	
    	var mno ='<%=mno%>'; 
		var url=baseURL+"/tZero/rate/queryOptLog/"+mno;
		
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=10;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
		
		$.ajax({
            type: "GET", 
            url: url,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: param,
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
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
    			
                $.each(data.items, function(index, obj) {  
                	var tr = $("<tr></tr>");
                	tr.append($("<td></td>").text(start + index + 1)); 
                	tr.append($("<td class=\"nowrap\"></td>").text(obj.mno)); 
                	tr.append($("<td class=\"nowrap\"></td>").text(obj.regNm));
                	if(obj.busTyp == '04'){
    					tr.append($("<td class=\"nowrap\"></td>").text('工作日费率'));
    				}else if(obj.busTyp == '05'){
    					tr.append($("<td class=\"nowrap\"></td>").text('非工作日费率'));
    				}else{
    					tr.append($("<td class=\"nowrap\"></td>").text(''));
    				}
                	
                	tr.append($("<td class=\"nowrap\"></td>").text(obj.oldRate+'%'));
                	tr.append($("<td class=\"nowrap\"></td>").text(obj.rate+'%'));
                	tr.append($("<td class=\"nowrap\"></td>").text(obj.oprId));
                	tr.append($("<td class=\"nowrap\"></td>").text(covertTimeData(obj.optDt,obj.optTm)));
                	$("#queryMecGrid tbody").append(tr);
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
              	//动态设置iframe高度
                var currentTabId = $("#tab-bar", parent.document).children('li.active').children('a').attr('href').replace('#tab_','');
                setIframeHeight($('#frame_'+currentTabId,parent.document)[0]);
	              //控制 复选框只能选中一个
	       		 $('input[type=checkbox]').bind('click', function(){
	       		 	$('input[type=checkbox]').not(this).attr("checked", false);
	       		 }); 
            }, 
            error: function(error) {
            	bootbox.alert("读取失败！");
            }
        });
	}
    var queryMethod=0;
    

    $(function(){
    	
    	/*初始化页面按钮权限*/
    	/* if (!hasPermission(PERMISSSIONCONST.USR001)) {$("#add_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.USR002)) {$("#edit_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.USR006)) {$("#info_btn").hide();} */
		
    	//加载数据
    	 reloadGrid(); 

    	
    	
    	
    	
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
   	});
    
function covertTimeData(date, time) {
    return date.substring(0, 4) + "-" + date.substring(4, 6) + "-" + date.substring(6, 8) 
    		+ " " + time.substring(0, 2) + ":" + time.substring(2, 4) + ":" + time.substring(4, 6);
};    





    </script>
    
</body>

</html>
 
