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
											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-4 text-right">商户编号:</label>
													<div class="col-md-8 paddingnone">
														<input name="mno" id="queryMecStore_mno"
															class="form-control" placeholder="请输入商户编号">
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-4 text-right">合作商编号:</label>
													<div class="col-md-8 paddingnone">
														<input name="orgNo" id="queryMecStore_orgNo"
															class="form-control" placeholder="请输入合作商编号">
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right">T+0类型:</label>
													<div class="col-md-8 paddingnone">
														<select name="stlTyp" id="queryMecStore_stlTyp"
															class="bs-select form-control" data-show-subtext="true">
															<option value="">全部</option>
															<option value="02">新T+0商户</option>
															<option value="01">老T+0商户</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right">所属分公司:</label>
													<div class="col-md-8 paddingnone">
														<select name="companyNo" id="queryMecStore_companyNo"
															class="bs-select form-control" data-show-subtext="true" data-size="12">

														</select>
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right">业务类型:</label>
													<div class="col-md-8 paddingnone">
														<select name="t0Typ" id="queryMecStore_t0Typ"
															class="bs-select form-control" data-show-subtext="true" multiple>

														</select>
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right">结算状态:</label>
													<div class="col-md-8 paddingnone">
														<select name="setSts" id="queryMecStore_setSts"
															class="bs-select form-control" data-show-subtext="true" multiple>

														</select>
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right">结算完成时间:</label>
													<div class="col-md-8 paddingnone">
														<div class="input-group input-daterange">
															<input type="text" class="form-control col-md-4"
																name="Ed_Dt" id="Ed_Dt"> <span
																class="input-group-addon"> <i
																class="fa fa-exchange"></i>
															</span> <input type="text" class="form-control col-md-4"
																name="Edd_Dt" id="Edd_Dt">
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right">起始/终止日期<font
														color="red">*</font>:
													</label>
													<div class="col-md-8 paddingnone">
														<div class="input-group input-daterange">
															<input type="text" class="form-control col-md-4"
																name="strBg" id="strBg"> <span
																class="input-group-addon"> <i
																class="fa fa-exchange"></i>
															</span> <input type="text" class="form-control col-md-4"
																name="strEd" id="strEd">
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-4 text-right">促销编号:</label>
													<div class="col-md-8 paddingnone">
														<input name="promotNo" id="queryMecStore_promotNo"
															class="form-control onlyNum" placeholder="请输入促销编号">
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right">付款类型:</label>
													<div class="col-md-8 paddingnone">
														<select name="payTyp" id="queryMecStore_payTyp"
															class="bs-select form-control" data-show-subtext="true">
															<option value="">全部</option>
															<option value="02">T+0结算</option>
															<option value="12">自动秒到</option>
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-offset-1 col-md-11">
														<button type="button" id="query_btn"
															class="btn btn-success">
															<i class="fa fa-search"></i> 查询
														</button>
														<button type="button" id="exportexcel_btn"
															class="btn btn btn-primary">
															<i class="fa fa-sign-out"></i> 导出excel
														</button>
													</div>
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
								<div class="caption">
									<i class="fa fa-search font-blue"></i> <span
										class="caption-subject font-blue bold uppercase">T+0结算记录信息列表</span>
								</div>
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
												<th><input type="checkbox" class="group-checkable"
													onclick="checkAll(this.checked)" /></th>
												<th class="nowrap">交易时间</th>
												<th class="nowrap">商户编号</th>
												<th class="nowrap">商户名称</th>
												<th class="nowrap">合作商编号</th>
												<th class="nowrap">T+0结算金额</th>
												<th class="nowrap">T+0结算手续费</th>
												<th class="nowrap">T+0类型</th>
												<th class="nowrap">分公司</th>
												<th class="nowrap">拓展员名称</th>
												<th class="nowrap">拓展员编号</th>
												<th class="nowrap">业务类型</th>
												<th class="nowrap">结算状态</th>
												<th class="nowrap">结算完成时间</th>
												<th class="nowrap">促销编号</th>
												<th class="nowrap">付款类型</th>

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
											<option value="10">10</option>
											<option value="20" selected="selected">20</option>
											<option value="30">30</option>
											<option value="50">50</option>
											<option value="80">80</option>
											<option value="100">100</option>
										</select>
									</div>
									<div class="inline fl">条</div>
								</div>
								<div class="">
								<label class="control-label text-right">&nbsp;&nbsp;T+0结算总金额: &nbsp;</label><label id="count_Label"></label>
								<label class="control-label text-right">&nbsp;&nbsp;T+0结算总手续费: &nbsp;</label><label id="totalAmt_Label"></label>
								</div>
								<div class="col-sm-6 pull-right no-padding">
									<div id="pagination"
										class="dataTables_paginate paging_simple_numbers clearfix pull-right">
										<nobr>
											<ul class="pagination no-padding" style="float: left">
												<li class="prev "><a href="javascript:;"
													onclick="javascript:pageing(1)"> 首页</a></li>
												<li class="prev "><a href="javascript:;"
													onclick="javascript:pageing('pro')"> 上一页</a></li>
												<li class="next "><a href="javascript:;"
													onclick="javascript:pageing('next')">下一页</a></li>
												<li class="next "><a href="javascript:;"
													onclick="javascript:pageing('last')">末页</a></li>
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
		                                                    <span id="error"  style="font-color:red"></span>
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
       <!-- END CONTENT -->
   </div>
   
   
   
    <!-- BEGIN FOOTER -->
    <jsp:include page="../common/footer.jsp" flush="true"/>
    <!-- END FOOTER -->


