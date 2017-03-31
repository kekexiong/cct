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
      <style type="text/css">
           input.error { border: 1px solid red; }
    label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
  </style>
    

</head>

<!-- <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md"> -->
<body class="iframe-body">

    <!-- BEGIN HEADER -->
    <jsp:include page="../common/header.jsp" flush="true"/>
    <!-- END HEADER -->

	<!-- BEGIN CONTAINER -->
	<div class="clearfix"></div>
	<div class="page-container">

		<!-- BEGIN MENU -->
		<%-- <jsp:include page="../common/menu.jsp" flush="true" /> --%>
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
								<form action="<%=request.getContextPath()%>/mec/queryData"
									class="form-horizontal" id="queryMecPanel_Form">
									<div class="form-body">
										<div class="row norow">
										 <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">商户编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="TradingRecordQueruPanel_mno" id="TradingRecordQueruPanel_mno" class="form-control" placeholder="请输入商户编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                     <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">商户名称:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="TradingRecordQueruPanel_mec_Nm" id="TradingRecordQueruPanel_mec_Nm" class="form-control" placeholder="请输入商户名称">
		                                            </div>
		                                        </div>
		                                    </div>
		                                 
											<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right"><font
														color="red">*</font>发起开始时间:</label>
													<div class="col-md-8 paddingnone">
															<input type="text" class="form-control col-md-4 form_datetime"
																name="TradingRecordQueruPanel_dtCte"
																id="TradingRecordQueruPanel_dtCte">
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right"><font
														color="red">*</font>发起结束时间:</label>
													<div class="col-md-8 paddingnone">
															<input type="text" class="form-control col-md-4 form_datetime"
																name="TradingRecordQueruPanel_dtCteEnd"
																id="TradingRecordQueruPanel_dtCteEnd">
													</div>
												</div>
											</div>

										   		                                    	
		                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">检索参考号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                            <input name="TradingRecordQueruPanel_retReNo" id="TradingRecordQueruPanel_retReNo" class="form-control col-md-4">
		                                            </div>
		                                        </div>
		                                    </div>

		                                    
		                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">银行卡号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                            <input name="TradingRecordQueruPanel_tranCrdNo" id="TradingRecordQueruPanel_tranCrdNo" class="form-control col-md-4">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    </div>
		                                    <div class="row norow">
		                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">发起途径:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="TradingRecordQueruPanel_ChannelId" id="TradingRecordQueruPanel_ChannelId" class="bs-select form-control" data-show-subtext="true">
															<option value="">全部</option>
															<option value="APP">APP</option>
															<option value="weChat">微信</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">归属分公司:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="TradingRecordQueruPanel_companyNo" id="TradingRecordQueruPanel_companyNo" class="bs-select form-control" data-show-subtext="true">
		                                                <option value="">全部</option>
		                                                </select>
		                                                
		                                                <!-- ajax获取  -->
		                                            </div>
		                                        </div>
		                                    </div>
		                                    

										</div>
										<div class="form-actions">
											<div class="row norow">
											<div class="col-md-offset-1 col-lg-8 col-md-8 col-sm-8 col-xs-4">
															<button type="button" id="query_btn"
																class="btn btn-success">
																<i class="fa fa-search"></i> 查询
															</button>
															<button type="button" id="reset_btn" class="btn red">
																<i class="fa fa-refresh"></i> 重置
															</button>
															<!-- </div>
															<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"> -->
															   <button type="button" id="auto_query_btn"
																class="btn btn-success">
																<i class="fa fa-search"></i> 开启自动查询
															</button>
