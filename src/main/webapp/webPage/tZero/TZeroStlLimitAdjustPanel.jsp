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
     <input type="hidden" id="data">
    
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
		                                    

		                                    <div class="row norow">
		                                   <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">商户编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mno" id="mno" class="form-control" placeholder="请输入商户编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                  
		                                  
		                                  	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">操作人编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="uteStffNo" id="uteStffNo" class="form-control" placeholder="请输入操作人编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">商户名称:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="cprRegNmCn" id="cprRegNmCn" class="form-control" placeholder="请输入商户名称">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">业务状态:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="stlSts" id="stlSts" class="bs-select form-control" data-show-subtext="true">
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
		                                                 
		                                                <button type="button" id="edit_btn" class="btn tn btn btn-primary"> <i class="fa fa-edit"></i> 修改限额</button>	
		                                                <button type="button" id="down_btn" class="btn btn-success"><i class="fa fa-download"></i> 模板下载</button>
		                                                <button type="button" id="exportexcel_btn" class="btn btn-info"> <i class="fa fa-import"></i> 批量导入手工限额</button>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">即日付商户业务限额调整信息列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel"  >
		                        <table  class="table table-striped table-bordered table-hover table-checkable order-column" id="queryMecGrid">
		                            <thead>
		                                <tr> 
		                                    <th>
		                                    </th>
		                                    <th class="nowrap"> 序号 </th>
		                                    <th class="nowrap"> 商户编号</th>
		                                    <th class="nowrap"> 商户名称</th>
		                                    <th class="nowrap"> 业务状态 </th>
		                                    <th class="nowrap"> 业务额度 </th>
		                                    <th class="nowrap"> 可用额度</th>
		                                    <th class="nowrap"> 操作时间</th>
		                                	<th class="nowrap"> 操作人编号</th>
		                                	<th class="nowrap"> 操作人备注 </th>
		                                	<th class="nowrap"> 操作记录 </th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            </tbody>
		                        </table>
		                    </div>
		                    <!-- 分页开始 -->
		                    <div class="row no-margin" id="pagination-bar">
								<div class="col-sm-4 left no-padding">
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
											<option value="500">500</option>
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
	


<!-- 文件模板导入 -->
	<div class="modal fade" id="importExcelWin" tabindex="-1" data-backdrop="static" data-width="600px">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="excelTitle">修改即日付额度</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="exportform">
                           <div class="form-body">
                               <div class="row norow">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right">商户编号:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input id="_mno" class="bs-select form-control" disabled="disabled" data-show-subtext="true"/>
                                            </div>
                                        </div>
                                    </div>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right">商户名称:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input id="_cprRegNmCn" class="bs-select form-control" disabled="disabled" data-show-subtext="true"/>
                                            </div>
                                        </div>
                                    </div>
                                    
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right">当前额度:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input id="_limitAmt" type="number" disabled="disabled" class="bs-select form-control"  data-show-subtext="true"/>
                                            </div>
                                        </div>
                                    </div>
                                    		<input type="hidden" id="_inMno"/>
                                       <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right">新额度:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input id="newLimitAmt" type="number" value="20000" class="bs-select form-control"  data-show-subtext="true"/>
                                            </div>
                                        </div>
                                    </div>
                                             
                                	 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right">操作备注:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input id="_rmk" class="bs-select form-control" data-show-subtext="true"/>
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
                                           <div class="col-md-12" style="text-align:center;">
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



