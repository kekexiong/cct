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
		                                     <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">促销编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="NoticeManageQueryPanel_promotNo" id="NoticeManageQueryPanel_promotNo" class="form-control" placeholder="请输入促销编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right"><font color="red">*</font>促销类型:</label>
		                                            <div class="col-md-8 paddingnone">
		                                              		<select name="NoticeManageQueryPanel_promotType" id="NoticeManageQueryPanel_promotType" class="bs-select form-control" data-show-subtext="true">
															<option value="">全部</option>
															<option value="1">满赠</option>
<!-- 															<option value="2">阶梯折扣</option> -->
															<option value="3">新商户优惠</option>
		                                                </select>
		                                                
		                                                <!-- ajax获取  -->
		                                            </div>
		                                        </div>
		                                    </div>
		                                    	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right"><font color="red">*</font>状态:</label>
		                                            <div class="col-md-8 paddingnone">
		                                              		<select name="NoticeManageQueryPanel_status" id="NoticeManageQueryPanel_status" class="bs-select form-control" data-show-subtext="true">
															<option value="">全部</option>
															<option value="2">编辑中</option>
															<option value="1" selected="selected">促销中</option>
															<option value="3">已关闭</option>
		                                                </select>
		                                                
		                                                <!-- ajax获取  -->
		                                            </div>
		                                        </div>
		                                    </div>
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">创建日期:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange">
		                                                    <input type="text" class="form-control col-md-3" name="strDtBg" id="NoticeManageQueryPanel_ctDtBg">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="ctDtEd" id="NoticeManageQueryPanel_ctDtEd">
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">关闭日期:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange">
		                                                    <input type="text" class="form-control col-md-3" name="strDtBg" id="NoticeManageQueryPanel_opDtBg">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="opDtEd" id="NoticeManageQueryPanel_opDtEd">
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
															<button type="button" id="reset_btn" class="btn red">
																<i class="fa fa-refresh"></i> 重置
															</button>
		                                                    <button type="button" id="add_btn" class="btn btn-info"> <i class="fa fa-pencil"></i>新建</button>
		                                                     <button type="button" id="importPanel_download_btn" class="btn btn-primary"> <i class="fa fa-out"></i> 下载模板</button>
														</div>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">结算产品促销活动信息列表</span> </div>
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
												<th class="nowrap">序号</th>
												<th class="nowrap">促销编号</th>
												<th class="nowrap">促销类型</th>
												<th class="nowrap">状态</th>
												<th class="nowrap">创建时间</th>
												<th class="nowrap">创建人</th>
												<th class="nowrap">关闭时间</th>
												<th class="nowrap">关闭人</th>
												<th class="nowrap">操作</th>
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


    



<!-- 添加/修改数据的模态框（Modal） -->
		<div class="modal fade" id="addWin" tabindex="-1" data-backdrop="static" data-width="300px">
		         <div class="modal-header">
		            <button type="button" class="close" 
		               data-dismiss="modal" aria-hidden="true">
		                  &times;
		            </button>
		            <h4 class="modal-title" id="">选择促销类型</h4>
		         </div>
		         <div class="modal-body">
		            <div class="portlet-body form">
                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="addform">
                            <div class="form-body">
                                <div class="row norow">

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                          <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">促销类型:</label>
		                                            <div class="col-md-8 paddingnone">
		                                              		<select name="addform_promotType" id="addform_promotType" class="bs-select form-control" data-show-subtext="true">
															<option value="1">满赠</option>
