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
											 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">起止日期:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange">
		                                                    <input type="text" class="form-control col-md-3" name="dtOpenBg" id="dtOpenBg">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="dtOpenEd" id="dtOpenEd">
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">是否非工作日:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="workDayFlg" id="queryMecStore_workDayFlg" class="bs-select form-control" data-show-subtext="true">
		                                                <option value="">全部</option>
		                                                <option value="00">是</option>
		                                                <option value="01">否</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">是否允许即刷即到:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="jsjdFlg" id="queryMecStore_jsjdFlg" class="bs-select form-control" data-show-subtext="true">
		                                                <option value="">全部</option>
		                                                <option value="0">否</option>
		                                                <option value="1">是</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">是否允许D+1结算:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="d1Flg" id="queryMecStore_d1Flg" class="bs-select form-control" data-show-subtext="true">
		                                                <option value="">全部</option>
		                                                <option value="1">是</option>
		                                                <option value="0">否</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">是否允许T+0结算:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="t0Flg" id="queryMecStore_t0Flg" class="bs-select form-control" data-show-subtext="true">
		                                                <option value="">全部</option>
		                                                <option value="1">是</option>
		                                                <option value="0">否</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                     <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">备注:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="rmk" id="queryMecStore_rmk" class="form-control" placeholder="请输入备注">
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
															<button type="button" id="reset_btn" class="btn red">
																<i class="fa fa-refresh"></i> 重置
															</button>
															<button type="button" id="edit_btn" class="btn btn-primary">
															    <i class="fa fa-edit"></i> 修改
															</button>
															<button type="button" id="importPanel_download_btn" class="btn btn-success">
															    <i class="fa fa-out"></i> 下载模板
															</button>
		                                                    <button type="button" id="importPanel_add_btn" class="btn btn-info">
		                                                     <i class="fa fa-add"></i>导入Excel
		                                                     </button>
		                                                     <button type="button" id="exportexcel_btn" class="btn btn btn-primary"> <i class="fa fa-sign-out"></i> 导出excel</button>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">非工作日属性信息列表</span> </div>
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
											 <th>
		                                        <input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                    												<th class="nowrap">数据主键</th>
												<th class="nowrap">业务类型(01:秒到自动结算;02即刷接到结算;03:闪电到账;04:TN直连付款)</th>
												<th class="nowrap">错误码</th>
												<th class="nowrap">错误原因</th>
												<th class="nowrap">备注</th>
												<th class="nowrap">金额</th>
												<th class="nowrap">商户编号</th>
												<th class="nowrap">创建日期</th>
												<th class="nowrap">创建时间</th>
												<th class="nowrap">手续费</th>
												<th class="nowrap">结算子类型</th>
												<th class="nowrap">交易流水号</th>
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
                                          <div class="col-md-12" style="text-align:center">
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
                                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">选择日期:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange">
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
                                           <div class="col-md-12" style="text-align:center">
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
   
   
   <!-- 添加/修改数据的模态框（Modal） -->
