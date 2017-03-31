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
    <link href="../../takin_theme/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
    <link href="../../takin_theme/assets/global/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css" />
    <link href="../../takin_theme/assets/global/plugins/bootstrap-summernote/summernote.css" rel="stylesheet" type="text/css" />

</head>

<!-- <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md"> -->
<body class="iframe-body">

    <!-- BEGIN HEADER -->
    <jsp:include page="../common/header.jsp" flush="true"/>
    <!-- END HEADER -->

	<!-- BEGIN CONTAINER -->
	<div class="clearfix"></div>
	<div class="page-container">

		<!-- BEGIN MENU -->
		<%-- <jsp:include page="../common/menu.jsp" flush="true" /> --%>
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
								<form action="<%=request.getContextPath()%>/mec/queryData"
									class="form-horizontal" id="queryMecPanel_Form">
									<div class="form-body">
										<div class="row norow">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-4 text-right">标题:</label>
													<div class="col-md-6 paddingnone">
														<input name="NoticeManageQueryPanel_annTitle"
															id="NoticeManageQueryPanel_annTitle" class="form-control"
															placeholder="----请输入标题----">
													</div>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right"><font
														color="red">*</font>状态:</label>
													<div class="col-md-6 paddingnone">
														<select name="NoticeManageQueryPanel_annStatus"
															id="NoticeManageQueryPanel_annStatus"
															class="bs-select form-control" data-show-subtext="true">
															<option value="">全部</option>
															<option value="01">编辑中</option>
															<option value="02">已发布</option>
															<option value="03">已撤下</option>
														</select>

														<!-- ajax获取  -->
													</div>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right">发布开始时间:</label>
													<div class="col-md-6 paddingnone">
															<input type="text" class="form-control col-md-4 form_datetime"
																name="NoticeManageQueryPanel_dtCte"
																id="NoticeManageQueryPanel_dtCte"> 
													</div>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right">发起结束时间:</label>
													<div class="col-md-6 paddingnone">
															<input type="text" class="form-control col-md-4 form_datetime"
																name="NoticeManageQueryPanel_dtCteEnd"
																id="NoticeManageQueryPanel_dtCteEnd">
													</div>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right">撤下开始时间:</label>
													<div class="col-md-6 paddingnone">
															<input type="text" class="form-control col-md-4 form_datetime"
																name="NoticeManageQueryPanel_startRevokTime"
																id="NoticeManageQueryPanel_startRevokTime">
													</div>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right">撤下结束时间:</label>
													<div class="col-md-6 paddingnone">
															<input type="text" class="form-control col-md-4 form_datetime"
																name="NoticeManageQueryPanel_endREvokTime"
																id="NoticeManageQueryPanel_endREvokTime">
													</div>
												</div>
											</div>
										</div>
										<div class="form-actions">
											<div class="row">
												<div class="col-md-12">
													<div class="row">
														<div class="col-md-offset-1 col-md-11">
															<button type="button" id="query_btn"
																class="btn btn-success">
																<i class="fa fa-search"></i> 查询
															</button>
															<button type="button" id="reset_btn" class="btn red">
																<i class="fa fa-refresh"></i> 重置
															</button>
															<button type="button" id="add_btn" class="btn btn-info">
																<i class="fa fa-pencil"></i> 新建
															</button>

														</div>
													</div>
												</div>
											</div>
										</div>
								</form>
							</div>
						</div>

					</div>
					<div class="clearfix"></div>
					<div class="portlet light bordered scaffold-list">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-search font-blue"></i> <span
									class="caption-subject font-blue bold uppercase">闪电到账公告管理信息列表</span>
							</div>
							<div class="tools">
								<a href="" class="fullscreen" data-original-title="全屏" title=""></a>
							</div>
						</div>
						<div class="portlet-body wheel">
							<table
								class="table table-striped table-bordered table-hover table-checkable order-column"
								id="queryMecGrid">
								<thead>
									<tr>
										<th class="nowrap">序号</th>
										<th class="nowrap">标题</th>
										<th class="nowrap">状态</th>
										<th class="nowrap">发布时间</th>
										<th class="nowrap">发布操作员</th>
										<th class="nowrap">撤下时间</th>
										<th class="nowrap">撤下操作员</th>
										<th class="nowrap">操作</th>
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
									记录数共:<span id="itemCount"></span>条 当前第<span id="nowpage"></span>/<span
										id="toalPage"></span>页 每页显示:
								</div>
								<div class="inline fl">
									<select id="limit" class=" form-control "
										onchange="onChange4PageSize(this)">
										<option value="10">10</option>
										<option value="20" selected="selected">20</option>
										<option value="30">30</option>
										<option value="50">50</option>
										<option value="80">80</option>
										<option value="100">100</option>
									</select>
								</div>
								<div class="inline fl">条</div>
							</div>

							<div class="col-sm-6 pull-right no-padding">
								<div id="pagination"
									class="dataTables_paginate paging_simple_numbers clearfix pull-right">
									<nobr>
										<ul class="pagination no-padding" style="float: left">
											<li class="prev "><a href="javascript:;"
												onclick="javascript:pageing(1)"> 首页</a></li>
											<li class="prev "><a href="javascript:;"
												onclick="javascript:pageing('pro')"> 上一页</a></li>
											<li class="next "><a href="javascript:;"
												onclick="javascript:pageing('next')">下一页</a></li>
											<li class="next "><a href="javascript:;"
												onclick="javascript:pageing('last')">末页</a></li>
										</ul>
										<div class="input-group pull-right col-sm-2"
											style="float: left;">
											<input min="1" class="form-control p"
												style="height: 31px; width: 80px;" type="number"> <a
												href="javascript:;" class="input-group-addon"
												onclick="javascript:pageing($('.p').val())"><i
												class="fa fa-mail-forward brown"></i></a>
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




	<div class="modal fade" id="importExcelWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">EXCEL文件导入</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" enctype="multipart/form-data" class="form-horizontal" id="exportform">
                           <div class="form-body">
  
                                   <div class="clearfix"></div>
                                   <div class="row norow">
                                   <div class="col-lg-12 col-md-12 col-sm-8 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">上传文件路径:</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <div class="input-group">
		                                                    <input type="file" class="form-control col-md-4" name="file" id="file">
		                                                    <span id="error"  style="font-color:red"></span>
		                                                </div>
		                                            </div>
		                                        </div>
		                            </div>
                               </div>
                               
                           </div>
                           <div class="form-actions">
                               <div class="row">
                                   <div class="col-md-12">
                                       <div class="row">
                                           <div class="col-md-12" style="align:center">
                                               <button type="button" id="importform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 上传</button>
                                               <button type="button" id="importform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </form>
                   </div>
	         </div>
	         <!-- 
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal">关闭
	            </button>
	            <button type="button" class="btn btn-primary">
	               提交更改
	            </button>
	         </div>
	          -->
       <!-- END CONTENT -->
   </div>



