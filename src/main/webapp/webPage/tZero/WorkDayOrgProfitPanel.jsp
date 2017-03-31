<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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

<!-- <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md"> -->
<body class="iframe-body">

    <!-- BEGIN HEADER -->
    <jsp:include page="../common/header.jsp" flush="true"/>
    <!-- END HEADER -->
    
    <!-- BEGIN CONTAINER -->
    <div class="clearfix"> </div>
    <div class="page-container">
    
    	<!-- BEGIN MENU -->
        <%-- <jsp:include page="../common/menu.jsp" flush="true"/> --%>
        <!-- END MENU -->
        
        <!-- BEGIN CONTENT -->
        <div class="page-content-wrapper">
		    <!-- 主体-->
		    <!-- <div class="page-content"> -->
		    <div class="">
		        <!-- 右边开始 -->
		        <div class="row">
		            <div class="col-md-12">
		                <div class="portlet light bordered scaffold-list">
		                    <!-- 查询信息 -->
		                    <div class="portlet-body form">
		                        <form action="<%=request.getContextPath()%>/tZero/org/workDay/profit" class="form-horizontal" id="workDayOrgProfitPanel_myForm">
		                            <div class="form-body">
		                                <div class="row norow">
			                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">起止日期:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange">
		                                                    <input type="text" class="form-control col-md-3" name="yMBg" id="workDayOrgProQyPanel_yMBg">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="yMEd" id="workDayOrgProQyPanel_yMEd">
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
			                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">合作商编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="orgNo" id="workDayOrgProQyPanel_orgNo" class="form-control" placeholder="请输入合作商编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">合作商名称:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="orgNm" id="workDayOrgProQyPanel_orgNm" class="form-control" placeholder="请输入合作商名称">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
	                                    <!-- 
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">日期开始:</label>
		                                            <div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm" data-date-viewmode="years" data-date-minviewmode="months">
		                                                 <input type="text" class="form-control col-md-3" name="yMBg" id="workDayOrgProQyPanel_yMBg" readonly>
                                                        <span class="input-group-btn">
                                                            <button class="btn default" type="button">
                                                                <i class="fa fa-calendar"></i>
                                                            </button>
                                                        </span>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">日期结束:</label>
		                                            <div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm" data-date-viewmode="years" data-date-minviewmode="months">
		                                                 <input type="text" class="form-control col-md-3" name="yMEd" id="workDayOrgProQyPanel_yMEd" readonly>
                                                        <span class="input-group-btn">
                                                            <button class="btn default" type="button">
                                                                <i class="fa fa-calendar"></i>
                                                            </button>
                                                        </span>
		                                            </div>
		                                        </div>
		                                    </div> -->
		                                 </div>
		                            </div>
		                            <div class="form-actions">
		                                <div class="row">
		                                    <div class="col-md-12">
		                                        <div class="row">
		                                            <div class="col-md-offset-1 col-md-11">
		                                                <button type="button" id="query_btn" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </form>
		                    </div>
		                </div>
		                <div class="clearfix"> </div>
		                <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-title">
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">D+1代理商分润列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="workDayOrgProfitGridPanel">
		                            <thead>
		                                <tr>
		                                    <th> 分润月份 </th>
		                                    <th> 合作商编号</th>
		                                    <th> 合作商名称 </th>
		                                    <th> 分润金额 </th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            </tbody>
		                        </table>
		                    </div>
		                    <!-- 分页开始 -->
		                    <div class="row no-margin" id="pagination-bar">
								<div class="col-sm-4 left no-padding">
									<div class="inline fl">
										记录数共:<span id="itemCount"></span>条 当前第<span id="nowpage"></span>/<span id="toalPage"></span>页 每页显示:
									</div>
									<div class="inline fl">
										<select id="limit" class=" form-control "
											onchange="onChange4PageSize(this)">
											<option value="20" selected="selected" >20</option>
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
	    	</div>
		</div>
    </div>
    
    
   
    <!-- BEGIN FOOTER -->
    <jsp:include page="../common/footer.jsp" flush="true"/>
    <!-- END FOOTER -->
    
    <script type="text/javascript">
    
  	//分页默认隐藏
    $("#pagination-bar").hide();

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
    

    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
   
	//封装查询参数
	function packageArg(){
		var param = {};
		var yMBg = $('#workDayOrgProQyPanel_yMBg').val().replace("-","").replace("-","");
		var yMEd = $('#workDayOrgProQyPanel_yMEd').val().replace("-","").replace("-","");
		var orgNo = $('#workDayOrgProQyPanel_orgNo').val().replace(/^\s+|\s+$/g, "");
		var orgNm = $('#workDayOrgProQyPanel_orgNm').val().replace(/^\s+|\s+$/g, "");
		
		param.yMBg=yMBg;
		param.yMEd=yMEd;
		param.orgNo=orgNo;
		param.orgNm=orgNm;  
		
		return param;
	}

    //查询数据
    function reloadGrid() {
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
    	var param = packageArg();
    	if(null == param){
    		return;
    	}
    	param.page=page;
    	param.start=start;
    	param.limit=limit;
			
    	var query_Path = baseURL + "/tZero/org/workDay/profit";
    	App.blockUI({target:"body",boxed:!0,message:"读取中...",zIndex:20000});
		$.ajax({
            type: "GET",
            url: query_Path,
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
    			$("#workDayOrgProfitGridPanel").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	
                	var trData = [];
                	
                	trData.push(obj.yM);
                	trData.push(obj.orgNo);
                	trData.push(obj.orgNm);
                	trData.push(obj.profitAmt);
                	
                	for(i=0; i < trData.length; i++){
                   	 if(trData[i] == undefined){
                   		 trData[i] = ''; 
                   	 }
                    }

                   	 $("#workDayOrgProfitGridPanel").DataTable().row.add(trData).draw();
                   	
                   	
                   });
                   $("#workDayOrgProfitGridPanel").DataTable().order([1, 'asc']).draw();
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
            },
            error: function(error) {
            }
        });
	}
  	
    $(function(){
    	
    	if (!hasPermission(PERMISSSIONCONST.TZERO801)) {$("#query_btn").hide();}
    	
    	$('#workDayOrgProQyPanel_yMBg,#workDayOrgProQyPanel_yMEd').each(function(index, input) {
    		$(this).datepicker('remove');
    	    $(this).datepicker({
    	        language: 'zh-CN',
    	        autoclose: true,
    	        todayHighlight: true,
    	        minViewMode:1,
    	        format:'yyyy-mm'
    	    });
    	});

		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
    });
    </script>  
</body>

</html>
