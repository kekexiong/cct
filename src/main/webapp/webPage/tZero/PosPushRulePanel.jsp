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
	        <div style="margin:10px 15px 0px 15px;"><h5 style="font-weight:bold;">POS自动推送规则设置</h5></div>
	        <!-- 右边开始 -->
	        <div class="row norow">
                <div class="scaffold-list" style="margin-top:15px;">
                    <div class="portlet-body wheel" style="overflow-x:auto;">
                        <div class="col-lg-10 col-md-12 col-sm-12 col-xs-18">
                               <div class="form-group">
                               	<label class="control-label col-md-4 text-right" style="font-weight: bold;">POS推送开通的条件:</label><br/><br/>
                                 	<label class="control-label col-md-4 text-right" style="width:33%; float:left;">截至设定时间，商户账户余额达:</label>
                                 	<div class="col-md-8 paddingnone" style="width:62%; float:left;padding-left:0px;">
                                      
                                          <input name="balence" type="number" id="PosPushRulePanel_balence" class="form-control" value="0.5" style="width:80%;float:left;" min="0"> 
										  <div style="float:left;ont-weight: 400;margin-top: 5px;"> 元</div>
                                       
                                   </div>
                               </div>
                           </div>
                         	<div class="col-lg-10 col-md-12 col-sm-12 col-xs-18">
                               <div class="form-group">
                                 	<label class="control-label col-md-4 text-right" style="width:33%; float:left;">设定时间：每周五、六</label>
                                 	<div class="col-md-8 paddingnone" style="width:62%; float:left;padding-left:0px;">
                                       
                                          	<input name="tm1" type="number" id="PosPushRulePanel_tm1" class="form-control"  style="width:30%;float:left;" min="0"> 
                                         	<div style="float:left;ont-weight: 400;margin-top: 5px;">&nbsp;点 &nbsp;&nbsp;&nbsp;&nbsp;</div>
                                         	<input name="tm2" type="number" id="PosPushRulePanel_tm2" class="form-control" style="width:30%;float:left;" min="0">&nbsp;
                                         	<div style="float:left;ont-weight: 400;margin-top: 5px;"> 点</div>
                                      
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
    	var database_balence=0;
    	var database_tm1=0;
    	var database_tm2=0;
    	
    	//数字校验
    	var balence = 0;
    	$("#PosPushRulePanel_balence").change(function(){
    		var regex = /^[1-9]\d*|0|[0-9]\.[1-9]\d*$/;
    		if(regex.test($(this).val())){
    			balence = $(this).val();
    		}else{
    			 $(this).val(balence);
    		}
    	});
    	
    	var tm1 = 0;
    	$("#PosPushRulePanel_tm1").change(function(){
    		var regex = /^[1-9]\d*|0|[0-9]\.[1-9]\d*$/;
    		if(regex.test($(this).val())){
    			if( $(this).val()>23){
    				bootbox.alert("该输入想最大值为23！");
    				$(this).val(tm1);
    				return;
    			}
    			tm1 = $(this).val();
    		}else{
    			 $(this).val(tm1);
    		}
    	});
    	
    	var tm2 = 0;
    	$("#PosPushRulePanel_tm2").change(function(){
    		var regex = /^[1-9]\d*|0|[0-9]\.[1-9]\d*$/;
    		if(regex.test($(this).val())){
    			if( $(this).val()>23){
    				bootbox.alert("该输入想最大值为23！");
    				$(this).val(tm2);
    				return;
    			}
    			tm2 = $(this).val();
    		}else{
    			 $(this).val(tm2);
    		}
    	});
    	
    	//获取系统配置值
    	var url = baseURL +　"/PushRule/queryPushRule?page=1&start=0&limit=25";
    	$.ajax({
            type: "GET",
            url: url,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	if(data.balence!=null){
            		$("#PosPushRulePanel_balence").val(data.balence);
            		balence= data.balence;
            		database_balence = balence;
            	}
				if(data.tm1!=null){
					$("#PosPushRulePanel_tm1").val(data.tm1);  
					tm1= data.tm1;
					database_tm1 = tm1;
				}
				if(data.tm2!=null){
					$("#PosPushRulePanel_tm2").val(data.tm2);
					tm2= data.tm2;
					database_tm1 = tm2;
				}
            },
            error:function(){ }
    	});
    	
    	
        //确认按钮
        $("#sure_btn").on("click",function(){
        	var balence = $("#PosPushRulePanel_balence").val();
        	var tm1 = $("#PosPushRulePanel_tm1").val();
        	var tm2 = $("#PosPushRulePanel_tm2").val();
        	
        	if(balence==""||tm1==""||tm2==""){
        		bootbox.alert("输入值不能为空");
        		return;
        	}
        	
        	if(parseFloat(balence) <0 || parseFloat(tm1) <0 || parseFloat(tm2) <0){
        		bootbox.alert("输入数字不能为负数！");
        		return;
        	}
        	
			var param ={};
        	param.balence = balence;
        	param.tm1 = tm1;
        	param.tm2 = tm2;
		
        	App.blockUI({target:"body",boxed:!0,message:"POS自动推送规则设置中，请稍等...",zIndex:20000});
        	
        	var dealUrl = baseURL + "/PushRule/setPushRule";
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
                	//window.close();
                	parent.$.fancybox.close();
                	
                },
                error:function(){
                	bootbox.alert("POS自动推送规则设置失败，请刷新重试.");
                }
        	});
        });
       
        //重置按钮
        $("#reset_btn").on("click",function(){
        	$("#PosPushRulePanel_balence").val("");
        	$("#PosPushRulePanel_tm1").val("");
        	$("#PosPushRulePanel_tm2").val("");
        });
   	});
    </script>  
</body>

</html>
