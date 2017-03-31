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
label.error {
	float: none;
	color: red;
	padding-left: .5em;
	vertical-align: top;
}
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
							<div class="page-bar">
					<ul class="page-breadcrumb">
						<li><i class="fa fa-home"></i> <a href="#">结算增值业务管理</a> <i
							class="fa fa-minus"></i></li>
						<li><span>自动秒到</span><i class="fa fa-minus"></i></li>
						<li><span>自动秒到开通规则管理</span></li>
					</ul>
				</div>
				<!-- 右边开始 -->
				<div class="col-md-0 paddingnone" style="float: left;margin-top:-25px">
				        <input type="button" style="float: right;width:100px" value="保存" class="form-control col-lg-2 col-md-2" id="save_btn">
				</div>
				<div class="row">
					<!-- BEGIN CONTENT -->
					<div class="portlet-body form">
						<div class="form-body">
						
						
							<div class="row norow">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="panel-title">法人结算</h4>
									</div>
									<form id="validRuleForm" class="form-horizontal" action="">
										<div class="panel-body">
											<div class="row norow">
												<div class="col-lg-10 col-md-12 col-sm-4 col-xs-6">
													<div class="form-group">
														<label for="span-medium-2" class="control-label col-md-3 text-right">默认结算账户对私户，必须法人结算:</label>
														<label for="span-medium-2" class="control-label col-md-9 text-right" style="margin-left:-1%">
														<input type="checkbox" name="legEnable" id="legEnable" >启用</label>
													</div>
												</div>
											</div>
										</form>	
										</div>
								</div>

							</div>







									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- ----------------------------- -->
				<div class="row">
					<!-- BEGIN CONTENT -->
					<div class="portlet-body form" style="margin-top:-20%">
						<div class="form-body">
							<div class="row norow">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="panel-title">结算量校验</h4>
									</div>
										<div class="panel-body">
										<form action="" id="addform">
											<!-- 一行开始  -->
											<div class="row norow">
												<div class="col-lg-10 col-md-12 col-sm-4 col-xs-6">
													<div class="form-group">
														<label for="span-medium-2" class="control-label col-md-1 text-right">近:</label>
														<div class="col-md-1 paddingnone">
															<input name="sumDay" id="sumDay" type="number" class="form-control onlyNum" min="0" required="" data-bv-notempty-message="不能为空">
														</div>
														
														<label for="span-medium-2" class="control-label col-md-5 text-right"> 天(不含当天)内累计结算成功的金额(不区分结算类型)大于等于:</label>
														<div class="col-md-2 paddingnone">
															 <input name="sumAmt" id="sumAmt" type="number" class="form-control onlyNum" min="0" required="" data-bv-notempty-message="不能为空"> 
														</div>
														<label for="span-medium-2" class="control-label col-md-0 text-right">元</label>
													</div>
												</div>
											</div>
											<!--  一行结束  -->
											
											<div class="row norow">
												<div class="col-lg-10 col-md-12 col-sm-4 col-xs-6">
													<div class="form-group">
														<label for="span-medium-2" class="control-label col-md-1 text-right" style="margin-left:-2%">或:</label>
														<label for="span-medium-2" class="control-label col-md-11 text-right" style="margin-left:2%">
														<input type="checkbox" name="sesEnable" id="sesEnable">启用</label>
													</div>
												</div>
											</div>
											
											
											<!-- 一行开始  -->
											<div class="row norow">
												<div class="col-lg-10 col-md-12 col-sm-4 col-xs-6"> 
													<div class="form-group">
														<label for="span-medium-2" class="control-label col-md-1 text-right">近:</label>
														<div class="col-md-1 paddingnone">
															  <input name="singleDay" id="singleDay" type="number" class="form-control onlyNum" min="0" required="" data-bv-notempty-message="不能为空"> 
														</div>
														
														<label for="span-medium-2" class="control-label col-md-3 text-right"> 天(不含当天)结算金额大于等于:</label>
														<div class="col-md-2 paddingnone">
															 <input name="singleAmt" id="singleAmt" type="number" class="form-control onlyNum" min="0" required="" data-bv-notempty-message="不能为空"> 
														</div>
														
														<label for="span-medium-2" class="control-label col-md-2 text-right" style="margin-left:-4%">元的天数,大于等于:</label>
														<div class="col-md-1 paddingnone">
															 <input name="countDay" id="countDay" type="number" class="form-control onlyNum" min="0" required="" data-bv-notempty-message="不能为空"> 
														</div>
														<label for="span-medium-2" class="control-label col-md-0 text-right">天</label>
														
													</div>
												</div>
											</div>
											<!--  一行结束  -->
											</form>
											
											
										</div>
								</div>

							</div>

									</div>
								</div>
							</div>
							
							
							
							<!-- 结束  -->
							
							
							<!-- ----------------------------- -->
				<div class="row">
					<!-- BEGIN CONTENT -->
					<div class="portlet-body form">
						<div class="form-body">
							<div class="row norow">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="panel-title">结算人开通秒到商户数校验</h4>
									</div>
										<div class="panel-body">
										<form action="" id="addform2">
											<!-- 一行开始  -->
											<div class="row norow">
												<div class="col-lg-10 col-md-12 col-sm-4 col-xs-6">
													<div class="form-group">
														<label for="span-medium-2" class="control-label col-md-4 text-right" style="margin-left:-6.5%">同一结算人名下，秒到开通状态商户大于:</label>
														<div class="col-md-1 paddingnone">
															  <input name="openNum" id="openNum" type="number" class="form-control onlyNum" min="0" required="" data-bv-notempty-message="不能为空"> 
														</div>
														
														<label for="span-medium-2" class="control-label col-md-2 text-right" style="margin-left:-4.5%">户，不允许再开通:</label>
														<div class="col-md-2 paddingnone">
															 <!-- <input name="limitOne" id="limitOne" type="number" class="form-control onlyNum" min="0" required="" data-bv-notempty-message="不能为空"> --> 
														</div>
														<label for="span-medium-2" class="control-label col-md-3 text-right" style="margin-left:27.5%">
														<input type="checkbox" name="actEnable" id="actEnable">启用</label>
													</div>
												</div>
											</div>
											</form>
										</div>
								</div>

							</div>

									</div>
								</div>
							</div>
							
							
							
							<!-- 结束  -->
							
							<div class="row">
					<!-- BEGIN CONTENT -->
					<div class="portlet-body form">
						<div class="form-body">
							<div class="row norow">
								<div class="panel panel-primary">
										<div class="panel-body">
											<div class="row norow">
												<div class="col-lg-10 col-md-12 col-sm-4 col-xs-6">
													<div class="form-group">
														<label for="span-medium-2" class="control-label col-md-2 text-right" style="margin-left:-3.5%">代理商名额限制:&nbsp;&nbsp;&nbsp;&nbsp;</label>
														<label for="span-medium-2" class="control-label col-md-10 text-right" style="margin-left:3.5%">
														<input type="checkbox" name="limitEnable" id="limitEnable">启用</label>
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
							<!-- 结束  -->
							
							<!-- ----------------------------- -->
				<div class="row">
					<!-- BEGIN CONTENT -->
					<div class="portlet-body form">
						<div class="form-body">
							<div class="row norow">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="panel-title">商户进件时长限制</h4>
									</div>
										<div class="panel-body">
										<form action="" id="addform3">
											<!-- 一行开始  -->
											<div class="row norow">
												<div class="col-lg-10 col-md-12 col-sm-4 col-xs-6">
													<div class="form-group">
														<label for="span-medium-2" class="control-label col-md-3 text-right" style="margin-left:-3.5%">商户进件必须满:</label>
														<div class="col-md-1 paddingnone">
															 <input name="effDt" id="effDt" type="text" class="form-control onlyNum" min="0" max="100" required="" data-bv-notempty-message="不能为空"> 
														</div>
														<label for="span-medium-2" class="control-label col-md-1 text-right" style="margin-left:-3%">天</label>
														<label for="span-medium-2" class="control-label col-md-7 text-right" style="margin-left:6.5%">
														<input type="checkbox" name="validityEnable" id="validityEnable">启用</label>
													</div>
												</div>
											</div>
											</form>
										</div>
								</div>

							</div>

									</div>
									
										<div class="form-body">
							<div class="row norow">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="panel-title">连续交易时长限制</h4>
									</div>
										<div class="panel-body">
										<form action="" id="addform4">
											<!-- 一行开始  -->
											<div class="row norow">
												<div class="col-lg-10 col-md-12 col-sm-4 col-xs-6">
													<div class="form-group">
														<label for="span-medium-2" class="control-label col-md-3 text-right" style="margin-left:-3.5%">半年内有效交易天数大于等于:</label>
														<div class="col-md-1 paddingnone">
															 <input name="tranDt" id="tranDt" type="text" class="form-control onlyNum" min="0" max="100" required="" data-bv-notempty-message="不能为空"> 
														</div>
														<label for="span-medium-2" class="control-label col-md-1 text-right" style="margin-left:-3%">天</label>
														<label for="span-medium-2" class="control-label col-md-7 text-right" style="margin-left:6.5%">
														<input type="checkbox" name="tranDtEnable" id="tranDtEnable">启用</label>
													</div>
												</div>
											</div>
											</form>
										</div>
								</div>

							</div>

									</div>
									
								</div>
							</div>
							
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


		$(function() {
			/*初始化页面按钮权限*/
			 if (!hasPermission(PERMISSSIONCONST.POSMD012)) {$("#save_btn").hide();}
			 initFirstPanel();
			 $('#addform').validate({
			        rules:{
			        	sumDay:{
			        		required:true,
			            	max:100,
			            	regex:/^\d*$/
			            },
			            sumAmt:{
			            	required:true,
			            	max:999999999999,
			            	regex:/^\d*$/
			            },
			            singleDay:{
			        		required:true,
			            	max:100,
			            	regex:/^\d*$/
			            },
			            singleAmt:{
			            	required:true,
			            	max:999999999999,
			            	regex:/^\d*$/
			            },
			            countDay:{
			        		required:true,
			            	max:100,
			            	regex:/^\d*$/
			            },
			           
			        },
			        messages:{
			        	singleDay:{
			        		required:'不能为空',
			            	max:"最大值100",
			            	regex:'输入框仅支持输入非负整数'
			            }, 
			        	sumAmt:{
			            	required:'不能为空',
			            	max:"最大值999999999999",
			            	regex:'输入框仅支持输入非负整数'
			            },
			            sumDay:{
			        		required:'不能为空',
			            	max:"最大值100",
			            	regex:'输入框仅支持输入非负整数'
			            }, 
			            singleAmt:{
			            	required:'不能为空',
			            	max:"最大值999999999999",
			            	regex:'输入框仅支持输入非负整数'
			            },
			            countDay:{
			        		required:'不能为空',
			            	max:"最大值100",
			            	regex:'输入框仅支持输入非负整数'
			            }, 
			        }
			    });
			 
			 
			 
			 $('#addform2').validate({
			        rules:{
			        	openNum:{
			        		required:true,
			            	max:99,
			            	regex:/^\d*$/
			            }
			           
			        },
			        messages:{
			        	openNum:{
			        		required:'不能为空',
			            	max:"最大值99",
			            	regex:'输入框仅支持输入非负整数'
			            }
			        }
			    });
			 
			 $('#addform3').validate({
			        rules:{
			            effDt:{
			        		required:true,
			        		min: 0,
			            	max:100,
			            	regex:/^\d*$/
			        	}
			        },
			        messages:{
				     	effDt: {
				     		required: '不能为空',
				     		min: '最小值为0',
				     		max: '最大值为100',
				     		regex:'输入框仅支持输入非负整数'
				     	}
			        }
			    });
			 
			 $('#addform4').validate({
			        rules:{
			        	tranDt:{
			        		required:true,
			        		min: 0,
			            	max:100,
			            	regex:/^\d*$/
			        	}
			        },
			        messages:{
				     	tranDt: {
				     		required: '不能为空',
				     		min: '最小值为0',
				     		max: '最大值为100',
				     		regex:'输入框仅支持输入非负整数'
				     	}
			        }
			    });
			 
			 
			$("#save_btn").on("click",function(){
				if($("#addform").valid()&&$("#addform2").valid()&&$("#addform3").valid()&&$("#addform4").valid()){
					data={};
					 data.sumDay = $('#sumDay').val();
					 data.sumAmt = $('#sumAmt').val();
					 data.singleDay = $('#singleDay').val();
					 data.singleAmt = $('#singleAmt').val();
					 data.countDay = $('#countDay').val();
					 data.openNum = $('#openNum').val();
					 data.legEnable = IsChecked($('#legEnable').prop("checked"));
					 data.sesEnable = IsChecked($('#sesEnable').prop("checked"));
					 data.actEnable = IsChecked($('#actEnable').prop("checked"));
					 data.limitEnable = IsChecked($('#limitEnable').prop("checked"));
					 data.validityEnable = IsChecked($('#validityEnable').prop("checked"));
					 data.tranDtEnable = IsChecked($('#tranDtEnable').prop("checked"));
					 data.effDt = $('#effDt').val();
					 data.tranDt = $('#tranDt').val();
					 
					bootbox.confirm("确定修改秒到业务规则?",function(btn){
						if(btn){
							App.blockUI({target:"body",boxed:!0,message:'秒到开通规则设置中，请稍等...',zIndex:20000});
							$.ajax({
					            type: "POST",
					            url: baseURL+"/tZero/openRule/save",
								data:data,					           
					            dataType: "json",
					            success: function(data) {
					            	if(data.success){
					            		bootbox.alert(data.resMsg);
					            	}else{
					            		bootbox.alert("修改秒到开通规则设置失败，请刷新重试.");
					            	}
					            	
					            }
					            
							});
						
							
							
						}
					
					}); 
				
				}else{
					bootbox.alert("请输入正确的数据");
					return;
				}
				 
				});
				
			
			

});

		// ----------------------------------------------------------------------
		// <summary>
		// 限制只能输入数字
		// </summary>
		// ----------------------------------------------------------------------
		
		//校验是否上限
		function IsChecked(value) {
			var val = "0";
			if(value==true){
				val = "1";
			}
			return val;
		}

		
		//初始化操作面板
		function initFirstPanel(){
							
			var ajaxUrl = baseURL + "/tZero/openRule/query";
			$.ajax({
	            type: "GET",
	            url: ajaxUrl,
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            async:false,
	            dataType: "json",
	            success: function(data) {
	            	if(data.timeout){
	            		ajaxTimeout();
	            		bootbox.alert("连接超时!");
	            		return;
	                }
	            	$("#sumDay").val(data.sumDay);
	            	$("#sumAmt").val(data.sumAmt);
	            	$("#singleAmt").val(data.singleAmt);
	            	$("#singleDay").val(data.singleDay);
	            	$("#countDay").val(data.countDay);
	            	$("#openNum").val(data.openNum);
	            	$("#limitOne").val(data.limitOne);
	            	
	            	
	            	if(data.legEnable=='1'){
	            		$("#legEnable").prop("checked",true);
	            	}
	            	if(data.sesEnable=='1'){
	            		$("#sesEnable").prop("checked",true);
	            	}
	            	if(data.actEnable=='1'){
	            		$("#actEnable").prop("checked",true);
	            	}
	            	if(data.limitEnable=='1'){
	            		$("#limitEnable").prop("checked",true);
	            	}
	            	if(data.validityEnable=='1'){
	            		$("#validityEnable").prop("checked",true);
	            	}
	            	if(data.tranDtEnable=='1'){
	            		$("#tranDtEnable").prop("checked",true);
	            	}
	            	$('#effDt').val(data.effDt);
					$('#tranDt').val(data.tranDt);
	            	
	            },
	            error: function(json) {

	            	bootbox.alert("系统异常， 请稍后重试!  ");

	            }
	        });
			
			
		}



	</script>

</body>

</html>
