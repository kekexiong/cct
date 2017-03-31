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
body {
	background-color: #FFFFFF;
}
</style>

</head>

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md">

	<!-- BEGIN CONTAINER -->
	<div class="clearfix"></div>
	<div class="page-container">
    	
       <!-- BEGIN CONTENT -->
		<div class="portlet-body form">
			<div style="margin:10px 15px 0px 15px;"><h5 style="font-weight:bold;">沉默商户激活自动推送规则设置</h5></div>
	        <!-- 右边开始 -->
	        <div class="row norow">
	           
                <div class="scaffold-list" style="margin-top:15px;">
                    <div class="portlet-body wheel" style="overflow-x:auto;">
                        <div class="col-lg-10 col-md-12 col-sm-12 col-xs-18">
                               <div class="form-group">
                               		<label class="control-label col-md-4 text-right" style="font-weight: bold;">须同时满足：</label><br/><br/> 	
                                 	<div class="col-md-8 paddingnone">
                                        <span style="float:left;margin-top: 5px;">1.商户已开通D+1，且最近</span><input name="notDoneSettlementSlipDays" type="number" id="ActiveSMSDOnePushRulPanel_notDoneSettlementSlipDays" class="form-control" value="0.5" style="width:20%; float:left;" min="0"> 
									  	<div style="font-weight: 400;margin-top: 5px; float:left;"> 天未产生过D+1结算单，且商户开通D+1时间在这之前</div>
                                   </div>
                               </div>
                           </div>
                           <div class="clearfix"></div>
                         <div class="col-lg-10 col-md-12 col-sm-12 col-xs-18" style="margin-top:15px;">
                               <div class="form-group">
                                 	<div class="col-md-8 paddingnone">
                                       	<span style="float:left;margin-top: 5px;">2.商户最近</span><input name="payCardDays" type="number" id="ActiveSMSDOnePushRulPanel_payCardDays" class="form-control"  style="width:20%;float:left;" min="0"> 
                                       	<div style="float:left;font-weight: 400;margin-top: 5px;">&nbsp;天的刷卡交易额大于&nbsp;&nbsp;</div>
                                       	<input name="payCardAmt" type="number" id="ActiveSMSDOnePushRulPanel_payCardAmt" class="form-control" style="width:20%; float:left;" min="0">&nbsp;
                                       	<div style="float:left;font-weight: 400;margin-top: 5px;"> 元</div>
                                   </div>
                               </div>
                           </div>
                           <div class="clearfix"></div>
                           <div class="col-lg-10 col-md-12 col-sm-12 col-xs-18" style="margin-top:15px;">
                               <div class="form-group">
                                 	<div class="col-md-8 paddingnone">
                                       	<span style="float:left;margin-top: 5px;">3.商户未开通即日付</span>
                                       	
                                   </div>
                               </div>
                           </div>
                           <div class="clearfix"> </div>
                           <br/>
                           <div class="col-lg-10 col-md-12 col-sm-12 col-xs-18">
                               <div class="form-group">
                               		<label class="control-label col-md-4 text-right" style="font-weight: bold;">发送短信时间：</label><br/><br/>
                                 	<div class="col-md-8 paddingnone">
                                          <span style="float:left;font-weight: 400;margin-top: 5px;">1.每周四</span><input name="tm1" type="number" id="ActiveSMSDOnePushRulPanel_tm1" class="form-control"  style="width:30%;float:left;" min="0"> 
										  <div style="float:left;font-weight: 400;margin-top: 5px;"> 点</div>
                                     
                                   </div>
                               </div>
                           </div>
                           <div class="clearfix"> </div>
                           <br/>
                           <br/>
                           <div class="col-md-10">
                                <div class="row">
                                    <div class="col-md-offset-1 col-md-11" style="text-align:center;">
                                    	<button type="button" id="sure_btn" class="btn btn-success"><i class="fa fa-sign-out"></i> 确认</button>
                                      <button type="button" id="reset_btn" class="btn btn-info"><i class="fa fa-refresh"></i> 重置</button> 
                                    </div>
                                </div>
                           </div>
                           <div class="clearfix"> </div>
                           <br/>
                           <br/>
                    </div> 
	        	</div>
	    	</div>
		</div>
    </div>
    
	<!-- BEGIN FOOTER -->
	<jsp:include page="../common/footer.jsp" flush="true" />
	<!-- END FOOTER -->
 
    <script type="text/javascript">
    var baseURL = "<%=request.getContextPath()%>";
    
    $(function(){
    	
    	$('.page-footer').hide();
    	//数字校验
    	var notDoneSettlementSlipDays = 0;
    	$("#ActiveSMSDOnePushRulPanel_notDoneSettlementSlipDays").change(function(){
    		var regex = /^[1-9]\d*|0|[0-9]\.[1-9]\d*$/;
    		if(regex.test($(this).val())){
    			notDoneSettlementSlipDays = $(this).val();
    		}else{
    			 $(this).val(notDoneSettlementSlipDays);
    		}
    	});
    	
    	var payCardDays = 0;
    	$("#ActiveSMSDOnePushRulPanel_payCardDays").change(function(){
    		var regex = /^[1-9]\d*$/;
    		if(regex.test($(this).val())){
    			payCardDays = $(this).val();
    		}else{
    			 $(this).val(payCardDays);
    		}
    	});
    	
    	var payCardAmt = 0;
    	$("#ActiveSMSDOnePushRulPanel_payCardAmt").change(function(){
    		var regex = /^[1-9]\d*|0|[0-9]\.[1-9]\d*$/;
    		if(regex.test($(this).val())){
    			payCardAmt = $(this).val();
    		}else{
    			 $(this).val(payCardAmt);
    		}
    	});
    	
    	var tm1 = 0;
    	$("#ActiveSMSDOnePushRulPanel_tm1").change(function(){
    		var regex = /^[1-9]\d*$/;
    		if(regex.test($(this).val())){
    			tm1 = $(this).val();
    		}else{
    			 $(this).val(tm1);
    		}
    	});
    	
    	
    	//获取系统配置值
    	var url = baseURL +　"/pushRul/queryDOneJHSMSPushRul?page=1&start=0&limit=25";
    	$.ajax({
            type: "GET",
            url: url,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	if(data.notDoneSettlementSlipDays!=null){
            		$("#ActiveSMSDOnePushRulPanel_notDoneSettlementSlipDays").val(data.notDoneSettlementSlipDays);
            		notDoneSettlementSlipDays= data.notDoneSettlementSlipDays;
            	}
				if(data.payCardDays!=null){
					$("#ActiveSMSDOnePushRulPanel_payCardDays").val(data.payCardDays);  
					payCardDays= data.payCardDays;
				}
				if(data.payCardAmt!=null){
					$("#ActiveSMSDOnePushRulPanel_payCardAmt").val(data.payCardAmt);
					payCardAmt= data.payCardAmt;
				}
				if(data.tm1!=null){
					$("#ActiveSMSDOnePushRulPanel_tm1").val(data.tm1);
					tm1= data.tm1;
				}
            },
            error:function(){ }
    	});
    	
    	
        //确认按钮
        $("#sure_btn").on("click",function(){
        	var notDoneSettlementSlipDays = $("#ActiveSMSDOnePushRulPanel_notDoneSettlementSlipDays").val();
        	var payCardDays = $("#ActiveSMSDOnePushRulPanel_payCardDays").val();
        	var payCardAmt = $("#ActiveSMSDOnePushRulPanel_payCardAmt").val();
        	var tm1 = $("#ActiveSMSDOnePushRulPanel_tm1").val();
        	
        	if(notDoneSettlementSlipDays=="" ||payCardDays==""||payCardAmt==""||tm1==""){
        		bootbox.alert("输入值不能为空");
        		return;
        	}
			
        	if(parseInt(notDoneSettlementSlipDays) <0 || parseInt(payCardDays) <0 || parseFloat(payCardAmt) <0 || parseInt(tm1)<0){
        		bootbox.alert("输入数字不能为负数！");
        		return;
        	}
        	
			var param ={};
        	param.notDoneSettlementSlipDays = notDoneSettlementSlipDays;
        	param.payCardDays = payCardDays;
        	param.payCardAmt = payCardAmt;
        	param.tm1 = tm1;
		
        	App.blockUI({target:"body",boxed:!0,message:"沉默商户自动推送规则设置中，请稍等...",zIndex:20000});
        	
        	var dealUrl = baseURL + "/pushRul/addDOneJHSMSPushRul";
        	$.ajax({
                type: "POST",
                url: dealUrl,
                data:param,
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                dataType: "json",
                success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
                	parent.bootbox.alert(data.resMsg);
                	parent.$.fancybox.close();
                },
                error:function(){
                	bootbox.alert("沉默商户自动推送规则设置，请刷新重试.");
                }
        	});
        });
       
        //重置按钮
        $("#reset_btn").on("click",function(){
        	$("#ActiveSMSDOnePushRulPanel_notDoneSettlementSlipDays").val("");
        	$("#ActiveSMSDOnePushRulPanel_payCardDays").val("");
        	$("#ActiveSMSDOnePushRulPanel_payCardAmt").val("");
        	$("#ActiveSMSDOnePushRulPanel_tm1").val("");
        });
   	});
    </script>  
</body>

</html>
