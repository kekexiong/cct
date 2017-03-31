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
    <form id="addform" method="POST">
    <div class="page-container">
    
    	<!-- BEGIN MENU -->
        <%-- <jsp:include page="../common/menu.jsp" flush="true"/> --%>
        <!-- END MENU -->
        
        <!-- BEGIN CONTENT -->
        <div class="page-content-wrapper">
		    <!-- 主体-->
		    <!-- <div class="page-content"> -->
		    <div class="">
		       	<input type="hidden" id="uuid"/>
		        <!-- 右边开始 -->  
		        <div class="row">
		            <div class="col-md-12">
		                <div class="portlet light bordered scaffold-list">
		                    <!-- 查询信息 -->
		                    <div class="portlet-body form">
		                            <div class="form-body">
		                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right" style="margin-left:-27px">单卡单日秒到上限:</label>
		                                            <div class="col-md-4 paddingnone">
		                                                <input name="oneDcUppLimit"  id="oneDcUppLimit" class="form-control" >
		                                            </div>
		                                        </div> 
		                                    </div>
		                                    
		                                    <div class="clearfix"></div>
		                                    
		                                </div>
		                            </div>
		                    </div>
		                   
		                </div>
		             
		        	</div>
		        	
		        	
		        	
		        	
		        	<!-- ---------------------------------------------- -->
		        	 <div class="row">
		            <div class="col-md-12">
		                <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-title">
		                        <div class="caption">  <span class="caption-subject font-blue bold uppercase"> 服务时间设置: </span> </div>
		                        <div class="tools">
		                            <a href="javascript:;" class="collapse" data-original-title="折叠" title=""> </a>
		                        </div>
		                    </div>
		                    <!-- 查询信息 -->
		                    <div class="portlet-body form">
		                            <div class="form-body">
		                                    <div class="col-lg-5 col-md-5 col-sm-4 col-xs-6" style="margin-left:-45px">
											<div class="form-group">
												<label for="span-medium-2" class="control-label col-md-3 text-right">秒到服务时间: </label>
													<div class="col-md-3 paddingnone"> 
														<input name="serTimeBegin" id="serTimeBegin"  class="form-control" >
													</div>
												<label for="span-medium-2" class="control-label col-md-2 text-right">至: </label>
												<div class="col-md-3 paddingnone">
													<input name="serTimeEnd" id="serTimeEnd" class="form-control" >
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
		                        <div class="caption">  <span class="caption-subject font-blue bold uppercase"> 可以秒到的单笔交易金额范围控制:</span> </div>
		                        <div class="tools">
		                            <a href="javascript:;" class="collapse" data-original-title="折叠" title=""> </a>
		                        </div>
		                    </div>
										
		                         <div class="portlet-body form">
		                            <div class="form-body">
		                                    <div class="col-lg-5 col-md-9 col-sm-4 col-xs-6" style="margin-left:-37px" id="md_amtLimit">
											<div class="form-group">
												<label for="span-medium-2" class="control-label col-md-4 text-right">默认秒到单笔交易上限: </label>
													<div class="col-md-3 paddingnone"> 
														<input name="defPayMaxLimit" id="defPayMaxLimit" class="form-control" placeholder="">
													</div>
											</div>
										</div>           
		                                 <div class="col-lg-5 col-md-9 col-sm-4 col-xs-6">
											<div class="form-group">
												<label for="span-medium-2" class="control-label col-md-6 text-right">默认秒到单笔交易上限设置范围: </label>
												<div class="col-md-2 paddingnone">
													<input name="payMin" id="payMin" class="form-control" placeholder="">
												</div>
												<label for="span-medium-2" class="control-label col-md-1 text-right">至: </label>
												<div class="col-md-3 paddingnone">
													<input name="payMax" id="payMax" class="form-control" placeholder="">
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
		            <div class="col-md-12" id="md_rate">
		                <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-title">
		                        <div class="caption">  <span class="caption-subject font-blue bold uppercase"> 秒到结算费率控制:</span> </div>
		                        <div class="tools">
		                            <a href="javascript:;" class="collapse" data-original-title="折叠" title=""> </a>
		                        </div>
		                    </div>
		                    <!-- 查询信息 -->
		                                     <div class="portlet-body form">
		                            <div class="form-body">
		                                    <div class="col-lg-5 col-md-9 col-sm-4 col-xs-6">
											<div class="form-group">
												<label for="span-medium-2" class="control-label col-md-4 text-right" style="margin-left:-65px">BAP默认秒到费率: </label>
													<div class="col-md-3 paddingnone"> 
														<input name="defFee" id="defFee"   class="form-control" placeholder="">
													</div>
											</div>
										</div>           
		                                 <div class="col-lg-4 col-md-8 col-sm-4 col-xs-6">
											<div class="form-group">
												<label for="span-medium-2" class="control-label col-md-5 text-right">全局秒到费率范围: </label>
												<div class="col-md-2 paddingnone">
													<input name="feeMin" id="feeMin"   class="form-control" placeholder="">
												</div>
												<label for="span-medium-2" class="control-label col-md-1 text-right">%</label>
												<label for="span-medium-2" class="control-label col-md-1 text-right"> 至: </label>
												<div class="col-md-2 paddingnone">
													<input name="feeMax" id="feeMax"   class="form-control" placeholder="">
												</div>
												<label for="span-medium-2" class="control-label col-md-1 text-right">%</label>
											</div>
										</div> 
		                                    
		                                    
		                                    <div class="clearfix"></div>
		                                </div>
		                            </div>
		                    </div>
		                   
		                </div>
		                
		                <!-- ----------------------------- -->
		        	 <div class="row">
		            <div class="col-md-12">
		                <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-title">
		                        <div class="caption">  <span class="caption-subject font-blue bold uppercase"> 秒到日限额设置:</span> </div>
		                        <div class="tools">
		                            <a href="javascript:;" class="collapse" data-original-title="折叠" title=""> </a>
		                        </div>
		                    </div>
		                    <!-- 查询信息 -->
		                    <div class="portlet-body form">
		                            <div class="form-body">
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" style="margin-left:-7px" id="md_dayAmtLimit">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-6 text-right">BAP默认秒到日限额:</label>
		                                            <div class="col-md-4 paddingnone">
		                                                <input name="payAmtLimit" id="payAmtLimit"   class="form-control" placeholder="">
		                                            </div>
		                                        </div> 
		                                        <input type="checkbox" id="amtIsLimit" />无上限
		                                    </div>
		                                    

		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-6 text-right">全局秒到日限额设置范围:</label>
		                                            <div class="col-md-4 paddingnone"> 
		                                            	<input name="amtLimitMin" id="amtLimitMin"   class="form-control" placeholder="">
		                                            </div> 
		                                        </div>
		                                    </div>
		                                 
		                                  <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-1 text-right">至:</label>
		                                            <div class="col-md-4 paddingnone"> 
		                                            	<input name="amtLimitMax" id="amtLimitMax"   class="form-control" placeholder="">
		                                            </div> 
		                                        </div>
		                                        <input type="checkbox" id="isLimit" />无上限
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
														<label for="span-medium-2" class="control-label col-md-3 text-right" style="margin-left:-3.5%">自动秒到商户查询只展示进件满</label>
														<div class="col-md-1 paddingnone">
															 <input name="satisEffDt" id="satisEffDt" type="text" class="form-control onlyNum" min="0" max="100" required="" data-bv-notempty-message="不能为空"> 
														</div>
														<label for="span-medium-2" class="control-label col-md-1 text-right" style="margin-left:-3%">天的商户</label>
														<label for="span-medium-2" class="control-label col-md-7 text-right" style="margin-left:6.5%">
														<input type="checkbox" name="satisEffDtFlg" id="satisEffDtFlg">启用</label>
													</div>
												</div>
											</div>
											<div class="row norow">
												<div class="col-lg-10 col-md-12 col-sm-4 col-xs-6"> 
													<div class="form-group">
														<label for="span-medium-2" class="control-label col-md-3 text-right" style="margin-left:-3.5%">自动秒到商户查询：对进件天数不满</label>
														<div class="col-md-1 paddingnone">
															  <input name="dissatisEffDt" id="dissatisEffDt" type="number" class="form-control onlyNum" min="0" required="" data-bv-notempty-message="不能为空"> 
														</div>
														
														<label for="span-medium-2" class="control-label col-md-4 text-right" style="margin-left:-3%"> 天的商户，进件日期按自动秒到最后一次开通日期往前推</label>
														<div class="col-md-1 paddingnone">
															 <input name="pushEffDt" id="pushEffDt" type="text" class="form-control onlyNum" min="0" required="" data-bv-notempty-message="不能为空"> 
														</div>
														
														<label for="span-medium-2" class="control-label col-md-1 text-right" style="margin-left:-3%">天展示</label>
														<label for="span-medium-2" class="control-label col-md-2 text-right" style="margin-left:9.5%">
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
		                
		                <!-- 右边开始 -->  
				        <div class="row">
				            <div class="col-md-12">
				                <div class="portlet light bordered scaffold-list">
				                    <!-- 查询信息 -->
				                    <div class="portlet-body form">
				                            <div class="form-body">
				                                    <div class="col-lg-10 col-md-12 col-sm-12 col-xs-12">
				                                        <div class="form-group">
				                                            <label for="span-medium-2" class="control-label col-md-3 text-right" style="margin-left:-3.5%">自动秒到开通商户默认等级状态:</label>
				                                            <div class="col-md-2 paddingnone">
			                                            	<select name="mecLevelStatus" id="mecLevelStatus" class="bs-select form-control" data-show-subtext="true">
					            								<option value="00">不升不降</option>	
					            								<option value="01">可升可降</option>
					            								<option value="02">只升不降</option>
			                                                </select>
		                                            </div> 
				                                        </div> 
				                                    </div>
				                                    
				                                    <div class="clearfix"></div>
				                                    
				                                </div>
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
	    	</div>
		</div>
  </form> 
   
    
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
		var url=baseURL+"/posMdRule/getPosMdRule";
		
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
           		$("#oneDcUppLimit").val(data.oneDcUppLimit);
           		$("#serTimeBegin").val(data.serTimeBegin);
           		$("#serTimeEnd").val(data.serTimeEnd);
           		$("#defPayMaxLimit").val(data.defPayMaxLimit);
           		$("#payMin").val(data.payMin);
           		$("#payMax").val(data.payMax);
           		
           		$("#defFee").val(data.defFee);
           		$("#feeMin").val(data.feeMin);
           		$("#feeMax").val(data.feeMax);
           		$("#payAmtLimit").val(data.payAmtLimit);
           		$("#amtLimitMin").val(data.amtLimitMin);
           		$("#amtLimitMax").val(data.amtLimitMax);
           		$("#uuid").val(data.uuid);
           		if(data.satisEffDtFlg=='1'){
            		$("#satisEffDtFlg").prop("checked",true);
            	}
            	if(data.dissatisEffDtFlg=='1'){
            		$("#dissatisEffDtFlg").prop("checked",true);
            	}
				$('#satisEffDt').val(data.satisEffDt);
				$('#dissatisEffDt').val(data.dissatisEffDt);
				$('#pushEffDt').val(data.pushEffDt);
				//更新内容刷新到相应的位置 
				$("#mecLevelStatus option[value='"+data.mecLevelStatus+"'").attr("selected", true);
		        $("#mecLevelStatus").selectpicker('render');
		        $("#mecLevelStatus").selectpicker('refresh');
				
           		if(data.amtIsLimit=='00'){
           			$("#amtIsLimit").trigger("click");
           			
           		}
           		if(data.isLimit=='00'){
           			$("#isLimit").trigger("click");
           		}
           		
           		
            }, 
            error: function(error) {
            	bootbox.alert("读取失败！");
            }
        });
	}
    var queryMethod=0;
    
 	//校验是否启用
	function IsChecked(value) {
		var val = "0";
		if(value==true){
			val = "1";
		}
		return val;
	}

    $(function(){
    	
    	//费率、单笔限额、日限额隐藏
	    $("#md_rate").hide();
	    $("#md_amtLimit").hide();
	    $("#md_dayAmtLimit").hide();
	    
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.TZER4001)) {$("#add_btn").hide();}
		
    	//加载数据
    	reloadGrid();
    	
    
    	
    	$("#amtIsLimit").bind("click",function(){
    		var check = $(this).prop("checked");
    		
    		if(check){
    			$("#payAmtLimit").attr("readonly",true);
    			$("#payAmtLimit").val("999999999999");
    		}else{
    			$("#payAmtLimit").attr("readonly",false);
    			$("#payAmtLimit").val("0");
    		} 
    	});
    	
    	$("#isLimit").bind("click",function(){
    		var check = $(this).prop("checked");
    		if(check){
    			$("#amtLimitMin").attr("readonly",true);
    			$("#amtLimitMax").attr("readonly",true);
    			$("#amtLimitMin").val("0");
    			$("#amtLimitMax").val("999999999999");
    		}else{
    			$("#amtLimitMin").attr("readonly",false);
    			$("#amtLimitMax").attr("readonly",false);
    			$("#amtLimitMin").val("0");
    			$("#amtLimitMax").val("0");
    		} 
    	});
    	
    	
    	//添加/修改表单的校验
		$('#addform').validate({
			errorElement:"span",
			errorClass:"help-block help-block-error",
			focusInvalid:!1,
			ignore:"",
			highlight:function(e){$(e).closest(".form-group").addClass("has-error")},
			success:function(e){$(e).closest(".form-group").removeClass("has-error")},
	        rules: {
	        	oneDcUppLimit: {
	        		required:true,
	        		number: true,
	        		range:[0,10000000]
	            },
	            serTimeBegin:{
	            	required:true,
	            	regex: /^([0-1][0-9]|2[0-3]):([0-5][0-9])$/
	            },
	            serTimeEnd:{
	            	required:true,
	            	regex: /^([0-1][0-9]|2[0-3]):([0-5][0-9])$/
	            },
	            defPayMaxLimit:{
	            	required:true,
	        		number: true,
	        		range:[0,10000000]
	            },
	            payMin:{
	            	required:true,
	        		number: true,
	        		range:[0,10000000]
	            },
	            payMax:{
	            	required:true,
	        		number: true,
	        		range:[0,10000000]
	            },
	            defFee:{
	            	required:true,
	        		number: true,
	        		range:[0,10]
	            },
	            feeMin:{
	            	required:true,
	        		number: true,
	        		range:[0,10]
	            },
	            feeMax:{
	            	required:true,
	        		number: true,
	        		range:[0,10]
	            },
	            payAmtLimit:{
	            	required:true,
	            	regex : /^\d*$/,
	            	range:[0,999999999999]
	            },
	            amtLimitMin:{
	            	required:true,
	            	regex : /^\d*$/,
	            	range:[0,999999999999]
	            },
	            amtLimitMax:{
	            	required:true,
	            	regex : /^\d*$/,
	            	range:[0,999999999999]
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
	        	},
	        	mecLevelStatus:{
	        		required:true
	        	}
	           
	        },
	        messages: {
	        	oneDcUppLimit: {
	        		required:'不能为空',
	        		number: '请输入数字',
	        		range:"请输入0~1000000"
	            },
	            serTimeBegin:{
	            	required:"不能为空",
	            	regex:'请输入正确的时间'
	            },
	            serTimeEnd:{
	            	required:"不能为空",
	            	regex:'请输入正确的时间'
	            },
	            defPayMaxLimit:{
	            	required:'不能为空',
	         		number: '请输入数字',
	         		range:"请输入0~1000000"
	            },
	            payMin:{
	            	required:'不能为空',
	         		number: '请输入数字',
	         		range:"请输入0~1000000"
	            },
	            payMax:{
	            	required:'不能为空',
	         		number: '请输入数字',
	         		range:"请输入0~1000000"
	            },
	            defFee:{
	            	required:'不能为空',
	         		number: '请输入数字',
	         		range:"请输入0~10"
	            },
	            feeMin:{
	            	required:'不能为空',
	         		number: '请输入数字',
	         		range:"请输入0~10"
	            },
	            feeMax:{
	            	required:'不能为空',
	         		number: '请输入数字',
	         		range:"请输入0~10"
	            },
	            payAmtLimit:{
	            	required:'不能为空',
	            	regex : '输入框仅支持输入正整数0-999999999999',
	            	range:[0,999999999999]
	            },
	            amtLimitMin:{
	            	required:'不能为空',
	            	regex : '输入框仅支持输入正整数0-999999999999',
	            	range:[0,999999999999]
	            },
	            amtLimitMax:{
	            	required:'不能为空',
	            	regex : '输入框仅支持输入正整数0-999999999999',
	            	range:[0,999999999999]
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
	        	},
	        	mecLevelStatus:{
	        		required: '不能为空'
	        	}
	           
	        }
	    });
    	
    	
    	
    	
    	
    	
    	//保存数据
    	$("#add_btn").bind("click",function(){
    		
    		if(!$('#addform').valid()){
    			bootbox.alert('请输入正确的数据');
    			return;
    		} 
    		
    		
    		var oneDcUppLimit =  $("#oneDcUppLimit").val();
     		 var defPayMaxLimit =  $("#defPayMaxLimit").val();//默认秒到单笔交易上限
      		 
       		
      		 var serTimeBegin =  $("#serTimeBegin").val();
      		 var serTimeEnd =  $("#serTimeEnd").val();
      		 
      		 
      		 var  serTimeBeginAA = serTimeBegin.substring(0, 2);
      		 var  serTimeBeginBB = serTimeBegin.substring(3, 5);
      		 
      		 var  serTimeEndAA   =  serTimeEnd.substring(0, 2);
      		 var  serTimeEndBB   =  serTimeEnd.substring(3, 5);
      		 
      		 
      		 if(parseInt(serTimeEndAA+serTimeEndBB) < parseInt(serTimeBeginAA+serTimeBeginBB)){
      			bootbox.alert( "秒到服务时间最大值应大于其最小值！");
    			 return; 
      		 }
      		 
      		 
      		 var payMin =  $("#payMin").val();//默认秒到单笔交易上限
      		 var payMax =  $("#payMax").val();
      		 var defFee =  $("#defFee").val();
      		 var feeMin =  $("#feeMin").val();
      		 var feeMax =  $("#feeMax").val();
      		 var payAmtLimit =  $("#payAmtLimit").val();//BAP默认秒到日限额
      		 var amtIsLimit =  chkIsLimit($("#amtIsLimit").prop("checked"));
     		 var amtLimitMin =  $("#amtLimitMin").val();//秒到日限额设置最小值
     		 var amtLimitMax =  $("#amtLimitMax").val();
     		 var isLimit =  chkIsLimit($("#isLimit").prop("checked"));
     		 var uuid = $("#uuid").val();
     		 
     		 var satisEffDtFlg = IsChecked($('#satisEffDtFlg').prop("checked"));
    		 var dissatisEffDtFlg = IsChecked($('#dissatisEffDtFlg').prop("checked"));
    		 var satisEffDt = $('#satisEffDt').val();
    		 var dissatisEffDt = $('#dissatisEffDt').val();
    		 var pushEffDt = $('#pushEffDt').val();
    		 var mecLevelStatus = $('#mecLevelStatus').val();
    		 if(mecLevelStatus==''){bootbox.alert('请选择商户开通默认等级状态');return;}
     		 if( null ==oneDcUppLimit || $.trim(oneDcUppLimit.toString()).length == 0 ){
     			 bootbox.alert("请填写单卡单日秒到上限!");
     			 return;
     	     }
      		 
      		 if( null ==defPayMaxLimit || $.trim(defPayMaxLimit.toString()).length == 0 ){
     			 bootbox.alert("请填写默认秒到单笔交易上限!");
     			 return;
     	     }
    		 
      		if( null ==payMin || $.trim(payMin.toString()).length == 0 ){
    			 bootbox.alert("请填写默认秒到单笔交易上限范围最小值!");
    			 return;
    	     }
      		
      		if( null ==payMax || $.trim(payMax.toString()).length == 0 ){
       			 bootbox.alert("请填写默认秒到单笔交易上限范围最大值!");
       			 return;
   	         }
      		
      		if(payMax<=payMin){
      			 bootbox.alert("默认秒到单笔交易上限范围最小值应小于其最大值!");
       			 return;
      		}
      		if( null ==defFee ||$.trim(defFee.toString()).length == 0 ){
       			 bootbox.alert("请填写BAP默认秒到费率!");
       			 return;
  	         }
      		

      		if( null ==feeMin || $.trim(feeMin.toString()).length == 0 ){
       			 bootbox.alert("请填写全局秒到费率最小值!");
       			 return;
  	         }
      		
      		if( null ==feeMax || $.trim(feeMax.toString()).length == 0 ){
       			 bootbox.alert("请填写全局秒到费率最大值!");
       			 return;
 	         }
      		/*if(feeMax <= feeMin ){
      			 bootbox.alert("全局秒到费率最小值应小于其最大值!");
       			 return;
      		}
      		
      		if(defPayMaxLimit<payMin || defPayMaxLimit>payMax){
      			bootbox.alert("超出上/下限制");
       		    return;
      		}
      		if(defFee < feeMin || defFee> feeMax ){
      			bootbox.alert("超出上/下限制");
       		    return;
      		}*/
      		
      		if( null ==payAmtLimit || $.trim(payAmtLimit.toString()).length == 0 ){
   			 bootbox.alert("请填写BAP默认秒到日限额!");
   			 return;
      		}
     		
      		if( null ==amtLimitMin || $.trim(amtLimitMin.toString()).length == 0 ){
       			 bootbox.alert("请填写全局秒到日限额范围最小值!");
       			 return;
 	        }
      		
     		if( null ==amtLimitMax || $.trim(amtLimitMax.toString()).length == 0 ){
       			 bootbox.alert("请填写全局秒到日限额范围最大值!");
       			 return;
  	        }
     		
     		if(amtLimitMax<amtLimitMin){
     			 bootbox.alert("全局秒到日限额范围最小值应小于其最大值!");
       			 return;
     		}
     		/*
     		if(payAmtLimit < amtLimitMin || payAmtLimit > amtLimitMax ){
      			bootbox.alert("日限额超出上/下限制");
       		    return;
      		}*/
     		
     		
     		bootbox.confirm("确定修改秒到业务规则？",function(btn){
     			if(btn){
     				var url_path_update = baseURL+"/posMdRule/modifyPosMdRule";
            		
        			App.blockUI({target:"body",boxed:!0,message:'秒到业务规则设置中，请稍等...',zIndex:20000});
        			var data={};
        			
        			data.payAmtLimit=payAmtLimit;
        			data.amtIsLimit=amtIsLimit;
        			data.amtLimitMin=amtLimitMin;
        			data.amtLimitMax=amtLimitMax;
        			data.isLimit=isLimit;
        			
        			data.oneDcUppLimit=oneDcUppLimit;
        			data.serTimeBegin=serTimeBegin;
        			data.serTimeEnd=serTimeEnd;
        			data.defPayMaxLimit=defPayMaxLimit;
        			data.payMin=payMin;
        			data.payMax=payMax;
        			data.defFee=defFee;
        			data.uuid=uuid;
        			data.feeMin = feeMin;
        			data.feeMax=feeMax;
        			data.satisEffDtFlg = satisEffDtFlg;
        			data.dissatisEffDtFlg = dissatisEffDtFlg;
        			data.satisEffDt = satisEffDt;
        			data.dissatisEffDt = dissatisEffDt;
        			data.pushEffDt = pushEffDt;
        			data.mecLevelStatus = mecLevelStatus;
        			
            		$.ajax({
                        type: "POST",  
                        url: url_path_update,
                        contentType: "application/x-www-form-urlencoded;charset=utf-8",
                        data: data,
                        dataType: "json", 
                        success: function(data) {
                	if(data.timeout){
                		ajaxTimeout();
                    }
                        	bootbox.alert(data.resMsg);
                        }, 
                        error: function(error) {
                        	bootbox.alert("修改秒到业务规则设置失败，请刷新重试.");
                        }
                    });
     				
     				
     			}
     		});
     		
     		
    		
    		
    	}); 
    	
    	
    	
    	
		
   	});
    
//判断是否为整数    
function isInteger(obj) {
	return obj%1 === 0
}

function chkIsLimit(value) {
	var val = "01";
	if(value==true){
		val = "00";
	}
	return val;
}




    </script>
    
</body>

</html>
 