<!-- Excel的模态框（Modal） -->
	<div class="modal fade" id="exportExcelWin" tabindex="-1" data-backdrop="static" data-width="600px">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">文件导入</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="exportform">
                           <div class="form-body">
                               <div class="row norow">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                       <div class="form-group">
                                           <label for="span-medium-2" class="control-label col-md-2 text-right">选择文件:</label>
                                           <label class="checkbox-inline">
										      <input type="file" name="file" id="file"   checked aria-label="...">
										   </label>
                                       </div>
                                   </div>
                                   <div class="clearfix"></div>
                               </div>
                           </div>
                           <div class="form-actions" style="text-align:center;">
                               <div class="row">
                                   <div class="col-md-12">
                                       <div class="row">
                                           <div class="col-md-12" style="text-align:center;">
                                               <button type="button" id="exportform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 确认</button>
                                               <button type="button" id="exportform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </form>
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
    		page=opp*1;
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
    	var url = baseURL + "/tzeroStl/queryTZeroLimitInfo"; //查询数据URL 
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
		
		param.mno = $('#mno').val(); //商务编号
		param.uteStffNo = $('#uteStffNo').val();//终端编号
		param.cprRegNmCn = $('#cprRegNmCn').val();//终端编号
		param.stlSts = $('#stlSts').val();//终端编号

		App.blockUI({target:"body",boxed:!0,message:'读取中...',zIndex:20000});
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
            	console.log(data);
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
                //data = Object {items: Array[20], totalCount: 269}
                $.each(data.items, function(index, obj) {
                	var trData = [];
                	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                	trData.push(start + index + 1);
                	
                	trData.push(obj.mno);
                	trData.push(obj.cprRegNmCn);
                	
                	
                	if(obj.stlSts=='00'){
                		trData.push('关闭');
                	}else if(obj.stlSts=='01'){
                		trData.push('开通');
                	}else if(obj.stlSts=='02'){
                		trData.push('暂停');
                	}
                	
                   	trData.push(obj.limitAmt);
                	trData.push(obj.remainAmt);
                	trData.push(obj.dttmUte);
                	trData.push(obj.uteStffNo);
                	trData.push(obj.rmk);
                	trData.push('<input type="button"  inMno='+obj.inMno+' name="showLog"    value="查看"/>');
                	
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
                
                $("input[name='showLog']").bind("click", showLog);  
                
             	 //控制 复选框只能选中一个
           		 $('input[type=checkbox]').bind('click', function(){
	       		 $('input[type=checkbox]').not(this).attr("checked", false);
	       		 }); 
              //绑定 变更状态事件
            	$("a[name='changests']").bind("click", changests);  
            },
            error: function(error) {
            	bootbox.alert("读取失败！");
            }
        });
	}
    var queryMethod=0;
    
   //跳转到变更状态页面
   function changests(){
	   var uuid = $(this).attr("UUID");
	    $.fancybox({afterLoad:fancyboxCenterOnViewport,
   		href:'SecondCfmUpdatePanel.jsp?uuid='+uuid,  
   		type: 'iframe',
   		padding: 5,
   		margin:60, 
   		scrolling: 'no',
   		fitToView: true,
   		width: 1000,
   		height: 800,
   		autoSize: false, 
   		autoResize:false,
   		closeClick: false,
   		afterClose:function(){
   			reloadGrid();
   		} 
   	}); 
   } 
    $(function(){
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.TZER1005)) {$("#edit_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZER1005)) {$("#exportexcel_btn").hide();}
    	
    	//异步查询状态
		querySts();
		
		
    	//推送类型选中事件
    	$("#_pushType").bind("change",function(){
    		var type = $("#_pushType").val()
    		if(type=='02'){
    			$("#_smsPassDiv").show();
    			$("#_sengMsgInfoDiv").show();
    		}else{
    			$("#_smsPassDiv").hide();
    			$("#_sengMsgInfoDiv").hide();
    		}
    		
    	})
    	
    	
    	//添加/修改表单的校验
		$('#addform').bootstrapValidator({trigger:'blur',
	        fields: {
	        	usrNm: {
	                validators: {
	                    notEmpty: {
	                        message: '用户名称必填'
	                    },
	                    stringLength: {
	                    	max: '32',
	                    	message: '用户名称不能超过32个字符'
	                    }
	                }
	            }
	        },
	        submitHandler: function(validator, form, submitButton) {
	            /* var fullName = [validator.getFieldElements('firstName').val(),
	                            validator.getFieldElements('lastName').val()].join(' ');
	            $('#helloModal')
	                .find('.modal-title').html('Hello ' + fullName).end()
	                .modal(); */
	        }
	    });

		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		//重置按钮
		 $("#reset_btn").on('click', function() {
			$("#queryMecPanel_Form")[0].reset();
			$("#queryMecPanel_Form .bs-select").selectpicker('val','');//重置select元素
		}); 
		
		//模板下载
		$("#down_btn").bind("click",function(){
				window.location.href = baseURL+"/tzeroStl/downloadExcel";			
		});
		 
		
		
		//修改限额页面
		$("#edit_btn").on('click', function() {
			openImportExcelWin();
		});
		 
		
		//批量导入excel修改
		// 批量修改随意通工作日费率
		 $("#exportexcel_btn").on('click', function() {
			$("#exportExcelWin").modal('show');
			
			batchOpt('04');
			$("#exportform_cancel_btn").off('click').on('click', function() {
				$("#exportExcelWin").modal('hide');
			});
			
		}); 
		
   	});
    
