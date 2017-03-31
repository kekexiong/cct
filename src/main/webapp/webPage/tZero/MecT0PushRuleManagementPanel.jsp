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
		                                    

		                                    <div class="row norow">
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">导入日期:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange">
		                                                    <input type="text" class="form-control col-md-3" name="strDtStart" id="strDtStart">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="strDtEnd" id="strDtEnd">
		                                                </div>
		                                            </div>
		                                        </div> 
		                                    </div>
		                                  
		                                  
		                                  	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">导入渠道:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="pushType" id="pushType" class="bs-select form-control" data-show-subtext="true">
				            								<option value="">全部</option>	
				            								<option value="01">POS</option>
				            								<option value="02">SMS</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">导入状态:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="importSts" id="importSts" class="bs-select form-control" data-show-subtext="true">
				            								<option value="">全部</option>	
				            								<option value="00">待处理</option>
				            								<option value="01">成功</option>
				            								<option value="02">失败</option>
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
		                                            	<button type="button" id="importPanel_add_btn" class="btn btn-info"> <i class="fa fa-import"></i> 手动导入T+0商户</button>
		                                                <button type="button" id="down_btn" class="btn btn-success"><i class="fa fa-download"></i> 下载T+0导入模板</button>
		                                                <!-- <button type="button" id="reset_btn" class="btn red"> <i class="fa fa-refresh"></i> 重置</button> -->
		                                                <button type="button" id="exportexcel_btn" class="btn btn btn-primary"> <i class="fa fa-sign-out"></i> 明细导出</button>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">即日付推送管理信息列表</span> </div>
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
		                                    <th class="nowrap"> 批次号 </th>
		                                    <th class="nowrap"> 导入时间 </th>
		                                    <th class="nowrap"> 导入渠道</th>
		                                    <th class="nowrap"> 导入状态 </th>
		                                    <th class="nowrap"> 导入条数 </th>
		                                    <th class="nowrap"> 处理结果 </th>
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
	
    <!-- 查看详情的模态框（Modal） -->
    
    <!-- Excel的模态框（Modal） -->
	<div class="modal fade" id="exportExcelWin" tabindex="-1" data-backdrop="static" data-width="600px">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">明细导出</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="exportform">
                           <div class="form-body">
                               <div class="row norow">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                       <div class="form-group">
                                           <label for="span-medium-2" class="control-label col-md-4 text-right">请选择导出方式:</label>
                                           <label class="checkbox-inline">
										      <input type="radio" name="innerExcelType" id="innerExcelType" value="1" checked aria-label="...">按页面选中导出
										   </label>
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
 


