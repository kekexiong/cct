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
	<input type="hidden" id="data">

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
								<form action="<%=request.getContextPath()%>/mec/queryData"
									class="form-horizontal" id="queryMecPanel_Form">
									<div class="form-body">


										<div class="row norow">
											<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-4 text-right">一代编号:</label>
													<div class="col-md-6 paddingnone">
														<input name="topAgentNo" id="topAgentNo"
															class="form-control" placeholder="请输入一代编号">
													</div>
												</div>
											</div>



											<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-4 text-right">一代名称:</label>
													<div class="col-md-6 paddingnone">
														<input name="topAgentNm" id="topAgentNm"
															class="form-control" placeholder="请输入一代名称">
													</div>
												</div>
											</div>


											<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
												<div class="form-group">
													<label for="span-medium-1"
														class="control-label col-md-4 text-right">分公司:</label>
													<div class="col-md-8 paddingnone">
														<select name="combo" id="combo" data-live-search="true"
															class="selectpicker bs-select form-control"
															data-show-subtext="true">
														</select>
														<!--  需要弹出窗口，进行选择-->
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
														<button type="button" id="query_btn"
															class="btn btn-success">
															<i class="fa fa-search"></i> 查询
														</button>
														<button type="button" id="edit_btn"
															class="btn tn btn btn-primary">
															<i class="fa fa-edit"></i>修改规模
														</button>
														<button type="button" id="down_btn"
															class="btn btn-success">
															<i class="fa fa-download"></i> 导出excel
														</button>
														<button type="button" id="exportexcel_btn"
															class="btn btn-info">
															<i class="fa fa-import"></i>批量修改
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
										class="caption-subject font-blue bold uppercase">信息列表</span>
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
											<th class="nowrap">一代编号</th>
											<th class="nowrap">一代名称</th>
											<th class="nowrap">归属分公司</th>
											<th class="nowrap">打包秒到规模上限</th>
											<th class="nowrap">标准秒到规模上限</th>
											<th class="nowrap">已开通标准秒到商户数</th>
											<th class="nowrap">已开通打包秒到商户数</th>
											<th class="nowrap">操作记录</th>
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
											<option value="20" selected="selected">20</option>
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



	<!-- 文件模板导入 -->
	<div class="modal fade" id="importExcelWin" tabindex="-1" role="dialog" data-backdrop="static"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="excelTitle">修改规模上限</h4>
				</div>
				<div class="modal-body">
					<div class="portlet-body form">
						<form action="<%=request.getContextPath()%>/"
							class="form-horizontal" id="addUserform">
							<div class="form-body">
								<div class="row norow">
									<input type="hidden" id="u_topAgentNo" /> <input type="hidden"
										id="u_mdPackLimit" /> <input type="hidden"
										id="u_mdStandardLimit" />
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">选择上限:</label>
											<div class="col-md-6 paddingnone">
												<select name="u_posMdTyp" id="u_posMdTyp"
													class="bs-select form-control" data-show-subtext="true">
													<option value="">请选择</option>
													<option value="1">打包秒到</option>
													<option value="2">标准秒到</option>
												</select>
											</div>
										</div>
									</div>

									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">当前上限:</label>
											<div class="col-md-6 paddingnone">
												<div id="u_numLimitBf"
													style="margin-top: 5px; margin-left: 5px"></div>
											</div>
											<label class="control-label col-md-2 text-right"></label>
										</div>
									</div>


									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">变更上限:</label>
											<div class="col-md-6 paddingnone">
												<input id="u_numLimitAf" name="u_numLimitAf" type="number"
													class="bs-select form-control" />
											</div>
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">操作备注:</label>
											<div class="col-md-6 paddingnone">
												<textarea rows="5" id="u_rmk" name="u_rmk"
													class="form-control" cols=""></textarea>
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
												<button type="button" id="importform_save_btn"
													class="btn btn-success">
													<i class="fa fa-save"></i> 确认
												</button>
												<button type="button" id="importform_cancle_btn"
													class="btn red">
													<i class="fa fa-share"></i> 取消
												</button>
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
	</div>



	<!-- Excel的模态框（Modal） -->
	<div class="modal fade" id="exportExcelWin" tabindex="-1" role="dialog" data-backdrop="static"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="">批量修改</h4>
				</div>
				<div class="modal-body">
					<div class="portlet-body form">
						<form action="<%=request.getContextPath()%>/" class="form-horizontal" id="exportform">
							<div class="form-body">
								<div class="row norow">

									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">选择上限:</label>
											<div class="col-md-6 paddingnone">
												<select name="_posMdTyp" id="_posMdTyp"
													class="bs-select form-control" data-show-subtext="true">
													<option value="">请选择</option>
													<option value="1">打包秒到</option>
													<option value="2">标准秒到</option>
												</select>
											</div>
										</div>
									</div>

									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">操作备注:</label>
											<div class="col-md-6 paddingnone">
												<textarea rows="5" id="_rmk" name="_rmk"
													class="form-control" cols="50"></textarea>
											</div>
											<label class="control-label col-md-2 text-right"></label>
										</div>
									</div>


									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label for="span-medium-2"
												class="control-label col-md-4 text-right"
												style="margin-left: -90px">选择文件:</label> <label
												class="checkbox-inline"> <input type="file"
												name="file" id="file" checked aria-label="...">
											</label>
										</div>
									</div>


									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right"><a
												href="javascript:void(0)" onclick="downloadTemplate()">下载模版</a></label>
											<div class="col-md-8 paddingnone"></div>
											<label class="control-label col-md-2 text-right"></label>
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
												<button type="button" id="exportform_save_btn"
													class="btn btn-success">
													<i class="fa fa-save"></i> 确认
												</button>
												<button type="button" id="exportform_cancel_btn"
													class="btn red">
													<i class="fa fa-share"></i> 取消
												</button>
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
	</div>




	<!-- Excel的模态框（Modal） -->
	<div class="modal fade" id="downLoadExcelWin" tabindex="-1" data-backdrop="static"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="">下载模板</h4>
				</div>
				<div class="modal-body">
					<div class="portlet-body form">
						<form action="<%=request.getContextPath()%>/"
							class="form-horizontal" id="exportform">
							<div class="form-body">
								<div class="row norow">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right"></label>
											<div class="col-md-8 paddingnone">
												<input type="button" id="download1" value="点击下载开通关闭模板"
													style="margin-left: -50px" class="bs-select form-control"
													data-show-subtext="true" />
											</div>
										</div>
									</div>

									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right"></label>
											<div class="col-md-8 paddingnone">
												<input type="button" id="download2" value="点击下载修改费率模板"
													style="margin-left: -50px" class="bs-select form-control"
													data-show-subtext="true" />
											</div>
										</div>
									</div>

									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right"></label>
											<div class="col-md-8 paddingnone">
												<input type="button" id="download3" value="点击下载修改限额模板"
													style="margin-left: -50px" class="bs-select form-control"
													data-show-subtext="true" />
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
												<button type="button" id="downLoad_cancel_btn"
													class="btn red" style="margin-left: 150px">
													<i class="fa fa-share"></i>关闭
												</button>
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
	</div>


	<!-- 动作类型关闭操作Model -->
	<div class="modal fade" id="closeWin" tabindex="-1" role="dialog" data-backdrop="static"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="">动作原因</h4>
				</div>
				<div class="modal-body">
					<div class="portlet-body form">
						<form action="<%=request.getContextPath()%>/"
							class="form-horizontal" id="closeForm">
							<div class="form-body">
								<div class="row norow">
									<input type="hidden" name="c_mon" id="c_mon" /> <input
										type="hidden" name="c_type" id="c_type" />

									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
										id="c_posMdTypDiv">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">秒到类型:</label>
											<div class="col-md-8 paddingnone">
												<select name="c_posMdTyp" id="c_posMdTyp"
													class="bs-select form-control" data-show-subtext="true">
													<option value="1">打包</option>
													<option value="2">标准</option>
												</select>
											</div>
										</div>
									</div>


									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">动作原因:</label>
											<div class="col-md-8 paddingnone">
												<textarea name="c_rmk" data-provide="markdown" id="c_rmk"
													rows="10" data-width="250" class="form-control"></textarea>
												<span class="help-block"> </span>
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
												<button type="button" id="close_save_btn"
													class="btn btn-success">
													<i class="fa fa-save"></i> 确认
												</button>
												<button type="button" id="close_cancel_btn" class="btn red">
													<i class="fa fa-share"></i>关闭
												</button>
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
	</div>





	<!-- 修改费率Model -->
	<div class="modal fade" id="updateRateWin" tabindex="-1" role="dialog" data-backdrop="static"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="">修改费率</h4>
				</div>
				<div class="modal-body">
					<div class="portlet-body form">
						<form action="<%=request.getContextPath()%>/"
							class="form-horizontal" id="updateRateForm">
							<div class="form-body">
								<div class="row norow">
									<input type="hidden" id="ur_mno" />
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">当前费率(%):</label>
											<div class="col-md-8 paddingnone">
												<input id="ur_rate" class="bs-select form-control"
													disabled="disabled" data-show-subtext="true" />
											</div>
										</div>
									</div>


									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">变更费率(%):</label>
											<div class="col-md-8 paddingnone">
												<input id="ur_acRateNew" class="bs-select form-control"
													size="15" type="number" placeholder="填写新费率"
													data-show-subtext="true" />
											</div>
										</div>
									</div>

									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">操作备注:</label>
											<div class="col-md-8 paddingnone">
												<textarea name="ur_rmk" data-provide="markdown" id="ur_rmk"
													rows="10" data-width="250" class="form-control"></textarea>
												<span class="help-block"> </span>
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
												<button type="button" id="updateRate_save_btn"
													class="btn btn-success">
													<i class="fa fa-save"></i> 确认
												</button>
												<button type="button" id="updateRate_cancel_btn"
													class="btn red">
													<i class="fa fa-share"></i>关闭
												</button>
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
	</div>


	<!-- 修改限额Model -->
	<div class="modal fade" id="updateLimitWin" tabindex="-1" role="dialog" data-backdrop="static"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="">修改限额</h4>
				</div>
				<div class="modal-body">
					<div class="portlet-body form">
						<form action="<%=request.getContextPath()%>/"
							class="form-horizontal" id="updateLimitForm">
							<div class="form-body">
								<div class="row norow">
									<input type="hidden" id="ul_mno" />
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">当前限额:</label>
											<div class="col-md-8 paddingnone">
												<input id="ul_limitAmt" class="bs-select form-control"
													disabled="disabled" data-show-subtext="true" />
											</div>
										</div>
									</div>


									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">变更限额:</label>
											<div class="col-md-8 paddingnone">
												<input id="ul_limitAmtNew" class="bs-select form-control"
													size="15" type="number" placeholder="填写新限额"
													data-show-subtext="true" />
											</div>
										</div>
									</div>

									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">操作备注:</label>
											<div class="col-md-8 paddingnone">
												<textarea name="ul_rmk" data-provide="markdown" id="ul_rmk"
													rows="10" data-width="250" class="form-control"></textarea>
												<span class="help-block"> </span>
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
												<button type="button" id="updateLimit_save_btn"
													class="btn btn-success">
													<i class="fa fa-save"></i> 确认
												</button>
												<button type="button" id="updateLimit_cancel_btn"
													class="btn red">
													<i class="fa fa-share"></i>关闭
												</button>
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
	</div>



	<!-- 修改限额Model -->
	<div class="modal fade" id="updateDayLimitWin" tabindex="-1" data-backdrop="static"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="">修改秒到日限额</h4>
				</div>
				<div class="modal-body">
					<div class="portlet-body form">
						<form action="<%=request.getContextPath()%>/"
							class="form-horizontal" id="updateDayLimitForm">
							<div class="form-body">
								<div class="row norow">
									<input type="hidden" id="udl_mno" /> <input type="hidden"
										id="udl_isDayLimit" />
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">当前限额:</label>
											<div class="col-md-8 paddingnone">
												<input id="udl_dayLimitAmt" class="bs-select form-control"
													disabled="disabled" data-show-subtext="true" />
											</div>
										</div>
									</div>


									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">变更限额:</label>
											<div class="col-md-6 paddingnone">
												<input id="udl_isDayLimitNew" class="bs-select form-control"
													size="15" type="number" placeholder="填写新限额"
													data-show-subtext="true" />
											</div>
											<label class="control-label col-md-2 text-right"><input
												type="checkBox" id="udl_checkbox">无上限</label>
										</div>
									</div>

									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label col-md-2 text-right">操作备注:</label>
											<div class="col-md-8 paddingnone">
												<textarea name="udl_rmk" data-provide="markdown"
													id="udl_rmk" rows="10" data-width="250"
													class="form-control"></textarea>
												<span class="help-block"> </span>
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
												<button type="button" id="updateDayLimit_save_btn"
													class="btn btn-success">
													<i class="fa fa-save"></i> 确认
												</button>
												<button type="button" id="updateDayLimit_cancel_btn"
													class="btn red">
													<i class="fa fa-share"></i>关闭
												</button>
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
	</div>



	<!-- BEGIN FOOTER -->
	<jsp:include page="../common/footer.jsp" flush="true" />
	<!-- END FOOTER -->

	<script type="text/javascript">
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

		//分页
		function pageing(opp) {
    	$(window.top.document).scrollTop(0,500);
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
					return;
				}

				if (opp > toalPage) {
					bootbox.alert('对不起没有你要跳转的页面');
					return;
				} else if (opp < 1) {
					bootbox.alert('对不起没有你要跳转的页面');
					return;
				}
				page = opp * 1;
				start = (page - 1) * limit;
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

		//关闭下载弹窗
		$("#downLoad_cancel_btn").bind('click', function() {
			$("#downLoadExcelWin").modal('hide');
		})

		$("#download1").bind(
				"click",
				function() {
					window.location.href = baseURL
							+ "/tZero/posMd/downloadTemplate?downType=01";
					$("#downLoadExcelWin").modal('hide');
				})

		$("#download2").bind(
				"click",
				function() {
					window.location.href = baseURL
							+ "/tZero/posMd/downloadTemplate?downType=02";
					$("#downLoadExcelWin").modal('hide');
				})

		$("#download3").bind(
				"click",
				function() {
					window.location.href = baseURL
							+ "/tZero/posMd/downloadTemplate?downType=03";
					$("#downLoadExcelWin").modal('hide');
				})

		//查询数据
		function reloadGrid() {
			var url = baseURL + "/tZero/posMdNum/query"; //查询数据URL 
			$('table > tbody').empty();
			if (limit == 0) {
				//默认20条
				limit = 20;
			}
			start = (page - 1) * limit;
			var param = {
				page : page,
				start : start,
				limit : limit
			};

			param.topAgentNo = $('#topAgentNo').val(); //一代编号
			param.topAgentNm = $("#topAgentNm").val();//一代名称
			param.orgNo = $('#combo').val();//分公司  

			App.blockUI({
				target : "body",
				boxed : !0,
				message : "读取中...",zIndex:20000});
			$
					.ajax({
						type : "POST",
						url : url,
						contentType : "application/x-www-form-urlencoded;charset=utf-8",
						data : param,
						dataType : "json",
						success : function(data) {
							if (data.timeout) {
								ajaxTimeout();
							}
							toalPage = Math.ceil(data.totalCount / limit);
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
							//$("#queryMecGrid tbody").empty();
							//data = Object {items: Array[20], totalCount: 269}
							$
									.each(
											data.items,
											function(index, obj) {
												var trData = [];
												trData
														.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");

												trData.push(obj.topAgentNo);
												trData.push(obj.topAgentNm);
												trData.push(obj.orgNm);

												trData.push(obj.mdPackLimit);
												trData
														.push(obj.mdStandardLimit);

												trData.push(obj.standNum);
												trData.push(obj.packNum);

												var oprate = oprateRecord(obj); //操作记录
												trData.push(oprate);

												for (i = 0; i < trData.length; i++) {
													if (trData[i] == undefined) {
														trData[i] = '';
													}
												}

												$("#queryMecGrid").DataTable().row
														.add(trData).draw();

											});
							$("#queryMecGrid").DataTable().order([ 1, 'asc' ])
									.draw();
							$("#pagination-bar").show();
							if (page == 1) {
								//first page
								$("#pagination .prev a").css({
									'color' : 'gray',
									'cursor' : 'not-allowed'
								});
							} else {
								$("#pagination .prev a").css({
									'color' : '#23527c',
									'cursor' : 'pointer'
								});
							}
							if (page == toalPage) {
								// last page
								$("#pagination .next a").css({
									'color' : 'gray',
									'cursor' : 'not-allowed'
								});
							} else {
								$("#pagination .next a").css({
									'color' : '#23527c',
									'cursor' : 'pointer'
								});
							}
							//动态设置iframe高度
							var currentTabId = $("#tab-bar", parent.document)
									.children('li.active').children('a').attr(
											'href').replace('#tab_', '');
							setIframeHeight($('#frame_' + currentTabId,
									parent.document)[0]);

							//控制 复选框只能选中一个
							$('input[type=checkbox]').bind(
									'click',
									function() {
										$('input[type=checkbox]').not(this)
												.attr("checked", false);
									});
							//绑定 变更状态事件
							$("a[name='changests']").bind("click", changests);
						},
						error : function(error) {
							bootbox.alert("读取失败！");
						}
					});
		}
		var queryMethod = 0;

		//跳转到变更状态页面
		function changests() {
			var uuid = $(this).attr("UUID");
			$.fancybox({afterLoad:fancyboxCenterOnViewport,
				href : 'SecondCfmUpdatePanel.jsp?uuid=' + uuid,
				type : 'iframe',
				padding : 5,
				margin : 60,
				scrolling : 'no',
				fitToView : true,
				width : 1000,
				height : 800,
				autoSize : false,
				autoResize : false,
				closeClick : false,
				afterClose : function() {
					reloadGrid();
				}
			});
		}
		$(function() {

			/*初始化页面按钮权限*/

			if (!hasPermission(PERMISSSIONCONST.POSMD021)) {
				$("#query_btn").hide();
			}
			if (!hasPermission(PERMISSSIONCONST.POSMD022)) {
				$("#edit_btn").hide();
			}
			if (!hasPermission(PERMISSSIONCONST.POSMD023)) {
				$("#down_btn").hide();
			}
			if (!hasPermission(PERMISSSIONCONST.POSMD024)) {
				$("#exportexcel_btn").hide();
			}

			//查询分公司
			sbjStore('combo', true);

			//修改规模上限，下拉框改变事件

			$("#u_posMdTyp").bind("change", function() {
				var val = $(this).val();
				var mdPackLimit = $("#u_mdPackLimit").val();
				var mdStandardLimit = $("#u_mdStandardLimit").val();
				if (val == "1") {
					$("#u_numLimitBf").text(mdPackLimit);
				} else if (val == "2") {
					$("#u_numLimitBf").text(mdStandardLimit);
				}
			});

			//异步查询状态
			/* querySts(); */

			//自动秒到业务状态 默认选择开通
			$("#posMdSts option[value='01'").attr("selected", true);
			//更新内容刷新到相应的位置 
			$("#posMdSts").selectpicker('render');
			$("#posMdSts").selectpicker('refresh');

			//推送类型选中事件
			$("#_pushType").bind("change", function() {
				var type = $("#_pushType").val()
				if (type == '02') {
					$("#_smsPassDiv").show();
					$("#_sengMsgInfoDiv").show();
				} else {
					$("#_smsPassDiv").hide();
					$("#_sengMsgInfoDiv").hide();
				}

			})

			//查询按钮
			$("#query_btn").on('click', function() {
				page = 1;
				reloadGrid();
			});
			//重置按钮
			$("#reset_btn").on('click', function() {
				$("#queryMecPanel_Form")[0].reset();
				$("#queryMecPanel_Form .bs-select").selectpicker('val', '01');//重置select元素

				//更新内容刷新到相应的位置  
				/* $("#posMdSts").find("option[value='01']").attr("selected", true);
				$("#posMdSts").selectpicker('render');  */
				/*  $("#posMdSts").selectpicker('refresh');  */
			});

			//模板下载
			$("#down_btn").bind("click", function() {
						var totalCount = $("#itemCount").text();
						
						if(totalCount>0){
						bootbox.confirm("共" + totalCount + "条数据,确定要导出吗?", function(btn) {
									if (btn) {
										window.open(baseURL + "/tZero/posMdNum/export");
									}
								});
						}else{
							bootbox.alert("没有可导出的数据！");
						}
					});

			//开通页面查询
			$("#queryMessage").bind("click", function() {
				var url = baseURL + "/tZero/posMd/queryMec";
				var mno = $("#_mno").val();

				if (mno == '') {
					bootbox.alert("请输入商户编号!");
					return;
				}

				$.ajax({
					url : url,
					type : "POST",
					data : {
						mno : mno
					},
					success : function(data) {
						data = $.parseJSON(data);
						if (data.success) {
							$("#_orgNm").val(data.orgNm);
							$("#_regNm").val(data.regNm); //商户名称
						} else {
							bootbox.alert(data.msg);
						}
					}
				});

			});

			//修改限额页面
			$("#edit_btn").on('click', function() {
				openImportExcelWin();
			});

			//批量导入excel修改
			// 批量修改
			$("#exportexcel_btn").on(
					'click',
					function() {
						$("#exportform")[0].reset();
						$("#exportform .bs-select").selectpicker('val', '');//重置select元素

						$("#_rmk").val("");
						$("#file").val('');
						$("#exportExcelWin").modal('show');

						batchOpt('04');
						$("#exportform_cancel_btn").off('click').on('click',
								function() {
									$("#exportExcelWin").modal('hide');
								});

					});

		});

		//修改规模
		function openImportExcelWin() {

			$("#addUserform")[0].reset();
			$("#addUserform .bs-select").selectpicker('val', '');//重置select元素
			$("label[id$='-error']").text("")

			var selectRocords = $("#queryMecGrid tbody input:checked");

			if (selectRocords.length <= 0) {
				bootbox.alert("请选中要修改的数据行...");
				return;
			}

			//设置表单数据
			var index = $(selectRocords[0]).attr("rownum");
			record = tableData.items[index];
			$("#u_numLimitBf").text("200");
			$("#u_topAgentNo").val(record.topAgentNo);
			$("#u_mdPackLimit").val(record.mdPackLimit);
			$("#u_mdStandardLimit").val(record.mdStandardLimit);

			//弹出窗口取消按钮
			$("#importform_cancle_btn").off('click').on('click', function() {
				$("#importExcelWin").modal('hide');
				$("#addUserform")[0].reset();
			});

			//开通保存
			$("#importform_save_btn").off('click').on('click', function() {

				var topAgentNo = $("#u_topAgentNo").val();
				var posMdTyp = $("#u_posMdTyp").val();
				var numLimitBf = $("#u_numLimitBf").text();
				var numLimitAf = $("#u_numLimitAf").val();
				var rmk = $("#u_rmk").val();
				var mdPackLimit = $("#u_mdPackLimit").val();
				var mdStandardLimit = $("#u_mdStandardLimit").val();

				if (posMdTyp == "" || posMdTyp == "null" || posMdTyp == null) {
					bootbox.alert("选择上限不能为空!");
					return;
				}
				if (numLimitAf == "") {
					bootbox.alert("变更上限不能为空!");
					return;
				}

				var reg = /^\d*$/;
				if (!reg.test(numLimitAf)) {
					bootbox.alert("变更上限输入框仅支持输入非负整数");
					return;
				}
				numLimitAf = parseInt(numLimitAf);
				if (numLimitAf > 999999999999) {
					bootbox.alert("变更上限最大值不能超过999999999999");
					return;
				}

				if (rmk.trim().length > 30) {
					bootbox.alert("操作备注长度过长!");
					return;
				}
				numLimitBf = parseInt(numLimitBf);
				if (numLimitBf == numLimitAf) {
					bootbox.alert("变更前后上限一致");
					return;
				}

				var url = baseURL + "/tZero/posMdNum/update";
				$.ajax({
					url : url,
					type : "post",
					data : {
						"topAgentNo" : topAgentNo,
						"posMdTyp" : posMdTyp,
						"numLimitBf" : numLimitBf,
						"numLimitAf" : numLimitAf,
						"rmk" : rmk,
						"mdPackLimit" : mdPackLimit,
						"mdStandardLimit" : mdStandardLimit
					},
					success : function(data) {
						data = $.parseJSON(data);
						if (data.success) {
							reloadGrid();
							$("#importExcelWin").modal('hide');
							$("#addUserform")[0].reset();
							bootbox.alert(data.msg);
						} else {

							bootbox.alert(data.erroMsg);
						}
						$("#importExcelWin").modal('hide');
						$("#addUserform")[0].reset();
					}
				});

			});

			$("#importExcelWin").modal('show');

		}

		//  查询所属分公司
		function querySts() {
			var url = baseURL + "/code/query/typ/TZERO_STL_STS";
			$.ajax({
				type : "GET",
				url : url,
				success : function(data) {
					console.log(data);
					var data = $.parseJSON(data);
					$("#stlSts").append("<option value=''>全部</option>");

					for (var i = 0; i < data.length; i++) {
						$("#stlSts").append(
								"<option value='" + data[i].cdVl + "'>"
										+ data[i].cdNm + "</option>");
					}
					//更新内容刷新到相应的位置
					$("#stlSts").selectpicker('render');
					$("#stlSts").selectpicker('refresh');
				}
			});
		}

		function batchOpt(optType) {
			$("#exportform_save_btn").off('click').on( 'click', function() {
						var _posMdTyp=$("#_posMdTyp").val();
						var _rmk=$("#_rmk").val();
					    if(_posMdTyp==""||_posMdTyp==null||_posMdTyp=="null"){
					    	bootbox.alert("选择上限不能为空");
					    	return;
					    }
						if(_rmk!=''&&_rmk.length>30){
							bootbox.alert("操作备注过长");
							return;
						}
						
					    
				
				
						var filepath = $("#file").val();
						if (filepath == undefined || filepath == "") {
							//fileObject.focus(); 
							bootbox.alert("请选择上传文件!");
							return;
						} else {
							var fileArr = filepath.split("\\");
							var fileTArr = fileArr[fileArr.length - 1]
									.toLowerCase().split(".");
							var filetype = fileTArr[fileTArr.length - 1];

							if (filetype != "xlsx") {
								//fileObject.focus(); 
								bootbox.alert("上传文件必须为07版Excel文件(后缀.xlsx)!");
								return;
							} else {
								$("#error").innerText = "";
							}
						}

						bootbox.confirm("确认要批量修改吗？",function(btn){
							if(btn){

								var fileObj = document.getElementById("file").files[0]; // 获取文件对象
								var form = new FormData();
								// FormData 对象
								form.append("file", fileObj); // 文件对象


								App.blockUI({
									target : "body",
									boxed : !0,
									message : CONST.TIP016,zIndex:20000});
								$.ajax({ 
									url : baseURL + '/tZero/posMdNum/import?posMdTyp='+_posMdTyp+'&rmk='+_rmk,
									type : "post",
									data : form,
									processData : false,
									contentType : false,
									success : function(result) {
										$("#exportExcelWin").modal('hide');
										result = jQuery.parseJSON(result);
										var msg = result.msg;
										if (result.hasErro==true) {
											bootbox.confirm( msg+"详情如下",function(btn){
												if(btn){
													showExcelImportErrorPanel(JSON.stringify(result));
												}
											})
											
											
										} else {
											bootbox.confirm( msg,function(btn){
												if(btn){
													reloadGrid();
												}
											})
											
										}
										//移除点击事件
										$("#exportform_save_btn").unbind("click");
									},
									error : function(e) {
										bootbox.alert("导入错误！！");
										// window.clearInterval(timer);
									}
								});
							}
						})
						
						
					
					});

		}

		//跳转excel导入出错页面    
		function showExcelImportErrorPanel(data) {
			$("#data").val(data);
			$.fancybox({afterLoad:fancyboxCenterOnViewport,
				href : 'PosMdMecNumMagPanelImptErroGrid.jsp',
				type : 'iframe',
				padding : 5,
				margin : 60,
				scrolling : 'no',
				fitToView : true,
				width : 1200,
				height : 490,
				autoSize : false,
				closeClick : false,
				afterClose : function() {
					/* reloadGrid(); */
				}
			});
		}

		//操作记录
		oprateRecord = function(obj) {
			var relVal = '';
			/* hasPermission(PERMISSSIONCONST.POSMD025) */
			if (true) {
				var topAgentNo = obj.topAgentNo;
				var str;
				str = "<a href='javascript:void(0);' onclick=PosMdLimitOptHis('"
						+ topAgentNo + "')>操作记录查询</a>	"
				relVal = str;
			}
			return relVal;
		}

		//关闭或开通win
		function openOrCloseFun(mon, type) {
			$("#closeForm")[0].reset();
			$('#c_mon').val(mon);
			$('#c_type').val(type);
			if (type == "01") {
				$('#c_posMdTypDiv').show();
			} else if (type == "00") {
				$('#c_posMdTypDiv').hide();
			}

			$("#closeWin").modal('show');

			//绑定取消事件
			$("#close_cancel_btn").off('click').on('click', function() {
				$("#closeWin").modal('hide');
				$("#closeForm")[0].reset();
			});
			//绑定保存事件
			$("#close_save_btn").off('click').on('click', function() {
				var type = $("#c_type").val();
				var mno = $("#c_mon").val();
				var rmk = $("#c_rmk").val();
				var posMdTyp = $("#c_posMdTyp").val();
				var url = '';
				if (type == "00") {
					url = baseURL + "/tZero/posMd/doClose";
				} else {
					url = baseURL + "/tZero/posMd/doOpen";
				}

				if (rmk == '') {
					bootbox.alert('请填写动作原因');
					return;
				}
				if (rmk.length > 50) {
					bootbox.alert('动作原因过长');
					return;
				}
				$.ajax({
					type : 'post',
					url : url,
					data : {
						mno : mno,
						rmk : rmk,
						posMdTyp : posMdTyp
					},
					success : function(data) {
						data = $.parseJSON(data);

						if (data.success == true) {
							bootbox.alert(data.msg);
							reloadGrid();

						} else {
							bootbox.alert(data.msg);
						}
						$("#closeWin").modal('hide');

					}
				});

			});

		}

		function updateRateFun(mno, rate) {
			$("#updateLimitForm")[0].reset();
			$('#ur_mno').val(mno);
			$('#ur_rate').val(rate);

			$("#updateRateWin").modal('show');

			//绑定取消事件
			$("#updateRate_cancel_btn").off('click').on('click', function() {
				$("#updateRateWin").modal('hide');
				$("#updateRateForm")[0].reset();
			});
			//绑定保存事件
			$("#updateRate_save_btn").off('click').on('click', function() {
				var acRateNew = $("#ur_acRateNew").val();
				var mno = $("#ur_mno").val();
				var rmk = $("#ur_rmk").val();
				var rate = $("#ur_rate").val();
				var url = baseURL + '/tZero/posMd/updateRate';

				if (acRateNew != '') {
					if (isNaN(acRateNew)) {
						bootbox.alert('新的费率只能为数字');
						return;
					} else {
						acRateNew = parseFloat(acRateNew);
						if (0 > acRateNew || acRateNew > 1) {
							bootbox.alert('新的费率只能为0-1');
							return;
						}
					}
				} else {
					bootbox.alert('新的费率不能为空');
					return;
				}

				if (rmk == '') {
					bootbox.alert('请填写操作备注');
					return;
				}
				if (rmk.length > 50) {
					bootbox.alert('操作备注过长');
					return;
				}
				$.ajax({
					type : 'post',
					url : url,
					data : {
						mno : mno,
						rate : rate,
						rateNew : acRateNew,
						rmk : rmk
					},
					success : function(data) {
						data = $.parseJSON(data);
						if (data.success == true) {
							bootbox.alert(data.msg);
							reloadGrid();
						} else {
							bootbox.alert(data.msg);
						}
						$("#updateRateWin").modal('hide');
						$("#updateRateForm")[0].reset();
					}
				});

			});

		}

		function updateLimitAmtFun(mno, limitAmt) {
			$("#updateLimitForm")[0].reset();

			$('#ul_mno').val(mno);
			$('#ul_limitAmt').val(limitAmt);

			$("#updateLimitWin").modal('show');

			//绑定取消事件
			$("#updateLimit_cancel_btn").off('click').on('click', function() {
				$("#updateLimitWin").modal('hide');
				$("#updateLimitForm")[0].reset();
			});
			//绑定保存事件
			$("#updateLimit_save_btn").off('click').on('click', function() {
				var limitAmtNew = $("#ul_limitAmtNew").val();
				var limitAmt = $('#ul_limitAmt').val();
				var mno = $("#ul_mno").val();
				var rmk = $("#ul_rmk").val();
				var url = baseURL + '/tZero/posMd/updateLimitAmt';

				if (limitAmtNew != '') {
					if (isNaN(limitAmtNew)) {
						bootbox.alert('新的限额只能为数字');
						return;
					} else {
						limitAmtNew = parseFloat(limitAmtNew);
						if (0 > limitAmtNew) {
							bootbox.alert('新的限额大于等于零');
							return;
						}
					}
				} else {
					bootbox.alert('新的限额不能为空');
					return;
				}

				if (rmk == '') {
					bootbox.alert('请填写操作备注');
					return;
				}
				if (rmk.length > 50) {
					bootbox.alert('操作备注过长');
					return;
				}
				$.ajax({
					type : 'post',
					url : url,
					data : {
						mno : mno,
						limitAmt : limitAmt,
						limitAmtNew : limitAmtNew,
						rmk : rmk
					},
					success : function(data) {
						data = $.parseJSON(data);
						if (data.success == true) {
							bootbox.alert(data.msg);
							reloadGrid();
						} else {
							bootbox.alert(data.msg);
						}
						$("#updateLimitWin").modal('hide');
					}
				});

			});

		}

		function updateDayLimitAmtFun(mno, dayLimitAmt, isDayLimit) {
			$("#updateDayLimitForm")[0].reset();

			$('#udl_mno').val(mno);

			if (isDayLimit == '01') {
				$('#udl_dayLimitAmt').val(dayLimitAmt);
			} else {
				$('#udl_dayLimitAmt').val("无上限");
			}

			$('#udl_isDayLimit').val(isDayLimit);
			$("#updateDayLimitWin").modal('show');

			$("#udl_isDayLimitNew").prop("disabled", false);
			$("#udl_isDayLimit").val('01')

			//无上限复选框选中事件
			$("#udl_checkbox").off('click').on('click', function() {
				if ($(this).prop('checked')) {
					$("#udl_isDayLimitNew").val('');
					$("#udl_isDayLimitNew").prop("disabled", true);
					$("#udl_isDayLimit").val('00')
				} else {
					$("#udl_isDayLimitNew").prop("disabled", false);
					$("#udl_isDayLimit").val('01')
				}

			})

			//绑定取消事件
			$("#updateDayLimit_cancel_btn").off('click').on('click',
					function() {
						$("#updateDayLimitWin").modal('hide');
						$("#updateDayLimitForm")[0].reset();
					});
			//绑定保存事件
			$("#updateDayLimit_save_btn").off('click').on('click', function() {
				var isDayLimitNew = $("#udl_isDayLimitNew").val();
				var isDayLimit = $('#udl_isDayLimit').val();
				var mno = $("#udl_mno").val();
				var rmk = $("#udl_rmk").val();
				var url = baseURL + '/tZero/posMd/updateDayLimitAmt';

				if (!$("#udl_checkbox").prop('checked')) {
					if (isDayLimitNew != '') {
						if (isNaN(isDayLimitNew)) {
							bootbox.alert('新的限额只能为数字');
							return;
						} else {
							isDayLimitNew = parseFloat(isDayLimitNew);
							if (0 > isDayLimitNew) {
								bootbox.alert('新的限额大于等于零');
								return;
							}
						}
					} else {
						bootbox.alert('新的限额不能为空');
						return;
					}
				}
				if (rmk == '') {
					bootbox.alert('请填写操作备注');
					return;
				}
				if (rmk.length > 50) {
					bootbox.alert('操作备注过长');
					return;
				}
				$.ajax({
					type : 'post',
					url : url,
					data : {
						mno : mno,
						rmk : rmk,
						limitAmtNew : isDayLimitNew,
						isDayLimitNew : isDayLimit
					},
					success : function(data) {
						data = $.parseJSON(data);
						if (data.success == true) {
							bootbox.alert(data.msg);
							reloadGrid();
						} else {
							bootbox.alert(data.msg);
						}
						$("#updateDayLimitWin").modal('hide');
					}
				});

			});

		}

		//限额修改记录 或日限额记录页面
		function PosMdLimitOptHis(topAgentNo) {
			var url = baseURL + '/tZero/posMdNum/log?topAgentNo=' + topAgentNo;
			var param = {
				page : 1,
				start : 0,
				limit : 20
			};
			$.ajax({
				type : "POST",
				url : url,
				data : param,
				dataType : "json",
				success : function(data) {
					if (data.timeout) {
						ajaxTimeout();
					}
					if (data.totalCount == 0) {
						bootbox.alert("没有操作数据");
						return;
					} else {
						$.fancybox({afterLoad:fancyboxCenterOnViewport,
							href : 'PosMdLimitOptHis.jsp?topAgentNo='
									+ topAgentNo,
							type : 'iframe',
							padding : 5,
							margin : 60,
							scrolling : 'no',
							fitToView : true,
							width : 1200,
							height : 490,
							autoSize : false,
							closeClick : false,
							afterClose : function() {
								/* reloadGrid(); */
							}
						});
					}
				}
			});

		}

		//查询分公司
		function sbjStore(element, isAll) {
			var param = {
				limit : 1000,
				page : 1,
				start : 0
			}

			$
					.ajax({
						type : "GET",
						url : baseURL + "/tZero/org/queryOrgNmComboList",
						contentType : "application/x-www-form-urlencoded;charset=utf-8",
						data : param,
						dataType : "json",
						async : false,
						success : function(data) {
							if (data.timeout) {
								ajaxTimeout();
							}
							$("#" + element).empty();

							if (isAll) {

								$("#" + element).append(
										$("<option></option>").val("").text(
												"全部"));
							} else {
								$("#" + element).append(
										$("<option></option>").val("").text(
												"请选择..."));

							}
							/* cdVl + "'>"   + data[i].cdNm */
							$.each(data, function(index, obj) {
								$("#" + element).append(
										$("<option></option>").val(obj.cdVl)
												.text(obj.cdNm));
							});
							//更新内容刷新到相应的位置
							$("#" + element).selectpicker('render');
							$("#" + element).selectpicker('refresh');
						},
						error : function(error) {
						}
					});
		}

		function downloadTemplate() {
			window.location.href = baseURL + "/tZero/posMdNum/download";
		}
	</script>

</body>

</html>

