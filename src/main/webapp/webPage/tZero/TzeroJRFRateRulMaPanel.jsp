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
		       
<!-- 		        右边开始   -->
<!-- 		        <div class="row"> -->
<!-- 		            <div class="col-md-12"> -->
<!-- 		                <div class="portlet light bordered scaffold-list"> -->
<!-- 		                    查询信息 -->
<!-- 		                    <div class="portlet-body form"> -->
<!-- 		                            <div class="form-body"> -->
<!-- 		                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12"> -->
<!-- 		                                        <div class="form-group"> -->
<!-- 		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">最低费率:</label>  -->
<!-- 		                                            <div class="col-md-6 paddingnone">  -->
<!-- 		                                                <input min="0" max="10" name="minRate" type="number" id="minRate" class="form-control" /> -->
<!-- 		                                            </div>  -->
<!-- 		                                            % -->
<!-- 		                                        </div>  -->
<!-- 		                                    </div> -->
		                                    

<!-- 		                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12"> -->
<!-- 		                                        <div class="form-group"> -->
<!-- 		                                            <label class="control-label col-md-4 text-right">最高费率:</label> -->
<!-- 		                                            <div class="col-md-6 paddingnone">     -->
<!-- 		                                            	<input min="0.00" max="10.00" name="maxRate" step="1.0" type="number" id="maxRate"  class="form-control" > -->
<!-- 		                                            </div>  -->
<!-- 		                                            % -->
<!-- 		                                        </div> -->
<!-- 		                                    </div> -->
		                                   
<!-- 		                                   <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12"> -->
<!-- 		                                        <div class="form-group">  -->
<!-- 		                                            <label class="control-label col-md-4 text-right">默认费率:</label> -->
<!-- 		                                            <div class="col-md-6 paddingnone">  -->
<!-- 		                                            	<select name="defaultRate" id="defaultRate" class="bs-select form-control" data-show-subtext="true"> -->
		                                            	
<!-- 		                                                </select> -->
<!-- 		                                            	<input  min="0" max="10" name="defaultRate" type="number" id="defaultRate" class="form-control" > -->
<!-- 		                                            </div> -->
<!-- 		                                        </div> -->
<!-- 		                                    </div> -->
		                                    
		                                    
		                                    
<!-- 		                                    <div class="clearfix"></div> -->
		                                    
<!-- 		                                </div> -->
<!-- 		                            </div> -->
<!-- 		                    </div> -->
		                   
