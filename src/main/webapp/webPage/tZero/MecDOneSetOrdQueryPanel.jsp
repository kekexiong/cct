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
		                        <form action="<%=request.getContextPath()%>/tZero/setOrd/query" class="form-horizontal" id="queryMecDOnSetOrQuery_myForm">
		                            <div class="form-actions">
		                            	<div class="row norow">
		                            		<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">商户编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mno" id="MecDOneSetOrdQueryForm_mno" class="form-control" placeholder="请输入商户编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">协议付款日期:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange ">
		                                                    <input type="text" class="form-control col-md-3" name="agrPayDtBg" id="MecDOneSetOrdQueryForm_argPayDtBg">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="agrPayDtEd" id="MecDOneSetOrdQueryForm_argPayDtEd">
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">所属分公司:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                 <select name="branchOrgNo" id="MecDOneSetOrdQueryForm_branchOrgNo" class="bs-select form-control" data-show-subtext="true">	                  
		                                                	<option value="-1">请选择</option>
		                                                	<option value="">全部</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                	
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">促销编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="promotNo" id="MecDOneSetOrdQueryForm_promotNo" class="form-control" placeholder="请输入促销编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">结算完成时间:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange ">
		                                                    <input type="text" class="form-control col-md-3" name="agrPayDtBg" id="MecDOneSetOrdQueryForm_endDtBg">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="endDtEd" id="MecDOneSetOrdQueryForm_endDtEd">
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">结算状态:</label>
		                                            <div class="col-md-8 paddingnone">
		                                            	<select name="setSts" id="MecDOneSetOrdQueryForm_setSts" class="bs-select form-control" data-show-subtext="true" multiple>
		                                                	<option value="">全部</option>
		                                                	<option value="02">待付款</option>
		                                                	<option value="04">延迟付款</option>
		                                                	<option value="05">扣款失败</option>
		                                                	<option value="06">付款中</option>
		                                                	<option value="03">已撤销</option>
		                                                	<option value="07">付款失败</option>
		                                                	<option value="08">付款成功</option>
		                                                	<option value="09">撤销审批失败</option>
		                                                	<option value="10">银行退票成功</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">直属代理商编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="agentOrgNo" id="MecDOneSetOrdQueryForm_agentOrgNo" class="form-control" placeholder="请输入直属代理商编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">一代编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="topAgentOrgNo" id="MecDOneSetOrdQueryForm_topAgentOrgNo" class="form-control" placeholder="请输入一代编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="clearfix"></div>
		                                </div>
		                                <div class="row">
		                                    <div class="col-md-12">
		                                        <div class="row">
		                                            <div class="col-md-offset-1 col-md-11">
		                                            	<button type="button" id="MecDOneSetOrd_query" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
		                                                <button type="button" id="MecDOneSetOrd_reset" class="btn red"> <i class="fa fa-refresh"></i> 重置</button>
		                                                <button type="button" id="MecDOneSetOrd_export" class="btn btn-info"> <i class="fa fa-sign-out"></i> 导出</button>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">D+1商户结算记录列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="MecDOneSetOrdQueryPanel_gridPanel">
		                            <thead>
		                                <tr>
		                                    <th> 序号 </th>
		                                	<th> 商户编号 </th> 
		                                    <th> 商户名称 </th>
		                                    <th> 直属代理商编号</th>
		                                    <th> 一代名称 </th>
		                                    <th> 一代编号 </th>
		                                    <th> 所属分公司 </th>
		                                    <th> D+1结算金额 </th>
		                                    <th> D+1结算手续费 </th>
		                                    <th> 结算状态 </th>
		                                    <th> 协议付款日期 </th>
		                                    <th> 结算完成日期 </th>
		                                    <th> 促销编号 </th>
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
	
    
    //是否查询过列表标志
    var isquery = false;
    
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
    	$("#MecDOneSetOrdQueryPanel_gridPanel").find('tbody').empty();
    	//$("table tbody [id^='resutl_']").remove();
    	reloadGrid();
    }
    
    //全选列表数据
    function checkAll(checked) {
    	$("#MecDOneSetOrdQueryPanel_gridPanel tbody :checkbox").prop('checked', checked);
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
    	var mno = $('#MecDOneSetOrdQueryForm_mno').val();
    	var argPayDtBg = $('#MecDOneSetOrdQueryForm_argPayDtBg').val();
    	var argPayDtEd = $('#MecDOneSetOrdQueryForm_argPayDtEd').val();
    	var branchOrgNo = $('#MecDOneSetOrdQueryForm_branchOrgNo').val();
    	var promotNo = $('#MecDOneSetOrdQueryForm_promotNo').val();
    	var setSts = $('#MecDOneSetOrdQueryForm_setSts').val();
    	var endDtBg = $('#MecDOneSetOrdQueryForm_endDtBg').val();
    	var endDtEd = $('#MecDOneSetOrdQueryForm_endDtEd').val();
    	var agentOrgNo = $('#MecDOneSetOrdQueryForm_agentOrgNo').val();
    	var topAgentOrgNo = $('#MecDOneSetOrdQueryForm_topAgentOrgNo').val();	
    	
    	if(argPayDtBg=="" && argPayDtEd==""){
    		bootbox.alert("协议付款日期不能为空!");
    		return null;
    	}
    	if(argPayDtBg!="" || argPayDtEd!=""){
    		if(argPayDtBg=="" || argPayDtEd==""){
    			bootbox.alert("日期查询条件不完整!");
    			return null;
    		}
    	}
    	if(endDtBg!="" || endDtEd!=""){
    		if(endDtBg=="" || endDtEd==""){
    			bootbox.alert("日期查询条件不完整!");
    			return null;
    		}
    	}

    	if("-1"==branchOrgNo || nul == branchOrgNo){
    		bootbox.alert("所属分公司不能为空!");
			return null;
    	}
    	
    	if("" !=mno && !/^\d{15}$/.test(mno)){
    		bootbox.alert("商户编号只能为15位数字!");
    		return null;
    	}
    	
    	if("" !=promotNo && !/^\d{10}$/.test(promotNo)){
    		bootbox.alert("促销编号只能为10位数字!");
    		return null;
    	}
    	
    	if("" !=agentOrgNo &&!/^\d{10}$/.test(agentOrgNo)){
    		bootbox.alert("直属代理商编号只能为10位数字!");
    		return null;
    	}
    	
    	if("" !=topAgentOrgNo && !/^\d{10}$/.test(topAgentOrgNo)){
    		bootbox.alert("一代编号只能为10位数字!");
    		return null;
    	}
    	//查询时间段
    	var argPayDt = diffDate(argPayDtBg,argPayDtEd);
    	var endDt = diffDate(endDtBg,endDtEd);
    	if(argPayDt > 31 || endDt > 31){
    		bootbox.alert("查询时间不能超过31天!");
    		return null;
    	}
    	
    	argPayDtBg = argPayDtBg.replace("/","").replace("/","");
    	argPayDtEd = argPayDtEd.replace("/","").replace("/","");
    	endDtBg = endDtBg.replace("/","").replace("/","");
    	endDtEd = endDtEd.replace("/","").replace("/","");
    	
       var curParams = {
    		"mno":mno,
          	"argPayDtBg":argPayDtBg,
           	"argPayDtEd": argPayDtEd,
//            "branchOrgNo": branchOrgNo,
            "promotNo": promotNo,
//            "setSts": setSts,
            "endDtBg": endDtBg,
            "endDtEd": endDtEd,
            "agentOrgNo": agentOrgNo,
            "topAgentOrgNo": topAgentOrgNo,
        };
        return curParams;
    }
    
    
    var query_Path = baseURL + "/tZero/setOrd/query";
    //查询数据
    function reloadGrid() {
    	$("#MecDOneSetOrdQueryPanel_gridPanel").find('tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
    	var param = getParams();
    	
    	if(param == null){
    		return;
    	}
    	
 	  	if($("#MecOrderInfo_startDate").val() > $("#MecOrderInfo_endDate").val()){
    		bootbox.alert("发起时间的开始时间不能大于结束时间");
    		return;
    	}

 	  	var branchOrgNo = $('#MecDOneSetOrdQueryForm_branchOrgNo').val();
 	  	
 	  	var branchOrgNoarg = "";
 	  	if(null != branchOrgNo && branchOrgNo.length>0 ){
 	  		for(var i =0 ;i<branchOrgNo.length; i++){
 	  			if(i==0){
 	  				branchOrgNoarg+= "?branchOrgNo="+branchOrgNo[i];
 	  			}else{
 	  				branchOrgNoarg+= "&branchOrgNo="+branchOrgNo[i];
 	  			}
 	  		}	
 	  	}
 	  	
    	var setSts = $('#MecDOneSetOrdQueryForm_setSts').val();
    	var setStsarg = "";
 	  	if(null != setSts && setSts.length>0 ){
 	  		for(var i =0 ;i<setSts.length; i++){
 	  			if(i==0){
 	  				if(branchOrgNoarg == ""){
 	  					setStsarg+= "?setStsArr="+setSts[i];
 	  				}else{
 	  					setStsarg+= "&setStsArr="+setSts[i];
 	  				}
 	  			}else{
 	  				setStsarg+= "&setStsArr="+setSts[i];
 	  			}
 	  		}	
 	  	}
 	  	
    	param.page=page;
    	param.start=start;
    	param.limit=limit;
    	App.blockUI({target:"body",boxed:!0,message:"读取中...",zIndex:20000});
		$.ajax({
            type: "POST",
            url: query_Path+branchOrgNoarg+setStsarg,
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
    			
    			//填充统计数据
    			$(".totalcount").html(data.items[0].totalcount);
    			$(".tolOrdMoney").html(data.items[0].tolOrdMoney);
    			$(".tolOrdFee").html(data.items[0].tolOrdFee);
    			$(".tolMoney").html(data.items[0].tolMoney);
    			$(".totalCount_success").html(data.items[0].totalCount_success);
    			$(".tolOrdMoney_success").html(data.items[0].tolOrdMoney_success);
    			$(".totalCount_failure").html(data.items[0].totalCount_failure);
    			$(".tolOrdMoney_failure").html(data.items[0].tolOrdMoney_failure);
    			$("#MecDOneSetOrdQueryPanel_gridPanel").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	
                	var trData = [];
                	trData.push(start + index + 1);
                	
                	trData.push(obj.mno!=null?obj.mno:"");
                	trData.push(obj.cprOperNmCn!=null?obj.cprOperNmCn:"");
                	trData.push(obj.agentOrgNo!=null?obj.agentOrgNo:"");
                	trData.push(obj.topAgentOrgNm!=null?obj.topAgentOrgNm:"");
                	trData.push(obj.topAgentOrgNo!=null?obj.topAgentOrgNo:"");
                	trData.push(obj.branchOrgNm!=null?obj.branchOrgNm:"");
                	trData.push(obj.setAmt!=null?obj.setAmt:"");
                	trData.push(obj.setFeeAmt!=null?obj.setFeeAmt:"");
                	trData.push(obj.setSts!=null?obj.setSts:"");
                	trData.push(obj.argPayDt!=null?obj.argPayDt:"");
                	trData.push(obj.endDt!=null?obj.endDt:"");
                	trData.push(obj.promotNo!=null?obj.promotNo:"");
                	
                	for(i=0; i < trData.length; i++){
                   	 if(trData[i] == undefined){
                   		 trData[i] = ''; 
                   	 }
                    }

                   	 $("#MecDOneSetOrdQueryPanel_gridPanel").DataTable().row.add(trData).draw();
                   	
                   	
                   });
                   $("#MecDOneSetOrdQueryPanel_gridPanel").DataTable().order([0, 'asc']).draw();
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
    	
    	if(!hasPermission(PERMISSSIONCONST.TZER8101)){  
    		$("#MecDOneSetOrd_query").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.TZER8101)){  
    		$("#MecDOneSetOrd_reset").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.TZER8102)){  
    		$("#MecDOneSetOrd_export").hide();
    	}
    	
    	var allval = new Array();
    	//加载所属公司下拉框
    	$.ajax({
            type: "GET",
            url: baseURL+"/tZero/org/queryOrgNmComboList",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	$.each(data,function(index, obj){
            		$("#MecDOneSetOrdQueryForm_branchOrgNo").append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
            		//更新内容刷新到相应的位置
           	        $("#MecDOneSetOrdQueryForm_branchOrgNo").selectpicker('render');
           	        $("#MecDOneSetOrdQueryForm_branchOrgNo").selectpicker('refresh');
           	     	allval.push(obj.cdVl);
            	});
            },
            error:function(){}
    	});
    	
    	//  全选下拉框实现困难较大，暂时不实现