<!-- 		                                                     <button type="button" id="close_query_btn"
																class="btn btn-success">
																<i class="fa fa-search"></i> 关闭自动查询
															</button> -->
														</div>
												</div>
											</div>
										</div>
								</form>
							</div>


						</div>
						<div class="clearfix"></div>
						<div class="portlet light bordered scaffold-list">
							<div class="portlet-title">
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">闪电到账审核信息列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
							<div class="portlet-body wheel">
									<table
										class="table table-striped table-bordered table-hover table-checkable order-column"
										id="queryMecGrid">
										<thead>
											<tr>
												<th>
		                                        <input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                   		</th>
												<th class="nowrap">序号</th>
												<th class="nowrap">检索参考号</th>
												<th class="nowrap">银行卡号</th>
												<th class="nowrap">流水号</th>
												<th class="nowrap">商户编号</th>
												<th class="nowrap">商户名称</th>
												<th class="nowrap">提取金额</th>
												<th class="nowrap">结算手续费</th>
												<th class="nowrap">动作类型</th>
												<th class="nowrap">发起时间</th>
												<th class="nowrap">发起途径</th>
												<th class="nowrap">拓展员编号</th>
												<th class="nowrap">拓展员名称</th>
												<th class="nowrap">归属机构</th>
												<th class="nowrap">归属分公司</th>
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
										记录数共:<span id="itemCount"></span>条 当前第<span id="nowpage"></span>/<span
											id="toalPage"></span>页 每页显示:
									</div>
									<div class="inline fl">
										<select id="limit" class=" form-control "
											onchange="onChange4PageSize(this)">
											<option value="10" >10</option>
											<option value="20" selected="selected">20</option>
											<option value="30">30</option>
											<option value="50">50</option>
											<option value="80">80</option>
											<option value="100">100</option>
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
											<div class="input-group pull-right col-sm-2"
												style="float: left;">
												<input min="1" class="form-control p"
													style="height: 31px; width: 80px;" type="number"> <a
													href="javascript:;" class="input-group-addon"
													onclick="javascript:pageing($('.p').val())"><i
													class="fa fa-mail-forward brown"></i></a>
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


    
     
     <div class="modal fade" id="importExcelWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">EXCEL文件导入</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" enctype="multipart/form-data" class="form-horizontal" id="exportform">
                           <div class="form-body">
  
                                   <div class="clearfix"></div>
                                   <div class="row norow">
                                   <div class="col-lg-12 col-md-12 col-sm-8 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">上传文件路径:</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <div class="input-group">
		                                                    <input type="file" class="form-control col-md-4" name="file" id="file">
		                                                </div>
		                                            </div>
		                                        </div>
		                            </div>
                               </div>
                               
                           </div>
                           <div class="form-actions">
                               <div class="row">
                                   <div class="col-md-12">
                                       <div class="row">
                                           <div class="col-md-12" style="align:center">
                                               <button type="button" id="importform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 上传</button>
                                               <button type="button" id="importform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </form>
                   </div>
	         </div>
	         <!-- 
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal">关闭
	            </button>
	            <button type="button" class="btn btn-primary">
	               提交更改
	            </button>
	         </div>
	          -->
       <!-- END CONTENT -->
   </div>



     <div class="modal fade" id="downloadWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">模板导出日期选择</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" enctype="multipart/form-data" class="form-horizontal" id="downloadform">
                           <div class="form-body">
  
                                   <div class="clearfix"></div>
                                   <div class="row norow">
                                 <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">选择日期:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange date-picker input-daterange" data-date="2016-08-04" data-date-format="yyyy-mm-dd">
		                                                    <input type="text" class="form-control col-md-3" name="downloadStart" id="downloadStart">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="downloadEnd" id="downloadEnd">
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
                               </div>
                               
                           </div>
                           <div class="form-actions">
                               <div class="row">
                                   <div class="col-md-12">
                                       <div class="row">
                                           <div class="col-md-12" style="align:center">
                                               <button type="button" id="download_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 确定</button>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </form>
                   </div>
	         </div>
	         <!-- 
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal">关闭
	            </button>
	            <button type="button" class="btn btn-primary">
	               提交更改
	            </button>
	         </div>
	          -->
       <!-- END CONTENT -->
   </div>
   
   
   
    <!-- BEGIN FOOTER -->
    <jsp:include page="../common/footer.jsp" flush="true"/>
    <!-- END FOOTER -->


