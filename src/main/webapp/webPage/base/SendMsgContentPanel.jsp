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
		                        <form action="<%=request.getContextPath()%>/sms/queryMsgInfo" class="form-horizontal" id="querySendMsgPanel_myForm">
		                            <div class="form-body">
		                                <div class="row norow">
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">短信编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="msgId" id="querySendMsgPanel_msgId" class="form-control" placeholder="请输入短信编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">短信内容:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="msg" id="querySendMsgPanel_msg" class="form-control" placeholder="请输入短信内容">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">创建人编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="cteStffNo" id="querySendMsgPanel_cteStffNo" class="form-control" placeholder="请输入创建人编号">
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
		                                                <button type="button" id="add_btn" class="btn btn-info"> <i class="fa fa-pencil"></i> 添加</button>
		                                                <button type="button" id="downloadMsg_btn" class="btn btn-info"> <i class="fa fa-download"></i> 下载短信模板</button>
		                                                <button type="button" id="importMsg_btn" class="btn tn btn btn-primary"> <i class="fa fa-sign-in"></i> 短信文件导入</button>
		                                                <button type="button" id="downloadRateUpd_btn" class="btn btn-info"> <i class="fa fa-download"></i> 下载费率变更模板</button>
		                                                <button type="button" id="importRateUpd_btn" class="btn tn btn btn-primary"> <i class="fa fa-sign-in"></i> 费率变更文件导入</button>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">短信发送列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="querySendMsgGridPanel">
		                            <thead>
		                                <tr>
		                                    <th>
		                                        <input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                    <th class="nowrap"> 序号 </th>
		                                    <th class="nowrap"> 短信编号 </th>
		                                    <th class="nowrap"> 短信内容 </th>
		                                    <th class="nowrap"> 创建时间 </th>
		                                    <th class="nowrap"> 创建人 </th>
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
		<!-- 添加/修改数据的模态框（Modal） -->
		<div class="modal fade" id="addOrUpdateWin" tabindex="-1" role="dialog" data-backdrop="static"
		   aria-labelledby="myModalLabel" aria-hidden="true">
		         <div class="modal-header">
		            <button type="button" class="close" 
		               data-dismiss="modal" aria-hidden="true">
		                  &times;
		            </button>
		            <h4 class="modal-title" id="addOrUpdateWin_title"></h4>
		         </div>
		         <div class="modal-body">
		            <div class="portlet-body form">
                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="addform">
                            <div class="form-body">
                                <div class="row norow">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-4 text-right">短信内容:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="msgContent" id="msgContent" class="form-control" placeholder="请输入短信内容">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12" style="text-align:center;">
                                        <div class="row">
                                            <div class="col-md-offset-1 col-md-11">
                                                <button type="button" id="addform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 提交</button>
                                                <button type="button" id="addform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
		         </div>
	</div>
	<!-- 文件导入 -->
	<div class="modal fade" id="importExcelWin" tabindex="-1" role="dialog" data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">导入EXCEL</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form class="form-horizontal" id="importform" enctype="multipart/form-data">
                           <div class="form-body">
                                <label class="control-label">请选择文件</label>
								<input id="importFile" name="file" type="file" class="file">
                           </div>
                           <div class="form-actions">
                               <div class="row">
                                   <div class="col-md-12" style="text-align:center;">
                                       <div class="row">
                                           <div class="col-md-offset-1 col-md-11">
                                               <button type="button" id="importform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 确认</button>
                                               <button type="button" id="importform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </form>
                   </div>
	         </div>
       <!-- END CONTENT -->
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
    	$("#querySendMsgGridPanel tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
	var querySendMsg_Path = baseURL + "/sms/queryMsgInfo";
    //查询数据
    function reloadGrid() {
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
		var msgId = $("#querySendMsgPanel_msgId").val().replace('/', '').replace('/', '');
		var msg = $("#querySendMsgPanel_msg").val().replace('/', '').replace('/', '');
		var cteStffNo = $("#querySendMsgPanel_cteStffNo").val().replace('/', '').replace('/', '');
		param.msgId = msgId;
		param.msg = msg;
		param.cteStffNo = cteStffNo;
		App.blockUI({target:"body",boxed:!0,message:"读取中",zIndex:20000});
		$.ajax({
            type: "POST",
            url: querySendMsg_Path,
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
    			
    			 $("#querySendMsgGridPanel").DataTable().clear().draw();
                 $.each(data.items, function(index, obj) {
                 	
                 	var trData = [];
                 	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                 	trData.push(start + index + 1);
                 	trData.push(obj.msgId);
                 	trData.push(obj.msg.substring(0,30)+'...');
                 	trData.push(obj.dttmCte);
                 	trData.push(obj.cteStffNo);
                 	trData.push(obj.msgId);
                 	trData.push(obj.msgId);
                  	
                    for(i=0; i < trData.length; i++){
                     	 if(trData[i] == undefined){
                     		 trData[i] = ''; 
                     	 }
                      }

                     	 $("#querySendMsgGridPanel").DataTable().row.add(trData).draw();
                     	
                     	
                     });
                     $("#querySendMsgGridPanel").DataTable().order([1, 'asc']).draw();
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
            },
            error: function(error) {
            }
        });
	}
    
    /** 添加或者修改 **/
    function showAddOrUpdate(type) {
    	var title = '', iconCls = '', btnText = '', url = '', record = null;
    	if (type == 'add') {
    		title = '添加短信内容', iconCls = 'add', btnText = '保存', url = baseURL + '/sms/insertNewMsg';
    	}
    	/*初始化添加修改弹出窗口*/
    	$("#addOrUpdateWin_title").text(title);
    	//弹出窗口保存按钮
    	$("#addform_save_btn").off('click').on('click', function() {
    		var msgContent = $('#msgContent').val().trim();
			App.blockUI({target:"body",boxed:!0,message:CONST.TIP016,zIndex:20000});
			$.ajax({
	            type: "POST",
	            url: url,
	            data : {
					msg : msgContent
				},
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            dataType: "json",
	            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
	            	$("#addOrUpdateWin").modal('hide');
	            	reloadGrid();
	            },
	            error: function(error) {
	            	$("#addOrUpdateWin").modal('hide');
	            }
	        });
    	});
    	//弹出窗口取消按钮
		$("#addform_cancel_btn").off('click').on('click', function() {
			$("#addOrUpdateWin").modal('hide');
    	});
    	$("#addOrUpdateWin").modal('show');
    	$("#addform")[0].reset();

    }
    
    //下载短信模板
    function showDownloadMsg(){
		var pathUrl = baseURL + "/sms/downloadSms";
    	window.location.href = pathUrl;
	}

  	//下载费率变更模板
    function showDownloadRateUpd(){
		var pathUrl = baseURL + "/sms/downloadRateUpdate";
    	window.location.href = pathUrl;
	}
    
  	//短信文件导入按钮
  	function showImportMsg(){
  		$("#importExcelWin").modal('show');
		$("#importform_save_btn").off('click').on('click', function() {
			$("#importform").ajaxSubmit({
                type: 'post',  
			    url : baseURL + '/sms/importExcelSmsSend',
			    dataType: 'json',
                beforeSubmit: function() {
                	var file=$("#importFile");
                    if($.trim(file.val())==''){
                           bootbox.alert("请选择文件");
                           return false;
                     }
                 	return true;
                },  
                success: function(action){
					if(action.success){
						$("#importExcelWin").modal('hide');
						var file = $("#importFile") 
						file.after(file.clone().val("")); 
						file.remove(); 
						reloadGrid();
					}else{
						bootbox.alert(action.msgInfo);
					}						
				
                },  
                error: function(XmlHttpRequest, textStatus, errorThrown){  
                    bootbox.alert( "导入失败");  
                }  
            });
			
		});
		$("#importform_cancel_btn").off('click').on('click', function() {
			$("#importExcelWin").modal('hide');
		});
  	}
  	
  	//费率变更导入按钮
  	function showImportRateUpd(){
  		$("#importExcelWin").modal('show');
		$("#importform_save_btn").off('click').on('click', function() {
			$("#importform").ajaxSubmit({
                type: 'post',  
			    url : baseURL + '/sms/importExcelRateUpdate',
			    dataType: 'json',
                beforeSubmit: function() {
                	var file=$("#importFile");
                    if($.trim(file.val())==''){
                           bootbox.alert("请选择文件");
                           return false;
                     }
                 	return true;
                },  
                success: function(action){
					if(action.success){
						$("#importExcelWin").modal('hide');
						var file = $("#importFile") 
						file.after(file.clone().val("")); 
						file.remove(); 
						reloadGrid();
					}else{
						bootbox.alert(action.msgInfo);
					}						
				
                },  
                error: function(XmlHttpRequest, textStatus, errorThrown){  
                    bootbox.alert( "导入失败");  
                }  
            });
			
		});
		$("#importform_cancel_btn").off('click').on('click', function() {
			$("#importExcelWin").modal('hide');
		});
  	}
    
    $(function(){
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.BASEINFO012)) {$("#add_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.BASEINFO013)) {$("#downloadMsg_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.BASEINFO014)) {$("#importMsg_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.BASEINFO015)) {$("#downloadRateUpd_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.BASEINFO016)) {$("#importRateUpd_btn").hide();}
    	
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
		//重置按钮
		$("#reset_btn").on('click', function() {
			$("#querySendMsgPanel_myForm")[0].reset();
		});
		
		//添加按钮
		$("#add_btn").on('click', function() {
			showAddOrUpdate('add');
		});
		
		//下载短信模板按钮
		$("#downloadMsg_btn").on('click', showDownloadMsg);
		
		//下载费率变更模板按钮
		$("#downloadRateUpd_btn").on('click', showDownloadRateUpd);
		
		//文件批量导入变更按钮
		$("#importMsg_btn").on('click', function() {
			showImportMsg();
		});
		
		//文件批量导入变更按钮
		$("#importRateUpd_btn").on('click', function() {
			showImportRateUpd();
		});
   	});
    </script>
    
</body>

</html>