/*    	$('#MecDOneSetOrdQueryForm_branchOrgNo').on('rendered.bs.select', function (e,l) {
   			if(""==$(this).val()){
   				$('#MecDOneSetOrdQueryForm_branchOrgNo').selectpicker('val',allval);
   			}
   		});*/
    	
    	//初始化日期(将当前日期设置在日期控件中)
    	$("#MecDOneSetOrdQueryForm_argPayDtBg").datepicker('update', new Date());
    	$("#MecDOneSetOrdQueryForm_argPayDtEd").datepicker('update', new Date());
    
    	//查询按钮
		$("#MecDOneSetOrd_query").on('click', reloadGrid);
    	
    	//重置按钮
		$("#MecDOneSetOrd_reset").on('click', function() {
			$("#queryMecDOnSetOrQuery_myForm")[0].reset();
			$("#queryMecDOnSetOrQuery_myForm .bs-select").selectpicker('val','');
			$("#MecDOneSetOrdQueryForm_argPayDtBg").datetimepicker('update', new Date());
	    	$("#MecDOneSetOrdQueryForm_argPayDtEd").datetimepicker('update', new Date());
	    	$("#MecDOneSetOrdQueryForm_argPayDtBg").val(new Date().format('yyyy/MM/dd'));
	    	$("#MecDOneSetOrdQueryForm_argPayDtEd").val(new Date().format('yyyy/MM/dd'));
	    	
		});
    	
		
		//导出excel按钮
		$("#MecDOneSetOrd_export").on('click', function() {
			if(null== tableData || tableData.items.length==0){
				bootbox.alert("没有可导出的数据！");
				return;
			}
        	if(tableData.items.length>100000){
        		bootbox.alert("对不起，您导出的数据超过10万条！");
        		return;
        	}
        	bootbox.confirm("共"+tableData.items.length+'条数据,确定要导出吗?',function(y){
        		if(y){
        			window.open(baseURL +"/tZero/setOrd/export");
        		}
        	});
		});
   	});
    </script>  
</body>

</html>
