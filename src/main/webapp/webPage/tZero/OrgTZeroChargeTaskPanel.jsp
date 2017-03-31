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
		                <div class="portlet light bordered scaffold-list">
		                    <!-- 查询信息 -->
		                    <div class="portlet-body form">
		                     <form action="<%=request.getContextPath()%>/mec/queryData" class="form-horizontal" id="queryMecPanel_Form">
		                            <div class="form-body">
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">合作商编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="orgNo" id="orgNo" class="form-control" placeholder="请输入合作商编号">
		                                            </div>
		                                        </div> 
		                                    </div>
		                                   

		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">合作商名称:</label>
		                                            <div class="col-md-8 paddingnone"> 
		                                            	<input name="orgNm" id="orgNm" class="form-control" placeholder="请输入合作商名称">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                  
		                                   <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">业务类型:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="chargeTyp" id="chargeTyp" class="bs-select form-control" >
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    
		                                      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">状态:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="taskSts" id="taskSts" class="bs-select form-control" >
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="clearfix"></div>
		                                </div>
		                            </div>
		                            <div class="form-actions">
		                                <div class="row">
		                                    <div class="col-md-12">
		                                        <div class="row">
		                                            <div class="col-md-offset-1 col-md-11">
		                                                <button type="button" id="query_btn" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
		                                            	<button type="button" id="reset_btn" class="btn red"> <i class="fa fa-refresh"></i> 重置</button>
		                                            </div>
		                                        </div>
		                                    </div> 
		                                </div>
		                            </div>
		                            </form>
		                    </div>
		                   
		                </div>
		                <div class="clearfix"> </div>
		                <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-title">
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">信息列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel"  >
		                   		<input type ="button" id="confirmCharge" value="财务确认收款"/> 
		                    	<input type ="button" id="confirmRebate" value="财务确认退款"/>
		                        <table  class="table table-striped table-bordered table-hover table-checkable order-column" id="queryMecGrid">
		                            <thead>
		                                <tr>
		                                    <th>
		                                    </th>
		                                    <th class="nowrap"> 序号 </th>
		                                    <th class="nowrap"> 合作商编号 </th>
		                                    <th class="nowrap"> 合作商名称 </th>
		                                    <th class="nowrap"> 业务类型 </th>
		                                    <th class="nowrap"> 状态</th>
		                                    <th class="nowrap"> 修改前出资比例 </th>
		                                    <th class="nowrap"> 修改后出资比例 </th>
		                                    <th class="nowrap"> 修改前T+0业务规模 </th>
		                                    <th class="nowrap"> 修改后T+0业务规模 </th>
		                                    <th class="nowrap"> 收款/退款金额</th> 
		                                </tr>
		                            </thead>
		                            <tbody>
		                            </tbody>
		                        </table>
		                    </div>
		                    <!-- 分页开始 -->
		                    <div class="row no-margin" id="pagination-bar">
								<div class="col-sm-4 left no-padding" style="margin-left:15px">
									<div class="inline fl">
										记录数共:<span id="itemCount"></span>条 当前第<span id="nowpage"></span>/<span id="toalPage"></span>页 每页显示:
									</div>
									<div class="inline fl">
										<select id="limit" class=" form-control "
											onchange="onChange4PageSize(this)">
											<option value="20" selected="selected" >20</option>
											<option value="30">30</option>
											<option value="45">45</option>
											<option value="60">60</option>
											<option value="75">75</option>
										</select>
									</div>
									<div class="inline fl">条</div>
								</div>

								<div class="col-sm-6 pull-right no-padding">
	
	
									<div id="pagination"
										class="dataTables_paginate paging_simple_numbers clearfix pull-right">
										<nobr>
											<ul class="pagination no-padding" style="float: left">
												<li class="prev "> <a href="javascript:;" onclick="javascript:pageing(1)"> 首页</a> </li>
												<li class="prev "> <a href="javascript:;" onclick="javascript:pageing('pro')"> 上一页</a> </li>
												<li class="next "><a href="javascript:;" onclick="javascript:pageing('next')">下一页</a></li>
												<li class="next "><a href="javascript:;" onclick="javascript:pageing('last')">末页</a></li>
											</ul>
											<div class="input-group pull-right col-sm-2" style="float: left;">
												<input min="1" class="form-control p" style="height: 31px; width: 80px;" type="number">
												<a href="javascript:;" class="input-group-addon" onclick="javascript:pageing($('.p').val())"><i class="fa fa-mail-forward brown"></i></a>
											</div>
										</nobr>
									</div>
								</div>
		                	</div>
		                	<!-- 分页结束 -->
		            	</div>
		        	</div>
		    	</div>
	    	</div>
		</div>
	</div>
	
   <!-- 确认收款，退款 -->
   <div class="modal fade" id="updateWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="updateTitle">修改即日付结算费率</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="updateform">
                           <div class="form-body">
                               <div class="row norow">
                                <input type="hidden" id="_uuid"/>
                               <input type="hidden" id="_type"/>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-4 text-right">合作商编号:</label>
                                            <div class="col-md-6 paddingnone">
                                               <input name="_orgNo" id="_orgNo" readonly class="form-control" placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-4 text-right">合作商名称:</label>
                                             <div class="col-md-6 paddingnone">
		                                           <input name="_orgNm" id="_orgNm" readonly class="form-control" placeholder="">
		                                      </div> 
                                        </div>
                                    </div>
                                    
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-4 text-right">业务类型:</label>
                                            <div class="col-md-6 paddingnone">
                                                 <input name="_chargeTyp_NM" id="_chargeTyp_NM" readonly class="form-control" placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                       <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label class="control-label col-md-4 text-right" id="amt"></label>
                                            <div class="col-md-6 paddingnone">
                                                <input name="_prcpAmt" id="_prcpAmt" readonly class="form-control" placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                             
                                   
                                   <div class="clearfix"></div>
                               </div>
                           </div>
                           <div class="form-actions">
                               <div class="row">
                                   <div class="col-md-12">
                                       <div class="row">
                                           <div class="col-md-offset-1 col-md-11" style="margin-left:30%">
                                               <button type="button" id="importform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 确认</button>
                                               <button type="button" id="importform_cancle_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
                                           </div>
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
    	else if (opp=='last')
    	{
    		if (page == toalPage) {
    			return;
    		}
    		page=$("#toalPage").text();
    		if(page>toalPage)
    		{
    			bootbox.alert('对不起没有你要跳转的页面');
    			return;
    		}
    		else if(page<1)
    		{
    			bootbox.alert('对不起没有你要跳转的页面');
    			return;
    		}
    		
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
		var url=baseURL+"/tZero/chargeTask/queryOrgTZeroChargeTaskList";
		
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
		
		param.orgNo  = $('#orgNo').val();//合作商编号
		param.orgNm  = $('#orgNm').val();//合作商名称
		param.chargeTyp= $('#chargeTyp').val();//检索参考号 
		param.taskSts  = $('#taskSts').val();//交易类型
		App.blockUI({target:"body",boxed:!0,message:"读取中",zIndex:20000});
		$.ajax({
            type: "POST", 
            url: url,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: param,
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	
            	toalPage=Math.ceil(data.totalCount/limit);
    			$("#itemCount").text(data.totalCount);
    			$("#nowpage").text(page);
    			$("#toalPage").text(toalPage);
    			if (!data.totalCount || data.totalCount == 0) {
    				$("#pagination-bar").hide();
    				return;
    			}
    			if (toalPage < 2) {
    				$("#pagination").hide();
    			} else {
    				$("#pagination").show();
    			}
    			tableData = $.extend(true, {}, data);//cache
    			$("#queryMecGrid").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {  

                	var trData = [];
                	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                	trData.push(start + index + 1);
                	
                	trData.push(obj.orgNo);
                	trData.push(obj.orgNm);
                	trData.push(obj.chargeTyp_NM);
                	
                	if(obj.taskSts_NM=='未收款'||obj.taskSts_NM=='未退款'){
                		trData.push("<font color='red'>"+obj.taskSts_NM+"</red>");
                	}else{
                		trData.push(obj.taskSts_NM);
                	}
                	
                	
                	trData.push(obj.oldPrcpRate);
                	trData.push(obj.prcpRate);
                	trData.push(obj.oldLimtAmt);
                	trData.push(obj.limitAmt);
                	trData.push(obj.prcpAmt);
                	 for(i=0; i < trData.length; i++){
                    	 if(trData[i] == undefined){
                    		 trData[i] = ''; 
                    	 }
                     }

                    	 $("#queryMecGrid").DataTable().row.add(trData).draw();
                    	
                    	
                    });
                    $("#queryMecGrid").DataTable().order([1, 'asc']).draw();
                $("#pagination-bar").show();
                if (page == 1) {
                	//first page
                	$("#pagination .prev a").css({'color':'gray','cursor':'not-allowed'});
                } else {
                	$("#pagination .prev a").css({'color':'#23527c','cursor':'pointer'});
                }
                if (page == toalPage) {
                	// last page
                	$("#pagination .next a").css({'color':'gray','cursor':'not-allowed'});
                } else {
                	$("#pagination .next a").css({'color':'#23527c','cursor':'pointer'});
                }
              	//动态设置iframe高度
                var currentTabId = $("#tab-bar", parent.document).children('li.active').children('a').attr('href').replace('#tab_','');
                setIframeHeight($('#frame_'+currentTabId,parent.document)[0]);
	              //控制 复选框只能选中一个
	       		 $('input[type=checkbox]').bind('click', function(){
	       		 	$('input[type=checkbox]').not(this).attr("checked", false);
	       		 }); 
            }, 
            error: function(error) {
            	bootbox.alert("读取失败！");
            }
        });
	}
    var queryMethod=0;
    
   //跳转到变更状态页面
   function confirmChargeWin(orgNo,orgNm,chargeTyp_NM,uuid,prcpAmt,type){
	   
	   
	    /* $.fancybox({afterLoad:fancyboxCenterOnViewport,
   		href:'OrgTZeroChargeDetailsPanel.jsp?uuid='+uuid+'&orgNo='+orgNo+'&orgNm='+orgNm+'&chargeTyp_NM='+chargeTyp_NM+'&prcpAmt='+prcpAmt+'&type='+type,  
   		type: 'iframe',
   		padding: 5,
   		margin:60, 
   		scrolling: 'no',  
   		fitToView: true,
   		width: 1000,
   		height: 800,
   		autoSize: false, 
   		closeClick: false,
   		afterClose:function(){
   			reloadGrid();
   		} 
   	});  */
   	
   	
	   $("#_orgNo").val(orgNo);
	   $("#_orgNm").val(orgNm);
	   $("#_chargeTyp_NM").val(chargeTyp_NM);
	   $("#_uuid").val(uuid);
	   $("#_prcpAmt").val(prcpAmt);
	   $("#_type").val(type);
	   
	   
	   if(type==1){
			$('#updateTitle').text("财务确认收款");
			$('#amt').text("收款金额");
			
		}else{
			$('#updateTitle').text("财务确认退款");
			$('#amt').text("退款金额"); 
		}
	   
	   $("#updateWin").modal("show");
   	
   	
   } 
    $(function(){
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.TZERO101)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO102)) {$("#reset_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO103)) {$("#confirmCharge").hide();}
    	/* if (!hasPermission(PERMISSSIONCONST.TZERO103)) {$("#confirmRebate").hide();} */
		
    	
    	//查询处理方式下拉框
    	queryProcessType(); 
    	//查询处理状态下拉框
    	queryProcessSts();
    	//加载数据
    	reloadGrid();

    	//收款
    	$("#confirmCharge").on('click',confirmChargePage); 
    	//退款
    	$("#confirmRebate").on('click',confirmRebatePage); 
    	
    	//重置按钮
		$("#reset_btn").on('click', function() {
			$("#queryMecPanel_Form")[0].reset();
			$("#queryMecPanel_Form .bs-select").selectpicker('val','');//重置select元素
		});
		
    	
    	
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
		
		$("#importform_cancle_btn").on("click",function(){
    		$("#updateWin").modal("hide");
    		
    	});
		
		
		$("#importform_save_btn").on("click",function(){
			var url = '';
			var message ='';
			var type=$("#_type").val();
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
				        data:{uuid:$("#_uuid").val()},
				        dataType: "json",
				        success: function(data) {
	            	if(data.timeout){
	            		ajaxTimeout();
	                }
				        	if(data.success){
				        		reloadGrid();
				        		bootbox.alert("操作成功!");
				        	}else{
				        		bootbox.alert("操作失败!"+data.msg); 
				        	}
				        	$("#updateWin").modal("hide");
				        } 
				        });
				}
			})
			
		});
		
   	});
    
    
  //跳转到 确认收款页面