<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.0/js/bootstrap-select.min.js"></script> -->
    <script type="text/javascript">
    
  	//分页默认隐藏
    $("#pagination-bar").hide();

    var idInt;
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
    
    var constTotalCount = 0;

    function changeTabName(obj){
    	tab = obj;
    	//重新加载表格数据
    	
    }
    
    //全选列表数据
    function checkAll(checked) {
    	$("#queryMecGrid tbody :checkbox").prop('checked', checked);
    }
  //onedit
    function openErrorWindow(item){
    	  
    	   $('table > tbody')[1].innerHTML = "";
     	
        $.each(item, function (index, obj) {
            var tr = $("<tr></tr>").append($("<td></td>").text(index));
            tr.append($("<td></td>").text(obj.erroMsg));
            $("#errorGrid tbody").append(tr);
        });
        
        $("#errorWindow").modal('show');
    }
    
    //分页1
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

    
    
  
    
    //行业大类，商户推展类型,商户类型在码表中加载数据
    function getComboStore(element, type_code) {
    	$.ajax({
            type: "GET",
            url: baseURL+"/code/query/typ/" + type_code,
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
                $("#" + element).empty();
                $("#" + element).append($("<option></option>").val("").text("全部"));
                $.each(data, function(index, obj) {
                	$("#" + element).append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
                });
              	//更新内容刷新到相应的位置
                $("#" + element).selectpicker('render');
                $("#" + element).selectpicker('refresh');
            },
            error: function(error) {
            }
        });
    }

  	
    
    //查询数据
    function reloadGrid() {
    //http://127.0.0.1:8080/bap/tZero/FcrMag/queryFcrInfo?_dc=1472111617720	
    	
     	 if(limit==0) {
        	//默认20条
        	limit=20;
        }
       	start=(page-1)*limit;
       	
       	var param = {start:start, limit:limit, page:page};
       	
       
		param.mno = $('#TradingRecordQueruPanel_mno').val(),
		param.beginStartDt = $('#TradingRecordQueruPanel_dtCte').val().replace('/', '').replace('/', '').replace(' ', '').replace(':', '').replace(':', ''),
		param.beginEndDt = $('#TradingRecordQueruPanel_dtCteEnd').val().replace('/', '').replace('/', '').replace(' ', '').replace(':', '').replace(':', ''),
		param.cprRegNmCn = $('#TradingRecordQueruPanel_mec_Nm').val(),
		param.retReNo = $('#TradingRecordQueruPanel_retReNo').val(),
		param.tranCrdNo = $('#TradingRecordQueruPanel_tranCrdNo').val(),
		param.channelId = $('#TradingRecordQueruPanel_ChannelId').val(),
		param.companyNo = $('#TradingRecordQueruPanel_companyNo').val()
	   	
	    if(!$('#queryMecPanel_Form').valid()){ 
	    	bootbox.alert("查询条件不正确");
	        return ; 
	    }  
		

		
//http://127.0.0.1:8080/bap/sddz/querySddzAccountAudit?_dc=1472649170475&mno=&cprRegNmCn=&beginStartDt=20160131000000&beginEndDt=20160831235959&retReNo=&tranCrdNo=&channelId=&companyNo=&page=1&start=0&limit=20
		App.blockUI({target:"body",boxed:!0,message:"读取中",zIndex:20000});
    	var	url = baseURL + "/sddz/querySddzAccountAudit";
		$.ajax({
            type: "GET",
            url: url,
            data:param,
            dataType: "json",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
           	    $("#queryMecGrid tbody").empty();
            	constTotalCount = data.totalCount;
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
    			

    	    		//流水结果
    				$("#queryMecGrid").DataTable().clear().draw();
                    //data = Object {items: Array[20], totalCount: 269}
                    $.each(data.items, function(index, obj) {
                    	
                    	var trData = [];
                    	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                    	trData.push(start + index + 1);
                    	
                    	trData.push(obj.retReNo);
                    	trData.push(obj.tranCrdNo);
                    	trData.push(obj.uuid);
                    	trData.push(obj.mno);
                    	trData.push(obj.cprRegNmCn);
                    	
                    	trData.push(obj.stmAmt);
                    	trData.push(obj.stmFeeAmt);
                    	if (!hasPermission(PERMISSSIONCONST.SDDZ0006)) {
                    		trData.push('');
                    	} else {
                    		if(obj.audSts == '00'){
                    		
	                    		trData.push("<INPUT type='button' value='审核' onclick = sddzAuditing('"+obj.uuid+"','"+obj.inMno+"')>");
	                    	}else{
	                    		trData.push("");
	                    	}
                    	}
                    	trData.push(obj.beginDt);
                    	
                    	
                    	trData.push(obj.channelId == 'weChat' ? "微信":obj.channelId);
                    	trData.push(obj.devNo);
                    	trData.push(obj.devNm);
                    	trData.push(obj.orgNm);
                    	trData.push(obj.companyNm);
                    	
                    	for(i=0; i < trData.length; i++){
                       	 if(trData[i] == undefined){
                       		 trData[i] = ''; 
                       	 }
                        }

                       	 $("#queryMecGrid").DataTable().row.add(trData).draw();
                       	
                       	
                       });
                       $("#queryMecGrid").DataTable().order([1, 'asc']).draw();
    			
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
            	bootbox.alert("连接超时！");
            }
        });
	}
    
    function transferTime(value){
    	
    	if(value){
     		var Y = value.substring(0,4);//2015
         	var M =value.substring(4,6);//04
         	var D =value.substring(6,8);//22
         	var H =value.substring(8,10);//16
         	var I =value.substring(10,12);//53
         	var S =value.substring(12,14);//42
         	var date = Y+"-"+M+"-"+D+" "+H+":"+I+":"+S;
         	return date;
     	}else{
     		return value;
     	}
    	
    	
    }
    
    
  	//拉取会计科目数据
  	function sbjStore() {
  		$.ajax({
            type: "GET",
            url: baseURL + "/tZero/org/queryOrgNmComboList",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
                $("#TradingRecordQueruPanel_companyNo").empty();
                $("#TradingRecordQueruPanel_companyNo").append($("<option></option>").val("").text("全部"));
                $.each(data, function(index, obj) {
                	$("#TradingRecordQueruPanel_companyNo").append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
                });
              	//更新内容刷新到相应的位置
                $("#TradingRecordQueruPanel_companyNo").selectpicker('render');
                $("#TradingRecordQueruPanel_companyNo").selectpicker('refresh');
            },
            error: function(error) {
            }
        });
  	}
  	
   
 
    $(function(){
    	
    	/*初始化页面按钮权限*/
/*     	if (!hasPermission(PERMISSSIONCONST.TZERO501)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO501)) {$("#exportexcel_btn").hide();} */
    	
    	$(".onlyNum").onlyNum();
        sbjStore();
        initDefaultDate();
        
        $("#close_query_btn").css('display', 'none');
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
        
		var flag = true;
		
		$("#auto_query_btn").on('click', function(){
			//$("#auto_query_btn").attr('id', 'close_query_btn');
			//$("#auto_query_btn").css('display', 'none');
			//$("#close_query_btn").css('display', 'block');
			if(flag){
				flag = false;
				$("#auto_query_btn").html('<i class="fa fa-search"></i>关闭自动查询');
				idInt = setInterval(reloadGrid,30000);
				
			}else{
				flag = true;
				$("#auto_query_btn").html('<i class="fa fa-search"></i>开启自动查询');
				//$("#close_query_btn").attr('id', 'auto_query_btn');
				 clearInterval(idInt);
			}
			

			
		});
		
		/* $("#close_query_btn").on('click', function(){
 			$("#auto_query_btn").css('display', 'block');
			$("#close_query_btn").css('display', 'none'); 
		
		}); */

		$('#queryMecPanel_Form').validate({
	        rules: {
	        	TradingRecordQueruPanel_mno: {
	        	  digits: true,
	        	  rangelength:[15,15]
	        	},
	        	TradingRecordQueruPanel_tranCrdNo: {
	        	  digits: true,
	        	  rangelength:[0,20]
	        	},
	        	TradingRecordQueruPanel_retReNo: {
	        	  digits: true,
	        	  rangelength:[12,12]
	        	},
	        	TradingRecordQueruPanel_dtCte: {
	        		required: true,
	        		date: true,
	        	},
	        	TradingRecordQueruPanel_dtCteEnd: {
	        		required: true,
	        		date: true,
	        	},
	        	
	        },
	        messages: {
	        	TradingRecordQueruPanel_mno: {
	        		digits: '只能为数字',
	        		rangelength: '商户编号只能是15位数字'
	        	},
	        	TradingRecordQueruPanel_tranCrdNo: {
	        		digits: '只能为数字',
	        		rangelength: '银行卡号只能为不大于20位的数字'
	        	},
	        	TradingRecordQueruPanel_retReNo: {
	        		digits: '只能为数字',
	        		rangelength: '检索参考号只能是12位数字'
	        	},
	        	TradingRecordQueruPanel_dtCte: {
	        		required: '不能为空',
	        		date: '格式错误',
	        	},
	        	TradingRecordQueruPanel_dtCteEnd: {
	        		required: '不能为空',
	        		date: '格式错误',
	        	},
	        	
	        }
	    });
	

		//重置按钮
		$("#reset_btn").on('click', function() {
			$("#queryMecPanel_Form")[0].reset();
			$("#queryMecPanel_Form .bs-select").selectpicker('val','');//重置select元素
			initDefaultDate();

		});

		
		//导出excel按钮
		$("#exportexcel_btn").on('click', function() {
			if(constTotalCount <= 0){
				bootbox.alert("当前没有数据可以导出!");
				return;
			}
/* 			
			if(constTotalCount > 100000){
				bootbox.alert("超过了10万条数据，请筛选数据!");
				return;
			} */
			
			bootbox.confirm("确认导出查询结果",function(truthBeTold) {
				if (truthBeTold) { 
		    		window.open(baseURL+"/AppRecord/mxlexcel");
		    	}
			}); 
			
		});
		
		
		
   	});
    
    
    
	
   
    
    
    // ----------------------------------------------------------------------
    // <summary>
    // 限制只能输入数字
    // </summary>
    // ----------------------------------------------------------------------
    $.fn.onlyNum = function () {
        $(this).keypress(function (event) {
            var eventObj = event || e;
            var keyCode = eventObj.keyCode || eventObj.which;
           if ((((keyCode >= 48 && keyCode <= 57) || (keyCode == 8 || keyCode == 46))))
               return true;
           else
               return false;
       }).focus(function () {
       //禁用输入法
           this.style.imeMode = 'disabled';
       }).bind("paste", function () {
    	        //获取剪切板的内容
    	            var clipboard = window.clipboardData.getData("Text");
    	            if (/^\d+$/.test(clipboard))
    	                return true;
    	            else
    	                return false;
    	        });
  };
    
  function initDefaultDate(){
  	
  	var myDate = new Date();
  	
  	var tempMonth;
  	if(myDate.getMonth()<9){
  		tempMonth = '0'+ (myDate.getMonth() + 1);
  	}else{
  		tempMonth = myDate.getMonth() + 1;
  	}
  	
  	var tempDay;
  	if(myDate.getDate()<=9){
  		tempDay = '0'+ myDate.getDate();
  	}else{
  		tempDay = myDate.getDate();
  	}
  
  	var dateString = myDate.getFullYear()+"/"+tempMonth+"/"+tempDay;
  	//bootbox.alert(myDate.getMonth() +" hello "+myDate.getDate());
  	
  	      $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii:ss'});
  	$("#TradingRecordQueruPanel_dtCte").datetimepicker('setEndDate', null);
  	$("#TradingRecordQueruPanel_dtCteEnd").datetimepicker('setStartDate', null);
  	$("#TradingRecordQueruPanel_dtCte").datetimepicker('update', new Date(dateString+ " 00:00:00"));
  	$("#TradingRecordQueruPanel_dtCteEnd").datetimepicker('update', new Date(dateString + " 23:59:59"));
  	
  }
  

  
  
//跳转到查看日志页面
  function sddzAuditing(uuid,inMno){
	$("#auto_query_btn").css('display', 'block');
	$("#close_query_btn").css('display', 'none');
	 clearInterval(idInt);
  	 $.fancybox({afterLoad:fancyboxCenterOnViewport,
   		href:'SddzAccountAuditingPanel_detail.jsp?uuid='+uuid+"&inMno=" + inMno,    
   		type: 'iframe',
   		padding: 5,
   		margin:60, 
   		scrolling: 'no',
   		fitToView: true,
   		width: 1000,
   		height: 800,
   		autoSize: false, 
   		closeClick: false,
   		afterClose:function(){
   			reloadGrid();
   		} 
   	}); 
  	
  	
  }


  /* 写到流水模板下载 流水批量导入，需要重新考虑（页面没有实现） */
  
    </script>
    
</body>

</html>
