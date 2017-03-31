<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
String inMno=request.getParameter("inMno");
%>
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
    body {
    	background-color:#FFFFFF;
    }
    </style>
    
</head>

<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md">

    <!-- BEGIN CONTAINER -->
    <div class="clearfix"> </div>
    <div class="page-container">
        
        <!-- BEGIN CONTENT -->
        <div class="portlet-body form">
                           <div class="form-body">
                               <div class="row norow">
                               	   <div class="panel panel-primary"> 
									  <div class="panel-heading">
									    <h3 class="panel-title">修改即日付结算费率</h3>
									  </div>
									  
									  <div class="panel-body">
									    <div class="col-lg-10 col-md-4 col-sm-4 col-xs-4">
	                                       <div class="form-group">
	                                           <label for="span-medium-2" class="control-label col-md-6 text-right">商户编号:</label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="mno" id="mno" readonly class="form-control" placeholder="">
	                                           </div>
	                                           
	                                           <label for="span-medium-2" class="control-label col-md-6 text-right">商户名称:</label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="cprRegNmCn" id="cprRegNmCn" readonly class="form-control" placeholder="">
	                                           </div>
	                                           
	                                            <label for="span-medium-2" class="control-label col-md-6 text-right">当前即日付费率%:</label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="oldRate" id="oldRate" readonly class="form-control" placeholder="">
	                                           </div>
	                                           
	                                            <label for="span-medium-2" class="control-label col-md-6 text-right"><font color="red">*</font>新即日付费率%::</label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="newRate" type="number" id="newRate"  class="form-control" placeholder="请输入新即日付费率%">
	                                           </div>
	                                       </div>
	                                    </div>
	                                    
	                                    
	                                    
			                            <div class="row">
		                                    <div class="col-md-12">
		                                        <div class="row">
		                                            <div class="col-md-offset-1 col-md-11">
		                                                <!-- <button type="button" id="addform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 提交</button>
		                                                <button type="button" id="addform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button> -->
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
	                                   
									  </div>
									</div>
                                   
                               </div>
                               </div>
                           </div>
        <!-- END CONTENT -->
    </div>
    <!-- END CONTAINER -->
    
    <!-- BEGIN FOOTER -->
    <jsp:include page="../common/footer.jsp" flush="true"/>
    <!-- END FOOTER -->
    
</body>

<script type="text/javascript" src="<%=request.getContextPath()%>/webPage/common/js/constant.js"></script>

<script type="text/javascript">
var baseURL = "<%=request.getContextPath()%>";

$(function(){
    	
	var inMno ='<%=inMno%>';
	
	  $.ajax({
	        url:baseURL + "/busRate/queryRateByInMno", 
	        type:"GET",
	        data:{inMno:inMno},
	        success:function(data){
	        	data = $.parseJSON(data);
	        	if(data.inMno==null || data.inMno==''){
					bootBox.alert("数据加载异常");
					return;
				}
	        	var inMno  = data.inMno;
	        	var mno  = data.mno;
	        	var cprRegNmCn = data.cprRegNmCn;
	        	var oldRate = data.rate;
	        	
	        	$("#mno").val(mno);
	        	$("#cprRegNmCn").val(cprRegNmCn);
	        	$("#oldRate").val(oldRate); 
	        } 
	    });
	
	
	 
	
	//提交按钮
	$("#addform_save_btn").on('click', function() {
		updateStatus();
	});
	
	//弹出窗口取消按钮
	$("#addform_cancel_btn").off('click').on('click', function() {
		parent.$.fancybox.close();
	});
	
	
	$('.page-footer').hide();
});




//修改状态
function updateStatus(){
		
		var inMno ='<%=inMno%>';
		var workRateNew = $("#newRate").val(); 
		
		
		
		if(workRateNew==''||isNaN(workRateNew)){
			bootbox.alert("请输入正确的新工作日费率!");
			return;
		}else{
			workRateNew = parseFloat(workRateNew);
		}
		
		
		if(!(0<=workRateNew&&workRateNew<=10)){
			bootbox.alert("只能输入0~10");
			return;
		}
		
		var data = {};
		data.inMno =inMno;
		data.mno = $("#mno").val();
		data.cprRegNmCn =$("#cprRegNmCn").val();
		data.oldRate = $("#oldRate").val();
		data.newRate =$("#newRate").val();
		
		
		
	
	var url = baseURL+"/busRate/saveJRFRateByInMno"
	
	App.blockUI({target:"body",boxed:!0,message:CONST.TIP016,zIndex:20000});
	
	 $.ajax({
	    type: "POST",
	    url: url,
	    data :data,
	    dataType: "json",
	    success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
	    	if (data && data.success == true) { 
	    		bootbox.alert("修改成功!")
	    		//关闭弹窗
	    		parent.$.fancybox.close();
			}else{
				bootbox.alert(data.msg);				
			}
	    },
	    error: function(error) {
	    }
	});		

}


</script>
</html>

