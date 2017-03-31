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
        <form action="" id="addForm">
        <div class="page-content-wrapper">
		    <!-- 主体-->
		    <!-- <div class="page-content"> -->
		    <div class="">
		       
		        <!-- 右边开始 -->  
		            <div class="col-md-12">
		                <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-title">
		                        <div class="caption">  <span class="caption-subject font-blue bold uppercase"> 小时付、手工提现规则：</span> </div>
		                        <div class="tools">
		                            <a href="javascript:;" class="collapse" data-original-title="折叠" title=""> </a>
		                        </div>
		                    </div>
		                    <!-- 查询信息 -->
		                    <div class="portlet-body form">
		                            <div class="form-body">
		                                    <div class="row norow">
												<div class="row norow">
												<div class="col-lg-10 col-md-12 col-sm-4 col-xs-6">
													<div class="form-group">
														<label for="span-medium-2" class="control-label col-md-3 text-right" style="margin-left:-3.5%">商户进件满</label>
														<div class="col-md-1 paddingnone">
															 <input name="effDt" id="effDt" type="text" class="form-control onlyNum" min="0" max="100" required="" data-bv-notempty-message="不能为空"> 
														</div>
														<label for="span-medium-2" class="control-label col-md-1 text-right" style="margin-left:-3.5%">天</label>
														<label for="span-medium-2" class="control-label col-md-7 text-right">
														<input type="checkbox" name="effDtFlg" id="effDtFlg" >启用</label>
													</div>
												</div>
											</div>
											<div class="row norow">
												<div class="col-lg-10 col-md-12 col-sm-4 col-xs-6"> 
													<div class="form-group">
														<label for="span-medium-2" class="control-label col-md-3 text-right" style="margin-left:-3.5%">商户存在连续</label>
														<div class="col-md-1 paddingnone">
															 <input name="tranDt" id="tranDt" type="text" class="form-control onlyNum" min="0" max="100" required="" data-bv-notempty-message="不能为空"> 
														</div>
														<label for="span-medium-2" class="control-label col-md-1 text-right" style="margin-left:-1%">天的交易</label>
														<label for="span-medium-2" class="control-label col-md-7 text-right" style="margin-left:-2.5%">
														<input type="checkbox" name="tranDtFlg" id="tranDtFlg" >启用</label>
													</div>
												</div>
											</div>
											</div>
		                                   
		                                    <div class="clearfix"></div>
		                                </div>
		                            </div>
		                    </div>
		                </div>
		                
		                <div class="col-md-12">
		                <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-title">
		                        <div class="caption">  <span class="caption-subject font-blue bold uppercase"> T+N结算方式开关</span> </div>
		                        <label for="span-medium-2" class="control-label col-md-9 text-right" style="margin-left:-7.25%">
		                        <input type="checkbox" name="tnFlg" id="tnFlg" disabled="disabled" >启用</label>
		                        <div class="tools">
		                            <a href="javascript:;" class="collapse" data-original-title="折叠" title=""> </a>
		                        </div>
		                    </div>
		                    </div>
		                </div>
		        	
		        	<div class="form-actions">
		                                <div class="row">
		                                    <div class="col-md-12">
		                                        <div class="row">
		                                            <div class="col-md-offset-1 col-md-11">
		                                                <button type="button" id="add_btn" class="btn btn-success" style="margin-left:500px;margin-top:100px"><i class="fa fa-search"></i> 保存</button>
		                                            </div>
		                                        </div>
		                                    </div> 
		                                </div>
		                            </div>
		        	
		    	</div>
	    	</div>
		</form>
		</div>

   
    
    <!-- BEGIN FOOTER -->
    <jsp:include page="../common/footer.jsp" flush="true"/>
    <!-- END FOOTER -->
    
    <script type="text/javascript">
  	
    //查询数据
    function reloadGrid() {
		var url=baseURL+"/tZero/mecVvRule/query";
		$.ajax({
            type: "GET", 
            url: url,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
           		$("#effDt").val(data.effDt);
           		$("#tranDt").val(data.tranDt);
           		if(data.effDtFlg=='1'){
            		$("#effDtFlg").prop("checked",true);
            	}
           		if(data.tranDtFlg=='1'){
            		$("#tranDtFlg").prop("checked",true);
            	}
           		if(data.tnFlg=='1'){
            		$("#tnFlg").prop("checked",true);
            	}
            }, 
            error: function(error) {
            	bootbox.alert("读取失败！");
            }
        });
	}

    $(function(){
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.VVMEC011)) {$("#add_btn").hide();}
    	
    	 $('#addForm').validate({
    		 errorElement:"span",
 			 errorClass:"help-block help-block-error",
 			 focusInvalid:!1,
 			 ignore:"",
 			 highlight:function(e){$(e).closest(".form-group").addClass("has-error")},
 			 success:function(e){$(e).closest(".form-group").removeClass("has-error")},
    		 rules: {
	         	effDt:{
	        		required:true,
	        		min: 0,
	            	max:180,
	            	regex:/^\d*$/
	        	},
	        	tranDt:{
	        		required:true,
	        		min: 0,
	            	max:180,
	            	regex:/^\d*$/
	        	}
	          },
	          messages: {
	            effDt:{
	            	required: '不能为空',
		     		min: '最小值为0',
		     		max: '最大值为180',
		     		regex:'输入框仅支持输入非负整数'
	        	},
	        	tranDt:{
	        		required: '不能为空',
		     		min: '最小值为0',
		     		max: '最大值为180',
		     		regex:'输入框仅支持输入非负整数'
	        	}
	          }
	      });
    	
		
    	//加载数据
    	reloadGrid();
    	
    	//校验是否启用
		function IsChecked(value) {
			var val = "0";
			if(value==true){
				val = "1";
			}
			return val;
		}
    	
		$('#effDtFlg').click(function(){
    		if($('#effDtFlg').prop("checked") || $('#tranDtFlg').prop("checked")){
        		$("#tnFlg").prop("checked",true);
        	}else{
        		$("#tnFlg").prop("checked",false);
        	}
		})
		
		$('#tranDtFlg').click(function(){
    		if($('#effDtFlg').prop("checked") || $('#tranDtFlg').prop("checked")){
        		$("#tnFlg").prop("checked",true);
        	}else{
        		$("#tnFlg").prop("checked",false);
        	}
		})
    	
    	//保存数据
    	$("#add_btn").bind("click",function(){
    		
    		if(!$('#addForm').valid()){  
    			bootbox.alert("输入数据不正确,请重新填写");
    			return;  
    		}
    		var effDt = $('#effDt').val();
     		var tranDt = $('#tranDt').val();
    		var effDtFlg = IsChecked($('#effDtFlg').prop("checked"));
    		var tranDtFlg = IsChecked($('#tranDtFlg').prop("checked"));
    		var tnFlg = IsChecked($('#tnFlg').prop("checked"));
    		
    		var url_path_update = baseURL+"/tZero/mecVvRule/save";
    		var param = {};
    		param.effDt = effDt;
    		param.tranDt = tranDt;
    		param.effDtFlg = effDtFlg;
    		param.tranDtFlg = tranDtFlg;
    		param.tnFlg =tnFlg;
    		
    		bootbox.confirm("确定修改Vv商户业务规则?",function(btn){
				if(btn){
					App.blockUI({target:"body",boxed:!0,message:'Vv商户业务规则设置中，请稍等...',zIndex:20000});
		    		$.ajax({
		                type: "POST",  
		                url: url_path_update,
		                contentType: "application/x-www-form-urlencoded;charset=utf-8",
		                data: param,
		                dataType: "json", 
		                success: function(data) {
			            	if(data.timeout){
			            		ajaxTimeout();
			            	}
			            	bootbox.alert(data.msg);
			            	reloadGrid();
		                }, 
		                error: function(error) {
		                	bootbox.alert("操作失败！");
		                }
		            });
				}
    		});
    	}); 
		
   	});
    


    </script>
    
</body>

</html>
 