<!-- 添加/修改数据的模态框（Modal） -->
		<div class="modal fade" id="addOrUpdateWin" tabindex="-1" data-backdrop="static" data-width="760px">
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
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display:none">
                                        <div class="form-group">
                                            <div class="col-md-10 paddingnone">
                                                <input name="uuid" id="uuid" class="form-control" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-2 text-right">标题:</label>
                                            <div class="col-md-10 paddingnone">
                                                <input name="annTitle" id="annTitle" class="form-control" placeholder="----请输入标题----">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                                <label class="control-label col-md-2 text-right">内容描述:</label>
                                                <div class="col-md-10 paddingnone">
                                                    <textarea name="content" data-provide="markdown" id="issContent" rows="20" data-width="600" class="form-control"></textarea>
                                                    <span class="help-block"> </span>
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
        <!-- END CONTENT -->
    	</div>
   
   
   
    <!-- BEGIN FOOTER -->
    <jsp:include page="../common/footer.jsp" flush="true"/>
    <!-- END FOOTER -->

        <script src="../../takin_theme/assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js" type="text/javascript"></script>
        <script src="../../takin_theme/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js" type="text/javascript"></script>
        <script src="../../takin_theme/assets/global/plugins/bootstrap-markdown/lib/markdown.js" type="text/javascript"></script>
        <script src="../../takin_theme/assets/global/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
        <script src="../../takin_theme/assets/global/plugins/bootstrap-summernote/summernote.min.js" type="text/javascript"></script>