//修改限额s
function openImportExcelWin(){
	 var dayMaxLimit  = "";
	var selectRocords = $("#queryMecGrid tbody input:checked");
	if (selectRocords.length > 0) {
		
		var index = $(selectRocords[0]).attr("rownum");
			record = tableData.items[index];
			 
		var mno = record.mno;
		var cprRegNmCn = record.cprRegNmCn; 
		var limitAmt =record.limitAmt;
		var inMno = record.inMno; 
		dayMaxLimit = record.dayMaxLimit;
		/* var newLimitAmt  =record.newLimitAmt; */ 
		$("#_mno").val(mno);
		$("#_cprRegNmCn").val(cprRegNmCn);
		$("#_limitAmt").val(limitAmt);
		$("#_inMno").val(inMno);
		
		

	} else { 
		bootbox.alert("选择一条数据");//选择一条数据
		return;
	}
			
	
    	
    	$("#importform_save_btn").off('click').on('click', function() {
    		var newLimitAmt = $("#newLimitAmt").val();
    		console.log(dayMaxLimit);
    	  if(newLimitAmt==''){
   			 bootbox.alert("新额度不能为空!"); 
   			 return;
    	  }
    	  if(isNaN(newLimitAmt)){
    			 bootbox.alert("新额度只能为数字!"); 
    			 return;
     	  }
    	  newLimitAmt = parseFloat(newLimitAmt); 
    	  if(newLimitAmt<=0){
    			 bootbox.alert("业务额度不能小于等于0"); 
    			 return;
     	  }
    	  if(newLimitAmt>dayMaxLimit){
    			 bootbox.alert("业务限额不能大于"+dayMaxLimit+"元"); 
    			 return;
     	  }
    	  
    	
    	 var url = baseURL+"/tzeroStl/updateTZeroLimit";
    	  
    	 var data = {};
		data.mno=$("#_mno").val();
		data.inMno=$("#_inMno").val();
		data.limitAmt=$("#newLimitAmt").val();
		data.rmk=$("#_rmk").val();
		
		
    	 $.ajax({ 
    	       type: "POST", 
    	       url: url, 
    	       data:data,
    	       success: function(data){ 
    	    	   var data = $.parseJSON(data);
    	    	   if(data.success){
 						bootbox.alert(data.msgInf);
 						$("#importExcelWin").modal('hide');
 						$("#_rmk").val("");
 						$("#newLimitAmt").val("20000");
 						reloadGrid();
    	    	   }else{
    	    		   bootbox.alert(data.msgInf);
    	    			$("#_rmk").val("");
 						$("#newLimitAmt").val("20000");
    	    	   }
    	        	} 
    			});
    		
    		
    	});

	        
    	//弹出窗口取消按钮
		$("#importform_cancle_btn").off('click').on('click', function() { 
			$("#importExcelWin").modal('hide');
    	});

    	$("#importExcelWin").modal('show');
    			
    	}
       
//  查询所属分公司
function querySts(){
	var url = baseURL+"/code/query/typ/TZERO_STL_STS";
	$.ajax({ 
       type: "GET", 
       url: url, 
       success: function(data){ 
    	  console.log(data);
    	   var data = $.parseJSON(data); 
    	  $("#stlSts").append("<option value=''>全部</option>");
    	
    	     for (var i = 0; i < data.length; i++) {
       	      $("#stlSts").append("<option value='" + data[i].cdVl + "'>"   + data[i].cdNm   + "</option>"); 
       	     }
    	    //更新内容刷新到相应的位置
            $("#stlSts").selectpicker('render');
            $("#stlSts").selectpicker('refresh');
        	} 
		});
	  }
