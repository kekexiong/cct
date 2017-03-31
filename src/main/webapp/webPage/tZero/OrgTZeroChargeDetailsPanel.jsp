<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%

String orgNo=request.getParameter("orgNo");
String orgNm=request.getParameter("orgNm");
String chargeTyp_NM=request.getParameter("chargeTyp_NM");
String uuid=request.getParameter("uuid");
String prcpAmt =request.getParameter("prcpAmt"); 
String type =request.getParameter("type"); 
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
									    <h3 class="panel-title" id="titleText"></h3>
									  </div>
									  
									  <div class="panel-body">
									    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
	                                       <div class="form-group">
	                                           <label for="span-medium-2" class="control-label col-md-6 text-right">合作商编号:</label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="orgNo" id="orgNo" readonly class="form-control" placeholder="">
	                                           </div>
	                                       </div>
	                                    </div>
	                                    
									    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
	                                       <div class="form-group">
	                                           <label for="span-medium-2" class="control-label col-md-6 text-right">合作商名称:</label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="orgNm" id="orgNm" readonly class="form-control" placeholder="">
	                                           </div>
	                                       </div>
	                                    </div>
	                                    
	                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
	                                       <div class="form-group">
	                                           <label for="span-medium-2" class="control-label col-md-6 text-right">业务类型:</label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="chargeTyp_NM" id="chargeTyp_NM" readonly class="form-control" placeholder="">
	                                           </div>
	                                       </div>
	                                    </div>
	                                    
	                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
	                                       <div class="form-group">
	                                           <label for="span-medium-2" class="control-label col-md-6 text-right" id="amt"></label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="prcpAmt" id="prcpAmt" readonly class="form-control" placeholder="">
	                                           </div>
	                                       </div>
	                                    </div>
	                                    
	                                     <div class="row">
		                                    <div class="col-md-12">
		                                        <div class="row">
		                                            <div class="col-md-offset-1 col-md-11">
		                                                <button type="button" id="addform_save_btn" class="btn btn-success"><i class="fa fa-save"></i>提交</button>
		                                                <button type="button" id="addform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
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
    	
	
	var orgNo='<%=orgNo%>';
	var orgNm='<%=orgNm%>';
	var chargeTyp_NM='<%=chargeTyp_NM%>';
	chargeTyp_NM =chargeTyp_NM.replace('ADD','+')
	
	var uuid='<%=uuid%>';
	var prcpAmt='<%=prcpAmt%>';
	var  type ='<%=type%>';
	
	$("#orgNo").val(orgNo);
	$("#orgNm").val(orgNm);  
	$("#chargeTyp_NM").val(chargeTyp_NM);
	$("#prcpAmt").val(prcpAmt);
	
	if(type==1){
		$('#titleText').text("财务确认收款");
		$('#amt').text("收款金额");
		
	}else{
		$('#titleText').text("财务确认退款");
		$('#amt').text("退款金额"); 
	}
	
	
	
	//提交按钮
	$("#addform_save_btn").on('click', function() {
		var url = '';
		var message ='';
		//收款
		if(type==1){
			url=baseURL+'/tZero/chargeTask/confirmOrgTZeroChargeTask';
			message ="确定要收款吗?";
		}else if(type==2){
			url=baseURL+'/tZero/chargeTask/confirmOrgTZeroRefundTask';
			message="确定要退款吗?";
		}
		
		bootbox.confirm(message,function(data){
			if(data){
				$.ajax({
			        type: "POST",
			        url: url,
			        data:{uuid:uuid},
			        dataType: "json",
			        success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
			        	if(data.success){
			        		parent.$.fancybox.close(); 
			        		bootbox.alert("操作成功!");
			        	}else{
			        		bootbox.alert(data.msg); 
			        	}
			        } 
			        });
			}
		})
		
		 
	});
	
	//弹出窗口取消按钮
	$("#addform_cancel_btn").off('click').on('click', function() {
		parent.$.fancybox.close();
	});
	
	
	$('.page-footer').hide();
});





</script>
</html>

