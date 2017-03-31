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
		                        <form action="<%=request.getContextPath()%>/usrQuery/inner" class="form-horizontal" id="queryInnerPanel_myForm">
		                            <div class="form-body">
		                                <div class="row norow">

		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">商户编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mno" id="queryInnerPanel_mno" class="form-control" placeholder="请输入商户编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">商户名称:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mecNm" id="queryInnerPanel_mecNm" class="form-control" placeholder="请输入商户名称">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">业务总开关:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="busSwt" id="queryInnerPanel_busSwt" class="bs-select form-control" data-show-subtext="true">
		                                                <option value="">全部</option>
		                                                <option value="01">开通</option>
		                                                <option value="00">关闭</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">业务类型:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="busTyp" id="queryInnerPanel_busTyp" class="bs-select form-control" data-show-subtext="true">
		                                                <option value="">全部</option>
		                                                <option value="00">API版代付</option>
		                                                <option value="01">网页版代付</option>
		                                                <option value="02">API和网页版代付</option>
		                                                <option value="03">无</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">全时代付状态:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="allTimePay" id="queryInnerPanel_allTimePay" class="bs-select form-control" data-show-subtext="true">
		                                                <option value="">全部</option>
		                                                <option value="00">未开通</option>
		                                                <option value="01">开通</option>
		                                                <option value="02">关闭</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">工作日代付状态:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="workDayPay" id="queryInnerPanel_workDayPay" class="bs-select form-control" data-show-subtext="true">
		                                  			   <option value="">全部</option>
		                                                <option value="00">未开通</option>
		                                                <option value="01">开通</option>
		                                                <option value="02">关闭</option>
		                                                </select> 
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
		                                            <div class="col-md-offset-1 col-md-11">
		                                                <button type="button" id="query_btn" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
		                                                <button type="button" id="reset_btn" class="btn red"> <i class="fa fa-refresh"></i> 重置</button>
		                                                <button type="button" id="add_btn" class="btn btn-info"> <i class="fa fa-pencil"></i> 添加</button>
		                                                <button type="button" id="edit_btn" class="btn tn btn btn-primary"> <i class="fa fa-edit"></i> 修改</button>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">代付业务信息列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="queryInnerGridPanel">
		                            <thead>
		                                <tr>
		                                    <th>
		                                        <input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                    <th> 序号 </th>
		                                    <th>商户编号</th>
		                                    <th> 商户名称 </th>
		                                    <th> 业务总开关</th>
		                                    <th> 业务类型</th>
		                                    <th> 全时代付状态 </th>
		                                    <th> 全时代付费率 </th>
		                                    <th> 工作日代付状态</th>
		                                    <th> 工作日代付费率 </th>
		                                    <th> 全时代付短信通知标识</th>
		                                    <th> 工作日代付短信通知标识</th>
		                                    <th> 操作  </th>
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
		
		<!-- 添加/修改数据的模态框（Modal） -->
		<div class="modal fade" id="addOrUpdateWin" tabindex="-1" data-backdrop="static" data-width="760px">
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
                                    <input name="inMno" id="addform_inMno" class="form-control" style="display:none" placeholder="">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-2 text-right">商户编号<font style="color:red">*</font>:</label>
                                            <div class="col-md-6 paddingnone">
                                                <input name="mno" id="addform_mno" class="form-control" placeholder="">
                                            </div>
                                            <div class="col-md-2 paddingnone">
                                               <button type="button" id="addform_query_btn" class="btn btn-default"><i class="fa fa-search"></i> 查询</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-2 text-right">商户名称<font style="color:red">*</font>:</label>
                                            <div class="col-md-6 paddingnone">
                                                <input name="mecNm" id="addform_mecNm" class="form-control" readonly placeholder="">
                                            </div>
                                          
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                                        <div class="form-group">
                                            <label class="control-label col-md-2 text-right">业务总开关:</label>
                                            <div class="col-md-6 paddingnone">
                                                <select name="busSwt" id="addform_busSwt" class="bs-select form-control" data-show-subtext="true">
                                                	<option value="01">开通</option>
                                                	<option value="00">关闭</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="addbusSwt">
                                        <div class="form-group">
                                            <label class="control-label col-md-2 text-right">业务类型:</label>
                                            <div class="col-md-6 paddingnone">
                                                <select name="busTyp" id="addform_busTyp" class="bs-select form-control" data-show-subtext="true">
                                                	<option value="03">请选择</option>
                                                	<option value="00">API版代付</option>
                                                	<option value="01">网页版代付</option>
                                                	<option value="02">API和网页版代付</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="addbusSwt_d">
                                <div class="row norow">
                                <h4 class="modal-title" id="">商户产品信息</h4>
                             		<br >
                                      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-8 text-center font-bold"><strong>产品类型</strong></label>
                                        </div>
                                    </div>
                                      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-8 text-center font-bold"><strong>状态</strong></label>
                                        </div>
                                    </div>
                                      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-8 text-center font-bold"><strong>费率</strong></label>
                                        </div>
                                    </div>
                                      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-6 "><strong>短信通知</strong></label>
                                        </div>
                                    </div>
                                </div>
                                    <br >
                                <div class="row">
                                	 <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-8 text-center">全时代付</label>
                                        </div>
                                    </div>
                                      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-group">
                                         <select name="allTimePay" id="addform_allTimePay" onchange="" class="bs-select form-control" data-show-subtext="true">
                                                	<option value="00">请选择</option>
                                                	<option value="01">开通</option>
                                          </select>
                                        </div>
                                    </div>
                                      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                      
                                      <div class="col-md-7 paddingnone">
		                                      <input name="allTimePayRate" id="addform_allTimePayRate" type="number" step="0.01" readonly='readonly' class="form-control onlyNum" >
		                               </div>
                                         <label class="control-label col-md-5" style="text-align:left" >元/笔</label>
                                    </div>
                                    
                                      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="col-md-12 paddingnone">
                                         <label><input type="checkbox" id="addform_addAtSmsFlgAll" disabled='disabled'>&nbsp;短信通知</label>
		                               </div>
                                    </div>
                                </div>
                                 <br >
                                  <div class="row">
                                	 <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-8 text-center">工作日代付</label>
                                        </div>
                                    </div>
                                      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-group">
                                         <select name="workDayPay" id="addform_workDayPay" class="bs-select form-control" data-show-subtext="true">
                                                	<option value="00">请选择</option>
                                                	<option value="01">开通</option>
                                          </select>
                                        </div>
                                    </div>
                                      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                      
                                      <div class="col-md-7 paddingnone">
		                                      <input name="workDayPayRate" id="addform_workDayPayRate" type="number" step="0.01" readonly='readonly' class="form-control onlyNum" >
		                               </div>
                                         <label class="control-label col-md-5" style="text-align:left">元/笔</label>
                                    </div>
                                    
                                      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="col-md-12 paddingnone">
                                         <label><input type="checkbox" id="addform_addWdSmsFlgAll" disabled='disabled'>&nbsp;短信通知</label>
		                               </div>
                                    </div>
                                </div>
                                <br >
                                  <div class="row norow">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="smsCont_Div">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-2 text-right">短信内容:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="smsCont" id="addform_smsCont" class="form-control" >
                                            </div>
                                          
                                        </div>
                                    </div>
                                    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                            <label class="control-label col-md-12 text-left">占位符提示：[n]代表户名、[c]代表银行卡尾号、[m]代表付款金额、[t]代表时间</label>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12" style="text-align:center;">
                                                <button type="button" id="addform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 添加</button>
                                                <button type="button" id="addform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
		         </div>
        <!-- END CONTENT -->
    	</div>
    </div>
    <!-- END CONTAINER -->
    
    <!-- 查看详情的模态框（Modal） -->
	<div class="modal fade" id="moreInfoWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="1000px" data-height="580px"
	   aria-labelledby="myModalLabel" aria-hidden="true" style="y-scroll:true">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" >查看操作记录</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       	<div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="moreInfoGridPanel">
		                            <thead>
		                                <tr>
		                                    <th>
		                                        <input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                    <th> 序号 </th>
		                                    <th> 商户编号</th>
		                                    <th> 商户名称 </th>
		                                    <th> 修改前业务总开关</th>
		                                    <th> 修改后业务总开关</th>
		                                    <th> 修改前业务类型</th>
		                                    <th> 修改后业务类型</th>
		                                    <th> 产品类型</th>
		                                    <th> 修改前状态 </th>
		                                    <th> 修改后状态 </th>
		                                    <th> 修改前费率</th>
		                                    <th> 修改后费率</th>
		                                    <th> 短信通知标识修改为 </th>
		                                    <th> 操作人</th>
		                                    <th>操作时间 </th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            </tbody>
		                        </table>
		                    </div>
                           <div class="form-actions">
                               <div class="row">
                                   <div class="col-md-12">
                                       <div class="row">
                                           <div class="col-md-12" style="text-align:center;">
                                               <button type="button" onclick="javascript:$('#moreInfoWin').modal('hide');" id="" class="btn btn-primary"> <i class="fa "></i> 关闭</button>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                   </div>
	         </div>
       <!-- END CONTENT -->
   </div>
   
   <!-- 添加/修改数据的模态框（Modal） -->
	<div class="modal fade" id="exportExcelWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">导出EXCEL</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="exportform">
                           <div class="form-body">
                               <div class="row norow">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                       <div class="form-group">
                                           <label for="span-medium-2" class="control-label col-md-4 text-right">请选择导出方式:</label>
                                           <label class="checkbox-inline">
										      <input type="radio" name="innerExcelType" id="innerExcelType" value="1" checked aria-label="...">按页面选中导出
										   </label>
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
                                               <button type="button" id="exportform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 确认</button>
                                               <button type="button" id="exportform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
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
		<div class="modal fade" id="alterWin" tabindex="-1" data-backdrop="static" data-width="1000px">
		         <div class="modal-header">
		            <button type="button" class="close" 
		               data-dismiss="modal" aria-hidden="true">
		                  &times;
		            </button>
		            <h4 class="modal-title" id="">修改代付商户信息</h4>
		         </div>
		         <div class="modal-body">
		            <div class="portlet-body form">
                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="alterform">
                            <div class="form-body">
                                <div class="row norow">
                                    <input name="inMno" id="alterform_inMno" class="form-control" style="display:none" placeholder="">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-2 text-right">商户编号<font style="color:red">*</font>:</label>
                                            <div class="col-md-6 paddingnone">
                                                <input name="mno" id="alterform_mno" disabled='disabled' class="form-control" placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-2 text-right">商户名称<font style="color:red">*</font>:</label>
                                            <div class="col-md-6 paddingnone">
                                                <input name="mecNm" id="alterform_mecNm" disabled='disabled'  class="form-control" readonly placeholder="">
                                            </div>
                                          
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                                        <div class="form-group">
                                            <label class="control-label col-md-2 text-right">业务总开关:</label>
                                            <div class="col-md-6 paddingnone">
                                                <select name="busTyp" id="alterform_busSwt"  class="bs-select form-control" data-show-subtext="true">
                                               		<!--  <option value="">请选择</option> -->
                                                	<option value="01">开通</option>
                                                	<option value="00">关闭</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="swt_type">
                                        <div class="form-group">
                                            <label class="control-label col-md-2 text-right">业务类型:</label>
                                            <div class="col-md-6 paddingnone">
                                                <select name="busTyp" id="alterform_busTyp"  class="bs-select form-control" data-show-subtext="true">
                                               		<option value="03">请选择</option>
                                                	<option value="00">API版代付</option>
                                                	<option value="01">网页版代付</option>
                                                	<option value="02">API和网页版代付</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="swt_type_d">
                                <div class="row norow">
                                <h4 class="modal-title" id="">商户产品信息</h4>
                             		<br >
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-8 text-center font-bold"><strong>类型</strong></label>
                                        </div>
                                    </div>
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-8 text-center font-bold"><strong>当前状态</strong></label>
                                        </div>
                                    </div>
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-8 text-center font-bold"><strong>新状态</strong></label>
                                        </div>
                                    </div>
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-8 text-center font-bold"><strong>当前费率</strong></label>
                                        </div>
                                    </div>
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-8 text-center font-bold"><strong>新费率</strong></label>
                                        </div>
                                    </div>
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-6 "><strong>短信通知</strong></label>
                                        </div>
                                    </div>
                                </div>
                                    <br >
                                <div class="row">
                                	 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-8 text-center">全时代付</label>
                                        </div>
                                    </div>
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-group"> 
                                         <select name="allTimePay" id="alterform_hisallTimePay" disabled='disabled' onchange="" class="bs-select form-control" data-show-subtext="true">
                                                	<option value="00">请选择</option>
                                                	<option value="01">开通</option>
                                                	<option value="02">关闭</option>
                                          </select>
                                        </div>
                                    </div>
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-group">
                                         <select name="allTimePay" id="alterform_allTimePay" onchange="" class="bs-select form-control" data-show-subtext="true">
                                                	<option value="00">请选择</option>
                                                	<option value="01">开通</option>
                                                	<option value="02">关闭</option>
                                          </select>
                                        </div>
                                    </div>
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                      
                                      <div class="col-md-6 paddingnone">
		                                      <input name="allTimePayRate" id="alterform_hisallTimePayRate" type="number" readonly='readonly' class="form-control onlyNum" >
		                               </div>
                                         <label class="control-label col-md-6" style="text-align:left" >元/笔</label>
                                    </div>
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                      
                                      <div class="col-md-6 paddingnone">
		                                      <input name="allTimePayRate" id="alterform_allTimePayRate" type="number" readonly='readonly' class="form-control onlyNum" >
		                               </div>
                                         <label class="control-label col-md-6" style="text-align:left" >元/笔</label>
                                    </div>
                                    
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="col-md-12 paddingnone">
                                         <label><input type="checkbox" id="alterform_addAtSmsFlgAll" disabled='disabled'>&nbsp;短信通知</label>
		                               </div>
                                    </div>
                                </div>
                                 <br >
                                  <div class="row">
                                	 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-8 text-center">工作日代付</label>
                                        </div>
                                    </div>
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-group">
                                           <select name="workDayPay" id="alterform_hisworkDayPay" disabled='disabled' class="bs-select form-control" data-show-subtext="true">
                                                	 <option value="00">请选择</option>
                                                	<option value="01">开通</option>
                                                	<option value="02">关闭</option>
                                          </select>
                                        </div>
                                    </div>
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-group">
                                         <select name="workDayPay" id="alterform_workDayPay" class="bs-select form-control" data-show-subtext="true">
                                                	 <option value="00">请选择</option>
                                                	<option value="01">开通</option>
                                                	<option value="02">关闭</option>
                                          </select>
                                        </div>
                                    </div>
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                      
                                      <div class="col-md-6 paddingnone">
		                                      <input name="workDayPayRate" id="alterform_hisworkDayPayRate" type="number" readonly='readonly' class="form-control onlyNum" >
		                               </div>
                                         <label class="control-label col-md-6" style="text-align:left">元/笔</label>
                                    </div>
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                      
                                      <div class="col-md-6 paddingnone">
		                                      <input name="workDayPayRate" id="alterform_workDayPayRate" type="number" readonly='readonly' class="form-control onlyNum" >
		                               </div>
                                         <label class="control-label col-md-6" style="text-align:left">元/笔</label>
                                    </div>
                                    
                                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="col-md-12 paddingnone">
                                         <label><input type="checkbox" id="alterform_addWdSmsFlgAll" disabled='disabled'>&nbsp;短信通知</label>
		                               </div>
                                    </div>
                                </div>
                                <br >
                                  <div class="row norow">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="smsCont_Div">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-2 text-right">短信内容:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="smsCont" id="alterform_smsCont" class="form-control" >
                                            </div>
                                          
                                        </div>
                                    </div>
                                    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                            <label class="control-label col-md-12 text-left">占位符提示：[n]代表户名、[c]代表银行卡尾号、[m]代表付款金额、[t]代表时间</label>
                                    </div>
                                </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12" style="text-align:center;">
                                                <button type="button" id="alterform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 修改</button>
                                                <button type="button" id="alterform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
		         </div>
        <!-- END CONTENT -->
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
    
    //全选列表数据
    function checkAll(checked) {
    	$("#queryInnerGridPanel tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
	
  	function getMecName(mno){
  		$.ajax({
            type: "GET",
            url: baseURL+'/ses/dfMecIf/queryMercInfoByInMno?mno='+mno,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            dataType: "json",
            success: function(json) {
            	if(json.success){
    	    		$("#addform_mecNm").val(json.mernm);
    	    		$("#addform_inMno").val(json.inmno);
    	    		$("#addform_mno").val(mno);
    	    	}else{
    	    		bootbox.alert(json.msg);
    	    	}
            	
            },
            error: function(error) {
    	    		bootbox.alert("获取商户名称异常");
            }
        });
  	}//end fun
  
  	
    /** 添加或者修改 **/
    function showAddOrUpdate(type) {
    	$("#addform")[0].reset();
    	$("#addform .bs-select").selectpicker('val', '');
    	//绑定响应事件
    	$("#addform_query_btn").off('click').on('click', function(){
    		//响应查询操作
    		var mno = $("#addform_mno").val().replace(/(^\s*)|(\s*$)/g, "");
    		if(mno == ''){
    			bootbox.alert("商户编号不能为空!");
    			return;
    		}else{
    			getMecName(mno);
    		}
    	});
    	
    	
    	//绑定下拉框改变事件
    	$("#addform_allTimePay").on('change', function(){
    		var value = $("#addform_allTimePay").val();
			if(value == '01'){
				$("#addform_allTimePayRate").val("1");
				$("#addform_allTimePayRate").attr('readonly', false);
				$("#addform_atSmsFlg").attr('disabled', false);
				$("#addform_addAtSmsFlgAll").attr('disabled', false);
			
				
			}else{ 
				$("#addform_allTimePayRate").val("");
				$("#addform_allTimePayRate").attr('readonly', true);
				$("#addform_addAtSmsFlgAll").attr('disabled', true);
				$("#addform_addAtSmsFlgAll")[0].checked = false;
				if('00'==$("#addform_workDayPay").val()){
					$("#addform_smsCont").attr('disabled', true);
					$("#addform_smsCont").val("");
				}
			}
    		
    	});
    	
		$("#addform_allTimePayRate").attr('readonly', true);
		$("#addform_addAtSmsFlgAll").attr('disabled', true);
		$("#addform_addAtSmsFlgAll")[0].checked = false;
		$("#addform_smsCont").attr('disabled', true);
		$("#addform_smsCont").val("");
    	
    	
		
		
		
		$("#addform_busSwt").on('change', function(){
			var recordadd = $("#addform_busSwt").val()
			if(recordadd=='00'){
				$("#addbusSwt").hide();
				$("#addbusSwt_d").hide();
			}else{
				$("#addbusSwt").show();
				$("#addbusSwt_d").show();
			}
		});
    	$("#addform_addAtSmsFlgAll").on('change', function(){
    		if($("#addform_addAtSmsFlgAll")[0].checked){    
				$("#addform_smsCont").attr('disabled', false);
			 }
    		if(!$("#addform_addAtSmsFlgAll")[0].checked){  
				if(!$("#addform_addWdSmsFlgAll")[0].checked){
					$("#addform_smsCont").val('');
					$("#addform_smsCont").attr('disabled', true);
				}
			 }
    	});
    	
    	
    	$("#addform_workDayPay").on('change', function(){
    		var value = $("#addform_workDayPay").val();
			if(value == '01'){
				$("#addform_workDayPayRate").val("0.5");
				$("#addform_workDayPayRate").attr('readonly', false);
				$("#addform_addWdSmsFlgAll").attr('disabled', false);
				
			}else{ 
				$("#addform_workDayPayRate").val("");
				$("#addform_workDayPayRate").attr('readonly', true);
				$("#addform_addWdSmsFlgAll").attr('disabled', true);
				$("#addform_addWdSmsFlgAll")[0].checked = false;
				if('00'==$("#addform_allTimePay").val()){
					$("#addform_smsCont").attr('disabled', true);
					$("#addform_smsCont").val("");
				}
			}
    		
    	});
		$("#addform_workDayPayRate").val("");
		$("#addform_workDayPayRate").attr('readonly', true);
		$("#addform_addWdSmsFlgAll").attr('disabled', true);
		$("#addform_addWdSmsFlgAll")[0].checked = false;
		$("#addform_smsCont").attr('disabled', true);
		$("#addform_smsCont").val("");
    	
    	
    	$("#addform_addWdSmsFlgAll").on('click', function(){
    		if($("#addform_addWdSmsFlgAll")[0].checked){    
				$("#addform_smsCont").attr('disabled', false);
			 }
    		if(!$("#addform_addWdSmsFlgAll")[0].checked){  
				if(!$("#addform_addAtSmsFlgAll")[0].checked){
					$("#addform_smsCont").val('');
					$("#addform_smsCont").attr('disabled', true);
				}
			 }
    	});
    	
    	var title = '', iconCls = '', btnText = '', url = '', record = null;
    	if (type == 'add') {
    		title = '添加代付商户信息', iconCls = 'add', btnText = '保存', url = baseURL + '/ses/dfMecIf/insertDfMecIf';
    	}
    	
    	/*初始化添加修改弹出窗口*/
    	$("#addOrUpdateWin_title").text(title);

		$("#addform_mno").val('');
		$("#addform_mecNm").val('');
		$("#addform_busSwt").selectpicker('val', '01');
		$("#addform_busTyp").selectpicker('val', '03');
		$("#addbusSwt").show();
		$("#addbusSwt_d").show();
    	
    	//弹出窗口保存按钮
    	$("#addform_save_btn").off('click').on('click', function() {
    		//响应事件,写到保存按钮事件
    		var inMno = $("#addform_inMno").val();
    		var mno = $("#addform_mno").val();
    		var mecNm = $("#addform_mecNm").val();
    		var busSwt = $("#addform_busSwt").val();
    		var busTyp = $("#addform_busTyp").val();
    		var param = {inMno:inMno, mno:mno, mecNm:mecNm, busTyp:busTyp, busSwt:busSwt};
    		var allTimePay = $("#addform_allTimePay").val();
    		var allTimePayRate = $('#addform_allTimePayRate').val();
    		param.allTimePay = allTimePay;
    		param.allTimePayRate = allTimePayRate;
    		var workDayPay = $("#addform_workDayPay").val();
    		var workDayPayRate = $('#addform_workDayPayRate').val();
    		var smsCont = $('#addform_smsCont').val();
    		param.workDayPay = workDayPay;
    		param.workDayPayRate = workDayPayRate;
    		param.smsCont = smsCont;
    		var wdSmsFlg = '00';
    		if(mno == '' || mno == null){
    			bootbox.alert("商户编号不能为空!");
    			return;
    		}
    		if(mecNm == '' || mecNm == null){
    			bootbox.alert("商户名称不能为空!");
    			return;
    		}
    		
    		if($("#addform_addWdSmsFlgAll")[0].checked){  
    		wdSmsFlg = '01';	
    		}
    		//重新计算
    		var atSmsFlg = '00';
    		if($("#addform_addAtSmsFlgAll")[0].checked){  
    			atSmsFlg = '01';	
    		}
    		param.wdSmsFlg = wdSmsFlg;
    		param.atSmsFlg = atSmsFlg;

    		//检查表单
//     		if(allTimePay=="00" && workDayPay=="00"){
// 				bootbox.alert("至少需要开通一种代付产品！");
// 				return;
// 			}
			if("01" == atSmsFlg || "01"==wdSmsFlg){
				if(null == smsCont || "" ==  smsCont ){
					bootbox.alert("请填写短信内容！");
					return
				}
			}
    		
    		
    		App.blockUI({target:"body",boxed:!0,message:'请稍等...',zIndex:12000});
			$.ajax({
	            type: "POST",
	            url: url,
	            data : param,
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            dataType: "json",
	            success: function(result) {
	            	$("#addOrUpdateWin").modal('hide');
	
	            		reloadGrid();
						bootbox.alert(result.msg);
						$("#addform")[0].reset();
						$("#addOrUpdateWin").modal('hide');
	            },
	            error: function(result) {
	            	$("#addOrUpdateWin").modal('hide');
	            	bootbox.alert(result.msg);
	            }
	        });
    	});
    	//弹出窗口取消按钮
		$("#addform_cancel_btn").off('click').on('click', function() {
			$("#addOrUpdateWin").modal('hide');
    	});
    	$("#addOrUpdateWin").modal('show');

    }
  	
  	
	function showAlter(){
    	//绑定下拉框改变事件
    	//初始化
		$("#alterform_inMno").val('');
		$("#alterform_mno").val('');
		$("#alterform_mecNm").val('');
		$("#alterform_busSwt").selectpicker('val', '01');
		$("#alterform_busTyp").selectpicker('val', '03');
		$("#alterform_allTimePay").selectpicker('val', '');
		$('#alterform_allTimePayRate').val('');
		$('#alterform_hisallTimePayRate').val('');
		$("#alterform_workDayPay").selectpicker('val', '');
		$("#alterform_hisworkDayPay").selectpicker('val', '');
		$('#alterform_workDayPayRate').val('');
		$('#alterform_hisworkDayPayRate').val('');
		$('#alterform_smsCont').val('');
		$("#alterform_hisallTimePay").selectpicker('val', '');
		$("#alterform_smsCont").attr('disabled', true);
		$("#alterform_allTimePayRate").val("");
		$("#alterform_allTimePayRate").attr('readonly', true);
		$("#alterform_atSmsFlg").attr('disabled', true);
		$("#alterform_addAtSmsFlgAll").attr('disabled', true);

		$("#alterform_workDayPayRate").val("");
		$("#alterform_workDayPayRate").attr('readonly', true);
		$("#alterform_addWdSmsFlgAll").attr('disabled', true);
	    $("#alterform_addWdSmsFlgAll")[0].checked = false;	
	    $("#alterform_addAtSmsFlgAll")[0].checked = false;	
    	
    	var tempResult;
    	$("#alterform_allTimePay").on('change', function(){
    		var value = $("#alterform_allTimePay").val();
			if(value == '01'){
				$("#alterform_allTimePayRate").val("1");
				$("#alterform_allTimePayRate").attr('readonly', false);
				$("#alterform_atSmsFlg").attr('disabled', false);
				$("#alterform_addAtSmsFlgAll").attr('disabled', false);
			
				
			}else{ 
				$("#alterform_allTimePayRate").val("");
				$("#alterform_allTimePayRate").attr('readonly', true);
				$("#alterform_addAtSmsFlgAll").attr('disabled', true);
				$("#alterform_addAtSmsFlgAll")[0].checked = false;
				if('00'==$("#alterform_workDayPay").val()){
					$("#alterform_smsCont").attr('disabled', true);
					$("#alterform_smsCont").val("");
				}
			}
    		
    	});
    	
    	$("#alterform_addAtSmsFlgAll").on('change', function(){
    		if($("#alterform_addAtSmsFlgAll")[0].checked){    
				$("#alterform_smsCont").attr('disabled', false);
			 }
    		if(!$("#alterform_addAtSmsFlgAll")[0].checked){  
				if(!$("#alterform_addWdSmsFlgAll")[0].checked){
					$("#alterform_smsCont").val('');
					$("#alterform_smsCont").attr('disabled', true);
				}
			 }
    	});
    	$("#alterform_busSwt").on('change', function(){
    		var value = $("#alterform_busSwt").val();
    		if(value=='00'){
    			$("#swt_type").hide();
    			$("#swt_type_d").hide();
    		}else{
    			$("#swt_type").show();
    			$("#swt_type_d").show();
    		}
    	});
    	$("#alterform_workDayPay").on('change', function(){
    		var value = $("#alterform_workDayPay").val();
			if(value == '01'){
				$("#alterform_workDayPayRate").val("0.5");
				$("#alterform_workDayPayRate").attr('readonly', false);
				$("#alterform_addWdSmsFlgAll").attr('disabled', false);
				
			}else{ 
				$("#alterform_workDayPayRate").val("");
				$("#alterform_workDayPayRate").attr('readonly', true);
				$("#alterform_addWdSmsFlgAll").attr('disabled', true);
				$("#alterform_addWdSmsFlgAll")[0].checked = false;
				if('00'==$("#alterform_allTimePay").val()){
					$("#alterform_smsCont").attr('disabled', true);
					$("#alterform_smsCont").val("");
				}
			}
    		
    	});
    	
    	$("#alterform_addWdSmsFlgAll").on('click', function(){
    		if($("#alterform_addWdSmsFlgAll")[0].checked){    
				$("#alterform_smsCont").attr('disabled', false);
			 }
    		if(!$("#alterform_addWdSmsFlgAll")[0].checked){  
				if(!$("#alterform_addAtSmsFlgAll")[0].checked){
					$("#alterform_smsCont").val('');
					$("#alterform_smsCont").attr('disabled', true);
				}
			 }
    	});
    	

    		var url = baseURL + '/ses/dfMecIf/updateDfMecIf';
    		var record;
    		var selectRocords = $("#queryInnerGridPanel tbody input:checked");
    		if (selectRocords.length <= 0) {
    			bootbox.alert(CONST.TIP001);
    			return;
    		} else if (selectRocords.length > 1) {
    			bootbox.alert(CONST.TIP002);
    			return;
    		} else {
    			var index = $(selectRocords[0]).attr("rownum");
    			record = tableData.items[index];
    			//console.log(record);
    		}
    		
    			$.ajax({
	            type: "GET",
	            //Accept: q=0.9,*/*;q=0.8
           		url: baseURL + "/ses/dfMecIf/getDfMecIfDetail/"+record.inMno+"?page=1&start=0&limit=25",
//http://127.0.0.1:8080/bap/ses/
	            dataType: "json",
	            success: function(result) {
	            	//初始化窗口
	            	tempResult = result;
	        		$("#alterform_inMno").val(result.inMno);
	        		$("#alterform_mno").val(result.mno);
	        		$("#alterform_mecNm").val(result.mecNm);
	        		$("#alterform_busSwt").selectpicker('val', result.busSwt);
	        		$("#alterform_busTyp").selectpicker('val', result.busTyp);
	        		$("#alterform_allTimePay").selectpicker('val', result.allTimePay);
	        		$('#alterform_allTimePayRate').val(result.allTimePayRate);
	        		$('#alterform_hisallTimePayRate').val(result.allTimePayRate);
	        		$("#alterform_workDayPay").selectpicker('val', result.workDayPay);
	        		$("#alterform_hisworkDayPay").selectpicker('val', result.workDayPay);
	        		$('#alterform_workDayPayRate').val(result.workDayPayRate);
	        		$('#alterform_hisworkDayPayRate').val(result.workDayPayRate);
	        		$('#alterform_smsCont').val(result.oldSmsCont);
	        		$("#alterform_hisallTimePay").selectpicker('val', result.allTimePay);
	        		
            		if(record.busSwt=='00'){
            			$("#swt_type").hide();
            			$("#swt_type_d").hide();
            		}else{
            			$("#swt_type").show();
            			$("#swt_type_d").show();
            		}
	        		if(record.allTimePay == '01'){
	    				$("#alterform_allTimePayRate").val("1");
	    				$("#alterform_allTimePayRate").attr('readonly', false);
	    				$("#alterform_atSmsFlg").attr('disabled', false);
	    				$("#alterform_addAtSmsFlgAll").attr('disabled', false);
	        		}
	        		if(record.workDayPay == '01'){
	    				//$("#alterform_workDayPayRate").val("0.5");
	    				$("#alterform_workDayPayRate").attr('readonly', false);
	    				$("#alterform_addWdSmsFlgAll").attr('disabled', false);
	        		}
	        		
	        		if(result.oldWdSmsFlg == '01'){  
	        			  $("#alterform_addWdSmsFlgAll")[0].checked = true;
	        			  $("#alterform_smsCont").attr('disabled', false);
	            	}
	        		if(result.oldAtSmsFlg == '01'){  
	        			  $("#alterform_addAtSmsFlgAll")[0].checked = true;	
	        			  $("#alterform_smsCont").attr('disabled', false);
	            	}

	            },
	            error: function(result) {
	            }
	        });		
    				

    	
    		
    		
    		
    	
    	//弹出窗口保存按钮
    	$("#alterform_save_btn").off('click').on('click', function() {
    		//响应事件,写到保存按钮事件
    		var inMno = $("#alterform_inMno").val();
    		var mno = $("#alterform_mno").val();
    		var mecNm = $("#alterform_mecNm").val();
    		var busSwt = $("#alterform_busSwt").val();
    		var busTyp = $("#alterform_busTyp").val();
    		var param = {inMno:inMno, mno:mno, mecNm:mecNm , busTyp:busTyp, busSwt:busSwt};
    		
    		param.allTimePayBf = tempResult.allTimePay == null?"":tempResult.allTimePay;
    		param.allTimePayRateBf = tempResult.allTimePayRate == null?"":tempResult.allTimePayRate;
    		param.oldBusSwt = tempResult.busSwt == null?"":tempResult.busSwt;
    		param.oldBusTyp = tempResult.busTyp == null?"":tempResult.busTyp;
    		param.oldAtSmsFlg = tempResult.oldAtSmsFlg== null?"":tempResult.oldAtSmsFlg;
    		param.oldSmsCont = tempResult.oldSmsCont== null?"":tempResult.oldSmsCont;
    		param.oldWdSmsFlg = tempResult.oldWdSmsFlg== null?"":tempResult.oldWdSmsFlg;
    		param.workDayPayBf = tempResult.workDayPay== null?"":tempResult.workDayPay;
    		param.workDayPayRateBf = tempResult.workDayPayRate== null?"":tempResult.workDayPayRate;

    		
    		
    		var allTimePay = $("#alterform_allTimePay").val();
    		var allTimePayRate = $('#alterform_allTimePayRate').val();
    		param.allTimePay = allTimePay;
    		param.allTimePayRate = allTimePayRate;
    		var workDayPay = $("#alterform_workDayPay").val();
    		var workDayPayRate = $('#alterform_workDayPayRate').val();
    		var smsCont = $('#alterform_smsCont').val();
    		param.workDayPay = workDayPay;
    		param.workDayPayRate = workDayPayRate;
    		param.smsCont = smsCont;
    		var wdSmsFlg = '00';
    		if(mno == '' || mno == null){
    			bootbox.alert("商户编号不能为空!");
    			return;
    		}
    		if(mecNm == '' || mecNm == null){
    			bootbox.alert("商户名称不能为空!");
    			return;
    		}
    		
    		
    		if($("#alterform_addWdSmsFlgAll")[0].checked){  
    		wdSmsFlg = '01';	
    		}
    		//重新计算
    		var atSmsFlg = '00';
    		if($("#alterform_addAtSmsFlgAll")[0].checked){  
    			atSmsFlg = '01';	
    		}
    		param.wdSmsFlg = wdSmsFlg;
    		param.atSmsFlg = atSmsFlg;

    		//检查表单
//     		if(allTimePay=="00" && workDayPay=="00"){
// 				bootbox.alert("至少需要开通一种代付产品！");
// 				return;
// 			}
			if("01" == atSmsFlg || "01"==wdSmsFlg){
				if(null == smsCont || "" ==  smsCont ){
					bootbox.alert("请填写短信内容！");
					return
				}
			}
			
    		if(param.allTimePayBf==allTimePay&&param.allTimePayRateBf==allTimePayRate&& param.workDayPayBf==workDayPay&& param.workDayPayRateBf==workDayPayRate
					&& smsCont==param.oldSmsCont&& atSmsFlg==param.oldAtSmsFlg&& wdSmsFlg==param.oldWdSmsFlg && busTyp==param.oldBusTyp && busSwt==param.oldBusSwt)
    		{
					bootbox.alert("未修改任何信息!");
					return;
			}else{
				App.blockUI({target:"body",boxed:!0,message:'请稍等...',zIndex:12000});
				$.ajax({
		            type: "POST",
		            url: url,
		            data : param,
		            contentType: "application/x-www-form-urlencoded;charset=utf-8",
		            dataType: "json",
		            success: function(result) {
		            	$("#alterWin").modal('hide');
		
		            		reloadGrid();
							bootbox.alert(result.msg);
							$("#alterform")[0].reset();
							$("#alterWin").modal('hide');
		            },
		            error: function(result) {
		            	//$("#alterWin").modal('hide');
		            	bootbox.alert(result.statusText);
		            }
		        });
			}
    	});
    	//弹出窗口取消按钮
		$("#alterform_cancel_btn").off('click').on('click', function() {
			$("#alterWin").modal('hide');
    	});
    	$("#alterWin").modal('show');
		
	}
    //查询数据
    function reloadGrid() {
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};

		var mno = $("#queryInnerPanel_mno").val();
		var mecNm = $("#queryInnerPanel_mecNm").val();
		var allTimePay = $("#queryInnerPanel_allTimePay").val();
		var workDayPay = $("#queryInnerPanel_workDayPay").val();
		var busSwt = $("#queryInnerPanel_busSwt").val();
		var busTyp = $("#queryInnerPanel_busTyp").val();
		param.mno = mno;
		param.mecNm = mecNm;
		param.allTimePay = allTimePay;
		param.workDayPay = workDayPay;
		param.busSwt = busSwt;
		param.busTyp = busTyp;
		App.blockUI({target:"body",boxed:!0,message:"读取中...",zIndex:20000});
		$.ajax({
            type: "POST",
            url: baseURL + "/ses/dfMecIf/querydfMecIfList",
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
    			tableData = $.extend(true, {}, data);//cache
    			
                //$("#queryInnerGridPanel tbody").empty();
    			 $("#queryInnerGridPanel").DataTable().clear().draw();
                //data = Object {items: Array[20], totalCount: 269}
                $.each(data.items, function(index, obj) {
                	var trData = [];
                	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                	trData.push(start + index + 1);
                	
                	trData.push(obj.mno);
                	trData.push(obj.mecNm);
                	
                	var tempbusSwt = obj.busSwt;
                	if(obj.busSwt == '00'){
                		tempbusSwt = "关闭";
                	}else if(obj.busSwt == '01'){
                		tempbusSwt = "开通";
                	}
                	trData.push(tempbusSwt);
                	
                	var tempbusTyp = obj.busTyp;
                	if(obj.busTyp == '00'){
                		tempbusTyp = "API版代付";
                	}else if(obj.busTyp == '01'){
                		tempbusTyp = "网页版代付";
                	}else if(obj.busTyp == '02'){
                		tempbusTyp = "API和网页版代付";
                	}else if(obj.busTyp == '03'){
                		tempbusTyp = "无";
                	}
                	trData.push(tempbusTyp);

                	var tempAllTimePay = obj.allTimePay;
                	if ('00' == tempAllTimePay)
                		tempAllTimePay = '未开通';
                    if ('01' == tempAllTimePay)
                    	tempAllTimePay = '开通';
                    if ('02' == tempAllTimePay)
                    	tempAllTimePay = '关闭';
                	
                	trData.push(tempAllTimePay);
                	trData.push((obj.allTimePayRate == undefined ? '' : obj.allTimePayRate) + "元/笔");
                	
                	
                	
                	var tempworkDayPay = obj.workDayPay;
                	if ('00' == tempworkDayPay)
                		tempworkDayPay = '未开通';
                    if ('01' == tempworkDayPay)
                    	tempworkDayPay = '开通';
                    if ('02' == tempworkDayPay)
                    	tempworkDayPay = '关闭';
                	
                	trData.push(tempworkDayPay);
                	trData.push((obj.workDayPayRate == undefined ? '' : obj.workDayPayRate)+ "元/笔");
                	
                	var tempatSmsFlg = obj.atSmsFlg;
                	if ('00' == tempatSmsFlg)
                		tempatSmsFlg = '未开通';
                    if ('01' == tempatSmsFlg)
                    	tempatSmsFlg = '开通';
                    if ('02' == tempatSmsFlg)
                    	tempatSmsFlg = '关闭';
                    trData.push(tempatSmsFlg);
                    
                	var tempwdSmsFlg = obj.wdSmsFlg;
                	if ('00' == tempwdSmsFlg)
                		tempwdSmsFlg = '未开通';
                    if ('01' == tempwdSmsFlg)
                    	tempwdSmsFlg = '开通';
                    if ('02' == tempwdSmsFlg)
                    	tempwdSmsFlg = '关闭';
                    trData.push(tempwdSmsFlg);
                    
                	trData.push("<a href='javascript:void(0);' onclick='showDfMecOprHisView("+obj.inMno+")'>查看操作记录</a>");
                	for(i=0; i < trData.length; i++){
                   	 if(trData[i] == undefined){
                   		 trData[i] = ''; 
                   	 }
                    }

                   	 $("#queryInnerGridPanel").DataTable().row.add(trData).draw();
                   	
                   	
                   });
                   $("#queryInnerGridPanel").DataTable().order([1, 'asc']).draw();
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
    
    /**
     *描述： 内部用户查询界面详情
     * 作者：songyingmei
     * 时间： 2014/07/15
     */

    //内部用户详情
    function moreInfo() {
    	
    	var selectRocords = $("#queryInnerGridPanel tbody input:checked");
		if (selectRocords.length > 1) {
			bootbox.alert(CONST.TIP511);
			return;
		}
		if (selectRocords.length == 1) {
			var index = $(selectRocords[0]).attr("rownum");
			record = tableData.items[index];
			var pathUrl = baseURL + '/usrQuery/moreInfo/' + record.usrId;
    		showMoreInfo(pathUrl);
			//console.log(record);
		} else {
			bootbox.alert(CONST.TIP510);//选择一条数据
			return;
		}
    }
    
    function showDfMecOprHisView(inMno) {
    	
    	$.ajax({
            type: "POST",
            url: baseURL + "/ses/dfMecIf/queryDfMecOprHisList",
            data:{
            	start:0,
            	page:1,
            	limit:1000,
            	inMno:inMno
            },
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	$("#moreInfoGridPanel").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	var trData = [];
                	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                	trData.push(start + index + 1);
                	
                	trData.push(obj.mno);
                	trData.push(obj.mecNm);
                	
                	var tempbusSwt = obj.lastSwt;
                	if(obj.lastSwt == '00'){
                		tempbusSwt = "关闭";
                	}else if(obj.lastSwt == '01'){
                		tempbusSwt = "开通";
                	}
                	trData.push(tempbusSwt); 
                	
                	tempbusSwt = obj.currentSwt;
                	if(obj.currentSwt == '00'){
                		tempbusSwt = "关闭";
                	}else if(obj.currentSwt == '01'){
                		tempbusSwt = "开通";
                	}
                	trData.push(tempbusSwt);
                	
                	
                	
                	var tempbusTyp = obj.lastTyp;
                	if(obj.lastTyp == '00'){
                		tempbusTyp = "API版代付";
                	}else if(obj.lastTyp == '01'){
                		tempbusTyp = "网页版代付";
                	}else if(obj.lastTyp == '02'){
                		tempbusTyp = "API和网页版代付";
                	}else if(obj.lastTyp == '03'){
                		tempbusTyp = "无";
                	}
                	trData.push(tempbusTyp); 
                	
                	tempbusTyp = obj.currentTyp;
                	if(obj.currentTyp == '00'){
                		tempbusTyp = "API版代付";
                	}else if(obj.currentTyp == '01'){
                		tempbusTyp = "网页版代付";
                	}else if(obj.currentTyp == '02'){
                		tempbusTyp = "API和网页版代付";
                	}else if(obj.currentTyp == '03'){
                		tempbusTyp = "无";
                	}
                	trData.push(tempbusTyp);
                	
                	var tempproductType = obj.productType;
  
                    if ('01' == tempproductType)
                    	tempproductType = '全时代付';
                    if ('02' == tempproductType)
                    	tempproductType = '工作日代付';
                	
                	trData.push(tempproductType);
                	var tempAllTimePay = obj.lastState;
                	if ('00' == tempAllTimePay)
                		tempAllTimePay = '未开通';
                    if ('01' == tempAllTimePay)
                    	tempAllTimePay = '开通';
                    if ('02' == tempAllTimePay)
                    	tempAllTimePay = '关闭';
                	
                	trData.push(tempAllTimePay);
                	tempAllTimePay = obj.currentState;
                	if ('00' == tempAllTimePay)
                		tempAllTimePay = '未开通';
                    if ('01' == tempAllTimePay)
                    	tempAllTimePay = '开通';
                    if ('02' == tempAllTimePay)
                    	tempAllTimePay = '关闭';
                	
                	trData.push(tempAllTimePay);
                	
                	
                	trData.push((obj.lastRate == undefined ? '' : obj.lastRate) + "元/笔");
                	trData.push((obj.currentRate == undefined ? '' : obj.currentRate) + "元/笔");
                	
                	
                	
                	var tempsmsFlg = obj.smsFlg;
                	if ('01' == tempsmsFlg)
                		tempsmsFlg = '开启';
                    if ('00' == tempsmsFlg)
                    	tempsmsFlg = '关闭';

                	trData.push(tempsmsFlg);
                	
                	
                	
                    trData.push(obj.opCte);
                    trData.push(obj.createTime);
                    
                    
                	for(i=0; i < trData.length; i++){
                   	 if(trData[i] == undefined){
                   		 trData[i] = ''; 
                   	 }
                    }

                   	 $("#moreInfoGridPanel").DataTable().row.add(trData);
                   	
                   	
                   });
                   $("#moreInfoGridPanel").DataTable().order([1, 'asc']).draw();
            	
            },
            error: function(error) {
            }
        });
    	$("#moreInfoWin").modal('show');

    }
  	
    $(function(){
    	
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.DF2501)) {$("#add_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.DF2502)) {$("#add_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.DF2503)) {$("#edit_btn").hide();}
    	//初始化页面表单数据源
		//getComboStore('queryInnerPanel_usrStsCombo', 'USR_STS');
		
    	//reloadGrid();
    	//添加/修改表单的校验
		$('#addform').bootstrapValidator({trigger:'blur',
	        fields: {
	        	addform_mno: {
	                validators: {
	                    notEmpty: {
	                        message: '商户编号不能为空'
	                    },
	                }
	            },
	            addform_busTyp: {
	                validators: {
	                    notEmpty: {
	                        message: '商户编号不能为空'
	                    }
	                }
	            },
	        },
	        submitHandler: function(validator, form, submitButton) {
	            /* var fullName = [validator.getFieldElements('firstName').val(),
	                            validator.getFieldElements('lastName').val()].join(' ');
	            $('#helloModal')
	                .find('.modal-title').html('Hello ' + fullName).end()
	                .modal(); */
	        }
	    });
		//查询按钮
		$("#query_btn").on('click', reloadGrid);
		
		//重置按钮
		$("#reset_btn").on('click', function() {
			$("#queryInnerPanel_myForm")[0].reset();
			$("#queryInnerPanel_myForm .bs-select").selectpicker('val','');
		});
		
		//添加按钮
		$("#add_btn").on('click', function() {
			showAddOrUpdate('add');
		});
		
		//修改按钮
		$("#edit_btn").on('click', function() {
			showAlter();
		});
		
		//详情按钮
		$("#info_btn").on('click', moreInfo);
		
		//导出excel按钮
		$("#exportexcel_btn").on('click', function() {
			$("#exportExcelWin").modal('show');
			
			$("#exportform_save_btn").off('click').on('click', function() {
				var innerExcelType = $("#innerExcelType").val();
				if (innerExcelType == '1') {
					var selectRocords = $("#queryInnerGridPanel tbody input:checked");
					var usrIdArray = new Array();
					if (selectRocords.length > 0) {
						for (var i = 0; i < selectRocords.length; i++) {
							var index = $(selectRocords[i]).attr("rownum");
			    			var record = tableData.items[index];
							var oneusrId = record.usrId;
							usrIdArray.push(oneusrId);

						}
						window.open(baseURL + "/usrQuery/innerExcel" + "?usrIdArray=" + usrIdArray);
						$("#exportExcelWin").modal('hide');

					} else {
						bootbox.alert(CONST.TIP513);//选择一条数据
					}

				}
			});
			$("#exportform_cancel_btn").off('click').on('click', function() {
				$("#exportExcelWin").modal('hide');
			});
			
		});
   	});
    </script>
    
</body>

</html>