function confirmChargePage(){
	  
	var selectRocords = $("#queryMecGrid tbody input:checked");  
	if (selectRocords.length > 0) {
	var index = $(selectRocords[0]).attr("rownum");  
	var record = tableData.items[index];  
	
	var taskSts = record.taskSts;
	if(taskSts!='00'){//00:未收款
		bootbox.alert("不是未收款状态！");
		return;
	}
	
	
	confirmChargeWin(record.orgNo,record.orgNm,record.chargeTyp_NM,record.uuid,record.prcpAmt,1); //展示页面,1带表收款
	}else{
		bootbox.alert("请选择数据")
	}
}   
  
//跳转到 确认退款页面
function confirmRebatePage(){
	  
	var selectRocords = $("#queryMecGrid tbody input:checked");  
	if (selectRocords.length > 0) {
	var index = $(selectRocords[0]).attr("rownum");  
	var record = tableData.items[index];  
	
	var taskSts = record.taskSts;
	if(taskSts!='02'){//02:未退款
		bootbox.alert("不是未退款状态！");
		return;
	} 
	
	
	confirmChargeWin(record.orgNo,record.orgNm,record.chargeTyp_NM,record.uuid,record.prcpAmt,2); //展示页面,2 退款
	}else{
		bootbox.alert("请选择数据")
	}
}     
  
  
  
    
function queryProcessType(){
	var url = baseURL+"/code/query/typ/TZERO_CHARGE_TYP";
	
	$.ajax({ 
       type: "GET", 
       url: url, 
       success: function(data){ 
    	  console.log(data);
    	   var data = $.parseJSON(data); 
    	  $("#chargeTyp").append("<option value=''>全部</option>");
    	
    	     for (var i = 0; i < data.length; i++) {
       	      $("#chargeTyp").append("<option value='" + data[i].cdVl + "'>"   + data[i].cdNm   + "</option>"); 
       	     }
    	     
    	     //更新内容刷新到相应的位置
             $("#chargeTyp").selectpicker('render');
             $("#chargeTyp").selectpicker('refresh');
        } 

});

	
} 


//查询状态下拉框
function queryProcessSts(){
	var url = baseURL+"/code/query/typ/TZERO_CHARGE_STS";
	$.ajax({ 
       type: "GET", 
       url: url, 
       success: function(data){ 
    	   var data = $.parseJSON(data); 
    	  $("#taskSts").append("<option value=''>全部</option>");
    	     for (var i = 0; i < data.length; i++) {
    	      $("#taskSts").append("<option value='" + data[i].cdVl + "'>"   + data[i].cdNm   + "</option>"); 
    	     }
    	   //更新内容刷新到相应的位置
             $("#taskSts").selectpicker('render');
             $("#taskSts").selectpicker('refresh'); 
        } 

});
}



    </script>
    
</body>

</html>
 