<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.0/js/bootstrap-select.min.js"></script> -->
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
                $("#queryMecStore_companyNo").empty();
                $("#queryMecStore_companyNo").append($("<option></option>").val("").text("全部"));
                $.each(data, function(index, obj) {
                	$("#queryMecStore_companyNo").append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
                });
              	//更新内容刷新到相应的位置
                $("#queryMecStore_companyNo").selectpicker('render');
                $("#queryMecStore_companyNo").selectpicker('refresh');
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
       	
       

  
    
    	//获取查询的参数
		var strBg  = $('#strBg').val().replace('/', '').replace('/', '');
		var strEd  = $('#strEd').val().replace('/', '').replace('/', '');
		var mno  = $('#queryMecStore_mno').val();
		var stlTyp  = $('#queryMecStore_stlTyp').val();
		var companyNo  = $('#queryMecStore_companyNo').val();
		var t0Typ  = $('#queryMecStore_t0Typ').val();
		var setSts  = $('#queryMecStore_setSts').val();
		var orgNo  = $('#queryMecStore_orgNo').val();
		var Ed_Dt  = $('#Ed_Dt').val().replace('/', '').replace('/', '');
		var Edd_Dt  = $('#Edd_Dt').val().replace('/', '').replace('/', '');
		var promotNo  = $('#queryMecStore_promotNo').val();
		var payTyp  = $('#queryMecStore_payTyp').val();
		
		if(strBg == "" || strBg == null){
			bootbox.alert("起始日期不能为空");
			return;
		}
		if(strEd == "" || strEd == null){
			bootbox.alert("终止日期不能为空");
			return;
		}
		
		if(Edd_Dt<Ed_Dt){
			bootbox.alert("起始时间不能超过结束时间!");
			return;
		}
		
		//http://127.0.0.1:8080/bap/
		
    	var	url = baseURL + "/tZero/org/query/mecSet?bStr_Dt="+strBg+"&eStr_Dt="+strEd+"&orgNo="+orgNo+"&mno="+mno+"&stlTyp="+stlTyp+"&companyNo="+companyNo+"&bEd_Dt="+Ed_Dt+"&eEd_Dt="+Edd_Dt+"&promotNo="+promotNo+"&payTyp="+payTyp+"&page="+page+"&start="+start+"&limit="+limit;
		
	
		
		//多选数据查询
		if(t0Typ != null && t0Typ != ""){
			for(i=0; i<t0Typ.length; i++){
				if(t0Typ[i] != null && t0Typ[i] != ""){
					url += "&t0TypArr=" + t0Typ[i];
				}else{
					url += "&t0TypArr=";
				}
			}
		}else{
			url += "&t0TypArr=";
		}
		
		
		//"&t0TypArr="+t0Typ+"&setStsArr="+setSts+
		//多选数据查询
		if(setSts != null && setSts != ""){
			for(i=0; i<setSts.length; i++){
				if(setSts[i] != null && setSts[i] != ""){
					url += "&setStsArr=" + setSts[i];
				}else{
					url += "&setStsArr=";
				}
			}
		}else{
			url += "&setStsArr=";
		}
		
		
		App.blockUI({target:"body",boxed:!0,message:"读取中",zIndex:20000});
		$.ajax({
			//http://127.0.0.1:8080/bap/posAD_Mec/index?_dc=1471942708283&page=1&start=0&limit=15
            type: "GET",
            url: url,
            dataType: "json",
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
    			

    			
    			$("#queryMecGrid").DataTable().clear().draw();
                    $.each(data.items, function(index, obj) {
                    	
                    	var trData = [];
                    	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                    	var tempStrDt = '';
                    	
            			if(obj.strDt!=null && obj.strDt!=''){
            				tempStrDt =  obj.strDt.substring(0, 4) + '-' + obj.strDt.substring(4, 6)
            						+ '-' + obj.strDt.substring(6, 8);
            			}
                    	
                    	
                    	trData.push(tempStrDt);
                    	trData.push(obj.mno);
                    	trData.push(obj.mno_NM);
                    	trData.push(obj.tzOrgNo);
                    	trData.push(obj.setAmt);
                    	
                    	trData.push(obj.setFeeAmt);
                    	trData.push(obj.stlTyp);
                    	trData.push(obj.companyNm);
                    	trData.push(obj.devNm);
                    	
                    	trData.push(obj.devNo);
                    	trData.push(obj.t0Typ);
                    	trData.push(obj.setSts);
                    	
						var tempendDt = '';
                    	
            			if(obj.endDt!=null && obj.strDt!=''){
            				tempendDt =  obj.endDt.substring(0, 4) + '-' + obj.endDt.substring(4, 6)
            						+ '-' + obj.endDt.substring(6, 8);
            			}
                    	
                    	trData.push(tempendDt);
                    	trData.push(obj.promotNo);
                    	trData.push(obj.payTyp);
                    	
                    	 for(i=0; i < trData.length; i++){
                        	 if(trData[i] == undefined){
                        		 trData[i] = ''; 
                        	 }
                         }

                        	 $("#queryMecGrid").DataTable().row.add(trData).draw();
                        	
                        	
                        });
                        $("#queryMecGrid").DataTable().order([0, 'asc']).draw();
                $("#count_Label").text(data.tolSetMoney+"元");
                $("#totalAmt_Label").text(data.tolSetFee+"元");
                
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
    
    
    
 
    $(function(){
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.TZERO601)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO602)) {$("#exportexcel_btn").hide();}
    	
    	 $(".onlyNum").onlyNum();
        initDefaultDate();
        sbjStore();
        getComboStore("queryMecStore_t0Typ", "T0_TYP");
        getComboStore("queryMecStore_setSts","SET_STS"),
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
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
				bootbox.alert("没有数据无法操作!");
				return;
			}
			
			if(constTotalCount > 100000){
				bootbox.alert("超过了10万条数据，请筛选数据!");
				return;
			}
			
			bootbox.confirm("共有"+constTotalCount+"条数据，确认要导出吗?", function(truthBeTold){
				
				if(truthBeTold){
					window.open(baseURL+"/tZero/org/mec/epexcel");
				}else{
					return;
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
           if ((((keyCode >= 48 && keyCode <= 57) || (keyCode == 8 || keyCode == 46||keyCode ==187 || keyCode ==189 )))&&keyCode != 46)
               return true;
           else
               return false;
       }).focus(function () {
       //禁用输入法
           this.style.imeMode = 'disabled';
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
  	
  	var tempString = myDate.getFullYear()+"/"+12+"/"+31;
  	$("#strBg").datepicker('update', dateString);
  	$("#strEd").datepicker('update', dateString);
  	
  }
  
    </script>
    
</body>

</html>
