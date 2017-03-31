<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
String orgNo=request.getParameter("orgNo");
String orgNm=request.getParameter("orgNm");
String remainPrcpAmt=request.getParameter("remainPrcpAmt");
String uuid=request.getParameter("uuid");
String refundPrcpAmt =request.getParameter("refundPrcpAmt"); 
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
	                                           <label for="span-medium-2" class="control-label col-md-6 text-right">本金账户余额:</label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="remainPrcpAmt" id="remainPrcpAmt" readonly class="form-control" placeholder="">
	                                           </div>
	                                       </div>
	                                    </div>
	                                    
	                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
	                                       <div class="form-group">
	                                           <label for="span-medium-2" class="control-label col-md-6 text-right" id="amt"></label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="refundPrcpAmt" id="refundPrcpAmt" type="number" class="form-control" placeholder="">
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
	var remainPrcpAmt='<%=remainPrcpAmt%>';
	var uuid='<%=uuid%>';
	var refundPrcpAmt='<%=refundPrcpAmt%>';
	var  type ='<%=type%>';
	
	$("#orgNo").val(orgNo);
	$("#orgNm").val(orgNm);  
	$("#remainPrcpAmt").val(remainPrcpAmt);
	
	if(type==1){
		$('#titleText').text("退合作商本金");
		$('#amt').text("退本金");
		
	}else{
		$('#titleText').text("合作商本金充值");
		$('#amt').text("本金充值金额"); 
	}
	
	
	
	//提交按钮
	$("#addform_save_btn").on('click', function() {
		var $refundPrcpAmt =  $("#refundPrcpAmt").val();
		
		if($refundPrcpAmt==''||isNaN($refundPrcpAmt)||$refundPrcpAmt<=0){
			bootbox.alert("请输入正确的金额");
			return;
		}
		 
		
		if(type==1){
			if(parseInt($refundPrcpAmt)>parseInt(remainPrcpAmt)){
				bootbox.alert("不能大于本金账户余额");
				return;
			}
		}
		
		var url = '';
		var message ='';
		//退款
		if(type==1){
			
			url=baseURL+'/tZero/account/refundPrcpAmt';
			message ="确定要退本金吗?";
		}else if(type==2){
			url=baseURL+'/tZero/account/rechargePrcpAmt';
			message="确定要充值吗?";
		}
		bootbox.confirm(message,function(btn){
			if(btn){

				$.ajax({
			        type: "POST",
			        url: url,
			        data:{
			        	uuid:uuid,
			        	orgNo:orgNo,
			        	remainPrcpAmt:remainPrcpAmt, 
			        	refundPrcpAmt:$refundPrcpAmt,
			        	rechargePrcpAmt:$refundPrcpAmt
			        	},
			        success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
			        	var data =jQuery.parseJSON(data);
			        	if(data.success){
			        		parent.$.fancybox.close();
			        		bootbox.alert(data.msg);
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