<!-- 															<option value="2">阶梯折扣</option> -->
															<option value="3">新商户优惠</option>
		                                                </select>
		                                                
		                                                <!-- ajax获取  -->
		                                            </div>
		                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <br />
                                <br />
                                <br />
                                <br />
                            </div>
                             <div class="clearfix"></div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12" style="text-align:center;">
                                                <button type="button" id="addform_save_btn" class="btn btn-success"><i class="fa"></i> 下一步</button>
                                                <button type="button" id="" onclick="javascript:$('#addWin').modal('hide')" class="btn red"> <i class="fa fa-share"></i> 取消</button>
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
   
   
   
   <!-- 添加/修改数据的模态框（Modal） -->
		<div class="modal fade" id="manzengWin" tabindex="-1" data-backdrop="static" data-width="600px">
		         <div class="modal-header">
		            <button type="button" class="close" 
		               data-dismiss="modal" aria-hidden="true">
		                  &times;
		            </button>
		            <h4 class="modal-title" id="">满赠</h4>
		         </div>
		         <div class="modal-body">
		            <div class="portlet-body form">
                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="manzengform">
                            <div class="form-body">
                                <div class="row norow">

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                          <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-6 text-right">即日付及闪电到账日均结算金额大于等于<font color="red">*</font>:</label>
		                                           <div class="col-md-3 paddingnone">
		                                                <input name="manZeng_AddForm_enoughAmt" id="manZeng_AddForm_enoughAmt" type="number" min='0' class="form-control onlyNum" >
		                                            </div>
		                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                          <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-6 text-right">则本周期的d+1结算手续费折扣率为<font color="red">*</font>:</label>
		                                             <div class="col-md-3 paddingnone">
		                                                <input name="manZeng_AddForm_discountRat" id="manZeng_AddForm_discountRat" type="number" class="form-control onlyNum" >
		                                            </div>
		                                            <label class="control-label col-md-1 text-right">%</label>
		                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display:none">
                                          <div class="form-group">
		                                             <div class="col-md-3 paddingnone">
		                                                <input name="manZeng_AddForm_promotNo" id="manZeng_AddForm_promotNo" class="form-control" >
		                                            </div>
		                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12" style="text-align:center;">
                                                <button type="button" id="manzengform_save_btn" class="btn btn-success"><i class="fa fa-save"></i>保存 </button>
                                                <button type="button" id="manzengform_commit_btn" class="btn btn-success"><i class="fa fa-save"></i>提交</button>
                                                <button type="button" id="" onclick="javascript:$('#manzengWin').modal('hide')" class="btn red"> <i class="fa fa-share"></i> 取消</button>
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
    	
    	
    	
    	
    	
   <!-- 添加/修改jieTiZheKouWin数据的模态框（Modal） -->
		<div class="modal fade" id="jieTiZheKouWin" tabindex="-1" data-backdrop="static" data-width="660px">
		         <div class="modal-header">
		            <button type="button" class="close" 
		               data-dismiss="modal" aria-hidden="true">
		                  &times;
		            </button>
		            <h4 class="modal-title" id="">阶梯折扣</h4>
		         </div>
		         <div class="modal-body">
		            <div class="portlet-body form">
                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="jieTiZheKouform">
                            <div class="form-body">
                                <div class="row norow">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                          <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-6 text-center">&nbsp;&nbsp;&nbsp;</label>
		                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center">
                                          <div class="form-group">
		                                            <label class="control-label col-md-12 text-center">即日付周期累计结算金额</label>
		                                        </div>
                                    </div>
                                     <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 text-center">
                                          <div class="form-group">
		                                             <label for="span-medium-2" class="control-label col-md-12 text-center">折扣比例</label>
		                                        </div>
                                    </div>
                                </div>
                                <br />
                                <!-- 折扣1 -->
                                 <div class="row norow">
                                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                          <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-6 text-right">阶梯1: </label>
		                                        </div>
                                    </div>
                                   <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 text-center">
                                          <div class="form-group">
		                                            <label id="jieTiZheKou_AddForm_ladderBeginAmtL1" class="control-label col-md-6 text-center">0-------</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <input name="jieTiZheKou_AddForm_ladderEndAmtL1" id="jieTiZheKou_AddForm_ladderEndAmtL1" type="number" class="form-control onlyNum" >
		                                            </div>
		                                        </div>
                                    </div>
                                     <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                          <div class="form-group">
                                          			<div class="col-md-6 paddingnone">
		                                                <input name="ladderL1" id="ladderL1" type="number" class="form-control onlyNum" >
		                                            </div>
		                                            <label class="control-label col-md-3 text-right">%</label>
		                                        </div>
                                    </div>
                                </div>
                                <!-- 折扣2 -->
                                <div class="row norow">
                                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                          <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-6 text-right">阶梯2: </label>
		                                        </div>
                                    </div>
                                      <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 text-center">
                                          <div class="form-group">
		                                            <label id="jieTiZheKou_AddForm_ladderBeginAmtL2" class="control-label col-md-6 text-center">-------</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <input name="jieTiZheKou_AddForm_ladderEndAmtL2" id="jieTiZheKou_AddForm_ladderEndAmtL2" type="number" class="form-control onlyNum" >
		                                            </div>
		                                        </div>
                                    </div>
                                     <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                          <div class="form-group">
                                          			<div class="col-md-6 paddingnone">
		                                                <input name="ladderL2" id="ladderL2" type="number" class="form-control onlyNum" >
		                                            </div>
		                                             <label class="control-label col-md-3 text-right">%</label>
		                                        </div>
                                    </div>
                                </div>
                                <!-- 折扣3 -->
                                <div class="row norow">
                                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                          <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-6 text-right">阶梯3: </label>
		                                        </div>
                                    </div>
                                     <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 text-center">
                                          <div class="form-group">
		                                            <label id="jieTiZheKou_AddForm_ladderBeginAmtL3" class="control-label col-md-6 text-center">-------</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <input name="jieTiZheKou_AddForm_ladderEndAmtL3" id="jieTiZheKou_AddForm_ladderEndAmtL3" type="number" class="form-control onlyNum" >
		                                            </div>
		                                        </div>
                                    </div>
                                     <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                          <div class="form-group">
                                          			<div class="col-md-6 paddingnone">
		                                                <input name="ladderL3" id="ladderL3" type="number" class="form-control onlyNum" >
		                                            </div>
		                                             <label class="control-label col-md-3 text-right">%</label>
		                                        </div>
                                    </div>
                                </div>
                                <!-- 折扣4 -->
                                <div class="row norow">
                                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                          <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-6 text-right">阶梯4: </label>
		                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 text-center">
                                          <div class="form-group">
		                                            <label id="jieTiZheKou_AddForm_ladderBeginAmtL4" class="control-label col-md-6 text-center">-------</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <input name="jieTiZheKou_AddForm_ladderEndAmtL4" id="jieTiZheKou_AddForm_ladderEndAmtL4" value="999999999999" disabled="disabled" class="form-control  onlyNum" >
		                                            </div>
		                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                          <div class="form-group">
                                          			<div class="col-md-6 paddingnone">
		                                                <input name="ladderL4" id="ladderL4" type="number"  class="form-control onlyNum" >
		                                            </div>
		                                            <label class="control-label col-md-3 text-right">%</label>
		                                        </div>
                                    </div>
                                </div>
                                         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display:none">
                                          <div class="form-group">
		                                             <div class="col-md-3 paddingnone">
		                                                <input name="jieTiZheKou_AddForm_promotNo" id="jieTiZheKou_AddForm_promotNo" class="form-control" >
		                                            </div>
		                                        </div>
                                    </div>
                            </div>
                            <br />
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12" style="text-align:center;">
                                                <button type="button" id="jieTiZheKouform_save_btn" class="btn btn-success"><i class="fa fa-save"></i>保存 </button>
                                                <button type="button" id="jieTiZheKouform_commit_btn" class="btn btn-success"><i class="fa fa-save"></i>提交</button>
                                                <button type="button" id="" onclick="javascript:$('#jieTiZheKouWin').modal('hide')" class="btn red"> <i class="fa fa-share"></i> 取消</button>
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
   
   
   
      <!-- 添加/修改数据的模态框（Modal） -->
		<div class="modal fade" id="newMecWin" tabindex="-1" data-backdrop="static" data-width="600px">
		         <div class="modal-header">
		            <button type="button" class="close" 
		               data-dismiss="modal" aria-hidden="true">
		                  &times;
		            </button>
		            <h4 class="modal-title" id="">新商户优惠</h4>
		         </div>
		         <div class="modal-body">
		            <div class="portlet-body form">
                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="newMecform">
                            <div class="form-body">
                                <div class="row norow">

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                          <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-8 text-right">非T0列表商户，微信首次自主开通即日付，手续费折扣:</label>
		                                           <div class="col-md-3 paddingnone">
		                                                <input name="newMec_AddForm_discountDay" id="newMec_AddForm_discountDay" type="number" class="form-control onlyNum" >
		                                            </div>
		                                            <label class="control-label col-md-1 text-right">天</label>
		                                        </div>
                                    </div>
<!--                                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> -->
<!--                                           <div class="form-group"> -->
<!-- 		                                            <label for="span-medium-2" class="control-label col-md-8 text-right">折扣率:</label> -->
<!-- 		                                             <div class="col-md-3 paddingnone"> -->
<!-- 		                                                <input name="newMec_AddForm_discountRat" id="newMec_AddForm_discountRat" type="number" class="form-control onlyNum" > -->
<!-- 		                                            </div> -->
<!-- 		                                            <label class="control-label col-md-1 text-right">%</label> -->
<!-- 		                                        </div> -->
<!--                                     </div> -->
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display:none">
                                          <div class="form-group">
		                                             <div class="col-md-3 paddingnone">
		                                                <input name="newMec_AddForm_promotNo" id="newMec_AddForm_promotNo" class="form-control" >
		                                            </div>
		                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12" style="text-align:center;">
                                                <button type="button" id="newMecform_save_btn" class="btn btn-success"><i class="fa fa-save"></i>保存 </button>
                                                <button type="button" id="newMecform_commit_btn" class="btn btn-success"><i class="fa fa-save"></i>提交</button>
                                                <button type="button" id="" onclick="javascript:$('#newMecWin').modal('hide')" class="btn red"> <i class="fa fa-share"></i> 取消</button>
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
    	
    	
    	
    	  <!-- 添加/修改数据的模态框（Modal） -->
		<div class="modal fade" id="newMecDetailWin" tabindex="-1" data-backdrop="static" data-width="600px">
		         <div class="modal-header">
		            <button type="button" class="close" 
		               data-dismiss="modal" aria-hidden="true">
		                  &times;
		            </button>
		            <h4 class="modal-title" id="">新商户优惠</h4>
		         </div>
		         <div class="modal-body">
		            <div class="portlet-body form">
                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="">
                            <div class="form-body">
                                <div class="row norow">

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                          <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-8 text-right">非T0列表商户，微信首次自主开通即日付，手续费折扣:</label>
		                                           <div class="col-md-3 paddingnone">
		                                                <input name="newMec_Detail_discountDay" id="newMec_Detail_discountDay" type="number" class="form-control onlyNum" >
		                                            </div>
		                                             <label class="control-label col-md-1 text-right">天</label>
		                                        </div>
                                    </div>
