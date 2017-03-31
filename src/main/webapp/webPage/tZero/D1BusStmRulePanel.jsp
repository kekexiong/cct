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
		                <div class="portlet light bordered scaffold-list" style="margin-top:15px;">
		                    <div class="portlet-body wheel" style="overflow-x:auto;">
		                        <div class="col-lg-12 col-md-14 col-sm-14 col-xs-18">
                                     <div class="form-group">
                                     	<label class="control-label col-md-2 text-right">结算参数管理:</label><br/><br/>
                                       	<label style="float:left;" class="control-label col-md-2 text-right"><font color="red">*</font>免费结算额度:</label>
                                       	<div class="col-md-4 paddingnone">
                                        	<input name="freeLimit" type="number" id="D1BusStmRule_Form_freeLimit" class="form-control"  style="width:80%;float:left;" min="0"> 
											<div style="float:left;font-weight: 400;margin-top: 5px;"> 元</div>
                                         </div>
                                         <label  style="float:left;" class="control-label col-md-2 text-right"><font color="red">*</font>默认结算费率:</label>
                                       	<div class="col-md-4 paddingnone">
                                            <input name="defaultRate" type="number" id="D1BusStmRule_Form_defaultRate" class="form-control"  style="width:80%;float:left;" min="0" max="1"> 
                                         	<div style="float:left;font-weight: 400;margin-top: 5px;"> %</div>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="clearfix"> </div>
                                 <br/>
                                 <br/>
                                 <div class="col-md-10">
                                      <div class="row">
                                          <div class="col-md-offset-1 col-md-11" style="text-align:center;">
                                          	<button type="button" id="save_btn" class="btn btn-success"><i class="fa fa-pencil"></i> 保存</button>
                                             
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
		</div>
    </div>
    
    
    
    <!-- BEGIN FOOTER -->
    <jsp:include page="../common/footer.jsp" flush="true"/>
    <!-- END FOOTER -->
    
    <script type="text/javascript">
    
    
    $(function(){
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.TZERO8501)) {$("#save_btn").hide();}
    	
    	//数字校验
    	var fixFeeAmtval = 0;
    	$("#D1BusStmRule_Form_freeLimit").change(function(){
    		var regex = /^[1-9]\d*|0|[0-9]\.[1-9]\d*$/;
    		if(regex.test($(this).val())){
    			if($(this).val().indexOf(".")!=-1 && $(this).val().split(".")[1].length>2){
	   				 $(this).val(fixFeeAmtval);
	   			}else{
	   				fixFeeAmtval = $(this).val();
	   			}
    		}else{
    			 $(this).val(fixFeeAmtval);
    		}
    	});
    	
    	var defaultRate = 0;
    	$("#D1BusStmRule_Form_defaultRate").change(function(){
    		var regex = /^[1-9]\d*|0|[0-9]\.[1-9]\d*$/;
    		if(regex.test($(this).val())){
    			if($(this).val().indexOf(".")!=-1 && $(this).val().split(".")[1].length>2){
    				 $(this).val(defaultRate);
    			}else{
    				defaultRate = $(this).val();
    			}
    		}else{
    			 $(this).val(defaultRate);
    		}
    	});
    	
    	//获取系统配置值
    	var url = baseURL +　"/d1BusStmRule/get";
    	$.ajax({
            type: "GET",
            url: url,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	if(data.freeLimit!=null){
            		$("#D1BusStmRule_Form_freeLimit").val(data.freeLimit);
            		fixFeeAmtval= data.freeLimit;
            	}
				if(data.defaultRate!=null){
					$("#D1BusStmRule_Form_defaultRate").val(data.defaultRate);  
					defaultRate= data.defaultRate;
				}
            },
            error:function(){ }
    	});
    	
    	
        //保存按钮
        $("#save_btn").on("click",function(){
        	var freeLimit = $("#D1BusStmRule_Form_freeLimit").val();
        	var defaultRate = $("#D1BusStmRule_Form_defaultRate").val();
        	
        	if(freeLimit=="" || defaultRate==""){
        		bootbox.alert("输入值不能为空");
        		return;
        	}
        	
        	if(parseFloat(freeLimit) <0 || parseFloat(defaultRate) <0){
        		bootbox.alert("输入数字不能为负数！");
        		return;
        	}
			
			bootbox.confirm("确定修改D+1业务参数吗？",function(y){
				if(y){
					var param ={};
		        	param.freeLimit = freeLimit;
		        	param.defaultRate = defaultRate;
				
		        	App.blockUI({target:"body",boxed:!0,message:"D+1业务参数设置中，请稍等...",zIndex:20000});
		        	
		        	var dealUrl = baseURL + "/d1BusStmRule/modify";
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
		                	if(data.success){
		                		bootbox.alert("更新数据成功！");
		                	}else{
		                		bootbox.alert(data.msg);
		                	}
		                	
		                },
		                error:function(){
		                	bootbox.alert("设置失败！");
		                }
		        	});
				}
			});
        }); 
   	});
    </script>  
</body>

</html>