<div class="modal fade" id="updateWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="600px" data-height="300px"
     aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="">修改非工作日属性</h4>
            </div>
            <div class="modal-body">
                <div class="portlet-body form">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">是否非工作日:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="workDayFlg" id="workDayFlg" class="bs-select form-control" data-show-subtext="true">
		                                                <option value="">不修改</option>
		                                                <option value="00">是</option>
		                                                <option value="01">否</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		     
		                                    	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">是否允许D+1结算:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="d1Flg" id="d1Flg" class="bs-select form-control" data-show-subtext="true">
		                                                <option value="">不修改</option>
		                                                <option value="1">是</option>
		                                                <option value="0">否</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">是否允许T+0结算:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="t0Flg" id="t0Flg" class="bs-select form-control" data-show-subtext="true">
		                                                <option value="">不修改</option>
		                                                <option value="1">是</option>
		                                                <option value="0">否</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                                                   	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">是否允许即刷即到:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="jsjdFlg" id="jsjdFlg" class="bs-select form-control" data-show-subtext="true">
		                                                <option value="">不修改</option>
		                                                <option value="0">否</option>
		                                                <option value="1">是</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
                    
                    
               </div>
           	 </div>
           	 <br>
           	 <br>
           	 <br>
           	 <br>
                   <div class="form-actions">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-12" style="text-align:center">
                                        <button type="button" 
                                                    id="confirm_update_btn" class="btn btn-success"><i class="fa fa-share"></i> 确认提交
                                            </button>
                                        <button type="button" 
                                                    id="cancel_btn" class="btn btn-success"><i class="fa fa-share"></i> 取消
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
            
            <!--
            <div class="modal-footer">
               <button type="button" class="btn btn-default"
                  data-dismiss="modal">关闭
               </button>
               <button type="button" class="btn btn-primary">
                  
               </button>
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

    
    
  
    
    //查询数据
    function reloadGrid() {
    //http://127.0.0.1:8080/bap/tZero/FcrMag/queryFcrInfo?_dc=1472111617720	
    	
     	 if(limit==0) {
        	//默认20条
        	limit=20;
        }
       	start=(page-1)*limit;
       	
       
        //http://127.0.0.1:8080/bap/sys/query/workDay&yMDBg=20160825&yMDEd=20161231&workDayFlg=&d1Flg=&t0Flg=&jsjdFlg=&rmk=&page=1&start=0&limit=20	
		var	param = {start:start,page:page,limit:limit};
  
    
    	//获取查询的参数
		var dtOpenBg  = $('#dtOpenBg').val().replace('/', '').replace('/', '');
		var dtOpenEd  = $('#dtOpenEd').val().replace('/', '').replace('/', '');
		var workDayFlg  = $('#queryMecStore_workDayFlg').val();
		var jsjdFlg  = $('#queryMecStore_jsjdFlg').val();
		var d1Flg  = $('#queryMecStore_d1Flg').val();
		var t0Flg  = $('#queryMecStore_t0Flg').val();
		var rmk  = $('#queryMecStore_rmk').val();
		
		if(dtOpenEd<dtOpenBg){
			bootbox.alert("起始时间不能超过结束时间!");
			return;
		}
		
    	var	url = baseURL + "/sys/query/workDay?yMDBg="+dtOpenBg+"&yMDEd="+dtOpenEd+"&workDayFlg="+workDayFlg+"&d1Flg="+d1Flg+"&t0Flg="+t0Flg+"&jsjdFlg="+jsjdFlg+"&rmk="+rmk+"&page="+page+"&start="+start+"&limit="+limit;
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
    			

    	    		//流水结果
    	 			$("#queryMecGrid").DataTable().clear().draw();
                    //data = Object {items: Array[20], totalCount: 269}
                    $.each(data.items, function(index, obj) {
                    	
                    	var trData = [];
                    	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                    	
                    	
                    	trData.push(obj.yMD);
                    	if(obj.workDayFlg == '00'){
                    		trData.push("<span style='color:red;font-weight:bold;'>是</span>");
                    	}else{
                    		//tr.append($("<td  class=\"nowrap\"></td>").append($("<span style='color:black;;'></span>").text("否")));
                    		trData.push("<span style='color:black;;'>否</span>");
                    	}
                    	
                    	if(obj.d1Flg == '1'){
                    	//	tr.append($("<td  class=\"nowrap\"></td>").append($("<span style='color:black;;'></span>").text("是")));
                    		trData.push("<span style='color:black;;'>是</span>");
                    	}else{
                    		//tr.append($("<td  class=\"nowrap\"></td>").append($("<span style='color:red;font-weight:bold;'></span>").text("否")));
                    		trData.push("<span style='color:red;font-weight:bold;'>否</span>");
                    	}
                    	
                    	if(obj.t0Flg == '1'){
                    		//tr.append($("<td  class=\"nowrap\"></td>").append($("<span style='color:black;;'></span>").text("是")));
                    		trData.push("<span style='color:black;;'>是</span>");
                    	}else{
                    		//tr.append($("<td  class=\"nowrap\"></td>").append($("<span style='color:red;font-weight:bold;'></span>").text("否")));
                    		trData.push("<span style='color:red;font-weight:bold;'>否</span>");
                    	}
                    	
                    	if(obj.jsjdFlg != '0'){
                    		//tr.append($("<td  class=\"nowrap\"></td>").append($("<span style='color:black;;'></span>").text("是")));
                    		trData.push("<span style='color:black;;'>是</span>");
                    	}else{
                    		//tr.append($("<td  class=\"nowrap\"></td>").append($("<span style='color:red;font-weight:bold;'></span>").text("否")));
                    		trData.push("<span style='color:red;font-weight:bold;'>否</span>");
                    	}

                    	trData.push(obj.rmk);
                    	trData.push(obj.uteStffNo);
                    	trData.push(obj.dtUte);
                    	 for(i=0; i < trData.length; i++){
                        	 if(trData[i] == undefined){
                        		 trData[i] = ''; 
                        	 }
                         }

                        	 $("#queryMecGrid").DataTable().row.add(trData).draw();
                        	
                        	
                        });
                        $("#queryMecGrid").DataTable().order([0, 'asc']).draw();
    	    
    			
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
    	if (!hasPermission(PERMISSSIONCONST.TZERO701)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO701)) {$("#reset_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO702)) {$("#edit_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO704)) {$("#importPanel_add_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO705)) {$("#exportexcel_btn").hide();}
    	
    
        initDefaultDate();
         
 		//初始化模板下载按钮
 		$("#importPanel_download_btn").on('click', function(){
 			
 			$("#downloadWin").modal('show');
 			
 			$("#download_save_btn").on('click', function() {
 	 			
 	 			var downloadDateStart = $("#downloadStart").val().replace('/', '-').replace('/', '-');
 	 			var downloadDateEnd = $("#downloadEnd").val().replace('/', '-').replace('/', '-');
 	 			
 	 			if(downloadDateStart == null || downloadDateStart == ""){
 	 				bootbox.alert("日期选项不能为空");
 	 				return;
 	 			}
 	 			if(downloadDateEnd == null || downloadDateEnd == ""){
 	 				bootbox.alert("日期选项不能为空");
 	 				return;
 	 			}
 	 			$("#downloadWin").modal('hide');
 	 			
 	 			window.location.href = baseURL + "/sys/download?dtStart="+downloadDateStart+"&dtEnd="+downloadDateEnd;
 			});
 		});
 		
 		
		//修改按钮
		$("#importPanel_add_btn").on('click', function() {
			openImportExcelWin();
		});
         
		$("#edit_btn").on('click', function() {
			showAddOrUpdate();
		});
         

    	
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
			
			if(constTotalCount > 300000){
				bootbox.alert("超过了30万条数据，请筛选数据!");
				return;
			}
			
			bootbox.confirm("共有"+constTotalCount+"条数据，确认要导出吗?", function(truthBeTold){
				
				if(truthBeTold){
					window.location.href = baseURL+"/sys/export";
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
           if ((((keyCode >= 48 && keyCode <= 57) || (keyCode == 8 || keyCode == 46)))&&keyCode != 46)
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
  	
  	
  	$("#dtOpenBg").datepicker('update', dateString);
  	$("#dtOpenEd").datepicker('update', tempString);
  	$("#downloadStart").datepicker('update', dateString);
  	$("#downloadEnd").datepicker('update', tempString);
  	
  }
  
  
  
//打开导入文件按钮
  function openImportExcelWin(){

	
	$("#exportform")[0].reset();

	
  	
  	$("#importform_save_btn").off('click').on('click', function() {

  		
  		var filepath = $("#file").val();
  		if(filepath==undefined||filepath==""){ 
  			//fileObject.focus(); 
  			bootbox.alert("请选择上传文件");
			return;
  		}
  		else{ 
  			var fileArr=filepath.split("\\"); 
  			var fileTArr=fileArr[fileArr.length-1].toLowerCase().split("."); 
  			var filetype=fileTArr[fileTArr.length-1]; 
  			
  			if(filetype!="xls"){ 
  				//fileObject.focus(); 
  				bootbox.alert("上传文件必须为03版Excel文件(后缀.xls)!");
  				return;
  		 	}
  	   } 
  		
				var fileObj = document.getElementById("file").files[0]; // 获取文件对象
		  		  var form = new FormData();
		  		   // FormData 对象
		  		  form.append("uploadFile", fileObj); // 文件对象
		  		App.blockUI({target:"body",boxed:!0,message:"正在处理，请稍后...",zIndex:20000});
		         $.ajax({
		             url:baseURL + "/sys/upload/workDay",
		             type:"post",
		             data:form,
		             processData:false,
		             contentType:false,
		           	 dataType: "json",
		  	         success:function(result){
		  	        		   $("#importExcelWin").modal('hide');
		  	        	       if(!result.success){
		  	            		bootbox.alert(result.message);
		  	            		reloadGrid();
		  	            	}else{
		  	            		
		  	            		bootbox.alert("添加了" + result.obj+"条记录");
		  	            		//将返回的数据绑定到列表中
		  	                    reloadGrid();
		  	            	}
		  	           },
		  	           error:function(e){
		  	               bootbox.alert("连接超时！！");
		  	           }
		         });        

  		//bootbox.alert("hello");

  		  
  		
  	       
  	});
	        
  	//弹出窗口取消按钮
	$("#importform_cancel_btn").off('click').on('click', function() {
			$("#importExcelWin").modal('hide');
  	});

  	$("#importExcelWin").modal('show');
  	
  	}





  /** 添加或者修改 **/
  function showAddOrUpdate() {

	 var uuid = '';
  	
  	var selectRocords = $("#queryMecGrid tbody input:checked");
  	if (selectRocords.length <= 0) {
  		bootbox.alert("请选择要修改的数据");
  		return;
  	} else{
  		for(i = 0; i < selectRocords.length; i++){
  			var index = $(selectRocords[i]).attr("rownum");
  			record = tableData.items[index];
  			uuid += record.uuid + ":";
  		}
  	} 
  	

  

  	
  	/* if(workDayFlg == "" || workDayFlg == null){
  		workDayFlg = record.workDayFlg;
  	}
  	if(jsjdFlg == "" || jsjdFlg == null){
  		jsjdFlg = record.jsjdFlg;
  	}
  	if(d1Flg == "" || d1Flg == null){
  		d1Flg = record.d1Flg;
  	}
  	if(t0Flg == "" || t0Flg == null){
  		t0Flg = record.t0Flg;
  	} */
	$("#workDayFlg").selectpicker('val','');
  	$("#jsjdFlg").selectpicker('val','');
  	$("#d1Flg").selectpicker('val','');
  	$("#t0Flg").selectpicker('val','');
  	var url = baseURL + "/sys/update/workDayFlg";
  	
  	//弹出窗口保存按钮
  	$("#confirm_update_btn").off('click').on('click', function() {
  	  	//获取所有修改的值
  	  	var workDayFlg = $("#workDayFlg").val();
  	  	var jsjdFlg = $("#jsjdFlg").val();
  	  	var d1Flg = $("#d1Flg").val();
  	  	var t0Flg = $("#t0Flg").val();
  	  	if((workDayFlg == "" || workDayFlg == null)&&(jsjdFlg == "" || jsjdFlg == null)&&(d1Flg == "" || d1Flg == null)&&(t0Flg == "" || t0Flg == null)){
  	  		bootbox.alert("请至少修改一项!");
  	  		return;
  	  	}
  		
  		App.blockUI({target:"body",boxed:!0,message:"保存修改中...",zIndex:20000});
			$.ajax({
	            type: "POST",
	            url: url,
	            data : {
	            	workDayFlg : workDayFlg,
	            	jsjdFlg : jsjdFlg,
	            	d1Flg : d1Flg,
	            	t0Flg : t0Flg,
	            	uuid : uuid
				},
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            dataType: "json",
	            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
	            	if (data.success) {
						$("#updateWin").modal('hide');
	            		reloadGrid();
						bootbox.alert(data.msg);
					}else{
						bootbox.alert("修改失败!"); 
					}
	            	
	            },
	            error: function(error) {
	            }
	        });
  	});
  	//弹出窗口取消按钮
		$("#cancel_btn").off('click').on('click', function() {
			$("#updateWin").modal('hide');
  	});

  	$("#updateWin").modal('show');

  }

  /* 写到流水模板下载 流水批量导入，需要重新考虑（页面没有实现） */
  
    </script>
    
</body>

</html>
