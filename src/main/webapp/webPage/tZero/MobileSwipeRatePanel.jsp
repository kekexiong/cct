<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		                        <form  class="form-horizontal" action="<%=request.getContextPath()%>/" id="updateForm">
		                            <div class="form-body">
		                                <div class="row norow">
		                                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-7 text-right">手刷T+0结算手续费:</label>
		                                            <div class="col-md-4 paddingnone">
		                                                <input name="rate" id="rate" min='0' max='10' class="form-control onlyNum" type="number" >
		                                            </div>
		                                             <label class="control-label col-md-1 text-right">%</label>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-1 text-right"><strong>,</strong></label>
		                                            <label for="span-medium-2" class="control-label col-md-6 text-right">每笔最低收取:</label>
		                                            <div class="col-md-3 paddingnone">
		                                                <input name="minFeeAmt" type="number" id="minFeeAmt" min='0' step="1.00" class="form-control onlyNum" >
		                                            </div>
		                                             <label class="control-label col-md-1 text-right">元</label> 
		                                        </div>
		                                    </div>
		                                    </div>
										<div class="row norow">
											<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
												<div class="form-group">
													<label for="span-medium-1"
														class="control-label col-md-7 text-right">手刷即刷即到结算手续费:</label>
													<div class="col-md-4 paddingnone">
														<input name="fixFeeAmt" type="number" id="fixFeeAmt" min="0"
															class="form-control onlyNum">
													</div>
													<label class="control-label col-md-1 text-right">元</label>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="form-group">
													<label for="span-medium-1"
														class="control-label col-md-7 text-right">手刷其他消费即刷即到结算手续费:</label>
													<div class="col-md-3 paddingnone">
														<input name="otherFixFeeAmt" type="number" id="otherFixFeeAmt" min="0"
															class="form-control onlyNum">
													</div>
													<label class="control-label col-md-1 text-right">元</label>
												</div>
											</div>
										</div>
											<div class="clearfix"></div>
										</div>
									</div>
		                            <div class="form-actions">
		                                <div class="row" >
		                                    <div class="col-md-12">
		                                        <div class="row">
		                                            <div class="col-md-offset-5 col-md-8">
		                                               <button type="button" id="edit_btn" class="btn btn-info"> <i class="fa fa-save"></i> 保存</button><!-- 
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </form>
		                    </div>
		               
		                </div>
		                <div class="clearfix"> </div>
		        	</div>
		    	</div>
		</div>
		

    
  

       
    <!-- BEGIN FOOTER -->
    <jsp:include page="../common/footer.jsp" flush="true"/>
    <!-- END FOOTER -->

		<script type="text/javascript">
			$(function() {

				
				
				/*初始化页面按钮权限*/
				if (!hasPermission(PERMISSSIONCONST.TZER8301)) {
					$("#edit_btn").hide();
				}
				
				$(".page-footer").hide();

				//初始化编辑表单
				initForm();

				$("#edit_btn").on(
								'click',
								function() {
									if(!$('#updateForm').valid()){
										return;
									}
									
									var rate = $("#rate").val();
									var minFeeAmt = $("#minFeeAmt").val();
									var fixFeeAmt = $("#fixFeeAmt").val();
									var otherFixFeeAmt = $("#otherFixFeeAmt").val();
									
									if(rate == null || rate == ''){
										bootbox.alert("数据不能为空!");
										return;
									}
									if(minFeeAmt == null || minFeeAmt == ''){
										bootbox.alert("数据不能为空!");
										return;
									}
									if(fixFeeAmt == null || fixFeeAmt == ''){
										bootbox.alert("数据不能为空!");
										return;
									}
									if(otherFixFeeAmt == null || otherFixFeeAmt == ''){
										bootbox.alert("数据不能为空!");
										return;
									}
									
								    App.blockUI({target:"body",boxed:!0,message:"手刷费率设置中，请稍等...",zIndex:20000});
									$
											.ajax({
												type : "post",
												url : baseURL+"/mobileSwipeRate/setFee",
												data : {
													rate : rate,
													minFeeAmt : minFeeAmt,
													fixFeeAmt : fixFeeAmt,
													otherFixFeeAmt : otherFixFeeAmt
												},
												contentType : "application/x-www-form-urlencoded;charset=utf-8",
												dataType : "json",
												success : function(data) {
													if (data.success) {
														bootbox.alert(data.resMsg);
														
														//$("#addform")[0].reset();
														//$("#addform").clear();
														//$("#addOrUpdateWin").modal('hide');

													} else {
														bootbox.alert(data.resMsg);
													}

												},
												error : function(error) {
												}
											});
								});

				


				
				$('#updateForm').validate({  
					//errorElement:"span", errorClass:"help-block help-block-error",
			        rules: {
			        	rate: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 10,
		                    regex:/^(([1-9]+)|([0-9]+\.[0-9]{1,2})|(\d*))$/
			        	},
			        	minFeeAmt: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 100.00,
		                    regex:/^(([1-9]+)|([0-9]+\.[0-9]{1,2})|(\d*))$/
			        	},
			        	fixFeeAmt: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 100.00,
		                    regex:/^(([1-9]+)|([0-9]+\.[0-9]{1,2})|(\d*))$/
			        	},
			        	otherFixFeeAmt: {
			        		required: true, 
		                    number: true,
		                    min: 0,
		                    max: 100.00,
		                    regex:/^(([1-9]+)|([0-9]+\.[0-9]{1,2})|(\d*))$/
			        	},
			        },
			        messages: {
			        	rate: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为10',
			        		regex: '最多两位小数'
			        	},
			        	minFeeAmt: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为100',
			        		regex: '最多两位小数'
			        	},
			        	fixFeeAmt: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为100',
			        		regex: '最多两位小数'
			        	},
			        	otherFixFeeAmt: {
			        		required: '不能为空',
			        		number: '请填写数字',
			        		min: '最小值为0',
			        		max: '最大值为100',
			        		regex: '最多两位小数'
			        	},
			        }
			    });
				
				
				$(".onlyNum").onlyNum();

			});

			//modify myang 2016-8-13
			function initForm() {
				$.ajax({
					type : "GET",
					url : baseURL + "/mobileSwipeRate/getFee",
					contentType : "application/json;charset=utf-8",
					dataType : "json",
					success : function(result) {
						$("#rate").val(result.rate);
						$("#minFeeAmt").val(result.minFeeAmt);
						$("#fixFeeAmt").val(result.fixFeeAmt);
						$("#otherFixFeeAmt").val(result.otherFixFeeAmt);
					},
					error : function(error) {
						bootbox.alert("Error");
					}
				});
			}
			
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
			
			
		</script>
		</body>
</html>