//查看页面
function showLog(){
	var inMno = $(this).attr("inMno");
	var url=baseURL+"/tzeroStl/opeateHis/"+inMno;
	var param = {page:1,start:0,limit:20};
	$.ajax({
        type: "GET", 
        url: url,
        data:param,
        dataType: "json",
        success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
        	if(data.totalCount==0){
        		bootbox.alert("没有操作数据");
        		return;
        	}else{
        		 $.fancybox({afterLoad:fancyboxCenterOnViewport,
        				href:'TZeroStlLimitShowLogPanel.jsp?inMno='+inMno,    
        				type: 'iframe',
        				padding: 5,
        				margin:60, 
        				scrolling: 'no', 
        				fitToView: true,
        				width: 1200,
        				height: 490, 
        				autoSize: false, 
        				closeClick: false,
        				afterClose:function(){
        					/* reloadGrid(); */
        				} 
        			}); 
        	}
        }
        });

}

function batchOpt(optType){ 
	$("#exportform_save_btn").off('click').on('click', function() { 
			
			var filepath = $("#file").val();
			if(filepath==undefined||filepath==""){ 
				//fileObject.focus(); 
				bootbox.alert("请选择上传文件!");
				return;
			}
			else{ 
				var fileArr=filepath.split("\\"); 
				var fileTArr=fileArr[fileArr.length-1].toLowerCase().split("."); 
				var filetype=fileTArr[fileTArr.length-1]; 
				
				if(filetype!="xlsx"){ 
					//fileObject.focus(); 
					bootbox.alert("上传文件必须为07版Excel文件(后缀.xlsx)!");
					return;
			 	}else{ 
					 $("#error").innerText=""; 
				} 
		   } 
			
	    	
	    	bootbox.confirm("确认导入Excel文件吗?",function(data){
	    		if(data){

	  			  var fileObj = document.getElementById("file").files[0]; // 获取文件对象
	  			  var form = new FormData();
	  			   // FormData 对象
	  			  form.append("file", fileObj); // 文件对象
	  			  
	  			 App.blockUI({target:"#exportExcelWin",boxed:!0,message:'文件导入中...',zIndex:20000});
	  	       $.ajax({
	  	           url:baseURL + "/tzeroStl/importExcel", 
	  	           type:"post",
	  	           data:form,
	  	           processData:false,
	  	           contentType:false,
	  	           success:function(result){
	  	        		   $("#importExcelWin").modal('hide');
	  	        		   result = jQuery.parseJSON(result);
	  	        	 if (result.msgCd == 'MEC00000') {
	  	            		var failCount = result.failureCount;
	  	            		if(failCount==0){
	  	            		bootbox.alert('本次批量导入调整即日付额度共成功'+result.successCount+'条,失败'+result.failureCount+'条');
	  	            		$("#file").val('');
	  	            		$("#exportExcelWin").modal('hide');
	  	            		//将返回的数据绑定到列表中
	  	                    	reloadGrid(); 
	  	            		}else{
	  	            			$("#file").val('');
	  	                		$("#exportExcelWin").modal('hide');
	  	            			showExcelImportErrorPanel(JSON.stringify(result));
	  	            			
	  	            		}
						}else if (result.msgCd == 'MEC0101'){
							bootbox.alert("批量调额失败，原因："+result.msgInfo);
						}else{
							bootbox.alert("导入文件未通过格式校验，原因："+result.msgInfo);
						}
	  	        	   
	  	        	   
	  	        	   //移除点击事件
	  	        	   $("#exportform_save_btn").unbind("click");
	  	           },
	  	           error:function(e){
	  	               bootbox.alert("导入错误！！");
	  	              // window.clearInterval(timer);
	  	           }
	  	       });     
	    		}
	    		
	    	})
	    	
	    	
	    	
			   
	   });
		
	}

//跳转excel导入出错页面    
function showExcelImportErrorPanel(data){
	$("#data").val(data);
	 $.fancybox({afterLoad:fancyboxCenterOnViewport,
  		href:'TZeroStlLimitExcelErrorPanel.jsp',    
  		type: 'iframe', 
  		padding: 5,
  		margin:60, 
  		scrolling: 'no',
  		fitToView: true,
  		width: 1200,
  		height: 490,
  		autoSize: false,  
  		closeClick: false,
  		afterClose:function(){
  			/* reloadGrid(); */
  		} 
  	}); 
}	


    </script>
    
</body>

</html>
 