<!-- 		                </div> -->
<!-- 		        	</div> -->
		        	
		        	
		        	
		        	<!-- ---------------------------------------------- -->
		        	 <div class="row">
		            <div class="col-md-12">
		                <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-title">
		                        <div class="caption">  <span class="caption-subject font-blue bold uppercase"> 即日付额度:</span> </div>
		                        <div class="tools">
		                            <a href="javascript:;" class="collapse" data-original-title="折叠" title=""> </a>
		                        </div>
		                    </div>
		                    <!-- 查询信息 -->
		                    <div class="portlet-body form">
		                            <div class="form-body">
		                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">单日最高结算金额：</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <input min="0" max="1000000" name="dayMaxLimit" id="dayMaxLimit" type="number" class="form-control" placeholder="">
		                                            </div>
		                                        </div>  
		                                    </div>
		                                   

		                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">默认开通额度:</label>
		                                            <div class="col-md-6 paddingnone"> 
		                                            	<input min="0" max="1000000" name="defaultLimit" id="defaultLimit" type="number" class="form-control" placeholder="">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                  
		                                    
		                                     
		                                    
		                                    <div class="clearfix"></div>
		                                    
		                                </div>
		                            </div>
		                    </div>
		                   
		                </div>
		             
		        	</div>
		        	
		        	<!-- ----------------------------- -->
		        	 <div class="row">
		            <div class="col-md-12">
		                <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-title">
		                        <div class="caption">  <span class="caption-subject font-blue bold uppercase"> 代理商可配置即日付额度：</span> </div>
		                        <div class="tools">
		                            <a href="javascript:;" class="collapse" data-original-title="折叠" title=""> </a>
		                        </div>
		                    </div>
		                    <!-- 查询信息 -->
		                    <div class="portlet-body form">
		                            <div class="form-body">
		                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">代理商可配置额度下限：</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <input min="0"  max="1000000" name="agentMinLimit" id="agentMinLimit" type="number" class="form-control" placeholder="">
		                                            </div>
		                                        </div> 
		                                    </div>
		                                   

		                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">代理商可配置额度上限：</label>
		                                            <div class="col-md-6 paddingnone"> 
		                                            	<input  min="0" max="1000000" name="agentMaxLimit" id="agentMaxLimit" type="number" class="form-control" placeholder="">
		                                            </div> 
		                                        </div>
		                                    </div>

		                                    <div class="clearfix"></div>
		                                    
		                                </div>
		                            </div>
		                    </div>
		                   
		                </div>
		             
		        	</div>
		        	
		        	
		        	<div class="col-md-12">
		                <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-title">
		                        <div class="caption">  <span class="caption-subject font-blue bold uppercase"> 进件时长限制:</span> </div>
		                        <div class="tools">
		                            <a href="javascript:;" class="collapse" data-original-title="折叠" title=""> </a>
		                        </div>
		                    </div>
		                    <!-- 查询信息 -->
		                    <div class="portlet-body form">
		                            <div class="form-body">
		                                    <div class="row norow">
												<div class="col-lg-10 col-md-12 col-sm-4 col-xs-6">
													<div class="form-group">
														<label for="span-medium-2" class="control-label col-md-3 text-right" style="margin-left:-3.5%">商户进件必须满:</label>
														<div class="col-md-1 paddingnone">
															 <input min="0" max="100" name="effDt" id="effDt" type="text" class="form-control" placeholder=""> 
														</div>
														<label for="span-medium-2" class="control-label col-md-1 text-right" style="margin-left:-3%">天</label>
														<label for="span-medium-2" class="control-label col-md-7 text-right" style="margin-left:6.5%">
														<input type="checkbox" name="effDtLimit" id="effDtLimit">启用</label>
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
		                        <div class="caption">  <span class="caption-subject font-blue bold uppercase"> 连续交易天数限制:</span> </div>
		                        <div class="tools">
		                            <a href="javascript:;" class="collapse" data-original-title="折叠" title=""> </a>
		                        </div>
		                    </div>
		                    <!-- 查询信息 -->
		                    <div class="portlet-body form">
		                            <div class="form-body">
		                                    <div class="row norow">
												<div class="col-lg-10 col-md-12 col-sm-4 col-xs-6">
													<div class="form-group">
														<label for="span-medium-2" class="control-label col-md-3 text-right" style="margin-left:-3.5%">半年内有效交易天数大于等于:</label>
														<div class="col-md-1 paddingnone">
															 <input name="tranDt" id="tranDt" type="text" class="form-control onlyNum" min="0" max="100" required="" data-bv-notempty-message="不能为空"> 
														</div>
														<label for="span-medium-2" class="control-label col-md-1 text-right" style="margin-left:-3%">天</label>
														<label for="span-medium-2" class="control-label col-md-7 text-right" style="margin-left:6.5%">
														<input type="checkbox" name="tranDtLimit" id="tranDtLimit">启用</label>
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
		                        <div class="caption">  <span class="caption-subject font-blue bold uppercase"> 查询结果显示范围，进件日期计算规则限制</span> </div>
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
														<label for="span-medium-2" class="control-label col-md-3 text-right" style="margin-left:-3.5%">即日付商户查询只展示进件满</label>
														<div class="col-md-1 paddingnone">
															 <input name="satisEffDt" id="satisEffDt" type="text" class="form-control onlyNum" min="0" max="100" required="" data-bv-notempty-message="不能为空"> 
														</div>
														<label for="span-medium-2" class="control-label col-md-1 text-right" style="margin-left:1%">天的商户</label>
														<label for="span-medium-2" class="control-label col-md-7 text-right" style="margin-left:2.5%">
														<input type="checkbox" name="satisEffDtFlg" id="satisEffDtFlg">启用</label>
													</div>
												</div>
											</div>
											<div class="row norow">
												<div class="col-lg-10 col-md-12 col-sm-4 col-xs-6"> 
													<div class="form-group">
														<label for="span-medium-2" class="control-label col-md-3 text-right" style="margin-left:-3.5%">即日付商户查询：对进件天数不满</label>
														<div class="col-md-1 paddingnone">
															  <input name="dissatisEffDt" id="dissatisEffDt" type="text" class="form-control onlyNum" min="0" required="" data-bv-notempty-message="不能为空"> 
														</div>
														
														<label for="span-medium-2" class="control-label col-md-4 text-right" style="margin-left:2%"> 天的商户，进件日期按即日付最后一次开通日期往前推</label>
														<div class="col-md-1 paddingnone">
															 <input name="pushEffDt" id="pushEffDt" type="text" class="form-control onlyNum" min="0" required="" data-bv-notempty-message="不能为空"> 
														</div>
														
														<label for="span-medium-2" class="control-label col-md-1 text-right" style="margin-left:0.5%">天展示</label>
														<label for="span-medium-2" class="control-label col-md-2 text-right" style="margin-left:1%">
														<input type="checkbox" name="dissatisEffDtFlg" id="dissatisEffDtFlg">启用</label>
													</div>
												</div>
											</div>
											</div>
		                                   
		                                    <div class="clearfix"></div>
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
    
  	//分页默认隐藏
    $("#pagination-bar").hide();

    //每页多少条
    var limit=0;
    //当前页
    var page=1;
    //起始条
    var start=0;
    //总页数
    var toalPage;
    //数据列表缓存
    var tableData;

    //分页
    function pageing(opp) {
    	$(window.top.document).scrollTop(0,500);
    	limit=$("#limit  option:selected").text();
    	 
    	if(opp=='pro')
    	{
    		if(page>1)
    		{
    			page=page-1;
    			start=(page-1)*limit;
    		}
    		else
    		{
    			bootbox.alert('已经是第一页');
    			return;
    		}
    	}
    	else if (opp=='next')
    	{
    		if(page==toalPage)
    		{
    			bootbox.alert('已经是最后一页');
    			return;
    		}
    		page=page+1;
    		start=(page-1)*limit;
    	}
    	else
    	{
    		 if (page == 1 && opp == 1) {
                 return;
             }
             
             if(opp>toalPage)
             {
                 bootbox.alert('对不起没有你要跳转的页面');
                 return;
             }
             else if(opp<1)
             {
                 bootbox.alert('对不起没有你要跳转的页面');
                 return;
             }
             page=opp*1;
             start=(page-1)*limit;
    	}
    	$('table > tbody').empty();
    	//$("table tbody [id^='resutl_']").remove();
    	reloadGrid();
    }
    
    //全选列表数据
    function checkAll(checked) {
    	$("#queryMecGrid tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
  	
    //查询数据
    function reloadGrid() {
		var url=baseURL+"/busRate/query?busTyp=01";
		
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
	
		$.ajax({
            type: "GET", 
            url: url,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: param,
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
           		$("#busNm").val(data.busNm);
           		$("#defaultLimit").val(data.defaultLimit);
           		$("#busTyp").val(data.busTyp);
           		$("#agentMaxLimit").val(data.agentMaxLimit);
           		$("#dayMaxLimit").val(data.dayMaxLimit);
           		$("#agentMinLimit").val(data.agentMinLimit);
           		if(data.effDtLimit=='1'){
            		$("#effDtLimit").prop("checked",true);
            	}
           		if(data.tranDtLimit=='1'){
            		$("#tranDtLimit").prop("checked",true);
            	}
           		if(data.satisEffDtFlg=='1'){
            		$("#satisEffDtFlg").prop("checked",true);
            	}
            	if(data.dissatisEffDtFlg=='1'){
            		$("#dissatisEffDtFlg").prop("checked",true);
            	}
            	$('#effDt').val(data.effDt);
				$('#tranDt').val(data.tranDt);
				$('#satisEffDt').val(data.satisEffDt);
				$('#dissatisEffDt').val(data.dissatisEffDt);
				$('#pushEffDt').val(data.pushEffDt);
           		
            }, 
            error: function(error) {
            	bootbox.alert("读取失败！");
            }
        });
	}
    var queryMethod=0;
    

    $(function(){
    	
    	
    	$('input').blur(function(){
    		var val = $(this).val();
    		if(val!=''){
    			//如果是整数
    			if(isInteger(val)){
    				$(this).val(parseInt(val));
    			}else{
    				$(this).val(parseFloat(val));
    			}
    		}
    		
    		
    	});
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.TZER4001)) {$("#add_btn").hide();}
//     	loadGoodId("defaultRate");
    	
    	 $('#addForm').validate({
    		 errorElement:"span",
 			 errorClass:"help-block help-block-error",
 			 focusInvalid:!1,
 			 ignore:"",
 			 highlight:function(e){$(e).closest(".form-group").addClass("has-error")},
 			 success:function(e){$(e).closest(".form-group").removeClass("has-error")},
    		 rules: {
    			 dayMaxLimit: {
	   				 required:true,
	   				 max:1000000,
	   				 min:0,
	   				 digits:true
	         	 },defaultLimit: {
	   				 required:true,
	   				 max:1000000,
	   				 min:0,
	   				 digits:true
	         	 },agentMinLimit: {
	   				 required:true,
	   				 max:1000000,
	   				 min:0,
	   				 digits:true
	         	 },agentMaxLimit: {
	   				 required:true,
	   				 max:1000000,
	   				 min:0,
	   				 digits:true
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
	        	},
	            satisEffDt:{
	        		required:true,
	        		min: 0,
	            	max:100,
	            	regex:/^\d*$/
	        	},
	        	dissatisEffDt:{
	        		required:true,
	        		min: 0,
	            	max:100,
	            	regex:/^\d*$/
	        	},
	        	pushEffDt:{
	        		required:true,
	        		min: 0,
	            	max:100,
	            	regex:/^\d*$/
	        	}
	            
	          },
	          messages: {
	        	 dayMaxLimit: {
	        		  required:'不能为空',
	        		  max:'该输入项的最大值是 1000000',
	        		  min:'不能为负数',
	        		  digits:'只能为整数'
	            },defaultLimit: {
	        		  required:'不能为空',
	        		  max:'该输入项的最大值是 1000000',
	        		  min:'不能为负数',
	        		  digits:'只能为整数'
	            },agentMinLimit: {
	        		  required:'不能为空',
	        		  max:'该输入项的最大值是 1000000',
	        		  min:'不能为负数',
	        		  digits:'只能为整数'
	            },agentMaxLimit: {
	        		  required:'不能为空',
	        		  max:'该输入项的最大值是 1000000',
	        		  min:'不能为负数',
	        		  digits:'只能为整数'
	            },
	            effDt:{
	            	required: '不能为空',
		     		min: '最小值为0',
		     		max: '最大值为100',
		     		regex:'输入框仅支持输入非负整数'
	        	},
	        	tranDt:{
	        		required: '不能为空',
		     		min: '最小值为0',
		     		max: '最大值为100',
		     		regex:'输入框仅支持输入非负整数'
	        	},
	            satisEffDt:{
	            	required: '不能为空',
		     		min: '最小值为0',
		     		max: '最大值为100',
		     		regex:'输入框仅支持输入非负整数'
	        	},
	        	dissatisEffDt:{
	        		required: '不能为空',
		     		min: '最小值为0',
		     		max: '最大值为100',
		     		regex:'输入框仅支持输入非负整数'
	        	},
	        	pushEffDt:{
	        		required: '不能为空',
		     		min: '最小值为0',
		     		max: '最大值为100',
		     		regex:'输入框仅支持输入非负整数'
	        	}
	            
	          }
	      });
		
    	
    	//加载计费产品下拉框
			function loadGoodId(element){
				$.ajax({
					type : "GET",
					url : baseURL+"/busRate/queryRate",
					contentType : "application/json;charset=utf-8",
					dataType : "json",
					success : function(data) {
						if(data.timeout){
		            		ajaxTimeout();
		                }
						$("#" + element).empty();
						$("#" + element).append($("<option></option>").val("").text("请选择"));
		                $.each(data, function(index, obj) {
		                	$("#" + element).append($("<option></option>").val(obj.goodsId).text(obj.goodsNm));
		                });
		               	//更新内容刷新到相应的位置
		                $("#" + element).selectpicker('render');
		                $("#" + element).selectpicker('refresh');
					},
					error : function(error) {
					}
				});
			}
    	
    	
    	
    	
    	
		
    	//加载数据
    	reloadGrid();
    	
    	$("input").bind("blur",function(){
    		var val = $(this).val();
    		if(val<0){
    			$(this).val('0');
    		}
    	});
    	
    	
    	//校验是否启用
		function IsChecked(value) {
			var val = "0";
			if(value==true){
				val = "1";
			}
			return val;
		}
    	
    	//保存数据
    	$("#add_btn").bind("click",function(){
    		
    		
    		 if(!$('#addForm').valid()){  
                 bootbox.alert("输入数据不正确,请重新填写");
                  return;  
              }  
    		
//     		var defaultRate = $("#defaultRate").val();
    		var dayMaxLimit = $("#dayMaxLimit").val();
    		var defaultLimit = $("#defaultLimit").val();
    		var agentMinLimit = $("#agentMinLimit").val();
    		var agentMaxLimit = $("#agentMaxLimit").val();
    		var effDtLimit = IsChecked($('#effDtLimit').prop("checked"));
    		var tranDtLimit = IsChecked($('#tranDtLimit').prop("checked"));
    		var satisEffDtFlg = IsChecked($('#satisEffDtFlg').prop("checked"));
    		var dissatisEffDtFlg = IsChecked($('#dissatisEffDtFlg').prop("checked"));
    		var effDt = $('#effDt').val();
    		var tranDt = $('#tranDt').val();
    		var satisEffDt = $('#satisEffDt').val();
    		var dissatisEffDt = $('#dissatisEffDt').val();
    		var pushEffDt = $('#pushEffDt').val();
    		if(dayMaxLimit==''||defaultLimit==''||agentMinLimit==''||agentMaxLimit==''){
    			bootbox.alert("请确保每项都不能为空!");
    			return;
    		}
    		
    		
    		if(isNaN(dayMaxLimit)||isNaN(defaultLimit)||isNaN(agentMinLimit)||isNaN(agentMaxLimit))
    		{ 
    			bootbox.alert("请填写数字!");
    			return;
    		}else{
        		 dayMaxLimit = parseFloat(dayMaxLimit);
        		 defaultLimit =parseFloat(defaultLimit);
        		 agentMinLimit = parseFloat(agentMinLimit);
        		 agentMaxLimit = parseFloat(agentMaxLimit); 
        		
        		 
    		}
    		if(dayMaxLimit<0){
    			bootbox.alert("单日最高结算金额不能小于0");
    			return;
    		}
    		if(dayMaxLimit>1000000){
    			bootbox.alert("单日最高结算金额不能大于1000000");
    			return; 
    		}
    		
    		if(!isInteger(dayMaxLimit)){
    			bootbox.alert("单日最高结算金额必须是整数");
    			return;
    		}
    		if(defaultLimit<0){
    			bootbox.alert("默认开通额度不能小于0");
    			return;
    		}
    		if(defaultLimit>1000000){
    			bootbox.alert("默认开通额度不能大于1000000");
    			return; 
    		}
    		if(!isInteger(defaultLimit)){
    			bootbox.alert("默认开通额度必须是整数");
    			return;
    		}
    		
    		if(agentMinLimit<0){
    			bootbox.alert("代理商可配置额度下限不能小于0");
    			return;
    		}
    		if(agentMinLimit>1000000){
    			bootbox.alert("代理商可配置额度下限不能大于1000000");
    			return; 
    		}
    		if(!isInteger(agentMinLimit)){
    			bootbox.alert("代理商可配置额度下限必须是整数");
    			return;
    		}
    		if(agentMaxLimit<0){
    			bootbox.alert("代理商可配置额度上限不能小于0");
    			return;
    		}
    		if(agentMaxLimit>1000000){
    			bootbox.alert("代理商可配置额度上限不能大于1000000");
    			return; 
    		}
    		if(!isInteger(agentMaxLimit)){
    			bootbox.alert("代理商可配置额度上限必须是整数");
    			return;
    		} 
    		
    		if (agentMinLimit > defaultLimit) {
    			bootbox.alert("代理商可配置额度下限必须小于或等于默认开通额度，请修改.");
    			return;
    		}
    		
    		if (agentMaxLimit < defaultLimit) {
    			bootbox.alert("默认开通额度必须小于或等于代理商可配置额度上限，请修改.");
    			return;
    		}
    		if (agentMaxLimit > dayMaxLimit) {
    			bootbox.alert("代理商可配置额度上限必须小于或等于单日最高结算额度，请修改.");
    			return;
    		}
    		
    		var url_path_update = baseURL+"/busRate/saveJRFRul";
    		
    		var param = {};
//     		param.defaultRate =defaultRate;
    		param.dayMaxLimit = dayMaxLimit;
    		param.defaultLimit =defaultLimit;
    		param.agentMinLimit = agentMinLimit;
    		param.agentMaxLimit = agentMaxLimit; 
    		param.effDtLimit = effDtLimit;
    		param.tranDtLimit = tranDtLimit; 
    		param.satisEffDtFlg = satisEffDtFlg;
    		param.dissatisEffDtFlg = dissatisEffDtFlg;
    		param.effDt = effDt;
    		param.tranDt = tranDt;
    		param.satisEffDt = satisEffDt;
    		param.dissatisEffDt = dissatisEffDt;
    		param.pushEffDt = pushEffDt;
    		
			param.busTyp="01";  
			App.blockUI({target:"body",boxed:!0,message:'即日付业务规则设置中，请稍等...',zIndex:20000});
    		$.ajax({
                type: "GET",  
                url: url_path_update,
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                data: param,
                dataType: "json", 
                success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
                	bootbox.alert(data.msg);
                }, 
                error: function(error) {
                	bootbox.alert("操作失败！");
                }
            });
    		 
    		
    	}); 
    	
    	
    	
    	
		
   	});
    
//判断是否为整数    
function isInteger(obj) {
	return obj%1 === 0
}




    </script>
    
</body>

</html>
 
