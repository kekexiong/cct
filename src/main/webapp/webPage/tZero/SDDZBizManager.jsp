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
<style type="text/css">
label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
</style>
</head>
<!-- <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md"> -->
<body class="iframe-body">

	<!-- BEGIN HEADER -->
	<jsp:include page="../common/header.jsp" flush="true" />
	<!-- END HEADER -->

	<!-- BEGIN CONTAINER -->
	<div class="clearfix"></div>
	<div class="page-container">

		<!-- BEGIN MENU
		<jsp:include page="../common/menu.jsp" flush="true" />
		END MENU -->

		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<!-- 主体-->
		<!-- 	<div class="page-content"> -->
			<div class="">
				<!-- 右边开始 -->
				<div class="row">
					<!-- BEGIN CONTENT -->
					<div class="portlet-body form">
						<div class="form-body">
							<div class="row norow">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="panel-title">闪电到账业务规则管理</h4>
									</div>
					<form id="validRuleForm" class="form-horizontal" action="" >
									<div class="panel-body">
										<div class="row norow">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-6 text-right"><font
														color="red">*</font>单日免验证额度:</label>
													<div class="col-md-5 paddingnone">
														<input name="validRule"
															id="SDDZBiz_Form_notValidateAmt" type="number"
															class="form-control onlyNum" min='0'
															 required  data-bv-notempty-message="不能为空">
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-7 text-right">单日单卡可发起商户数:</label>
													<div class="col-md-5 paddingnone">
														<input name="validRule"
															id="SDDZBiz_Form_mecNum" type="number"
															class="form-control onlyNum">
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
												<div class="form-group">
													<label for="span-medium-2" 
														class="control-label col-md-6 text-right"><input
														type="checkbox" name="mecNoMax" id="SDDZBiz_Form_mecNoMax">无上限</label>
													<div class="col-md-3 paddingnone">
														<input name=
															id="" type="button"
															value="保存" onclick="savefunctionfirst()" class="form-control col-md-2">
													</div>
												</div>
											</div>

										</div>
										<div class="row norow">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-6 text-right"><font
														color="red">*</font>预计到账时长:</label>
													<div class="col-md-4 paddingnone">
														<input name="SDDZBiz_Form_accountTime"
															id="SDDZBiz_Form_accountTime" type="number"
															class="form-control onlyNum">
													</div>
													<label for="span-medium-2"
														class="control-label col-md-2">小时</label>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-7 text-right"><font
														color="red">*</font>闪电到账结算费率:</label>
													<div class="col-md-4 paddingnone">
														<input name="SDDZBiz_Form_sesRate"
															id="SDDZBiz_Form_sesRate" type="number"
															class="form-control onlyNum" min='0' name="points" step='0.01'>

													</div>
													<label for="span-medium-2"
														class="control-label col-md-1 text-right">%</label>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-6 text-right"><font
														color="red">*</font>商户进件必须满:</label>
														<div class="col-md-2 paddingnone">
															 <input name="effDt" id="effDt" type="number" class="form-control onlyNum" min="0" max="100" required="" data-bv-notempty-message="不能为空"> 
														</div>
														<label for="span-medium-2" class="control-label col-md-0 text-right">天</label>
													<input type="checkbox" name="effDtLimit" id="effDtLimit">启用</label>
												</div>
											</div>
										</div> 
										<div class="row norow">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-6 text-right"><font
														color="red">*</font>商户闪电到账日限额:</label>
													<div class="col-md-5 paddingnone">
														<input name="validRule"
															id="SDDZBiz_Form_mecDayLimit" type="number"
															class="form-control onlyNum">
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-7 text-right"><font
														color="red">*</font>商户近半年内净交易额大于0的天数不小于:</label>
														<div class="col-md-2 paddingnone">
															 <input name="tranDt" id="tranDt" type="number" class="form-control onlyNum" min="0" max="100" required="" data-bv-notempty-message="不能为空"> 
														</div>
														<label for="span-medium-2" class="control-label col-md-0 text-right">天</label>
													<input type="checkbox" name="tranDtLimit" id="tranDtLimit">启用</label>
												</div>
											</div>
										</div>
									</div>
									</form>
								</div>

							</div>
							<!--  -->
							<div class="row norow">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h5 class="panel-title">闪电到账服务时间及金额管理</h5>

									</div>
									
									<div class="panel-body">
										<div class="row norow">
															<div class="portlet-body form">
						<div class="form-body">
										<form id="validRuleForm2" class="form-horizontal" action="" >
											<div class="panel panel-info">
												<div
													class="panel-heading col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<label class="control-label col-md-3 text-left"><h5>结算账户为非银联代付支持银行
															工作日规则</h5> </label>
													<div class="col-md-1 paddingnone" style="float: right;">
														<input type="button" style="float: right;" value="保存"
															class="form-control col-lg-2 col-md-2" onclick="savefunctionsecond()">
													</div>
												</div>
												<div class="panel-body">
													<div class="row norow">申请时间及额度控制</div>
														<div class="row norow">
														<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
															<div class="form-group">
																<label for="span-medium-2"
																	class="control-label col-md-3 text-right"><font
																	color="red">*</font>时段1: </label>
																<div class="col-md-3 paddingnone">
																	<input appStartTm1="validRuleTime"
																		id="SDDZBiz_Form_appStartDt"
																		class="form-control onlyTime">
																</div>
																<label for="span-medium-2"
																	class="control-label col-md-2 text-right"><font
																	color="red">*</font>至: </label>
																<div class="col-md-3 paddingnone">
																	<input name="validRuleTime"
																		id="SDDZBiz_Form_appEndDt1"
																		class="form-control onlyTime">
																</div>
															</div>
														</div>
														<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6">
															<div class="form-group">
																<label class="control-label col-md-3 text-right"><font
																	color="red">*</font>交易下限: </label>
																<div class="col-md-3 paddingnone">
																	<input name="SDDZBiz_Form_tradeMin1"
																		id="SDDZBiz_Form_tradeMin1"
																		type="number" class="form-control onlyNum" min='0'>
																</div>
																<label class="control-label col-md-3 text-right"><font
																	color="red">*</font>提取下限: </label>
																<div class="col-md-3 paddingnone">
																	<input name="SDDZBiz_Form_appMin1"
																		id="SDDZBiz_Form_appMin1"
																		type="number" class="form-control onlyNum" min='0'>
																</div>
															</div>
														</div>
														<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
															<div class="form-group">
																<label class="control-label col-md-4 text-right">提取上限:
																</label>
																<div class="col-md-4 paddingnone">
																	<input name="SDDZBiz_Form_appMax1"
																		id="SDDZBiz_Form_appMax1"
																		type="number" class="form-control onlyNum" min='0'>
																</div>
																<label class="control-label col-md-4 text-right"><input
																	type="checkbox" name="amtNoMax1" id="SDDZBiz_Form_amtNoMax1">无上限</label>

															</div>
														</div>
														<div class="row norow"></div>

													</div>

													<!-- 第二行 -->
													<div class="row norow">
														<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
															<div class="form-group">
																<label for="span-medium-2"
																	class="control-label col-md-3 text-right"><font
																	color="red">*</font>时段2: </label>
																<div class="col-md-3 paddingnone">
																	<input name="validRuleTime"
																		id="SDDZBiz_Form_appStartDt2"
																		class="form-control onlyTime" disabled="disabled">
																</div>
																<label for="span-medium-2"
																	class="control-label col-md-2 text-right"><font
																	color="red">*</font>至: </label>
																<div class="col-md-3 paddingnone">
																	<input name="validRuleTime"
																		id="SDDZBiz_Form_appEndDt2"
																		class="form-control onlyTime">
																</div>
															</div>
														</div>
														<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6">
															<div class="form-group">
																<label class="control-label col-md-3 text-right"><font
																	color="red">*</font>交易下限: </label>
																<div class="col-md-3 paddingnone">
																	<input name="SDDZBiz_Form_tradeMin2"
																		id="SDDZBiz_Form_tradeMin2"
																		type="number" class="form-control onlyNum" min='0'>
																</div>
																<label class="control-label col-md-3 text-right"><font
																	color="red">*</font>提取下限: </label>
																<div class="col-md-3 paddingnone">
																	<input name="SDDZBiz_Form_appMin2"
																		id="SDDZBiz_Form_appMin2"
																		type="number" class="form-control onlyNum" min='0'>
																</div>
															</div>
														</div>
														<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
															<div class="form-group">
																<label class="control-label col-md-4 text-right">提取上限:
																</label>
																<div class="col-md-4 paddingnone">
																	<input name="SDDZBiz_Form_appMax2"
																		id="SDDZBiz_Form_appMax2"
																		type="number" class="form-control onlyNum" min='0'>
																</div>
																<label class="control-label col-md-4 text-right"><input
																	type="checkbox" name="amtNoMax2" id="SDDZBiz_Form_amtNoMax2">无上限</label>

															</div>
														</div>
														<div class="row norow"></div>

													</div>

													<!-- 受理时间及额度控制 -->
													<div class="row norow">受理时间及额度控制</div>
													<div class="row norow">
														<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
															<div class="form-group">
																<label for="span-medium-2"
																	class="control-label col-md-3 text-right"><font
																	color="red">*</font>时段1: </label>
																<div class="col-md-3 paddingnone">
																	<input name="validRuleTime"
																		id="SDDZBiz_Form_accStartDt1"
																		class="form-control onlyTime">
																</div>
																<label for="span-medium-2"
																	class="control-label col-md-2 text-right"><font
																	color="red">*</font>至: </label>
																<div class="col-md-3 paddingnone">
																	<input name="validRuleTime"
																		id="SDDZBiz_Form_accEndDt1"
																		class="form-control onlyTime">
																</div>
															</div>
														</div>
														<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6">
															<div class="form-group">
																<label class="control-label col-md-3 text-right"><font
																	color="red">*</font>交易下限: </label>
																<div class="col-md-3 paddingnone">
																	<input name="SDDZBiz_Form_tradeMin3"
																		id="SDDZBiz_Form_tradeMin3"
																		readonly class="form-control onlyNum" min='0'>
																</div>
																<label class="control-label col-md-3 text-right"><font
																	color="red">*</font>提取下限: </label>
																<div class="col-md-3 paddingnone">
																	<input name="SDDZBiz_Form_accMin1"
																		id="SDDZBiz_Form_accMin1"
																		readonly class="form-control onlyNum" min='0'>
																</div>
															</div>
														</div>
														<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
															<div class="form-group">
																<label class="control-label col-md-4 text-right">提取上限:
																</label>
																<div class="col-md-4 paddingnone">
																	<input name="SDDZBiz_Form_accMax1"
																		id="SDDZBiz_Form_accMax1"
																		readonly class="form-control onlyNum" min='0'>
																</div>
																<label class="control-label col-md-4 text-right"><input
																	type="checkbox" name="amtNoMax1T" id="SDDZBiz_Form_amtNoMax1T" disabled="disabled">无上限</label>

															</div>
														</div>
														<div class="row norow"></div>

													</div>

													<!-- 第二行 -->
													<div class="row norow">
														<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
															<div class="form-group">
																<label for="span-medium-2"
																	class="control-label col-md-3 text-right"><font
																	color="red">*</font>时段2: </label>
																<div class="col-md-3 paddingnone">
																	<input name="validRuleTime"
																		id="SDDZBiz_Form_accStartDt2"
																		class="form-control onlyTime" disabled="disabled">
																</div>
																<label for="span-medium-2"
																	class="control-label col-md-2 text-right"><font
																	color="red">*</font>至: </label>
																<div class="col-md-3 paddingnone">
																	<input name="validRuleTime"
																		id="SDDZBiz_Form_accEndDt2"
																		class="form-control onlyTime">
																</div>
															</div>
														</div>
														<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6">
															<div class="form-group">
																<label class="control-label col-md-3 text-right"><font
																	color="red">*</font>交易下限: </label>
																<div class="col-md-3 paddingnone">
																	<input name="SDDZBiz_Form_tradeMin4"
																		id="SDDZBiz_Form_tradeMin4"
																		readonly class="form-control onlyNum" min='0'>
																</div>
																<label class="control-label col-md-3 text-right"><font
																	color="red">*</font>提取下限: </label>
																<div class="col-md-3 paddingnone">
																	<input name="SDDZBiz_Form_accMin2"
																		id="SDDZBiz_Form_accMin2"
																		readonly class="form-control onlyNum" min='0'>
																</div>
															</div>
														</div>
														<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
															<div class="form-group">
																<label class="control-label col-md-4 text-right">提取上限:
																</label>
																<div class="col-md-4 paddingnone">
																	<input name="SDDZBiz_Form_accMax2"
																		id="SDDZBiz_Form_accMax2"
																		readonly class="form-control onlyNum" min='0'>
																</div>
																<label class="control-label col-md-4 text-right"><input
																	type="checkbox" name="amtNoMax2T" id="SDDZBiz_Form_amtNoMax2T" disabled="disabled">无上限</label>

															</div>
														</div>
														<div class="row norow"></div>

													</div>
												</div>
											</div>
											</form>
											</div>
											</div>
										</div>
										<!-- 结算账户为非银联代付支持银行 非工作日规则 -->
										<div class="row norow">
															<div class="portlet-body form">
						<div class="form-body">
										<form id="validRuleForm3" class="form-horizontal" action="">
											<div class="panel panel-info">
												<div
													class="panel-heading col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<label class="control-label col-md-3 text-left"><h5>结算账户为非银联代付支持银行
															非工作日规则</h5> </label>
													<div class="col-md-1 paddingnone" style="float: right;">
														<input type="button" style="float: right;" value="保存"
															class="form-control col-lg-2 col-md-2" onclick="savefunctionthird()">
													</div>
												</div>
												<div class="panel-body">
													<div class="row norow">时间及额度控制</div>
													<div class="row norow">
														<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
															<div class="form-group">
																<label for="span-medium-2"
																	class="control-label col-md-3 text-right"><font
																	color="red">*</font>时段1: </label>
																<div class="col-md-3 paddingnone">
																	<input name="validRuleTime"
																		id="SDDZBiz_Form_startTm5"
																		class="form-control onlyTime">
																</div>
																<label for="span-medium-2"
																	class="control-label col-md-2 text-right"><font
																	color="red">*</font>至: </label>
																<div class="col-md-3 paddingnone">
																	<input name="validRuleTime"
																		id="SDDZBiz_Form_endTm5"
																		class="form-control onlyTime">
																</div>
															</div>
														</div>
														<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6">
															<div class="form-group">
																<label class="control-label col-md-3 text-right"><font
																	color="red">*</font>交易下限: </label>
																<div class="col-md-3 paddingnone">
																	<input name="SDDZBiz_Form_tradeMin5"
																		id="SDDZBiz_Form_tradeMin5"
																		type="number" class="form-control onlyNum" min='0'>
																</div>
																<label class="control-label col-md-3 text-right"><font
																	color="red">*</font>提取下限: </label>
																<div class="col-md-3 paddingnone">
																	<input name="SDDZBiz_Form_amtMin5"
																		id="SDDZBiz_Form_amtMin5"
																		type="number" class="form-control onlyNum" min='0'>
																</div>
															</div>
														</div>
														<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
															<div class="form-group">
																<label class="control-label col-md-4 text-right">提取上限:
																</label>
																<div class="col-md-4 paddingnone">
																	<input name="SDDZBiz_Form_amtMax5"
																		id="SDDZBiz_Form_amtMax5"
																		type="number" class="form-control onlyNum" min='0'>
																</div>
																<label class="control-label col-md-4 text-right"><input
																	type="checkbox" name="amtNoMax5" id="SDDZBiz_Form_amtNoMax5">无上限</label>

															</div>
														</div>
														<div class="row norow"></div>

													</div>
												</div>
											</div>
											</form>
											</div>
											</div>

										</div>
										<!-- end panel  -->
										<!-- 银联代付支持银行规则 -->

										<div class="row norow">
															<div class="portlet-body form">
						<div class="form-body">
										<form id="validRuleForm4" class="form-horizontal" action="">
											<div class="panel panel-info">
												<div
													class="panel-heading col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<label class="control-label col-md-2 text-left"><h5>银联代付支持银行规则</h5>
													</label>
													<div class="col-md-1 paddingnone" style="float: right;">
														<input type="button" style="float: right;" value="保存"
															class="form-control col-lg-2 col-md-2" onclick="savefunctionfourth()">
													</div>
												</div>
												<div class="panel-body">
													<div class="row norow">时间及额度控制</div>
													<div class="row norow">
														<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
															<div class="form-group">
																<label for="span-medium-2"
																	class="control-label col-md-3 text-right"><font
																	color="red">*</font>时段1: </label>
																<div class="col-md-3 paddingnone">
																	<input name="validRuleTime"
																		id="SDDZBiz_Form_startTm6"
																		class="form-control onlyTime">
																</div>
																<label for="span-medium-2"
																	class="control-label col-md-2 text-right"><font
																	color="red">*</font>至: </label>
																<div class="col-md-3 paddingnone">
																	<input name="validRuleTime"
																		id="SDDZBiz_Form_endTm6"
																		class="form-control onlyTime">
																</div>
															</div>
														</div>
														<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6">
															<div class="form-group">
																<label class="control-label col-md-3 text-right"><font
																	color="red">*</font>交易下限: </label>
																<div class="col-md-3 paddingnone">
																	<input name="SDDZBiz_Form_tradeMin6"
																		id="SDDZBiz_Form_tradeMin6"
																		type="number" class="form-control onlyNum" min='0'>
																</div>
																<label class="control-label col-md-3 text-right"><font
																	color="red">*</font>提取下限: </label>
																<div class="col-md-3 paddingnone">
																	<input name="SDDZBiz_Form_amtMin6"
																		id="SDDZBiz_Form_amtMin6"
																		type="number" class="form-control onlyNum" min='0'>
																</div>
															</div>
														</div>
														<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
															<div class="form-group">
																<label class="control-label col-md-4 text-right">提取上限:
																</label>
																<div class="col-md-4 paddingnone">
																	<input name="SDDZBiz_Form_amtMax6"
																		id="SDDZBiz_Form_amtMax6"
																		type="number" class="form-control onlyNum" min='0'>
																</div>
																<label class="control-label col-md-4 text-right"><input
																	type="checkbox" name="amtNoMax6" id="SDDZBiz_Form_amtNoMax6">无上限</label>

															</div>
														</div>
														<div class="row norow"></div>

													</div>
												</div>
											</div>
										</form>
										</div>
										</div>
										</div>

										<!-- end panel -->

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- BEGIN FOOTER -->
	<jsp:include page="../common/footer.jsp" flush="true" />
	<!-- END FOOTER -->


	<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.0/js/bootstrap-select.min.js"></script> -->
	<script type="text/javascript">

		//行业大类，商户推展类型,商户类型在码表中加载数据
		function getComboStore(element, type_code) {
			$.ajax({
				type : "GET",
				url : baseURL + "/code/query/typ/" + type_code,
				contentType : "application/json;charset=utf-8",
				dataType : "json",
				success : function(data) {
					$("#" + element).empty();
					$("#" + element).append(
							$("<option></option>").val("").text("全部"));
					$.each(data, function(index, obj) {
						$("#" + element).append(
								$("<option></option>").val(obj.cdVl).text(
										obj.cdNm));
					});
					//更新内容刷新到相应的位置
					$("#" + element).selectpicker('render');
					$("#" + element).selectpicker('refresh');
				},
				error : function(error) {
				}
			});
		}



		$(function() {
			/*初始化页面按钮权限*/
			/*     	if (!hasPermission(PERMISSSIONCONST.TZERO501)) {$("#query_btn").hide();}
			 if (!hasPermission(PERMISSSIONCONST.TZERO501)) {$("#exportexcel_btn").hide();} */

			$(".onlyNum").onlyNum();

			 $('#validRuleForm').validate({
		    	  //errorElement:"span", errorClass:"help-block help-block-error",
			        rules: {
			        	validRule: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			        	SDDZBiz_Form_accountTime: {
			        		required: true, 
			                number: true,
			                min: 0,
			                max: 99
			        	},
			        	SDDZBiz_Form_sesRate: {
		            		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 100
			        	},
			        	effDt:{
			        		required:true,
			        		min: 0,
			            	max:100,
			            	regex:/^\d*$/
			        	},
			        	tranDt:{
			        		required:true,
			        		min: 0,
			            	max:100,
			            	regex:/^\d*$/
			        	}
			        },
			        messages: {
			            	validRule: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
						 SDDZBiz_Form_accountTime: {
							 required: '不能为空',
					     		number: '请填写数字',
					     		min: '最小值为0',
					     		max: '最大值为99'
					     	},
					     	SDDZBiz_Form_sesRate: {
					     		required: '不能为空',
					     		number: '请填写数字',
					     		min: '最小值为0',
					     		max: '最大值为100'
					     	}, 
					     	effDt: {
					     		required: '不能为空',
					     		min: '最小值为0',
					     		max: '最大值为100',
					     		regex:'输入框仅支持输入非负整数'
					     	},
					     	tranDt: {
					     		required: '不能为空',
					     		min: '最小值为0',
					     		max: '最大值为100',
					     		regex:'输入框仅支持输入非负整数'
					     	},
			        	
			        }
			    }); 
			 
			    
			 $('#validRuleForm2').validate({
		    	  //errorElement:"span", errorClass:"help-block help-block-error",
			        rules: {
			        	SDDZBiz_Form_tradeMin1: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			        	SDDZBiz_Form_appMin1: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			        	SDDZBiz_Form_appMax1: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			        	
			        	
			        	
			        	
			        	SDDZBiz_Form_tradeMin2: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			        	SDDZBiz_Form_appMin2: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			        	SDDZBiz_Form_appMax2: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			        	
			        	
			        	SDDZBiz_Form_tradeMin3: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			        	SDDZBiz_Form_accMin1: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			        	SDDZBiz_Form_accMax1: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			        	
			        	
			        	SDDZBiz_Form_tradeMin4: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			        	SDDZBiz_Form_accMin2: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			        	SDDZBiz_Form_accMax2: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			        },
			        messages: {
			        	
			        	SDDZBiz_Form_tradeMin1: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
			        	SDDZBiz_Form_appMin1: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
			        	SDDZBiz_Form_appMax1: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
			        	
			        	
			        	
			        	
			        	SDDZBiz_Form_tradeMin2: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
			        	SDDZBiz_Form_appMin2: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
			        	SDDZBiz_Form_appMax2: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
			        	
			        	
			        	SDDZBiz_Form_tradeMin3: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
			        	SDDZBiz_Form_accMin1: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
			        	SDDZBiz_Form_accMax1: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
			        	
			        	
			        	SDDZBiz_Form_tradeMin4: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
			        	SDDZBiz_Form_accMin2: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
			        	SDDZBiz_Form_accMax2: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},

			        }
			    });
			 
			 $('#validRuleForm3').validate({
		    	  //errorElement:"span", errorClass:"help-block help-block-error",
			        rules: {
			        	SDDZBiz_Form_tradeMin5: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			 			SDDZBiz_Form_amtMin5: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
						 SDDZBiz_Form_amtMax5: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	}
			        },
			        messages: {
			        	
			        	SDDZBiz_Form_tradeMin5: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
			 			SDDZBiz_Form_amtMin5: {
			 				required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
						 SDDZBiz_Form_amtMax5: {
							 required: '不能为空',
				        		number: '请填写数字',
				        		min: '最小值为0',
				        		max: '最大值为999999999999'
			        	}
			        }
			    });
			 
			 $('#validRuleForm4').validate({
		    	  //errorElement:"span", errorClass:"help-block help-block-error",
			        rules: {
			        	SDDZBiz_Form_tradeMin6: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
			 			SDDZBiz_Form_amtMin6: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	},
						 SDDZBiz_Form_amtMax6: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 999999999999
			        	}
			        },
			        messages: {
			        	
			        	SDDZBiz_Form_tradeMin6: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
			 			SDDZBiz_Form_amtMin6: {
			 				required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为999999999999'
			        	},
						 SDDZBiz_Form_amtMax6: {
							 required: '不能为空',
				        		number: '请填写数字',
				        		min: '最小值为0',
				        		max: '最大值为999999999999'
			        	}
			        }
			    });
			 

			 
			
			initFirstPanel();

			
			$('input:checkbox[name=mecNoMax]').on('click', function(){
				if($('input:checkbox[name=mecNoMax]').eq(0)[0].checked){
					$("#SDDZBiz_Form_mecNum").attr('disabled', true);
				
				}else{
					$("#SDDZBiz_Form_mecNum").attr('disabled', false);
					
				}
			});
			
			//第二行第一段的测试
			$("#SDDZBiz_Form_appEndDt1").on('blur', function(){
				var mi = parseInt($('#SDDZBiz_Form_appEndDt1').val().substring(3,5));
				var hh = parseInt($('#SDDZBiz_Form_appEndDt1').val().substring(0,2));
				if(!(isNaN(mi)||isNaN(mi))){
					if(mi=='59'){
						hh = hh +1;
						mi =parseInt("0");
					}else{
						mi = mi +1;
					}
					if(mi<10){
						mi = "0"+mi;
					}
					if(hh<10){
						hh = "0"+hh;
					}
					$('#SDDZBiz_Form_appStartDt2').val(hh+":"+mi);
			}
		});
		/* end blur  */
		
		$("#SDDZBiz_Form_tradeMin1").on('change', function(){
			var mi = $('#SDDZBiz_Form_tradeMin1').val();//SDDZBiz_Form_accMin1
			$('#SDDZBiz_Form_tradeMin3').val(mi);
		});
		
		$("#SDDZBiz_Form_appMin1").on('change', function(){
			var mi = $('#SDDZBiz_Form_appMin1').val();//SDDZBiz_Form_accMin1
			$('#SDDZBiz_Form_accMin1').val(mi);
		});
		
		$("#SDDZBiz_Form_appMax1").on('change', function(){
			var mi = $('#SDDZBiz_Form_appMax1').val();//SDDZBiz_Form_accMin1
			$('#SDDZBiz_Form_accMax1').val(mi);
		});
		
		$('input:checkbox[name=appNoMax1]').on('click', function(){
			if($('input:checkbox[name=appNoMax1]').eq(0)[0].checked){
				$('input:checkbox[name=accNoMax1]').eq(0).attr("checked",true);
				$('input:checkbox[name=appNoMax1]').eq(0).attr("checked",true);
				
				$('#SDDZBiz_Form_accMax1').attr('disabled', true);
				$('#SDDZBiz_Form_appMax1').attr('disabled', true);
			
			}else{
				$('input:checkbox[name=accNoMax1]').eq(0).attr("checked",false);
				$('input:checkbox[name=appNoMax1]').eq(0).attr("checked",false);
				
				$('#SDDZBiz_Form_accMax1').attr('disabled', false);
				$('#SDDZBiz_Form_appMax1').attr('disabled', false);
				
			}
		});
		
		/* end 第一个  第一行 */
		
		/* 第二段第二行中的测试程序 */
		
		
				
		$("#SDDZBiz_Form_tradeMin2").on('change', function(){
			var mi = $('#SDDZBiz_Form_tradeMin2').val();//SDDZBiz_Form_accMin1
			$('#SDDZBiz_Form_tradeMin4').val(mi);
		});
		
		$("#SDDZBiz_Form_appMin2").on('change', function(){
			var mi = $('#SDDZBiz_Form_appMin2').val();//SDDZBiz_Form_accMin1
			$('#SDDZBiz_Form_accMin2').val(mi);
		});
		
		$("#SDDZBiz_Form_appMax2").on('change', function(){
			var mi = $('#SDDZBiz_Form_appMax2').val();//SDDZBiz_Form_accMin1
			$('#SDDZBiz_Form_accMax2').val(mi);
		});
		
		$('input:checkbox[name=amtNoMax2]').on('click', function(){
			if($('input:checkbox[name=amtNoMax2]').eq(0)[0].checked){
				/* $('input:checkbox[name=amtNoMax2T]').eq(0).attr("checked",true); */
			/* 	$('input:checkbox[name=appNoMax2]').eq(0).attr("checked",true); */
				
				document.getElementById("SDDZBiz_Form_amtNoMax2T").checked = true;
				$('#SDDZBiz_Form_appMax2').attr('disabled', true);
				$('#SDDZBiz_Form_accMax2').attr('disabled', true);
			
			}else{/* 
				$('input:checkbox[name=amtNoMax2T]').eq(0).attr("checked",false); */
				document.getElementById("SDDZBiz_Form_amtNoMax2T").checked = false;
				/* $('input:checkbox[name=appNoMax2]').eq(0).attr("checked",false);
				 */
				$('#SDDZBiz_Form_accMax2').attr('disabled', false);
				$('#SDDZBiz_Form_appMax2').attr('disabled', false);
				
			}
		});
		
		//第一个无上限的checkbox的响应事件
		$('input:checkbox[name=amtNoMax1]').on('click', function(){
			if($('input:checkbox[name=amtNoMax1]').eq(0)[0].checked){
				
				document.getElementById("SDDZBiz_Form_amtNoMax1T").checked = true;
				$('#SDDZBiz_Form_appMax1').attr('disabled', true);
				$('#SDDZBiz_Form_accMax1').attr('disabled', true);
			
			}else{
				/* $('input:checkbox[name=amtNoMax1T]').eq(0).attr("checked",false);
				$('input:checkbox[name=amtNoMax1]').eq(0).attr("checked",false); */
				
				document.getElementById("SDDZBiz_Form_amtNoMax1T").checked = false;
				
				$('#SDDZBiz_Form_accMax1').attr('disabled', false);
				$('#SDDZBiz_Form_appMax1').attr('disabled', false);
				
			}
		});
		
		/* 结束第二段第二行 */
		
		/* 开始第二段第三行 */
		$("#SDDZBiz_Form_accEndDt1").on('blur', function(){
				var mi = parseInt($('#SDDZBiz_Form_accEndDt1').val().substring(3,5));
				var hh = parseInt($('#SDDZBiz_Form_accEndDt1').val().substring(0,2));
				if(!(isNaN(mi)||isNaN(mi))){
					if(mi=='59'){
						hh = hh +1;
						mi =parseInt("0");
					}else{
						mi = mi +1;
					}
					if(mi<10){
						mi = "0"+mi;
					}
					if(hh<10){
						hh = "0"+hh;
					}
					if(mi!=NaN&&hh!='NaN'){
					$('#SDDZBiz_Form_accStartDt2').val(hh+":"+mi);
					}
					}
		});
		/* 结束第二段第三行 */

		
		/* 开始第三段 */
		$("#SDDZBiz_Form_appMin1").on('change', function(){
			var mi = $('#SDDZBiz_Form_appMin1').val();//SDDZBiz_Form_accMin1
			$('#SDDZBiz_Form_accMin1').val(mi);
		});
		
		$("#SDDZBiz_Form_appMax1").on('change', function(){
			var mi = $('#SDDZBiz_Form_appMax1').val();//SDDZBiz_Form_accMin1
			$('#SDDZBiz_Form_accMax1').val(mi);
		});
		
		$('input:checkbox[name=amtNoMax5]').on('click', function(){
			if($('input:checkbox[name=amtNoMax5]').eq(0)[0].checked){
				$('#SDDZBiz_Form_amtMax5').attr('disabled', true);
			}else{
				$('#SDDZBiz_Form_amtMax5').attr('disabled', false);
				
			}
		});
		
		/* 结束第三段 */
		
		
		$('input:checkbox[name=amtNoMax6]').on('click', function(){
			if($('input:checkbox[name=amtNoMax6]').eq(0)[0].checked){
				$('#SDDZBiz_Form_amtMax6').attr('disabled', true);
			}else{
				$('#SDDZBiz_Form_amtMax6').attr('disabled', false);
				
			}
		});

		
		
		$(".onlyTime").on('blur', function(){
			var tempVal = $(this).val();
			//alert(tempVal.match(/^([0-1][0-9]|2[0-3]):([0-5][0-9])$/));
			if(tempVal.match(/^([0-1][0-9]|2[0-3]):([0-5][0-9])$/) == null){
				bootbox.alert("输入时间格式错误!");
				var element = $(this).attr('id');
				$("#" + element).val("00:00");
				//doucment.getElementById(element).value = tempVal
				
				//this.value = tempVal;
				//$(this).val(tempVal);
			}
		});

});

		// ----------------------------------------------------------------------
		// <summary>
		// 限制只能输入数字
		// </summary>
		// ----------------------------------------------------------------------
		$.fn.onlyNum = function() {
			$(this).keypress(
							function(event) {
								var eventObj = event || e;
								var keyCode = eventObj.keyCode
										|| eventObj.which;
								if ((((keyCode >= 48 && keyCode <= 57) || (keyCode == 8 || keyCode == 46))))
									return true;
								else
									return false;
							}).focus(function() {
						//禁用输入法
						this.style.imeMode = 'disabled';
					}).bind("paste", function() {
						//获取剪切板的内容
						var clipboard = window.clipboardData.getData("Text");
						if (/^\d+$/.test(clipboard))
							return true;
						else
							return false;
					});
		};
		
		
		

		
		//初始化操作面板
		function initFirstPanel(){
			//document.getElementById("SDDZBiz_Form_amtNoMax2T").checked = false;
			$('#SDDZBiz_Form_mecNum').attr('disabled', false);
			//$('input:checkbox[name=mecNoMax]').eq(0).attr("checked",false);
			document.getElementById("SDDZBiz_Form_mecNoMax").checked = false;
			
			
    		document.getElementById("SDDZBiz_Form_amtNoMax1").checked = false;
			$('#SDDZBiz_Form_appMax1').attr('disabled', false);
			
			
    		document.getElementById("SDDZBiz_Form_amtNoMax2").checked = false;
			//$('input:checkbox[name=amtNoMax2]').eq(0).attr("checked",true);
			$('#SDDZBiz_Form_appMax2').attr('disabled', false);
			
    		document.getElementById("SDDZBiz_Form_amtNoMax1T").checked = false;
			//$('input:checkbox[name=amtNoMax1T]').eq(0).attr("checked",true);
			$('#SDDZBiz_Form_accMax1').attr('disabled', false);
			
			
    		document.getElementById("SDDZBiz_Form_amtNoMax2T").checked = false;
			//$('input:checkbox[name=amtNoMax2T]').eq(0).attr("checked",true);
			$('#SDDZBiz_Form_accMax2').attr('disabled', false);
							
			document.getElementById("SDDZBiz_Form_amtNoMax5").checked = false;
			//$('input:checkbox[name=amtNoMax5]').eq(0).attr("checked",true);
			$('#SDDZBiz_Form_amtMax5').attr('disabled', false);
			
			document.getElementById("SDDZBiz_Form_amtNoMax6").checked = false;
			//$('input:checkbox[name=amtNoMax6]').eq(0).attr("checked",true);
			$('#SDDZBiz_Form_amtMax6').attr('disabled', false);		
							
			var ajaxUrl = baseURL + "/sddz/sddzBizQuery";
			$.ajax({
	            type: "GET",
	            url: ajaxUrl,
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            async:false,
	            dataType: "json",
	            success: function(json) {
	            	if(json.timeout){
	            		ajaxTimeout();
	                }else{
	            	
	            	if (!json.success) {
						//闪电到账状态正常
						bootbox.alert('提示ccc');
					}else{
						
						/* 初始化第一个面板的数据 */
						$('#SDDZBiz_Form_notValidateAmt').val(json.notValidateAmt);
						$('#SDDZBiz_Form_mecNum').val(json.mecNum);
						$('#SDDZBiz_Form_accountTime').val(json.accountTime);
						$('#SDDZBiz_Form_sesRate').val(json.sesRate);
						
						if(json.mecNoMax == '1'){
							$('#SDDZBiz_Form_mecNum').attr('disabled', true);
							document.getElementById("SDDZBiz_Form_mecNoMax").checked = true;
							//$('input:checkbox[name=mecNoMax]').eq(0).attr("checked",true);
						}
						$('#SDDZBiz_Form_mecDayLimit').val(json.mecDayLimit);
						$('#effDt').val(json.effDt);
						$('#tranDt').val(json.tranDt);
						if(json.effDtLimit=='1'){
		            		$("#effDtLimit").prop("checked",true);
		            	}
		           		if(json.tranDtLimit=='1'){
		            		$("#tranDtLimit").prop("checked",true);
		            	}
						
						
						/* $('#SDDZBiz_Form_appStartDtaaaaa').val(json.accEndTm1); */
						/* 第二个面板 */
					   $('#SDDZBiz_Form_appStartDt').val(json.appStartTm1);
          			   $('#SDDZBiz_Form_appEndDt1').val(json.appEndTm1);
        			   $('#SDDZBiz_Form_appStartDt2').val(json.appStartTm2);
        	   			$('#SDDZBiz_Form_appEndDt2').val(json.appEndTm2);
        	   			$('#SDDZBiz_Form_appMax2').val(json.amtMax2);
        			   $('#SDDZBiz_Form_appMax1').val(json.amtMax1);
        	   			//提取下限
        			   $('#SDDZBiz_Form_appMin1').val(json.amtMin1);
        	   			$('#SDDZBiz_Form_appMin2').val(json.amtMin2);
        	   			
        			   $('#SDDZBiz_Form_accMin1').val(json.amtMin1T);
        	   			$('#SDDZBiz_Form_accMin2').val(json.amtMin2T);
        	   			
          	   			$('#SDDZBiz_Form_accMax2').val(json.amtMax2T);
         			   $('#SDDZBiz_Form_accMax1').val(json.amtMax1T);
        	   			
        	   			$('#SDDZBiz_Form_accStartDt1').val(json.accStartTm1);
        	   			$('#SDDZBiz_Form_accEndDt1').val(json.accEndTm1);
        	   			$('#SDDZBiz_Form_accStartDt2').val(json.accStartTm2);
        	   			$('#SDDZBiz_Form_accEndDt2').val(json.accEndTm2);

        	  			 $('#SDDZBiz_Form_tradeMin1').val(json.tradeMin1);
        	  			 $('#SDDZBiz_Form_tradeMin2').val(json.tradeMin2);
        	  			 $('#SDDZBiz_Form_tradeMin3').val(json.tradeMin3);
        	  			 $('#SDDZBiz_Form_tradeMin4').val(json.tradeMin4);
						
						
    					if(json.amtNoMax1 == '1'){
    						document.getElementById("SDDZBiz_Form_amtNoMax1").checked = true;
						//	$('input:checkbox[name=amtNoMax1]').eq(0).attr("checked",true);
							$('#SDDZBiz_Form_appMax1').attr('disabled', true);
							
						}
 
    					if(json.amtNoMax2 == '1'){
    						document.getElementById("SDDZBiz_Form_amtNoMax2").checked = true;
							//$('input:checkbox[name=amtNoMax2]').eq(0).attr("checked",true);
							$('#SDDZBiz_Form_appMax2').attr('disabled', true);
						}
    					
    					if(json.amtNoMax1T == '1'){
    						
    						document.getElementById("SDDZBiz_Form_amtNoMax1T").checked = true;
							//$('input:checkbox[name=amtNoMax1T]').eq(0).attr("checked",true);
							$('#SDDZBiz_Form_accMax1').attr('disabled', true);
						}
    					if(json.amtNoMax2T == '1'){
    						document.getElementById("SDDZBiz_Form_amtNoMax2T").checked = true;
							//$('input:checkbox[name=amtNoMax2T]').eq(0).attr("checked",true);
							$('#SDDZBiz_Form_accMax2').attr('disabled', true);
						}
         	   			
         	   			
						
						
						/*第三个面板  */
                        $('#SDDZBiz_Form_startTm5').val(json.startTm5);
    					$('#SDDZBiz_Form_endTm5').val(json.endTm5);
    					$('#SDDZBiz_Form_amtMax5').val(json.amtMax5);
    					$('#SDDZBiz_Form_amtMin5').val(json.amtMin5);
    					if(json.amtNoMax5 == '1'){
    						document.getElementById("SDDZBiz_Form_amtNoMax5").checked = true;
							//$('input:checkbox[name=amtNoMax5]').eq(0).attr("checked",true);
							$('#SDDZBiz_Form_amtMax5').attr('disabled', true);
						}
    					$('#SDDZBiz_Form_tradeMin5').val(json.tradeMin5);
    					
    					/* 第四个 */
    					$('#SDDZBiz_Form_startTm6').val(json.startTm6);
    					$('#SDDZBiz_Form_endTm6').val(json.endTm6);
    					$('#SDDZBiz_Form_amtMax6').val(json.amtMax6);
    					$('#SDDZBiz_Form_amtMin6').val(json.amtMin6);
    					if(json.amtNoMax6 == '1'){
    						document.getElementById("SDDZBiz_Form_amtNoMax6").checked = true;
							//$('input:checkbox[name=amtNoMax6]').eq(0).attr("checked",true);
							$('#SDDZBiz_Form_amtMax6').attr('disabled', true);
						}
    					$('#SDDZBiz_Form_tradeMin6').val(json.tradeMin6);
						
    					
    					
						
					}
	               }
	            	
	            },
	            error: function(json) {

	            	bootbox.alert("系统异常， 请稍后重试!  ");

	            }
	        });
			
			
		}


		//校验是否上限
		function IsChecked(value) {
			var val = "0";
			if(value==true){
				val = "1";
			}
			return val;
		}
		
		/* 保存函数  保存闪电到账业务规则管理中的内容 */

		function savefunctionfirst(){
			//alert($('#validRuleForm').valid());
			
			if(!$('#validRuleForm').valid()){
				bootbox.alert("请检查数据格式!");
				return;
			}else{
			
			var notValidateAmt=$('#SDDZBiz_Form_notValidateAmt').val();
			var mecNum=$('#SDDZBiz_Form_mecNum').val();
			var accountTime=$('#SDDZBiz_Form_accountTime').val();
			var sesRate=$('#SDDZBiz_Form_sesRate').val();
			var mecDayLimit=$('#SDDZBiz_Form_mecDayLimit').val();
			var effDt=$('#effDt').val();
			var tranDt=$('#tranDt').val();
			var effDtLimit = IsChecked($('#effDtLimit').prop("checked"));
    		var tranDtLimit = IsChecked($('#tranDtLimit').prop("checked"));
			
			if(notValidateAmt == "" || notValidateAmt == null){
				bootbox.alert("数据不能为空请检查!");
				return;
			}
			if(mecNum == "" || mecNum == null){
				bootbox.alert("数据不能为空请检查!");
				return;
			}
			if(accountTime == "" || accountTime == null){
				bootbox.alert("数据不能为空请检查!");
				return;
			}
			if(sesRate == "" || sesRate == null){
				bootbox.alert("数据不能为空请检查!");
				return;
			}
			if(mecDayLimit == "" || mecDayLimit == null){
				bootbox.alert("数据不能为空请检查!");
				return;
			}
			
			var mecNoMax = false;
			//
			if($('input:checkbox[name=mecNoMax]').eq(0)[0].checked){
				mecNoMax = true;
			}
			
			//数据验证
			if(mecNoMax==false && mecNum==null){
				bootbox.alert('单日单卡可发起商户数不准确！');
				return
			};
			
			var ajaxUrl = baseURL + "/sddz/sddzBizUpdate";
			$.ajax({
	            type: "POST",
	            url: ajaxUrl,
	            data : {
					notValidateAmt:notValidateAmt,
					mecNum:mecNum,
					accountTime:accountTime,
					sesRate:sesRate,
					mecNoMax:mecNoMax,
					mecDayLimit:mecDayLimit,
					effDtLimit:effDtLimit,
					tranDtLimit,tranDtLimit,
					effDt:effDt,
					tranDt,tranDt
				},
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            async:false,
	            dataType: "json",
	            success: function(json) {
	            	if (json.success) {
						//闪电到账状态正常
						bootbox.alert('更新数据成功！');
					}else{
						//闪电到账状态暂停
						bootbox.alert('更新数据失败！');
					}
	            	
	            },
	            error: function(json) {
	            	if(json){
	            		//bootbox.alert(json.msgInf);	
	            	}
	            }
	        });
			}
		}
		
		/* 结束闪电到账业务规则管理 */
		
		
		/* 保存函数  保存闪电到账服务时间及金额管理中的内容 */
		function savefunctionsecond(){
			
			if(!$('#validRuleForm2').valid()){
				bootbox.alert("请检查数据格式!");
				return;
			}else{
			var appStartTm1 = parseInt($('#SDDZBiz_Form_appStartDt').val().replace(":", ""));
          	var appEndTm1=  parseInt($('#SDDZBiz_Form_appEndDt1').val().replace(":", ""));
        	var amtMax1=$('#SDDZBiz_Form_appMax1').val();
        	var amtMin1=$('#SDDZBiz_Form_appMin1').val();
        	var appStartTm2=parseInt($('#SDDZBiz_Form_appStartDt2').val().replace(":", ""));
        	var appEndTm2=parseInt($('#SDDZBiz_Form_appEndDt2').val().replace(":", ""));
        	var amtMax2=$('#SDDZBiz_Form_appMax2').val();
        	var amtMin2=$('#SDDZBiz_Form_appMin2').val();
        	var accStartTm1=parseInt($('#SDDZBiz_Form_accStartDt1').val().replace(":", ""));
        	var accEndTm1=parseInt($('#SDDZBiz_Form_accEndDt1').val().replace(":", ""));
        	var accStartTm2=parseInt($('#SDDZBiz_Form_accStartDt2').val().replace(":", ""));
        	var accEndTm2=parseInt($('#SDDZBiz_Form_accEndDt2').val().replace(":", ""));
        	
        	
        	
        	var amtNoMax1= false;
        	if($('input:checkbox[name=amtNoMax1]').eq(0)[0].checked){
        		amtNoMax1 = true;
			}
        	
        	var amtNoMax2= false;
        	if($('input:checkbox[name=amtNoMax2]').eq(0)[0].checked){
        		amtNoMax2 = true;
			}
        	var tradeMin1=$('#SDDZBiz_Form_tradeMin1').val();
        	var tradeMin2=$('#SDDZBiz_Form_tradeMin2').val();
        	var tradeMin3=$('#SDDZBiz_Form_tradeMin3').val();
        	var tradeMin4=$('#SDDZBiz_Form_tradeMin4').val();
		
        	//数据验证
        	//申请时间验证
			if(appStartTm1>appEndTm1){
				bootbox.alert('申请起始时间大于结束时间！');
				return
			};
			if(appStartTm2-1!=appEndTm1){
				bootbox.alert('申请时间存在交叉或间断！');
				return
			};
			if(appStartTm2>appEndTm2){
				bootbox.alert('申请起始时间大于结束时间！');
				return
			};
			
			//受理时间验证
			if(accStartTm1>accEndTm1){
				bootbox.alert('受理起始时间大于结束时间！');
				return
			};
			if(accEndTm1+1!=accStartTm2){
				bootbox.alert('受理时间存在交叉或间断！');
				return
			};
			if(accStartTm2>accEndTm2){
				bootbox.alert('受理起始时间大于结束时间！');
				return
			};
			
			//金额验证
			if(amtNoMax1==false && (amtMax1<amtMin1||amtMax1==null||amtMin1==null)){
				bootbox.alert('提取上限要大于等于提取下限！');
				return
			};
			//amtMax2==null||amtMin2==null||   ||amtMin1=null||
			if(amtNoMax2==false && (amtMax2<amtMin2||amtMin2==null||amtMax2==null)){
				bootbox.alert('提取上限要大于等于提取下限！');
				return
			};
			if(tradeMin1==null || tradeMin2== null || tradeMin3==null || tradeMin4== null
					||tradeMin1 != tradeMin3 || tradeMin2 != tradeMin4){
				bootbox.alert('交易下限不准确！');
				return
			};
        	
			var ajaxUrl = baseURL + "/sddz/sddzBizUpdate";
			$.ajax({
	            type: "POST",
	            url: ajaxUrl,
	            data : {
	            	appStartTm1 : $('#SDDZBiz_Form_appStartDt').val(),
					appEndTm1:  $('#SDDZBiz_Form_appEndDt1').val(),
					amtMax1:$('#SDDZBiz_Form_appMax1').val(),
					amtMin1:$('#SDDZBiz_Form_appMin1').val(),
					appStartTm2:$('#SDDZBiz_Form_appStartDt2').val(),
					appEndTm2:$('#SDDZBiz_Form_appEndDt2').val(),
					amtMax2:$('#SDDZBiz_Form_appMax2').val(),
					amtMin2:$('#SDDZBiz_Form_appMin2').val(),
					accStartTm1:$('#SDDZBiz_Form_accStartDt1').val(),
					accEndTm1:$('#SDDZBiz_Form_accEndDt1').val(),
					accStartTm2:$('#SDDZBiz_Form_accStartDt2').val(),
					accEndTm2:$('#SDDZBiz_Form_accEndDt2').val(),
					amtNoMax1:amtNoMax1,
					amtNoMax2:amtNoMax2,
					tradeMin1:tradeMin1,
					tradeMin2:tradeMin2,
					tradeMin3:tradeMin3,
					tradeMin4:tradeMin4
				},
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            async:false,
	            dataType: "json",
	            success: function(json) {
	            	if (json.success) {
						//闪电到账状态正常
						bootbox.alert('更新数据成功！');
					}else{
						//闪电到账状态暂停
						bootbox.alert('更新数据失败！');
					}
	            	
	            },
	            error: function(json) {
	            	if(json){
	            		bootbox.alert("连接超时");	
	            	}
	            }
	        });
			
			}
			
		}
		
		function savefunctionthird(){
			if(!$('#validRuleForm3').valid()){
				bootbox.alert("请检查数据格式!");
				return;
			}else{
			 	var startTm5 = parseInt($('#SDDZBiz_Form_startTm5').val().replace(":", ""));
				var endTm5=  parseInt($('#SDDZBiz_Form_endTm5').val().replace(":", ""));
				var amtMax5=$('#SDDZBiz_Form_amtMax5').val();
				var amtMin5=$('#SDDZBiz_Form_amtMin5').val();

				
				var amtNoMax5 = false;
				//
				if($('input:checkbox[name=amtNoMax5]').eq(0)[0].checked){
					amtNoMax5 = true;
				}
				
				var tradeMin5=$('#SDDZBiz_Form_tradeMin5').val();
				//申请时间验证
				if(startTm5>endTm5){
					bootbox.alert('申请起始时间大于结束时间！');
					return
				};
				
				//金额验证
				if(amtNoMax5==false && (amtMax5==null || amtMax5< amtMin5)){
					bootbox.alert('提取上限要大于等于提取下限！');
					return
				};
				if(tradeMin5==null){
					bootbox.alert('交易下限不准确！');
					return
				};
			
				var ajaxUrl = baseURL + "/sddz/sddzBizUpdate";
				$.ajax({
		            type: "POST",
		            url: ajaxUrl,
		            data : {
					  	startTm5:$('#SDDZBiz_Form_startTm5').val(),
    					endTm5:$('#SDDZBiz_Form_endTm5').val(),
    					amtMax5:amtMax5,
    					amtMin5:amtMin5,
    					amtNoMax5:amtNoMax5,
    					tradeMin5:tradeMin5
					},
		            contentType: "application/x-www-form-urlencoded;charset=utf-8",
		            async:false,
		            dataType: "json",
		            success: function(json) {
		            	if (json.success) {
							//闪电到账状态正常
							bootbox.alert('更新数据成功！');
						}else{
							//闪电到账状态暂停
							bootbox.alert('更新数据失败！');
						}
		            	
		            },
		            error: function(json) {
		            	if(json){
		            		bootbox.alert(json.msgInf);	
		            	}
		            }
		        });
			}
			
		}
		
		
		function savefunctionfourth(){
			if(!$('#validRuleForm4').valid()){
				bootbox.alert("请检查数据格式!");
				return;
			}else{
		 	var startTm6 = parseInt($('#SDDZBiz_Form_startTm6').val().replace(":", ""));
			var endTm6=  parseInt($('#SDDZBiz_Form_endTm6').val().replace(":", ""));
			var amtMax6=$('#SDDZBiz_Form_amtMax6').val();
			var amtMin6=$('#SDDZBiz_Form_amtMin6').val();

			
			var amtNoMax6 = false;
			//
			if($('input:checkbox[name=amtNoMax6]').eq(0)[0].checked){
				amtNoMax6 = true;
			}
			
			var tradeMin6=$('#SDDZBiz_Form_tradeMin6').val();

			//不为空判断 
			
			//申请时间验证
			if(startTm6>endTm6){
				Ext.MessageBox.bootbox.alert('提示','申请起始时间大于结束时间！');
				return
			};
			
			//金额验证
			if(amtNoMax6==false && (amtMax6==null || amtMax6< amtMin6)){
				Ext.MessageBox.bootbox.alert('提示','提取上限要大于等于提取下限！');
				return
			};
			if(tradeMin6==null){
				Ext.MessageBox.bootbox.alert('提示','交易下限不准确！');
				return
			};
		
			var ajaxUrl = baseURL + "/sddz/sddzBizUpdate";
			$.ajax({
	            type: "POST",
	            url: ajaxUrl,
	            data : {
				  	startTm6:$('#SDDZBiz_Form_startTm6').val(),
					endTm6:$('#SDDZBiz_Form_endTm6').val(),
					amtMax6:amtMax6,
					amtMin6:amtMin6,
					amtNoMax6:amtNoMax6,
					tradeMin6:tradeMin6
				},
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            async:false,
	            dataType: "json",
	            success: function(json) {
	            	if (json.success) {
						//闪电到账状态正常
						bootbox.alert('更新数据成功！');
					}else{
						//闪电到账状态暂停
						bootbox.alert('更新数据失败！');
					}
	            	
	            },
	            error: function(json) {
	            	if(json){
	            		bootbox.alert(json.msgInf);	
	            	}
	            }
	        });
			}
			
		
	}
		
		/* 结束闪电到账服务时间 */

	</script>

</body>

</html>