<!-- 文件模板导入 -->
	<div class="modal fade" id="importExcelWin" tabindex="-1" data-backdrop="static" data-width="600px">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="excelTitle">手动导入T+0商户</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="exportform1">
                           <div class="form-body">
                               <div class="row norow">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="actDiv" >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-3 text-right">推送类型:</label>
                                            <div class="col-md-8 paddingnone">
                                                <select name="_pushType" id="_pushType" class="bs-select form-control" data-show-subtext="true">
                                                	<option value="01">POS</option>
                                                	<option value="02">SMS</option>
                                                </select>
                                            </div> 
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                       <div class="form-group">
                                           <label for="span-medium-2" class="control-label col-md-3 text-right">选择文件:</label>
                                           <label class="checkbox-inline">
										      <input type="file" name="file" id="file"   checked aria-label="...">
										   </label>
                                       </div>
                                   </div>
                                    
                                    <div id="_smsPassDiv">
                                      <label class="control-label col-md-3 text-right" >发送短信通道:</label>
                                            <div class="col-md-8 paddingnone">
                                                <select name="_smsPass" id="_smsPass" class="bs-select form-control" data-show-subtext="true">
                                                	<option value="1001">朗宇行业</option>
                                                	<option value="1014">朗宇营销</option> 
                                                	<option value="1011">百悟通行业</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                    
                                   <div id="_sengMsgInfoDiv"> 		
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                                        <div class="form-group">
                                                  <label class="control-label col-md-3 text-right">短信内容:</label>
                                                 <div class="col-md-8 paddingnone">
                                                    <textarea name="_sengMsgInfo" data-provide="markdown" id="_sengMsgInfo" rows="10" data-width="250" class="form-control"></textarea>
                                                    <span class="help-block"> </span>
                                                </div>
                                        </div>
                                    </div>
                                   </div>
                                     </form>
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
                 if(page == toalPage){
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
    	var url = baseURL + "/HandImportSearch/index?mecType=01"; //查询数据URL 
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
		param.strDtStart = $('#strDtStart').val().replace('/', '').replace('/', '').trim(); //开始时间
		param.strDtEnd   = $('#strDtEnd').val().replace('/', '').replace('/', '').trim(); //结束时间
		
		param.pushType = $('#pushType').val(); //商务编号
		param.importSts = $('#importSts').val();//终端编号
		App.blockUI({target:"body",boxed:!0,message:"读取中",zIndex:20000});
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
                	
                	trData.push(obj.importNo);
                	trData.push(covertTimeData(obj.importDt,obj.importTm));
                	
                	if(obj.pushType=='01'){
                		trData.push('POS');
                	}else{
                		trData.push('SMS');
                	}
                	

                	if('00' == obj.importSts)	
                		trData.push('待处理');
					if('01' == obj.importSts)
                		trData.push('成功');
					if('02' == obj.importSts)
                		trData.push('失败');
                	
                	
                	trData.push(obj.importCount);
                	if (obj.smsSendSts == "00") {
        				 trData.push('待发送');
        			} else if (obj.smsSendSts == "01") {
        				 trData.push('发送成功');
        			} else if (obj.smsSendSts == "02") {
        				 trData.push('发送失败');
        			} else {
        				 trData.push('');
        			}
                	
                	 $("#queryMecGrid").DataTable().row.add(trData).draw();
                 	
                 	
                });
                $("#queryMecGrid").DataTable().order([0, 'asc']).draw();
                
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
    /* 	if (!hasPermission(PERMISSSIONCONST.USR001)) {$("#add_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.USR002)) {$("#edit_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.USR006)) {$("#info_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.USR007)) {$("#exportexcel_btn").hide();} */
		
    	$("#_smsPassDiv").hide(); 
		$("#_sengMsgInfoDiv").hide(); 
    	
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
		/* $("#reset_btn").on('click', function() {
			$("#queryMecPanel_Form")[0].reset();
			$("#plqueryMecPanel_Form")[0].reset();
			$("#queryMecPanel_Form .bs-select").selectpicker('val','');//重置select元素
			$("#batchMnos_Form")[0].reset();
			$("#batchMnos_Form .bs-select").selectpicker('val','');
		}); */
		
		//模板下载
		$("#down_btn").bind("click",function(){
				window.location.href = baseURL+"/t0d1/push/downloadBatchPushMnoTemplate";			
		});
		 
		
		
		//导入excel面板
		$("#importPanel_add_btn").on('click', function() {
			$("#file").val("");
			openImportExcelWin();
		});
		
		
		
		//导出excel按钮
		$("#exportexcel_btn").on('click', function() {
		


			var innerExcelType = $("#innerExcelType").val();
			if (innerExcelType == '1') {
				var selectRocords = $("#queryMecGrid tbody input:checked");
				console.log(selectRocords);
				if (selectRocords.length > 0) {
					
					var index = $(selectRocords[0]).attr("rownum");
		  			record = tableData.items[index];
		    		
		    		var importNo = record.importNo;
		    		var pushType = record.pushType; 
		    		var importSts = record.importSts;
		    		var smsSendSts = record.smsSendSts;
		    		bootbox.confirm("确定要导出吗?",function(data){
						if(data){
							
				    		window.open(baseURL+"/HandImportSearch/exportmInfoList?mecType=01"+"&importNo="+importNo
									+"&pushType="+pushType+"&importSts="+importSts+"&smsSendSts="+smsSendSts);

						} 
					})
					
		    	
				} else { 
					bootbox.alert(CONST.TIP513);//选择一条数据
				}

			} 
			
			
			
		});
		
		
   	});
    
