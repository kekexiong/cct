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
<jsp:include page="../common/resource.jsp" flush="true" />

</head>

<!-- <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md"> -->
<body class="iframe-body">

	<!-- BEGIN HEADER -->
	<jsp:include page="../common/header.jsp" flush="true" />
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
								<form action="<%=request.getContextPath()%>/mec/queryData" class="form-horizontal" id="queryMecPanel_Form">
									<div class="row norow">
																						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
													<div class="form-group">
														<label class="control-label col-md-4 text-right">付款通道:</label>
														<div class="col-md-8 paddingnone">
															<select name="channelCd"
																id="CHANNEL_CD"
																class="bs-select form-control" data-show-subtext="true">
																<!-- <option value="">全部</option>
																<option value="00">是</option>
																<option value="01">否</option> -->
															</select>
														</div>
													</div>
												</div>
												<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
													<div class="form-group">
														<label class="control-label col-md-4 text-right">付款类型:</label>
														<div class="col-md-8 paddingnone">
															<select name="payType"
																id="PAY_TYPE"
																class="bs-select form-control" data-show-subtext="true">
																<!-- <option value="">全部</option>
																<option value="00">是</option>
																<option value="01">否</option> -->
															</select>
														</div>
													</div>
												</div>
												<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
													<div class="form-group">
														<label for="span-medium-2"
															class="control-label col-md-4 text-right">最小金额:</label>
														<div class="col-md-8 paddingnone">
															<input name="minAmt"
																id="MIN_AMT" class="form-control"
																placeholder="最小金额">
														</div>
													</div>
												</div>
												<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
													<div class="form-group">
														<label for="span-medium-2"
															class="control-label col-md-4 text-right">最大金额:</label>
														<div class="col-md-8 paddingnone">
															<input name="maxAmt"
																id="MAX_AMT" class="form-control"
																placeholder="最大金额">
														</div>
													</div>
												</div>
												<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
													<div class="form-group">
														<label for="span-medium-2"
															class="control-label col-md-4 text-right">最小笔数:</label>
														<div class="col-md-8 paddingnone">
															<input name="minNum"
																id="MIN_NUM" class="form-control"
																placeholder="最小笔数">
														</div>
													</div>
												</div>
												<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
													<div class="form-group">
														<label for="span-medium-2"
															class="control-label col-md-4 text-right">最大笔数:</label>
														<div class="col-md-8 paddingnone">
															<input name="maxNum"
																id="MAX_NUM" class="form-control"
																placeholder="最大笔数">
														</div>
													</div>
												</div>
									</div>
									<div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-offset-1 col-md-11">
														<button type="button" id="query_btn" class="btn btn-success">
															<i class="fa fa-search"></i> 查询
														</button>
														<button type="button" id="reset_btn" class="btn red">
															<i class="fa fa-refresh"></i> 重置
														</button>
														<button type="button" id="add_btn" class="btn btn-info"> 
															<i class="fa fa-pencil"></i> 添加
														</button>
														<button type="button" id="edit_btn" class="btn tn btn btn-primary"> 
															<i class="fa fa-edit"></i> 修改
														</button>
														<button type="button" id="dele_btn" class="btn tn btn btn-primary"> 
															<i class="fa fa-edit"></i> 删除
														</button>
															<button type="button" id="isExport_btn" class="btn tn btn btn-primary"> 
																<i class="fa fa-edit"></i> 导出
															</button>
															<button type="button" id="isImport_btn" class="btn tn btn btn-primary"> 
																<i class="fa fa-edit"></i> 导入
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
										class="caption-subject font-blue bold uppercase">test信息列表</span>
								</div>
								<div class="tools">
									<a href="" class="fullscreen" data-original-title="全屏" title=""></a>
								</div>
							</div>
							<div class="portlet-body wheel">
								<div style="overflow-x: scroll;">
									<table
										class="table table-striped table-bordered table-hover table-checkable order-column"
										id="queryMecGrid">
										<thead>
											<tr>
												<th><input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" /></th> 
													<th class="nowrap">序号</th>
															<th class="nowrap">付款通道</th> 
															<th class="nowrap">付款类型</th> 
															<th class="nowrap">最小金额</th> 
															<th class="nowrap">最大金额</th> 
															<th class="nowrap">最小笔数</th> 
															<th class="nowrap">最大笔数</th> 
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
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
									<label class="control-label text-right">&nbsp;&nbsp;总笔数: &nbsp;</label><label id="count_Label"></label>
									<label class="control-label text-right">&nbsp;&nbsp;总计金额: &nbsp;</label><label id="totalAmt_Label"></label>
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
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!----------------------------------- 添加(修改)功能弹出页面（获取输入值的输入框后缀统一增加_SHOW标识符） ------------------------------------------>
		<div class="modal fade" id="addOrUpdateWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="1000px" data-height="500px">
	        <div class="modal-header">
	           <button type="button" class="close" 
	              data-dismiss="modal" aria-hidden="true">
	                 &times;
	           </button>
	           <h4 class="modal-title" id="addOrUpdateWin_title"></h4>
	        </div>
	        <div class="modal-body">
	           <div class="portlet-body form">
	               <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="addform">
	                   <div class="form-body">
	                       <div class="row norow">
	                           				                           				                           				                           		<!-- 下拉框 -->
										<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
											<div class="form-group">
												<label class="control-label col-md-4 text-right">付款通道:</label>
												<div class="col-md-8 paddingnone">
													<select name="channelCd"
														id="CHANNEL_CD_SHOW"
														class="bs-select form-control" data-show-subtext="true">
														<!-- <option value="">全部</option>
														<option value="00">是</option>
														<option value="01">否</option> -->
													</select>
												</div>
											</div>
										</div>
	                           				                           				                           				                           		<!-- 下拉框 -->
										<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
											<div class="form-group">
												<label class="control-label col-md-4 text-right">付款类型:</label>
												<div class="col-md-8 paddingnone">
													<select name="payType"
														id="PAY_TYPE_SHOW"
														class="bs-select form-control" data-show-subtext="true">
														<!-- <option value="">全部</option>
														<option value="00">是</option>
														<option value="01">否</option> -->
													</select>
												</div>
											</div>
										</div>
	                           				                           				                           			<!-- 普通输入框 -->
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class="form-group">
												<label for="span-medium-2"
													class="control-label col-md-4 text-right">最小金额:</label>
												<div class="col-md-8 paddingnone">
													<input name="minAmt"
														id="MIN_AMT_SHOW" class="form-control"
														placeholder="最小金额">
												</div>
											</div>
										</div>
	                           			                           				                           				                           			<!-- 普通输入框 -->
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class="form-group">
												<label for="span-medium-2"
													class="control-label col-md-4 text-right">最大金额:</label>
												<div class="col-md-8 paddingnone">
													<input name="maxAmt"
														id="MAX_AMT_SHOW" class="form-control"
														placeholder="最大金额">
												</div>
											</div>
										</div>
	                           			                           				                           				                           			<!-- 普通输入框 -->
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class="form-group">
												<label for="span-medium-2"
													class="control-label col-md-4 text-right">最小笔数:</label>
												<div class="col-md-8 paddingnone">
													<input name="minNum"
														id="MIN_NUM_SHOW" class="form-control"
														placeholder="最小笔数">
												</div>
											</div>
										</div>
	                           			                           				                           				                           			<!-- 普通输入框 -->
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class="form-group">
												<label for="span-medium-2"
													class="control-label col-md-4 text-right">最大笔数:</label>
												<div class="col-md-8 paddingnone">
													<input name="maxNum"
														id="MAX_NUM_SHOW" class="form-control"
														placeholder="最大笔数">
												</div>
											</div>
										</div>
	                           			                           <div class="clearfix"></div>
	                       </div>
	                   </div>
	                   <div class="form-actions">
	                       <div class="row">
	                           <div class="col-md-12">
	                               <div class="row">
	                                   <div class="col-md-12" style="text-align:center;">
	                                       <button type="button" id="addform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 提交</button>
	                                       <button type="button" id="addform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
	                                   </div>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	               </form>
	           </div>
	        </div>
    	</div>
		
		
		
		
	</div>

	<jsp:include page="../common/footer.jsp" flush="true" />

	<script type="text/javascript">
		//分页功能
		//分页默认隐藏
		$("#pagination-bar").hide();
		//每页多少条
		var limit = 0;
		//当前页
		var page = 1;
		//起始条
		var start = 0;
		//总页数
		var toalPage;
		//数据列表缓存
		var tableData;
	
		var importLimit = 0;
	
		var importPage = 1;
	
		var importStart = 0;
	
		var importTotalPage;
	
		var tableData;
	
		function pageing(opp) {
			$(window.top.document).scrollTop(0, 500);
			limit = $("#limit  option:selected").text();
	
			if (opp == 'pro') {
				if (page > 1) {
					page = page - 1;
					start = (page - 1) * limit;
				} else {
					bootbox.alert('已经是第一页');
					return;
				}
			} else if (opp == 'next') {
				if (page == toalPage) {
					bootbox.alert('已经是最后一页');
					return;
				}
				page = page + 1;
				start = (page - 1) * limit;
			} else if (opp == 'last') {
				if (page == toalPage) {
					bootbox.alert('已经是最后一页');
					return;
				}
				page = $("#toalPage").text();
				if (page > toalPage) {
					bootbox.alert('对不起没有你要跳转的页面');
					return;
				} else if (page < 1) {
					bootbox.alert('对不起没有你要跳转的页面');
					return;
				}
	
				start = (page - 1) * limit;
			} else {
				if (page == 1 && opp == 1) {
					bootbox.alert('已经是第一页');
					return;
				}
				page = opp * 1;
				if (page > toalPage) {
					bootbox.alert('对不起没有你要跳转的页面');
					return;
				} else if (page < 1) {
					bootbox.alert('对不起没有你要跳转的页面');
					return;
				}
	
				start = (page - 1) * limit;
			}
			$('table > tbody').empty();
			reloadGrid();
		}
		//初始化页面功能
		$(function(){
			<!---------------------在此手动设置按钮的权限------------------------------->
			//if (!hasPermission(PERMISSSIONCONST.SES1002)) {$("#").hide();}
			<!---------------------在此手动初始化页面表单审核状态数据源---------------------->
				
					getComboStore("CHANNEL_CD_SHOW", "CHANNEL_CD");
					getComboStore("CHANNEL_CD", "CHANNEL_CD");
				
					getComboStore("PAY_TYPE_SHOW", "PAY_TYPE");
					getComboStore("PAY_TYPE", "PAY_TYPE");
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
	    	
	    	//初始化输入框时间默认值方法
	    	initDefaultDate();
	    	//重置按钮
			$("#reset_btn").on('click', function() {
				$("#queryMecPanel_Form")[0].reset();
				$("#queryMecPanel_Form .bs-select").selectpicker('val','');
				initDefaultDate();
			});
	    	//查询按钮
			$("#query_btn").on('click', function() {
				page = 1;
				reloadGrid();
			});
	    	//添加按钮
			$("#add_btn").on('click', function() {
				addOrUpdate("add","");
			});
			//修改按钮
			$("#edit_btn").on('click', function() {
				var selectRocords = $("#queryMecGrid tbody input:checked");
	    		if (selectRocords.length != 1) {
	    			bootbox.alert("请选择一条数据");
	    			return;
	    		} else {
	    			var index = $(selectRocords[0]).attr("rownum");
	    			record = tableData.items[index];
	    		}
	    		addOrUpdate("update",record);
			});
	    	//添加保存按钮
	    	var param = {};
			$("#addform_save_btn").off('click').on('click', function() {
							param.channelCd = $("#CHANNEL_CD_SHOW").val();
							param.payType = $("#PAY_TYPE_SHOW").val();
							param.minAmt = $("#MIN_AMT_SHOW").val();
							param.maxAmt = $("#MAX_AMT_SHOW").val();
							param.minNum = $("#MIN_NUM_SHOW").val();
							param.maxNum = $("#MAX_NUM_SHOW").val();
				$.ajax({
					type: "POST",
					url: baseURL + "/SES/Test/Testsave",
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					data: param,
					dataType: "json",
					success:function(data){
						if(data.timeout){
		            		ajaxTimeout();
		                }
						bootbox.alert(data.msg);
						$("#addOrUpdateWin").modal('hide');
						reloadGrid();
					},
					error:function(){
						
					}
				});
			});
			//弹出页面取消按钮
			$("#addform_cancel_btn").on('click',function(){
				$("#addOrUpdateWin").modal('hide');
			});
	    	//删除按钮
			$("#dele_btn").on('click', function() {
				var selectRocords = $("#queryMecGrid tbody input:checked");
				var uuids = "";
				if(selectRocords.length <= 0){
					bootbox.alert(CONST.TIP001);
	    			return;
				}else{
					for(i=0; i < selectRocords.length; i++){
						var index = $(selectRocords[i]).attr("rownum");
	        			record = tableData.items[index];
					}
					uuids = uuids.substring(0, uuids.lastIndexOf(","));
					bootbox.confirm("选择了"+selectRocords.length+"条, 确认删除?", function(truthBeTold){
						if(truthBeTold){
		    				 $.ajax({
		     	                type: "POST",
		     	                url: baseURL + "/SES/Test/TestdeleteByUuid",
		     	                data:{
		     	                	uuids:uuids
		     	                },
		     	               contentType: "application/x-www-form-urlencoded;charset=utf-8",
		     	                dataType: "json",
		     	                success: function(data) {
		            	if(data.timeout){
		            		ajaxTimeout();
		                }
		     	                	if (data.success) {
		     	                		bootbox.alert("操作成功!");
		     	                		reloadGrid();
		     	                	}else{
		     	                		bootbox.alert("操作失败！ "+data.msg);
		     	                	}
		     	    			},
		     	                	
		     	         
		     	                error: function(error) {
		     	                	bootbox.alert("操作失败!");
		     	                }
		     		    });
		    			}else{
		    				return;
		    			}
					});
				}
			});
		});
		//添加或者修改方法
		function addOrUpdate(type,value){
			if("add" == type){
				$("#addOrUpdateWin").modal('show');
			}else if("update" == type){
				var param = {};
				$.ajax({
					type : "POST",
					url : baseURL + "/SES/Test/TestgetDetail",
					data :param,
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					dataType : "json",
					success:function(data){
								document.getElementById('CHANNEL_CD_SHOW').value=data.data.channelCd;
								document.getElementById('PAY_TYPE_SHOW').value=data.data.payType;
								document.getElementById('MIN_AMT_SHOW').value=data.data.minAmt;
								document.getElementById('MAX_AMT_SHOW').value=data.data.maxAmt;
								document.getElementById('MIN_NUM_SHOW').value=data.data.minNum;
								document.getElementById('MAX_NUM_SHOW').value=data.data.maxNum;
						
					},
					error:function(){
						alert("操作失败，请重新操作！")
					}
				});
			}else{
				bootbox.alert("操作错误，请重新操作！");
    			return;
			}
		}
		//下拉框码表中加载数据
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
		//初始化输入框时间默认值
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
	    }
		var queryInner_Path = baseURL + "/SES/Test/Testquery";
		//实现查询按钮方法
		function reloadGrid(){
			$('table > tbody').empty();
	    	if(limit==0) {
	    		//默认20条
	    		limit=20;
	    	}
	    	start=(page-1)*limit;
			if(daysBetween(beginDt, endDt) > 30){
	            bootbox.alert("起止时间的最大间隔为1个月");
	            return;
	        }
			//获取筛选条件输入值
			var param = {page:page,start:start,limit:limit};
					param.channelCd = $("#CHANNEL_CD").val();
					param.payType = $("#PAY_TYPE").val();
					param.minAmt = $("#MIN_AMT").val();
					param.maxAmt = $("#MAX_AMT").val();
					param.minNum = $("#MIN_NUM").val();
					param.maxNum = $("#MAX_NUM").val();
			$.ajax({
				type: "POST",
				url: queryInner_Path,
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				data: param,
				dataType: "json",
				success:function(data){
					if(data.timeout){
	            		ajaxTimeout();
	                }
					toalPage=Math.ceil(data.totalCount/limit);
					$("#itemCount").text(data.totalCount);
					$("#nowpage").text(page);
					$("#toalPage").text(toalPage);
					if (!data.totalCount || data.totalCount == 0) {
	    			    $("#count_Label").text("0  笔");
	    			    $("#totalAmt_Label").text("0 元");
	    				$("#pagination-bar").hide();
	    				return;
	    			}
					if (toalPage < 2) {
	    				$("#pagination").hide();
	    			} else {
	    				$("#pagination").show();
	    			}
					tableData = $.extend(true, {}, data);
					var sumPayAmt = data.items[0].sumPayAmt;
                    $("#count_Label").text(data.totalCount +" 笔");
    			    $("#totalAmt_Label").text(sumPayAmt+ " 元");
    			    $("#queryMecGrid").DataTable().clear().draw();
    			    $.each(data.items,function(index,obj){
    			    	var trData = [];
    			    	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
    			    	trData.push(start + index + 1);
    			    			trData.push(obj.channelCd);
    			    			trData.push(obj.payType);
    			    			trData.push(obj.minAmt);
    			    			trData.push(obj.maxAmt);
    			    			trData.push(obj.minNum);
    			    			trData.push(obj.maxNum);
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
				error:function(error){
					
				}
			});
			
		}
		//验证时间间隔方法
		function daysBetween(DateOne,DateTwo)  
	    {   
	        var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ('/'));  
	        var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ('/')+1);  
	        var OneYear = DateOne.substring(0,DateOne.indexOf ('/'));  
	      
	        var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('/'));  
	        var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ('/')+1);  
	        var TwoYear = DateTwo.substring(0,DateTwo.indexOf ('/'));  
	      
	        var cha=((Date.parse(OneMonth+'/'+OneDay+'/'+OneYear)- Date.parse(TwoMonth+'/'+TwoDay+'/'+TwoYear))/86400000);   
	        return Math.abs(cha);  
	    }
		

		/* 写到流水模板下载 流水批量导入，需要重新考虑（页面没有实现） */
	</script>

</body>

</html>