<!--                                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> -->
<!--                                           <div class="form-group"> -->
<!-- 		                                            <label for="span-medium-2" class="control-label col-md-8 text-right">折扣率:</label> -->
<!-- 		                                             <div class="col-md-3 paddingnone"> -->
<!-- 		                                                <input name="newMec_Detail_discountRat" id="newMec_Detail_discountRat" type="number" class="form-control onlyNum" > -->
<!-- 		                                            </div> -->
<!-- 		                                            <label class="control-label col-md-1 text-right">%</label> -->
<!-- 		                                        </div> -->
<!--                                     </div> -->
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12" style="text-align:center;">
                                                <button type="button" onclick="javascript:$('#newMecDetailWin').modal('hide')" class="btn btn-success"><i class="fa fa-save"></i>确定 </button>
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
   
   
       
     <div class="modal fade" id="importExcelWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">文件导入</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" enctype="multipart/form-data" class="form-horizontal" id="exportform">
                           <div class="form-body">
                                   <div class="clearfix"></div>
                                   <div class="row norow">
                                   <div class="col-lg-12 col-md-12 col-sm-8 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">选择文件:</label>
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
                                           <div class="col-md-offset-4 col-md-8">
                                               <button type="button" id="importform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 确认</button>
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

    
    
  
    
    function sddzNoticeUpdateView(uuid, type){
    	if(type == '02'){
    		bootbox.confirm("是否发布此公告?", function(confirmFlg){
    			if(confirmFlg){
        			$.ajax({
        	            type: "POST",
        	            url: baseURL + "/notice/deployAment",
        	            data : {
        	            	uuid : uuid,
        				},
        	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
        	            dataType: "json",
        	            success: function(json) {
        	            	if(json.timeout){
        	            		ajaxTimeout();
        	                }
        	            	if (json && json.msgCd=="SXF00000") {//执行成功
    							reloadGrid();
    						}else{
    							return;
    						}
        	            	
        	            },
        	            error: function(error) {
        	            }
        	        });
        		}
    		});
    	
    		
    		
    	}else if(type == '03'){
    		
    		bootbox.confirm("是否撤销此公告?", function(confirmFlg){
    			if(confirmFlg){
        			$.ajax({
        	            type: "POST",
        	            url: baseURL + "/notice/revokeAment",
        	            data : {
        	            	uuid : uuid,
        				},
        	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
        	            dataType: "json",
        	            success: function(json) {
        	            	if(json.timeout){
        	            		ajaxTimeout();
        	                }
        	            	if (json && json.msgCd=="SXF00000") {//执行成功
    							reloadGrid();
    						}else{
    							return;
    						}
        	            	
        	            },
        	            error: function(error) {
        	            }
        	        });
        		}
    		});
    	
    	}
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
       	
       
		param.promotNo = $('#NoticeManageQueryPanel_promotNo').val(),
		param.promotType = $('#NoticeManageQueryPanel_promotType').val(),
		param.status = $('#NoticeManageQueryPanel_status').val(),
 		param.ctDtEd = $('#NoticeManageQueryPanel_ctDtEd').val().replace('/', '').replace('/', ''),
		param.ctDtBg = $('#NoticeManageQueryPanel_ctDtBg').val().replace('/', '').replace('/', ''), 
		
 		param.opDtBg = $('#NoticeManageQueryPanel_opDtBg').val().replace('/', '').replace('/', ''),
		param.opDtEd = $('#NoticeManageQueryPanel_opDtEd').val().replace('/', '').replace('/', '');
		
    	var	url = baseURL + "/stmPromotional/queryList";
    	App.blockUI({target:"body",boxed:!0,message:"读取中",zIndex:20000});
		$.ajax({
            type: "POST",
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
                    //	tr.append($("<td><INPUT type='button' value='详情' onclick = sddzQueryDetailView('"+obj.uuid+"','"+obj.inMno+"')></td>"));
                    //data = Object {items: Array[20], totalCount: 269}
                    $.each(data.items, function(index, obj) {
                    	var trData = [];
                    	trData.push(start + index + 1);
                    	
                    	trData.push(obj.promotNo);
                    		  var tempType = ''
                    		  if ('1' == obj.promotType)
                    			  tempType = '满赠';
                    		  else if ('2' == obj.promotType)
                    			  tempType = '阶梯折扣';
                    		  else if ('3' == obj.promotType)
                    			  tempType = '新商户优惠';
                    		  else
                    			  tempType = obj.promotType;
                    	
                    	trData.push(tempType);
                    	var tempStatus = '';
              		  if ('1' == obj.status)
              			tempStatus = '促销中';
            		  else if ('2' == obj.status)
            			  tempStatus = '编辑中';
            		  else if ('3' == obj.status)
            			  tempStatus = '已关闭';
            		  else
            			  tempStatus = obj.status;
                    	
                    	trData.push(tempStatus);
                    	
                    	var date = obj.createDate.substring(0, 4) + "-" + obj.createDate.substring(4, 6) + "-" + obj.createDate.substring(6, 8) + " " +obj.createDate.substring(8, 10) + ":" + obj.createDate.substring(10, 12) + ":" +obj.createDate.substring(12, 14);
                    	
                    	trData.push(date);
                    	trData.push(obj.closeId);
                    	
                    	
                    	
                    	var status = obj.status;
                    	
                    	if(status == '3'){
                    	trData.push(obj.closeDate.substring(0, 4) + "-" + obj.closeDate.substring(4, 6) + "-" + obj.closeDate.substring(6, 8) + " " +obj.closeDate.substring(8, 10) + ":" + obj.closeDate.substring(10, 12) + ":" +obj.closeDate.substring(12, 14));
                    	trData.push(obj.closeId);
                    		
                    	}else{
                    		
                    	trData.push("");
                    	trData.push("");
                    	}
                    	
                    	var promotType = obj.promotType;
            			var promotNo = obj.promotNo;
            			
            			var res = '';
            			 if ('1' == status && ('1'== promotType || '2' ==promotType  )){//促销中
            				 res = "<a href='#'  onClick='showDetail(\""+promotNo+"\",\""+promotType+"\");'>查看</a>&nbsp;&nbsp;&nbsp;"+
            				        "<a href='#'  onClick='cloOrOpePro(\""+promotNo+"\",\""+promotType+"\",\""+'00'+"\");'>关闭</a>&nbsp;&nbsp;&nbsp;"+
            				        "<a href='#'  onClick='updatePromRange(\""+promotNo+"\",\""+promotType+"\");'>更新促销范围</a>&nbsp;&nbsp;&nbsp;";
            			 }else if('1' == status && '3'== promotType ){
            				 res = "<a href='#'  onClick='showDetail(\""+promotNo+"\",\""+promotType+"\");'>查看</a>&nbsp;&nbsp;&nbsp;"+
            			        "<a href='#'  onClick='cloOrOpePro(\""+promotNo+"\",\""+promotType+"\",\""+'00'+"\");'>关闭</a>&nbsp;&nbsp;&nbsp;";
            			 }else if('2' == status ){//编辑中
            				 res = "<a href='#'  onClick='modifyProm(\""+promotNo+"\",\""+promotType+"\");'>修改</a>&nbsp;&nbsp;&nbsp;"+
            			        "<a href='#'  onClick='cloOrOpePro(\""+promotNo+"\",\""+promotType+"\",\""+'01'+"\");'>启用</a>&nbsp;&nbsp;&nbsp;";
            			 }else if('3' == status){//已关闭
            				 res = "<a href='#'  onClick='showDetail(\""+promotNo+"\",\""+promotType+"\");'>查看</a>&nbsp;&nbsp;&nbsp;";
            			 }

                    	trData.push(res);
                    	
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
    

    
  	
  	function ontranCrdNoChange(obj) {
  		var text = obj.value;
		var reg = /^[0-9]*$/;
		if (text != null && text != '') {
			if (!reg.test(text)) {
				return "银行卡号只能是不大于20位数字";
			}
			if (text.length > 20) {
				return "银行卡号只能是不大于20位数字";
			}
			return true;
		}
		return true;
	}
  	
  	function onretReNoChange(obj){
  		var text = obj.value;
  		var reg = /^[0-9]*$/;
		if (text != null && text != '') {
			if (!reg.test(text)) {
				return "检索参考号只能是12位数字";
			}
			if (text.length != 12) {
				return "检索参考号只能是12位数字";
			}
			return true;
		}
		return true;

  	}
    
 
    $(function(){
    	
    	/*初始化页面按钮权限*/
/*     	if (!hasPermission(PERMISSSIONCONST.TZERO501)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO501)) {$("#exportexcel_btn").hide();} */

        $("#NoticeManageQueryPanel_status").selectpicker('val', '1');
        
        reloadGrid();
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
        $("#add_btn").on('click', function(){
        	openChose();
        });
        
		

	//文本框修改事件
	$("#jieTiZheKou_AddForm_ladderEndAmtL1").on('blur', function(){
		 var s_ladderEndAmtL1 =  $('#jieTiZheKou_AddForm_ladderEndAmtL1').val()
			if(null == s_ladderEndAmtL1 || ""==s_ladderEndAmtL1){
				$('#jieTiZheKou_AddForm_ladderBeginAmtL2').text('-------');
			}else{
				$('#jieTiZheKou_AddForm_ladderBeginAmtL2').text(s_ladderEndAmtL1+"-------");
			}
	});
	
	$("#jieTiZheKou_AddForm_ladderEndAmtL2").on('blur', function(){
		 var s_ladderEndAmtL2 =  $('#jieTiZheKou_AddForm_ladderEndAmtL2').val()
			if(null == s_ladderEndAmtL2 || ""==s_ladderEndAmtL2){
				$('#jieTiZheKou_AddForm_ladderBeginAmtL3').text('-------');
			}else{
				$('#jieTiZheKou_AddForm_ladderBeginAmtL3').text(s_ladderEndAmtL2+"-------");
			}
	});
	
	$("#jieTiZheKou_AddForm_ladderEndAmtL3").on('blur', function(){
		 var s_ladderEndAmtL3 =  $('#jieTiZheKou_AddForm_ladderEndAmtL3').val()
			if(null == s_ladderEndAmtL3 || ""==s_ladderEndAmtL3){
				$('#jieTiZheKou_AddForm_ladderBeginAmtL4').text('-------');
			}else{
				$('#jieTiZheKou_AddForm_ladderBeginAmtL4').text(s_ladderEndAmtL3+"-------");
			}
	});
        
        
	

		//重置按钮
		$("#reset_btn").on('click', function() {
			$("#queryMecPanel_Form")[0].reset();
			$("#queryMecPanel_Form .bs-select").selectpicker('val','');//重置select元素
			$("#NoticeManageQueryPanel_status").selectpicker('val', '1');

		});

		
		//初始化模板下载按钮
		$("#importPanel_download_btn").on('click', function(){
			window.location.href = baseURL + "/stmPromotional/downloadExcelForProm";
			
		});
		
    });
    
    
    

  
//跳转到查看日志页面
  function sddzQueryDetailView(uuid,inMno){
  	 $.fancybox({afterLoad:fancyboxCenterOnViewport,
   		href:'TradingRecordQueruPanel_detail.jsp?uuid='+uuid+"&inMno=" + inMno,    
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
  
  
  
  
   /** 添加或者修改 **/
    function showAddOrUpdate(type, uuid) {
    	 $("#addform").resetForm();
    	 $('#issContent').val('');
    	var title = '', iconCls = '', btnText = '', url = '', record = null;
    	if (type == 'add') {
    		title = '添加公告', iconCls = 'add', btnText = '保存', url = baseURL + '/notice/addAment';
    	}else if (type == 'update'){
    		title = '修改公告', iconCls = 'update', btnText = '修改', url = baseURL + '/notice/updateAment';
    	}

    	/*初始化添加修改弹出窗口*/
    	$("#addOrUpdateWin_title").text(title);
 
    	//弹出窗口保存按钮
    	$("#addform_save_btn").off('click').on('click', function() {
			var uuid = $('#uuid').val();
			var annTitle = $('#annTitle').val();
			var issContent = $('#issContent').val();
			
			if(issContent==""||issContent==null){
				bootbox.alert("内容不能为空!");
				return "内容不能为空!";
			}
			if (issContent.trim().length > 1000){
				return "内容不能大于1000个中文";
			}
			if(annTitle==""||annTitle==null){
				bootbox.alert("标题不能为空!");
				return "标题不能为空!";
			}
			
			if(annTitle.length>30){
				return "标题不能大于30个字!";
			}
			
			$.ajax({
	            type: "POST",
	            url: url,
	            data : {
					annTitle : annTitle,
					issContent : issContent,
					uuid  : uuid ==null ? "":uuid 
				},
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            dataType: "json",
	            success: function(json) {
	            	if(json.timeout){
	            		ajaxTimeout();
	                }
	            	$("#addOrUpdateWin").modal('hide');
	            	if (json && json.msgCd == "SXF00000") {//操作成功
						
						bootbox.alert('操作成功！');
						reloadGrid();
					}else{
						bootbox.alert(json.msgInf); 
					}
	            	
	            },
	            error: function(error) {
	            	$("#addOrUpdateWin").modal('hide');
	            }
	        });
    	});
    	//弹出窗口取消按钮
		$("#addform_cancel_btn").off('click').on('click', function() {
			$("#addOrUpdateWin").modal('hide');
    	});
		if (type == 'update') {
			
			var ajaxUrl = baseURL + "/notice/getOneAment";
			$.ajax({
	            type: "POST",
	            url: ajaxUrl,
	            data : {
	            	uuid:uuid
				},
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            async:false,
	            dataType: "json",
	            success: function(json) {
	            	if(json.timeout){
	            		ajaxTimeout();
	                }
	            	if (json && json.msgCd == CONST.TIP007) {//操作成功
						var uuid = json.uuid;//获取参数对象
						var annTitle  = json.annTitle;
						var issContent = json.issContent;
						$('#uuid').val(uuid);
						$('#annTitle').val(annTitle);
						$('#issContent').html(issContent);
					}else{
						bootbox.alert(json.msgInf); 
						return;
					}
	            	
	            },
	            error: function(json) {
	            	if(json){
	            		bootbox.alert(json.msgInf);	
	            	}
	            }
	        });
		}
    	$("#addOrUpdateWin").modal('show');
    }
  
  //查看详细内容的按钮
  function showNoticeAmentInfo(uuid){
	  
	 var title = '公告详情';
	 $("#addOrUpdateWin_title").text(title);
	 $("#addform_cancel_btn").css('display', 'none');
	 $("#addform_save_btn").css('display', 'none');
	 $("#addform").resetForm();
	var url = baseURL + '/notice/getOneAment';
	  $.ajax({
          type: "POST",
          url: url,
          data : {
        	  uuid:uuid
			},
          contentType: "application/x-www-form-urlencoded;charset=utf-8",
          dataType: "json",
          success: function(json) {
          	if(json.timeout){
        		ajaxTimeout();
            }
        	  if (json && json.msgCd == CONST.TIP007) {//
        	    var uuid = json.uuid;//获取参数对象
				var annTitle  = json.annTitle;
				var issContent = json.issContent;
				$('#uuid').val(uuid);
				$('#annTitle').val(annTitle);
				$('#issContent').html(issContent);
				$('#uuid').attr('readonly', true);
				$('#annTitle').attr('readonly', true);
				$('#issContent').attr('readonly', true);
        	   $("#addOrUpdateWin").modal('show');
        	  }else{
        		  bootbox.alert(json.msgInf);
        		  return;
        	  }
          },
          error: function(json) {
        	  if(json){
        		  bootbox.alert(json.msgInf);
        	  }else{
        		  bootbox.alert("加载失败!");
        	  }
          }
	  });
  }
  
  //添加新建按钮响应事件
  function openChose(){
	  $("#addform_promotType").selectpicker('val', '');
	 	$("#addWin").modal('show'); 
		$("#addform_save_btn").off('click').on('click', function() {
			var promotType = $("#addform_promotType").val();
			
			if(promotType == null || promotType == ""){
				bootbox.alert("请选择促销类型!");
				return;
			}else {
				
				//当选择的促销类型为满赠
				if(promotType == '1'){
					$("#addWin").modal('hide'); 
					manZengAddShow('add', '');
					
					
				}
				else if(promotType == '2'){
					$("#addWin").modal('hide'); 
					jieTiZheKouAddShow('add', '');
				}
				else if(promotType == '3'){
					$("#addWin").modal('hide'); 
					newMecAddShow('add', '');
				}
			}
    	}); 
	 
	 
	  
  }//end fun
  
  /* 开始满赠窗口的实现 */
	function manZengAddShow(type, promotNo){
	  
	  //jquery validator验证表单信息
	  $('#manzengform').validate({
	        rules: {
	        	manZeng_AddForm_discountRat: {
                    number: true,
                    min: 0,
                    max: 100
	        	}
	        },
	        messages: {
	        	manZeng_AddForm_discountRat: {
	        		number: '只能为数字',
	        		min: '折扣率最小值为0',
	        		max: '折扣率最大值为100'
	        	}
	        }
	    });
	  
	  
	  
		$("#manzengform")[0].reset();
		$("#manzengWin").modal('show');
		
		var url = '';
		if(type == 'add'){
			url = baseURL + '/stmPromotional/saveManZeng';
			
		}else if(type == 'update'){
			
			url = baseURL + '/stmPromotional/modifyManZeng';

	   		
		     $.ajax({
	   	          type: "GET",
	   	          url: baseURL+"/stmPromotional/manZengDetail/" + promotNo,
	   	          data:{
	   	        	start:0,
	   	        	page:1,
	   	        	limit:25
	   	          },
	   	          contentType: "application/x-www-form-urlencoded;charset=utf-8",
	   	          dataType: "json",
	   	          success: function(json) {
		            	if(json.timeout){
		            		ajaxTimeout();
		                }
	   	        	  if(json){
	   				 $('#manZeng_AddForm_enoughAmt').val(json.enoughAmt);
	   		   		 $('#manZeng_AddForm_discountRat').val(json.enoughAmt);
	   		   		 $('#manZeng_AddForm_promotNo').val(json.promotNo);
	   	        	  }  
	   	          },
	   	          error: function(json) {
	   	          }
	   		  });
			
			
		}
		
		
		
		$("#manzengform_save_btn").off('click').on('click', function() {

			if(!$('#manzengform').valid()){
				return;
			}
			
		 var enoughAmt =  $('#manZeng_AddForm_enoughAmt').val();
   		 var discountRat =  $('#manZeng_AddForm_discountRat').val();
		var param = {enoughAmt:enoughAmt,discountRat:discountRat};
		 
		 if(type == 'update'){
			 param.promotNo =  $('#manZeng_AddForm_promotNo').val();
		 }
			 param.status = 2;
	  
   		 if(enoughAmt == null || enoughAmt == ""){
   			 bootbox.alert("输入项数据不正确，验证未通过！");
   			 return;
   		 }
   		 if(discountRat == null || discountRat == ""){
   			 bootbox.alert("输入项数据不正确，验证未通过！");
   			 return;
   		 }
   		
   		 bootbox.confirm("确认保存满赠信息?", function(confirmFlg){
   			 if(confirmFlg){
   	   			
   	   			
   	   		    App.blockUI({target:"body",boxed:!0,message:"数据正在处理中，请稍后...",zIndex:20000});
   	   		     $.ajax({
   	   	          type: "POST",
   	   	          url: url,
   	   	          data : param,
   	   	          contentType: "application/x-www-form-urlencoded;charset=utf-8",
   	   	          dataType: "json",
   	   	          success: function(json) {
  	            	if(json.timeout){
	            		ajaxTimeout();
	                }
   	   	        	  if (json.resultflag == 'yes') {//
   	   	        	  	 $("#manzengWin").modal('hide');
   	   	        		bootbox.alert('保存满增信息成功');
   	   	        	  	 reloadGrid();
   	   	        	  }else{
   	   	        	  	 $("#manzengWin").modal('hide');
   	   	        		bootbox.alert('保存满增信息失败'+json.msg);
   	   	        	  } 
   	   	          },
   	   	          error: function(json) {
   	   	        	  if(json){
   	   	        		  bootbox.alert(json.msgInf);
   	   	        	  }else{
   	   	        		  bootbox.alert("保存失败，请刷新重试！");
   	   	        	  }
   	   	          }
   	   		  });
   	   		 }
   		 });
   		
		});
   		
		
		$("#manzengform_commit_btn").off('click').on('click', function() {
			
			if(!$('#manzengform').valid()){
				return;
			}
			
			var enoughAmt =  $('#manZeng_AddForm_enoughAmt').val();
	   		var discountRat =  $('#manZeng_AddForm_discountRat').val();
			var param = {enoughAmt:enoughAmt,discountRat:discountRat};
			 
			 if(type == 'update'){
				 param.promotNo =  $('#manZeng_AddForm_promotNo').val();
			 }
			param.status = 1;
		  
	   		 if(enoughAmt == null || enoughAmt == ""){
	   			 bootbox.alert("输入项数据不正确，验证未通过！");
	   			 return;
	   		 }
	   		 if(discountRat == null || discountRat == ""){
	   			 bootbox.alert("输入项数据不正确，验证未通过！");
	   			 return;
	   		 }
	   		
	   		 bootbox.confirm("确认提交满赠信息?", function(confirmFlg){
	   			 if(confirmFlg){
	 	   			
	 	   			
	 	   		    App.blockUI({target:"body",boxed:!0,message:"数据正在处理中，请稍后...",zIndex:20000});
	 	   		     $.ajax({
	 	   	          type: "POST",
	 	   	          url: url,
	 	   	          data :param,
	 	   	          contentType: "application/x-www-form-urlencoded;charset=utf-8",
	 	   	          dataType: "json",
	 	   	          success: function(json) {
	 		            	if(json.timeout){
	 		            		ajaxTimeout();
	 		                }
	 	   	        	  if (json.resultflag == 'yes') {//
	 	   	        		bootbox.alert('提交满增信息成功');
	 	   	        	  	 $("#manzengWin").modal('hide');
	 	   	        	    reloadGrid();
	 	   	        	  }else{
	 	   	        		bootbox.alert('提交满增信息失败'+json.msg);
	 	   	        	  	 $("#manzengWin").modal('hide');
	 	   	        	  } 
	 	   	          },
	 	   	          error: function(json) {
	 	   	        	  if(json){
	 	   	        		 
	 	   	        	  }else{
	 	   	        		  bootbox.alert("提交失败，请刷新重试！");
	 	   	        	  }
	 	   	          }
	 	   		  });
	 	   			 
	 	   			 
	 	   		 }
	   		 })
	   		
    	}); 
		
	  
  	}
  /* 结束窗口 */

  /* 开始阶梯折扣窗口的实现 */
  	function jieTiZheKouAddShow(type, promotNo){

		 $("#jieTiZheKouform")[0].reset();
		 var url = '';
		 if(type == 'add'){
	 			url = baseURL + '/stmPromotional/saveJieTiZheKou';
	 	  		$('#jieTiZheKou_AddForm_ladderBeginAmtL1').text('0-------');
	 	  		$('#jieTiZheKou_AddForm_ladderBeginAmtL2').text('-------');
	 	  		$('#jieTiZheKou_AddForm_ladderBeginAmtL3').text('-------');
	 	  		$('#jieTiZheKou_AddForm_ladderBeginAmtL4').text('-------');
			 
		 }else if(type == 'update'){
	 			url = baseURL + '/stmPromotional/modifyJieTiZheKou';
		   		   		 $('#jieTiZheKou_AddForm_promotNo').val(promotNo);

			     $.ajax({
		   	          type: "GET",
		   	          url: baseURL+"/stmPromotional/jieTiZheKouDetail/" + promotNo,
		   	          data:{
			   	        	start:0,
			   	        	page:1,
			   	        	limit:25
			   	          },
		   	          contentType: "application/x-www-form-urlencoded;charset=utf-8",
		   	          dataType: "json",
		   	          success: function(json) {
			            	if(json.timeout){
			            		ajaxTimeout();
			                }
		   	        	  if(json){
		   				 $('#jieTiZheKou_AddForm_ladderEndAmtL1').val(json.ladderEndAmtL1);
		   		   		 $('#jieTiZheKou_AddForm_ladderEndAmtL2').val(json.ladderEndAmtL2);
		   		   		 $('#jieTiZheKou_AddForm_ladderEndAmtL3').val(json.ladderEndAmtL3);
	
		   		   		 $('#ladderL1').val(json.ladderL1);
		   		   		 $('#ladderL2').val(json.ladderL2);
		   		   		 $('#ladderL3').val(json.ladderL3);
		   		   		 $('#ladderL4').val(json.ladderL4);
		   		   		 
		   		   		 
		 	 	  		$('#jieTiZheKou_AddForm_ladderBeginAmtL1').text('0-------');
			 	  		$('#jieTiZheKou_AddForm_ladderBeginAmtL2').text(json.ladderBeginAmtL2+'-------');
			 	  		$('#jieTiZheKou_AddForm_ladderBeginAmtL3').text(json.ladderBeginAmtL3+'-------');
			 	  		$('#jieTiZheKou_AddForm_ladderBeginAmtL4').text(json.ladderBeginAmtL4+'-------');
		   		   		 
		   		   		 
		   	        	  }  
		   	          },
		   	          error: function(json) {
		   	          }
		   		  });
			 
		 }

		$("#jieTiZheKouWin").modal('show');
		
		
		
		$("#jieTiZheKouform_save_btn").off('click').on('click', function() {
			  
			
	 		 var ladderEndAmtL1 =  $("#jieTiZheKou_AddForm_ladderEndAmtL1").val() ;
	  		
	 		 var param = {ladderEndAmtL1:ladderEndAmtL1};
	 		  var ladderBeginAmtL2 =  $("#jieTiZheKou_AddForm_ladderBeginAmtL2").text().split('-')[0];
	 		 var ladderEndAmtL2 =  $("#jieTiZheKou_AddForm_ladderEndAmtL2").val();
	 		var ladderBeginAmtL3 =  $("#jieTiZheKou_AddForm_ladderBeginAmtL3").text().split('-')[0];
	 		var ladderEndAmtL3 =  $("#jieTiZheKou_AddForm_ladderEndAmtL3").val();
	 		var ladderBeginAmtL4 =  $("#jieTiZheKou_AddForm_ladderBeginAmtL4").text().split('-')[0];
	  		 
	 		var  ladderL1 =  $("#ladderL1").val();
	 		var ladderL2 =  $("#ladderL2").val();
	 		var ladderL3 =  $("#ladderL3").val();
	 		var ladderL4 =  $("#ladderL4").val();
		  
	  		 
	  		param.ladderBeginAmtL2 = ladderBeginAmtL2;
	  		param.ladderEndAmtL2 = ladderEndAmtL2;
	  		param.ladderBeginAmtL3 = ladderBeginAmtL3;
	  		param.ladderEndAmtL3 = ladderEndAmtL3;
	  		param.ladderBeginAmtL4 = ladderBeginAmtL4;
	  		param.ladderL1 = ladderL1;
	  		param.ladderL2 = ladderL2;
	  		param.ladderL3 = ladderL3;
	  		param.ladderL4 = ladderL4;
	  		 
	  		 if(type == 'update'){
	  			 param.promotNo = $('#jieTiZheKou_AddForm_promotNo').val();
	  		 }
	  		 param.status = 2;
	  		 
	  		 
	  		
	  		
	  		if(null != ladderBeginAmtL2 && ""!= ladderBeginAmtL2 &&  null != ladderEndAmtL2 && ""!= ladderEndAmtL2 && ladderBeginAmtL2>ladderEndAmtL2){
	  			 bootbox.alert ("阶段2下线大于上限！");
				     return;
	  		}
	  		
	  		if(null != ladderBeginAmtL3 && ""!= ladderBeginAmtL3 &&  null != ladderEndAmtL3 && ""!= ladderEndAmtL3 &&  ladderBeginAmtL3>ladderEndAmtL3){
	 			 bootbox.alert ("阶段3下线大于上限！");
			     return;
	 		}
	  		
	  		
	  		if(null != ladderL1 && ""!= ladderL1 &&   null != ladderL2 && ""!= ladderL2 && ladderL2>ladderL1){
				 bootbox.alert ("阶段2的折扣比例大于阶段1的折扣比例!");
			     return;
			}
	  		
	  		if(null != ladderL3 && ""!= ladderL3 &&   null != ladderL2 && ""!= ladderL2 &&  ladderL3>ladderL2){
				 bootbox.alert ("阶段3的折扣比例大于阶段2的折扣比例!");
			     return;
			    }
	  		

	  		if(null != ladderL4 && ""!= ladderL4 &&   null != ladderL3 && ""!= ladderL3 &&  ladderL4>ladderL3){
				 bootbox.alert ("阶段4的折扣比例大于阶段3的折扣比例!");
			     return;
			   }
   		
	  		bootbox.confirm("确认保存阶梯折扣信息?", function(confirmFlg){
	  			if(confirmFlg){
	  	   			 
	  			  
	  	   			
	  	   		    App.blockUI({target:"body",boxed:!0,message:"数据正在处理中，请稍后...",zIndex:20000});
	  	   		     $.ajax({
	  	   	          type: "POST",
	  	   	          url: url,
	  	   	          data :param,
	  	   	          contentType: "application/x-www-form-urlencoded;charset=utf-8",
	  	   	          dataType: "json",
	  	   	          success: function(json) {
	  	            	if(json.timeout){
		            		ajaxTimeout();
		                }
	  	   	        	  if (json.resultflag == 'yes') {//
	  	   	        	  	 $("#jieTiZheKouWin").modal('hide');
	  	   	        	  bootbox.alert('保存阶梯折扣信息成功');
	  	   	        	reloadGrid();
	  	   	        	  }else{
	  	   	        	  	 $("#jieTiZheKouWin").modal('hide');
	  	   	        		bootbox.alert('保存阶梯折扣信息失败'+json.msg);
	  	   	        	  } 
	  	   	          },
	  	   	          error: function(json) {
	  	   	        	  if(json){
	  	   	        		  
	  	   	        	  }else{
	  	   	        		  bootbox.alert("保存失败，请刷新重试！");
	  	   	        	  }
	  	   	          }
	  	   		  });
	  	   		 }
	  		});
   		 
		});
   		
		
		$("#jieTiZheKouform_commit_btn").off('click').on('click', function() {
	 		 var ladderEndAmtL1 =  $("#jieTiZheKou_AddForm_ladderEndAmtL1").val() ;
		  		
	 		 var param = {ladderEndAmtL1:ladderEndAmtL1};
	 		  var ladderBeginAmtL2 =  $("#jieTiZheKou_AddForm_ladderBeginAmtL2").text().split('-')[0];
	 		 var ladderEndAmtL2 =  $("#jieTiZheKou_AddForm_ladderEndAmtL2").val();
	 		var ladderBeginAmtL3 =  $("#jieTiZheKou_AddForm_ladderBeginAmtL3").text().split('-')[0];
	 		var ladderEndAmtL3 =  $("#jieTiZheKou_AddForm_ladderEndAmtL3").val();
	 		var ladderBeginAmtL4 =  $("#jieTiZheKou_AddForm_ladderBeginAmtL4").text().split('-')[0];
	  		 
	 		var  ladderL1 =  $("#ladderL1").val();
	 		var ladderL2 =  $("#ladderL2").val();
	 		var ladderL3 =  $("#ladderL3").val();
	 		var ladderL4 =  $("#ladderL4").val();
		  
	  		 
	  		param.ladderBeginAmtL2 = ladderBeginAmtL2;
	  		param.ladderEndAmtL2 = ladderEndAmtL2;
	  		param.ladderBeginAmtL3 = ladderBeginAmtL3;
	  		param.ladderEndAmtL3 = ladderEndAmtL3;
	  		param.ladderBeginAmtL4 = ladderBeginAmtL4;
	  		param.ladderL1 = ladderL1;
	  		param.ladderL2 = ladderL2;
	  		param.ladderL3 = ladderL3;
	  		param.ladderL4 = ladderL4;
		  
	  		 
	  		 if(type == 'update'){
	  			 param.promotNo = $('#jieTiZheKou_AddForm_promotNo').val();
	  		 }
	  			 param.status = 1;
	  		 
	  		 
	  		
	  		
	  		if(null != ladderBeginAmtL2 && ""!= ladderBeginAmtL2 &&  null != ladderEndAmtL2 && ""!= ladderEndAmtL2 && ladderBeginAmtL2>ladderEndAmtL2){
	  			 bootbox.alert ("阶段2下线大于上限！");
				     return;
	  		}
	  		
	  		if(null != ladderBeginAmtL3 && ""!= ladderBeginAmtL3 &&  null != ladderEndAmtL3 && ""!= ladderEndAmtL3 &&  ladderBeginAmtL3>ladderEndAmtL3){
	 			 bootbox.alert ("阶段3下线大于上限！");
			     return;
	 		}
	  		
	  		
	  		if(null != ladderL1 && ""!= ladderL1 &&   null != ladderL2 && ""!= ladderL2 && ladderL2>ladderL1){
				 bootbox.alert ("阶段2的折扣比例大于阶段1的折扣比例!");
			     return;
			}
	  		
	  		if(null != ladderL3 && ""!= ladderL3 &&   null != ladderL2 && ""!= ladderL2 &&  ladderL3>ladderL2){
				 bootbox.alert ("阶段3的折扣比例大于阶段2的折扣比例!");
			     return;
			    }
	  		

	  		if(null != ladderL4 && ""!= ladderL4 &&   null != ladderL3 && ""!= ladderL3 &&  ladderL4>ladderL3){
				 bootbox.alert ("阶段4的折扣比例大于阶段3的折扣比例!");
			     return;
			   }
   		
	  		bootbox.confirm("确认提交阶梯折扣信息?", function(confirmFlg){
	  			 if(confirmFlg){
	  	   			
	  	   		    App.blockUI({target:"body",boxed:!0,message:"数据正在处理中，请稍后...",zIndex:20000});
	  	   		     $.ajax({
	  	   	          type: "POST",
	  	   	          url: url,
	  	   	          data :param,
	  	   	          contentType: "application/x-www-form-urlencoded;charset=utf-8",
	  	   	          dataType: "json",
	  	   	          success: function(json) {
	  	            	if(json.timeout){
		            		ajaxTimeout();
		                }
	  	   	        	  if (json.resultflag == 'yes') {//
	  	   	        	  	 $("#jieTiZheKouWin").modal('hide');
	  	   	        	  bootbox.alert('提交阶梯折扣信息成功');
	  	   	        	reloadGrid();
	  	   	        	  }else{
	  	   	        	  	 $("#jieTiZheKouWin").modal('hide');
	  	   	        		bootbox.alert('提交阶梯折扣信息失败'+json.msg);
	  	   	        	  } 
	  	   	          },
	  	   	          error: function(json) {
	  	   	        	  if(json){
	  	   	        		  
	  	   	        	  }else{
	  	   	        		  bootbox.alert("提交失败，请刷新重试！");
	  	   	        	  }
	  	   	          }
	  	   		  });
	  	   		 }
	  		});
   	
    	}); 
		
	  
  	}
  /* 结束窗口 */
  
   /* 开始新商户优惠窗口的实现 */
    	function newMecAddShow(type, promotNo){

    	 $("#newMecform")[0].reset();
	  
    	 
    	 var url = '';
 		if(type == 'add'){
 			url = baseURL + '/stmPromotional/saveNewMac';
 			
 		}else if(type == 'update'){
 			
   			url = baseURL + '/stmPromotional/modifyNewMac';

 	   		
 		     $.ajax({
 	   	          type: "GET",
 	   	          url: baseURL+"/stmPromotional/newMacDetail/" + promotNo,
	   	          data:{
		   	        	start:0,
		   	        	page:1,
		   	        	limit:25
		   	          },
 	   	          contentType: "application/x-www-form-urlencoded;charset=utf-8",
 	   	          dataType: "json",
 	   	          success: function(json) {
 		            	if(json.timeout){
 		            		ajaxTimeout();
 		                }
 	   	        	  if(json){
//  	   				 $('#newMec_AddForm_discountRat').val(json.discountRat);
 	   		   		 $('#newMec_AddForm_discountDay').val(json.discountDay);
 	   		   		 $('#newMec_AddForm_promotNo').val(json.promotNo);
 	   	        	  }  
 	   	          },
 	   	          error: function(json) {
 	   	          }
 	   		  });
 			
 			
 		}
    	 
    	 
    	 
		$("#newMecWin").modal('show');
		
		
		
		$("#newMecform_save_btn").off('click').on('click', function() {
			  
      		 var discountDay =  $("#newMec_AddForm_discountDay").val();
//        		 var discountRat =  $("#newMec_AddForm_discountRat").val();
//        		 var param = {discountDay:discountDay,discountRat:discountRat,status:2};
//        		if(discountDay == null || discountDay == "" || discountRat == "" || discountRat == null){
//        			bootbox.alert("输入项数据不正确，验证未通过！");
//        			return;
//        		} 

       		var param = {discountDay:discountDay,status:2};
       		if(discountDay == null || discountDay == "" ){
       			bootbox.alert("输入项数据不正确，验证未通过！");
       			return;
       		} 
	  		 
	  		 
	  		if(type == 'update'){
	  			param.promotNo = $("#newMec_AddForm_promotNo").val();
	  		}
	  		
	  	
   		
	  	bootbox.confirm("确认保存新商户优惠信息?", function(confirmFlg){
	  		 if(confirmFlg){

	    			
	    		    App.blockUI({target:"body",boxed:!0,message:"数据正在处理中，请稍后...",zIndex:20000});
	    		     $.ajax({
	    	          type: "POST",
	    	          url: url,
	    	          data :param,
	    	          contentType: "application/x-www-form-urlencoded;charset=utf-8",
	    	          dataType: "json",
	    	          success: function(json) {
	  	            	if(json.timeout){
		            		ajaxTimeout();
		                }
	    	        	  if (json.resultflag == 'yes') {//
	    	        	  	 $("#newMecWin").modal('hide');
	    	        		bootbox.alert('保存新商户优惠信息成功');
	    	        		reloadGrid();
	    	        	  }else{
	    	        	  	 $("#newMecWin").modal('hide');
	    	        		bootbox.alert('保存新商户优惠信息失败'+json.msg);
	    	        	  } 
	    	          },
	    	          error: function(json) {
	    	        	  if(json){
	    	        		  
	    	        	  }else{
	    	        		  bootbox.alert("保存失败，请刷新重试！");
	    	        	  }
	    	          }
	    		  });
	    		 }
	  	});
   		
		});
   		
		
		$("#newMecform_commit_btn").off('click').on('click', function() {
			  
     		 var discountDay =  $("#newMec_AddForm_discountDay").val();
//        		 var discountRat =  $("#newMec_AddForm_discountRat").val();
//        		 var param = {discountDay:discountDay,discountRat:discountRat,status:1};
//        		if(discountDay == null || discountDay == "" || discountRat == "" || discountRat == null){
//        			bootbox.alert("输入项数据不正确，验证未通过！");
//        			return;
//        		} 
			var param = {discountDay:discountDay,status:1};
       		if(discountDay == null || discountDay == ""){
       			bootbox.alert("输入项数据不正确，验证未通过！");
       			return;
       		} 
	  		 
	  		 
	  		if(type == 'update'){
	  			param.promotNo = $("#newMec_AddForm_promotNo").val()
	  		}
	  		 
        		if( null == discountDay || discountDay.toString().length == 0 ){
       			 $("#newMec_AddForm.discountDay").val("");
      			     bootbox.alert("手续费折扣天数未填写！");
      			     return;
      		    }
          		
//           		if( null == discountRat || discountRat.toString().length == 0 ){
//        			 $("#newMec_AddForm.discountRat").val("");
//       			     bootbox.alert("折扣率未填写！");
//       			     return;
//       		    }
	  		
	  		
	  	
  		
          		bootbox.confirm("确认提交新商户优惠信息?", function(confirmFlg){
          			 if(confirmFlg){

          	  		    App.blockUI({target:"body",boxed:!0,message:"数据正在处理中，请稍后...",zIndex:20000});
          	  		     $.ajax({
          	  	          type: "POST",
          	  	          url: url,
          	  	          data :param,
          	  	          contentType: "application/x-www-form-urlencoded;charset=utf-8",
          	  	          dataType: "json",
          	  	          success: function(json) {
          	            	if(json.timeout){
        	            		ajaxTimeout();
        	                }
          	  	        	  if (json.resultflag == 'yes') {//
          	  	        	  	 $("#newMecWin").modal('hide');
          	  	        		bootbox.alert('提交新商户优惠信息成功');
          	  	        		reloadGrid();
          	  	        	  }else{
          	  	        	  	 $("#newMecWin").modal('hide');
          	  	        		bootbox.alert('提交新商户优惠信息失败'+json.msg);
          	  	        	  } 
          	  	          },
          	  	          error: function(json) {
          	  	        	  if(json){
          	  	        		  
          	  	        	  }else{
          	  	        		  bootbox.alert("提交失败，请刷新重试！");
          	  	        	  }
          	  	          }
          	  		  });
          	  		 }
          		});
  		
    	}); 
		
	  
  	}
  
  /* 结束实现 */
  
  /* 开始查看详情页面实现 */
  function modifyProm(promotNo, promotType){
	  if(promotType == '1'){
		  manZengAddShow('update', promotNo);
	  }//end if
// 	  if(promotType == '2'){
// 		  jieTiZheKouAddShow('update', promotNo);
// 	  }//end if
	  if(promotType == '3'){
		  newMecAddShow('update', promotNo);
	  }//end if

  }
  
  /* 结束查看详情页面实现 */
  function showDetail(promotNo, promotType){
	  if(promotType == '1'){
		  manZengDetail(promotNo);
	  }//end if
// 	  if(promotType == '2'){
// 		  jieTiZheKouDetail(promotNo);
// 	  }//end if
	  if(promotType == '3'){
		  newMecDetail(promotNo)
	  }//end if
	  
	  
  }//end show Detail
  
  
  /* 开始满赠窗口的实现 */
	function manZengDetail(promotNo){
	  
		  $.fancybox({afterLoad:fancyboxCenterOnViewport,
	            href:'StmPromotionalPanel_manZeng_detail.jsp?promotNo='+promotNo,
	            type: 'iframe',
	           /*  padding: 5,
	            margin:60,
	            scrolling: 'no',
	            fitToView: true,
	            width: 1000,
	            height: 800,
	            autoSize: false,
	            closeClick: false, */
	            width: 1000,
	       		onStart:function(){
	       			//reloadGrid();
	       			//$("#fancybox-overlay").css({"position":"fixed"});
	       			$("#fancybox-wrap").css({"position":"fixed"});
	       			$("#fancybox-wrap").css({"overflow":"scroll"});
	       		},
	            afterClose:function(){
	            	
	            }
	        });
	}
/* 结束窗口 */

/* 开始阶梯折扣窗口的实现 */
	function jieTiZheKouDetail(promotNo){
		  $.fancybox({afterLoad:fancyboxCenterOnViewport,
	            href:'StmPromotionalPanel_jieTiZheKou_detail.jsp?promotNo='+promotNo,
	            type: 'iframe',
	           /*  padding: 5,
	            margin:60,
	            scrolling: 'no',
	            fitToView: true,
	            width: 1000,
	            height: 800,
	            autoSize: false,
	            closeClick: false, */
	            width: 1000,
	       		onStart:function(){
	       			//reloadGrid();
	       			//$("#fancybox-overlay").css({"position":"fixed"});
	       			$("#fancybox-wrap").css({"position":"fixed"});
	       			$("#fancybox-wrap").css({"overflow":"scroll"});
	       		},
	            afterClose:function(){
	            	
	            }
	        });
	  
	}
/* 结束窗口 */

/* 开始新商户优惠窗口的实现 */
  	function newMecDetail(promotNo){

		     $.ajax({
	   	          type: "GET",
	   	          url: baseURL+"/stmPromotional/newMacDetail/" + promotNo,
	   	          data:{
		   	        	start:0,
		   	        	page:1,
		   	        	limit:25
		   	          },
	   	          contentType: "application/x-www-form-urlencoded;charset=utf-8",
	   	          dataType: "json",
	   	          success: function(json) {
		            	if(json.timeout){
		            		ajaxTimeout();
		                }
	   	        	  if(json){
// 	   				 $('#newMec_Detail_discountRat').val(json.discountRat);
	   		   		 $('#newMec_Detail_discountDay').val(json.discountDay);
// 	   				 $('#newMec_Detail_discountRat').attr('disabled', true);
	   		   		 $('#newMec_Detail_discountDay').attr('disabled', true);
	   	        	  }  
	   	          },
	   	          error: function(json) {
	   	          }
	   		  });
  	 
		$("#newMecDetailWin").modal('show');
	}
  
  
  function cloOrOpePro(promotNo,promotType,opOrCloFlg){
	  var ms = '';
	  if(opOrCloFlg == '01'){
		  ms = '开启';
	  }
	  if(opOrCloFlg == '00'){
		  ms = '关闭';
	  }
	  
	  
	  bootbox.confirm('确认'+ms+'商户促销信息', function(confirmFlg){
		  if(confirmFlg){
			  App.blockUI({target:"body",boxed:!0,message:"数据正在处理中，请稍后...",zIndex:20000});
			  $.ajax({
	   	          type: "POST",
	   	          url: baseURL+"/stmPromotional/openOrCloseProm",
	   	          data:{
						promotNo : promotNo,
						promotType : promotType,
						opOrCloFlg : opOrCloFlg
		   	          },
	   	          contentType: "application/x-www-form-urlencoded;charset=utf-8",
	   	          dataType: "json",
	   	          success: function(res) {
	   	        	if (res.resultflag == "yes") {  // 修改成功
						bootbox.alert(ms+'商户促销信息成功');
					} else {  
						bootbox.alert(ms+'商户促销信息失败'+res.msg);
					}
	   	        	reloadGrid();
	   	          },
	   	          error: function(json) {
	   	        	bootbox.alert('保存失败，请刷新重试！');
	   	          }
	   		  });
		  }
	  });
	  
	  
  }
  
  
  //批量导入功能开始
  function updatePromRange(promotNo,promotType){
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
	  			
	  			if(filetype!="xlsx"){ 
	  				//fileObject.focus(); 
	  				bootbox.alert("上传文件必须为07版Excel文件(后缀.xlsx)!");
	  				return;
	  		 	}
	  	   } 
	  		
	  		//bootbox.alert("hello");

	  		  var form = new FormData();
	  		  var fileObj = document.getElementById("file").files[0]; // 获取文件对象
	  		   // FormData 对象
	  		  form.append("file", fileObj); // 文件对象
	  		  form.append("promotNo", promotNo);
	  		  form.append("promotType", promotType);

	  		 App.blockUI({target:"body",boxed:!0,message:"文件导入中...",zIndex:20000});
	         $.ajax({
	             url:baseURL + "/stmPromotional/importPromoExcel",
	             type:"post",
	             data:form,
	             processData:false,
	             contentType:false,
	           	 dataType: "json",
	  	           success:function(result){
	  	        		   $("#importExcelWin").modal('hide');
	  	        	       if(result.hasErro){
	  	            		bootbox.alert(result.msg + ", 有部分数据导入失败,详情请见导出EXCEL");
	  	            		window.open(baseURL + "/stmPromotional/promotScopeExcelResultExport");
	  	            		
	  	            	}else{
	  	            		bootbox.alert("操作成功, " + result.msg);
	  	            		//将返回的数据绑定到列表中
	  	                    	reloadGrid();
	  	                       	   
	  	           
	  	            	}
	  	           },
	  	           error:function(e){
	  	               bootbox.alert("导入失败！！");
	  	           }
	         });        
	  		
	  	       
	  		
	  	});

		        
	  	//弹出窗口取消按钮
			$("#importform_cancel_btn").off('click').on('click', function() {
				$("#importExcelWin").modal('hide');
	  	});

	  	$("#importExcelWin").modal('show');
  }
  
    </script>
    
</body>

</html>
