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
		                    <jsp:include page="../common/page/fileupload.jsp" flush="true"/>
   							<jsp:include page="../common/page/errorgrid.jsp" flush="true"/>
		                    <!-- 查询信息 -->
		                    <div class="portlet-body form">
		                        <form action="<%=request.getContextPath()%>/tZero/mecQry/query" class="form-horizontal" id="queryMecDOnSetOrQuery_myForm">
		                            <div class="form-actions">
		                            	<div class="row norow">
		                            		<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">商编:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mno" id="DOneMecQueryForm_mno" class="form-control" placeholder="请输入商编">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">一代编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="topOrgNo" id="DOneMecQueryForm_topOrgNo" class="form-control" placeholder="请输入一代编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">业务状态:</label>
		                                            <div class="col-md-8 paddingnone">
		                                            	<select name="busSts" id="DOneMecQueryForm_busSts" class="bs-select form-control" data-show-subtext="true">
		                                                	<option value="">全部</option>
		                                                	<option value="0">关闭</option>
		                                                	<option value="1">开通</option>
		                                                	<option value="2">暂停</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">所属分公司:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                 <select name="companyNo" id="DOneMecQueryForm_companyNo" class="bs-select form-control" data-show-subtext="true" data-size="12">
		                                                	<option class="selectall" value="">全部</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">最后状态变更时间:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange ">
		                                                    <input type="text" class="form-control col-md-3" name="dtUteBg" id="DOneMecQueryForm_dtUteBg">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="dtUteEd" id="DOneMecQueryForm_dtUteEd">
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="clearfix"></div>
		                                </div>
		                                <div class="row">
		                                    <div class="col-md-12">
		                                        <div class="row">
		                                            <div class="col-md-offset-1 col-md-11">
		                                            	<button type="button" id="DOneMecQueryPanel_query" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
		                                                <button type="button" id="DOneMecQueryPanel_export" class="btn btn-info"> <i class="fa fa-sign-out"></i> 导出excel</button>
		                                                <button type="button" id='TZER8813' onClick="downloadD1BatchQueryTemplate()" class="btn btn btn-primary"> <i class="fa fa-sign-out"></i> 下载批量查询模板</button>
		                                                <button type="button" id="batchQueryByMnoButton" class="btn btn btn-primary"> <i class="fa fa-sign-out"></i> 商编批量查询</button>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </form>
		                    </div>
		                </div>
		                <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-title">
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">D+1商户列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="DOneMecQueryGrid">
		                            <thead>
		                                <tr>
		                                    <th> 商编 </th>
		                                	<th> 商户名称 </th> 
		                                    <th> 业务状态 </th>
		                                    <th> 费率</th>
		                                    <th> 单笔免费限额 </th>
		                                    <th> 一代名称 </th>
		                                    <th> 一代编号 </th>
		                                    <th> 分公司 </th>
		                                    <th> 最后操作时间 </th>
		                                    <th> 业务员编号 </th>
		                                    <th> 业务员名称 </th>
		                                    <th> 最后开通渠道 </th>
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
    var config={
    		uploadUrl: baseURL+'/tZero/mecQry/validateBatchQueryByMnos',
    		uploadButton: 'batchQueryByMnoButton',
    		win: 'b_q_w',
    		winTitle: '根据商编批量查询D+1商户',
    		errorWin: 'b_q_e_w',
    		errorGrid: 'b_q_e_g',
    		successCallback: function(){
    			window.location.href=baseURL+'/tZero/mecQry/downloadD1BatchQueryByMnosResult'
    		}
    	}; 
		function downloadD1BatchQueryTemplate() {
			var url = baseURL + "/tZero/mecQry/downloadD1BatchQueryTemplate";
			window.location.href = url;
		};
    
    </script>
	<script src="<%=request.getContextPath()%>/webPage/common/page/uploadaction.js" type="text/javascript"></script>
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
	
    var totalCount;
    
  //日期格式化
    Date.prototype.format = function(format){
    	var o = {
    	"M+" : this.getMonth()+1, //month
    	"d+" : this.getDate(), //day
    	"h+" : this.getHours(), //hour
    	"m+" : this.getMinutes(), //minute
    	"s+" : this.getSeconds(), //second
    	"q+" : Math.floor((this.getMonth()+3)/3), //quarter
    	"S" : this.getMilliseconds() //millisecond
    	}

    	if(/(y+)/.test(format)) {
    		format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    	}

    	for(var k in o) {
	    	if(new RegExp("("+ k +")").test(format)) {
	    		format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
	    	}
    	}
    	return format;
    } 
  
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
    	$("#DOneMecQueryGrid").find('tbody').empty();
    	//$("table tbody [id^='resutl_']").remove();
    	reloadGrid();
    }
    
    //全选列表数据
    function checkAll(checked) {
    	$("#DOneMecQueryGrid tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
  //计算天数差的函数，通用
    function diffDate(sDate1, sDate2) {// sDate1和sDate2是2014-07-16格式
    	var aDate, oDate1, oDate2, iDays;
    	oDate1 = new Date(sDate1);
    	oDate2 = new Date(sDate2);
    	iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24);// 把相差的毫秒数转换为天数
    	return iDays;
    }
    
    //获取一键参数
    function  getParams () {
    	var mno = $("#DOneMecQueryForm_mno").val();
		var topOrgNo = $("#DOneMecQueryForm_topOrgNo").val();
		var companyNo = $("#DOneMecQueryForm_companyNo").val();
		var busSts = $("#DOneMecQueryForm_busSts").val();
		var dtUteBg = $("#DOneMecQueryForm_dtUteBg").val().replace("/","").replace("/","");
		var dtUteEd = $("#DOneMecQueryForm_dtUteEd").val().replace("/","").replace("/","");
		
		var wdcFlgPaused = "";
		var wdcFlgOpen = "";
		if(busSts=="0"){//关闭
			wdcFlgPaused ="0";
			wdcFlgOpen ="0";
		}else if(busSts=="1"){//开通
			wdcFlgPaused ="1";
			wdcFlgOpen ="1";
		}else if(busSts=="2"){//暂停
			wdcFlgPaused ="0";
			wdcFlgOpen ="1";
		}
    	
       var curParams = {
   		   "mno":mno,
			"topOrgNo":topOrgNo,
			"wdcFlgPaused":wdcFlgPaused,
			"wdcFlgOpen":wdcFlgOpen,
			"companyNo":companyNo,
			"dtUteBg":dtUteBg,
			"dtUteEd":dtUteEd
        };
        return curParams;
    }
    
    
    var query_Path = baseURL + "/tZero/mecQry/query";
    //查询数据
    function reloadGrid() {
    	$("#DOneMecQueryGrid").find('tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
    	var param = getParams();
    	
    	if(param == null){
    		return;
    	}
 	  	
    	param.page=page;
    	param.start=start;
    	param.limit=limit;
    	App.blockUI({target:"body",boxed:!0,message:"读取中...",zIndex:20000});
		$.ajax({
            type: "POST",
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
    			totalCount = data.totalCount;
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
    			
    			//填充统计数据
    			$("#DOneMecQueryGrid").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	
                	var trData = [];
                	trData.push(obj.mno!=null?obj.mno:"");
                	trData.push(obj.mnoNm!=null?obj.mnoNm:"");
                	if(obj.busSts=="0"){
                		trData.push("关闭");
                	}else if(obj.busSts=="1"){
                		trData.push("开通");
                	}else{
                		trData.push("暂停");
                	}
                	trData.push(obj.acRate!=null?obj.acRate:"");
                	trData.push(obj.freeAmt!=null?obj.freeAmt:"");
                	trData.push(obj.topOrgNm!=null?obj.topOrgNm:"");
                	trData.push(obj.topOrgNo!=null?obj.topOrgNo:"");
                	trData.push(obj.companyNm!=null?obj.companyNm:"");
                	trData.push(obj.dtUte!=null?obj.dtUte:"");
                	trData.push(obj.empNo!=null?obj.empNo:"");
                	trData.push(obj.empNm!=null?obj.empNm:"");
                	trData.push(obj.openSysId!=null?obj.openSysId:"");
                	
                	for(i=0; i < trData.length; i++){
                   	 if(trData[i] == undefined){
                   		 trData[i] = ''; 
                   	 }
                    }

                   	 $("#DOneMecQueryGrid").DataTable().row.add(trData).draw();
                   	
                   	
                   });
                   $("#DOneMecQueryGrid").DataTable().order([0, 'asc']).draw();
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
    	
    	if(!hasPermission(PERMISSSIONCONST.TZER8811)){  
    		$("#DOneMecQueryPanel_query").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.TZER8812)){  
    		$("#DOneMecQueryPanel_export").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.TZER8813)){
    		$("#TZER8813").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.TZER8814)){
    		$("#batchQueryByMnoButton").hide();
    	}
    	
    	var allval = new Array();
    	//加载所属公司下拉框
    	$.ajax({
            type: "GET",
            url: baseURL+"/tZero/orgRule/getAllOrgUuids",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	$.each(data,function(index, obj){
            		$("#DOneMecQueryForm_companyNo").append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
            		//更新内容刷新到相应的位置
           	        $("#DOneMecQueryForm_companyNo").selectpicker('render');
           	        $("#DOneMecQueryForm_companyNo").selectpicker('refresh');
           	     	allval.push(obj.cdVl);
            	});
            },
            error:function(){}
    	});
    
    	//查询按钮
		$("#DOneMecQueryPanel_query").on('click', reloadGrid);
    	
		//导出excel按钮
		$("#DOneMecQueryPanel_export").on('click', function() {
			if(null== totalCount || totalCount==0){
				bootbox.alert("没有可导出的数据！");
				return;
			}
        	if(totalCount>100000){
        		bootbox.alert("数据大于十万条，请筛选后导出！");
        		return;
        	}
        	bootbox.confirm("共"+totalCount+'条数据,确定要导出吗?',function(y){
        		if(y){
        			window.open(baseURL +"/tZero/mecQry/export");
        		}
        	});
		});
   	});
    
    
    
    </script>  
</body>

</html>