<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.0/js/bootstrap-select.min.js"></script> -->
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
    
    var constTotalCount = 0;

    function changeTabName(obj){
    	tab = obj;
    	//重新加载表格数据
    	
    }
    
    //全选列表数据
    function checkAll(checked) {
    	$("#queryMecGrid tbody :checkbox").prop('checked', checked);
    }
  //onedit
    function openErrorWindow(item){
    	  
    	   $('table > tbody')[1].innerHTML = "";
     	
        $.each(item, function (index, obj) {
            var tr = $("<tr></tr>").append($("<td></td>").text(index));
            tr.append($("<td></td>").text(obj.erroMsg));
            $("#errorGrid tbody").append(tr);
        });
        
        $("#errorWindow").modal('show');
    }
    
    //分页1
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
    
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }

    
    
  
    
    function sddzNoticeUpdateView(uuid, type){
    	if(type == '02'){
    		bootbox.confirm("是否发布此公告?",function(confirmFlg) {
    			if(confirmFlg){
        			$.ajax({
        	            type: "POST",
        	            url: baseURL + "/notice/deployAment",
        	            data : {
        	            	uuid : uuid,
        				},
        	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
        	            dataType: "json",
        	            success: function(json) {
        	            	if (json && json.msgCd=="SXF00000") {//执行成功
    							reloadGrid();
    						}else{
    							return;
    						}
        	            	
        	            },
        	            error: function(error) {
        	            }
        	        });
        		}
    		});
    		
    		
    	}else if(type == '03'){
    		bootbox.confirm("是否撤销此公告?",function(confirmFlg) {
    			if(confirmFlg){
        			$.ajax({
        	            type: "POST",
        	            url: baseURL + "/notice/revokeAment",
        	            data : {
        	            	uuid : uuid,
        				},
        	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
        	            dataType: "json",
        	            success: function(json) {
        	            	if (json && json.msgCd=="SXF00000") {//执行成功
    							reloadGrid();
    						}else{
    							return;
    						}
        	            	
        	            },
        	            error: function(error) {
        	            }
        	        });
        		}
    		});
    	}
    }    


  	
    
    //查询数据
    function reloadGrid() {
    //http://127.0.0.1:8080/bap/tZero/FcrMag/queryFcrInfo?_dc=1472111617720	
    	
     	 if(limit==0) {
        	//默认20条
        	limit=20;
        }
       	start=(page-1)*limit;
       	
       	var param = {start:start, limit:limit, page:page};
       	
       
		param.annTitle = $('#NoticeManageQueryPanel_annTitle').val(),
/* 		param.startTime = $('#TradingRecordQueruPanel_dtCte').val().replace('/', '-').replace('/', '-') + ":00",
		param.endTime = $('#TradingRecordQueruPanel_dtCteEnd').val().replace('/', '-').replace('/', '-') + ":00", */
		param.annStatus = $('#NoticeManageQueryPanel_annStatus').val(),
		param.startTime = $('#NoticeManageQueryPanel_dtCte').val().replace('/', '-').replace('/', '-').replace(' ', 'T'),
		param.endTime = $('#NoticeManageQueryPanel_dtCteEnd').val().replace('/', '-').replace('/', '-').replace(' ', 'T'),
		param.startRevokTime = $('#NoticeManageQueryPanel_startRevokTime').val().replace('/', '-').replace('/', '-').replace(' ', 'T'),
		param.endREvokTime = $('#NoticeManageQueryPanel_endREvokTime').val().replace('/', '-').replace('/', '-').replace(' ', 'T');
		App.blockUI({target:"body",boxed:!0,message:"读取中",zIndex:20000});
    	var	url = baseURL + "/notice/pageAments";
		$.ajax({
            type: "POST",
            url: url,
            data:param,
            dataType: "json",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
           	    $("#queryMecGrid tbody").empty();
            	constTotalCount = data.totalCount;
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
    			

    	    		//流水结果
    	 
                     $("#queryMecGrid").DataTable().clear().draw();
                    $.each(data.items, function(index, obj) {
                    	var trData = [];
                    	trData.push(start + index + 1);
                    	
                    	trData.push(obj.annTitle);
                    	trData.push(obj.annStatusT);
                    	trData.push(obj.issueTime);
                    	trData.push(obj.issueOP);
                    	
                    	trData.push(obj.revokTime);
                    	trData.push(obj.revokOP);
                    	var uuid = obj.uuid;
            			var inMno = obj.inMno;
            			var status = obj.annStatus;
            			var annTitle = obj.annTitle;
            			var issContent = obj.issContent;
            			//annTitle=Ext.decode(annTitle);
            			//issContent=Ext.decode(issContent);
            			var returnStr = "";
            			if(status=="01"){//编辑
            				returnStr = "<INPUT type='button' value='修改' onclick = showAddOrUpdate('update','"+uuid+"')>"+"&nbsp;&nbsp;<INPUT type='button' value='发布' onclick = sddzNoticeUpdateView('"+uuid+"','02')>&nbsp;"+"&nbsp;<INPUT type='button' value='查看' onclick = showNoticeAmentInfo('"+uuid+"')>&nbsp;&nbsp;";
            			}else if(status=="02"){
            				returnStr = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
            						"<INPUT type='button' value='撤下' onclick = sddzNoticeUpdateView('"+uuid+"','03')>&nbsp;"+"&nbsp;<INPUT type='button' value='查看' onclick = showNoticeAmentInfo('"+uuid+"')>&nbsp;&nbsp;";
            			}else if(status=="03"){
            				returnStr = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
            						"<INPUT type='button' value='查看' onclick = showNoticeAmentInfo('"+uuid+"')>&nbsp;&nbsp;";
            			}

                    	trData.push(returnStr);
                    	for(i=0; i < trData.length; i++){
                       	 if(trData[i] == undefined){
                       		 trData[i] = ''; 
                       	 }
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
            },
            error: function(error) {
            	bootbox.alert("连接超时！");
            }
        });
	}
    

    
  	
  	function ontranCrdNoChange(obj) {
  		var text = obj.value;
		var reg = /^[0-9]*$/;
		if (text != null && text != '') {
			if (!reg.test(text)) {
				return "银行卡号只能是不大于20位数字";
			}
			if (text.length > 20) {
				return "银行卡号只能是不大于20位数字";
			}
			return true;
		}
		return true;
	}
  	
  	function onretReNoChange(obj){
  		var text = obj.value;
  		var reg = /^[0-9]*$/;
		if (text != null && text != '') {
			if (!reg.test(text)) {
				return "检索参考号只能是12位数字";
			}
			if (text.length != 12) {
				return "检索参考号只能是12位数字";
			}
			return true;
		}
		return true;

  	}
    
 
    $(function(){
    	
    	/*初始化页面按钮权限*/
/*     	if (!hasPermission(PERMISSSIONCONST.TZERO501)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO501)) {$("#exportexcel_btn").hide();} */
    	

        reloadGrid();
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
        $("#add_btn").on('click', function(){
        	showAddOrUpdate('add', '');
        });
        
		

        $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii:ss'});
	

		//重置按钮
		$("#reset_btn").on('click', function() {
			$("#queryMecPanel_Form")[0].reset();
			$("#queryMecPanel_Form .bs-select").selectpicker('val','');//重置select元素

		});

		
		
		
   	});
    
    
    
	
   
  
    
  function initDefaultDate(){
  	
  	var myDate = new Date();
  	
  	var tempMonth;
  	if(myDate.getMonth()<9){
  		tempMonth = '0'+ (myDate.getMonth() + 1);
  	}else{
  		tempMonth = myDate.getMonth() + 1;
  	}
  	
  	var tempDay;
  	if(myDate.getDate()<=9){
  		tempDay = '0'+ myDate.getDate();
  	}else{
  		tempDay = myDate.getDate();
  	}
  
  	var dateString = myDate.getFullYear()+"/"+tempMonth+"/"+tempDay;
  	//bootbox.alert(myDate.getMonth() +" hello "+myDate.getDate());
  	
  	$("#TradingRecordQueruPanel_dtCte").val(dateString+ " 00:00");
  	$("#TradingRecordQueruPanel_dtCteEnd").val(dateString + " 23:59");
  	
  }
  

  
  
//跳转到查看日志页面
  function sddzQueryDetailView(uuid,inMno){
  	 $.fancybox({afterLoad:fancyboxCenterOnViewport,
   		href:'TradingRecordQueruPanel_detail.jsp?uuid='+uuid+"&inMno=" + inMno,    
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
   	}); 
  	
  	
  }


  /* 写到流水模板下载 流水批量导入，需要重新考虑（页面没有实现） */
  
  
  
  
   /** 添加或者修改 **/
    function showAddOrUpdate(type, uuid) {
    	 $("#addform").resetForm();
    	 $('#issContent').val('');
    	 $('#uuid').val('');
    	 $('#annTitle').val('');
    	 $('#issContent').attr('onfocus', "");
			$('#uuid').attr('disabled', false);
			$('#annTitle').attr('disabled', false);
			$('#issContent').attr('readonly', false);
			 $("#addform_cancel_btn").css('display', '');
			 $("#addform_save_btn").css('display', '');
    	var title = '', iconCls = '', btnText = '', url = '', record = null;
    	if (type == 'add') {
    		title = '添加公告', iconCls = 'add', btnText = '保存', url = baseURL + '/notice/addAment';
    	}else if (type == 'update'){
    		title = '修改公告', iconCls = 'update', btnText = '修改', url = baseURL + '/notice/updateAment';
    		//根据uuid获取详情
    	}

    	/*初始化添加修改弹出窗口*/
    	$("#addOrUpdateWin_title").text(title);
 
    	
    	
    	//弹出窗口保存按钮
    	$("#addform_save_btn").off('click').on('click', function() {
			var uuid = $('#uuid').val();
			var annTitle = $('#annTitle').val();
			var issContent = $('#issContent').val();
			
			if(issContent==""||issContent==null){
				bootbox.alert("内容不能为空!");
				return "内容不能为空!";
			}
			if (issContent.trim().length > 1000){
				return "内容不能大于1000个中文";
			}
			if(annTitle==""||annTitle==null){
				bootbox.alert("标题不能为空!");
				return "标题不能为空!";
			}
			
			if(annTitle.length>30){
				return "标题不能大于30个字!";
			}
			
			$.ajax({
	            type: "POST",
	            url: url,
	            data : {
					annTitle : annTitle,
					issContent : issContent,
					uuid  : uuid ==null ? "":uuid 
				},
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            dataType: "json",
	            success: function(json) {
	            	$("#addOrUpdateWin").modal('hide');
	            	if (json && json.msgCd == "SXF00000") {//操作成功
						
						bootbox.alert('操作成功！');
						reloadGrid();
					}else{
						bootbox.alert(json.msgInf); 
					}
	            	
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
		if (type == 'update') {
			
			var ajaxUrl = baseURL + "/notice/getOneAment";
			$.ajax({
	            type: "POST",
	            url: ajaxUrl,
	            data : {
	            	uuid:uuid
				},
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            async:false,
	            dataType: "json",
	            success: function(json) {
	            	if (json && json.msgCd == CONST.TIP007) {//操作成功
						var uuid = json.uuid;//获取参数对象
						var annTitle  = json.annTitle;
						var issContent = json.issContent;
						$('#uuid').val(uuid);
						$('#annTitle').val(annTitle);
						$('#issContent').val(issContent);
					}else{
						bootbox.alert(json.msgInf); 
						return;
					}
	            	
	            },
	            error: function(json) {
	            	if(json){
	            		bootbox.alert(json.msgInf);	
	            	}
	            }
	        });
		}
    	$("#addOrUpdateWin").modal('show');
    }
  
  //查看详细内容的按钮
  function showNoticeAmentInfo(uuid){
	 $('#issContent').attr('onfocus', "this.blur()");
	  
	 var title = '公告详情';
	 $("#addOrUpdateWin_title").text(title);
	 $("#addform_cancel_btn").css('display', 'none');
	 $("#addform_save_btn").css('display', 'none');
	 $("#addform").resetForm();
	var url = baseURL + '/notice/getOneAment';
	  $.ajax({
          type: "POST",
          url: url,
          data : {
        	  uuid:uuid
			},
          contentType: "application/x-www-form-urlencoded;charset=utf-8",
          dataType: "json",
          success: function(json) {
        	  if (json && json.msgCd == CONST.TIP007) {//
        	    var uuid = json.uuid;//获取参数对象
				var annTitle  = json.annTitle;
				var issContent = json.issContent;
				$('#uuid').val(uuid);
				$('#annTitle').val(annTitle);
				$('#issContent').html(issContent);
				$('#uuid').attr('disabled', true);
				$('#annTitle').attr('disabled', true);
        	   $("#addOrUpdateWin").modal('show');
        	  }else{
        		  bootbox.alert(json.msgInf);
        		  return;
        	  }
          },
          error: function(json) {
        	  if(json){
        		  bootbox.alert(json.msgInf);
        	  }else{
        		  bootbox.alert("加载失败!");
        	  }
          }
	  });
  }
    </script>
    
</body>

</html>