//打开导入文件按钮
function openImportExcelWin(){
	
		$("#exportform1")[0].reset();
		$("#_smsPassDiv").hide();
		$("#_sengMsgInfoDiv").hide();
		$("#_pushType option[value='01'").attr("selected", true);
        $("#_pushType").selectpicker('render');
        $("#_pushType").selectpicker('refresh');

		
    	
    	$("#importform_save_btn").off('click').on('click', function() {
    		var type = $("#_pushType").val();
    		if(type=='02'){
    			if($("#_sengMsgInfo").val()==''){
					bootbox.alert("请填写短信内容!")   ; 				
    				return; 
    			}
    		}
    		
    		
    		
    		var filepath = $("#file").val();
    		if(filepath==undefined||filepath==""){ 
    			//fileObject.focus();
    			bootbox.alert("请选择要上传的文件");
    			//$("#error").innerText="请选择上传文件！"; 
				return;
    		}
    		else{ 
    			var fileArr=filepath.split("\\"); 
    			var fileTArr=fileArr[fileArr.length-1].toLowerCase().split("."); 
    			var filetype=fileTArr[fileTArr.length-1]; 
    			
    			if(filetype!="xlsx"){ 
    			//	fileObject.focus(); 
    				bootbox.alert("上传文件必须为07版Excel文件(后缀.xlsx)!");
    				//$("#error").innerText="上传文件必须为07版Excel文件(后缀。xlsx)！"; 
    				return;
    		 	}
    	   } 
    		
    		

    		  var fileObj = document.getElementById("file").files[0]; // 获取文件对象
    		  var form = new FormData();
    		   // FormData 对象
    		   form.append("file", fileObj); // 文件对象

    	
           App.blockUI({target:"body",boxed:!0,message:CONST.TIP016,zIndex:12000});
           $.ajax({
               url:baseURL + "/t0d1/push/batchImportPushMno?mecType=01&pushType="+$("#_pushType").val()+"&smsPass="+$("#_smsPass").val()+"&sengMsgInfo="+$("#_sengMsgInfo").val(),
               type:"post",
               data:form,
               processData:false,
               contentType:false,
               dataType:'json',
               success:function(result){
            		   $("#importExcelWin").modal('hide');
            		  /*  if(action.result.hasErro == true) {
							Ext.Msg.alert("系统提示", "上传失败");
						}else{
							Ext.Msg.alert("提示", action.result.msg);
							Ext.getCmp('T0_MecPushInfoGrid').getSelectionModel().clearSelections();//主页面复选框取消选择
							Ext.getCmp('T0_MecPushInfoGrid').getStore().reload();
						} */
            		   if(result.success){
            			   if(result.hasErro == true){
                    		   bootbox.alert("上传失败");
                    		 
        	            	}else{
        	            		  bootbox.alert(result.msg);
        	            		  reloadGrid();
        	            		  $.unblockUI();
        	            	}
            		   }else{
            			   bootbox.alert("上传失败");
            		   }
               },
               error:function(e){
                   //bootbox.alert("错误！！");
                   window.clearInterval(timer);
               }
           });        
    		
    	       
    		
    	});

	        
    	//弹出窗口取消按钮
		$("#importform_cancle_btn").off('click').on('click', function() {
			$("#importExcelWin").modal('hide');
    	});

    	$("#importExcelWin").modal('show');
    	
    	}
       
//时间转换
function covertTimeData(date, time) {
    return date.substring(0, 4) + "-" + date.substring(4, 6) + "-" + date.substring(6, 8) 
    		+ " " + time.substring(0, 2) + ":" + time.substring(2, 4) + ":" + time.substring(4, 6);
}   
    
    </script>
    
</body>

</html>
 
