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
		                        <form action="<%=request.getContextPath()%>/pts/psmtckct/query" class="form-horizontal" id="querypsmtckct_myForm">
		                            <div class="form-body">
		                                <div class="row norow">
		                                	
		                                     <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">批量导入时间:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange" >
		                                                    <input type="text" class="form-control col-md-3" name="dtCteStart" id="MecTzeroAndDOneStlPanel_Form_dtCte">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="dtCteEnd" id="MecTzeroAndDOneStlPanel_Form_dtCteEnd">
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
		                                            <div class="col-md-offset-1 col-md-11">
		                                                <button type="button" id="query_btn" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
		                                                <button type="button" id="reset_btn" class="btn red"> <i class="fa fa-refresh"></i> 重置</button>
		                                                <button type="button" id="download_btn" class="btn btn btn-primary"> <i class="fa fa-download"></i> 下载模板</button>
		                                                <button type="button" id="MecTzeroAndDOneStlPanel_Form_btn_importFile_open" class="btn btn-info"> <i class="fa fa-search-unlock"></i> 批量导入开通</button>
		                                                <button type="button" id="MecTzeroAndDOneStlPanel_Form_btn_importFile_close" class="btn tn btn btn-success"> <i class="fa fa-lock"></i> 批量导入关闭</button>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">D+1批量开通/关闭列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="queryMecTzeroAndDOneStlGridPanel">
		                            <thead>
		                                <tr>
		                                    <th>
		                                        <input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                    <th> 序号 </th>
		                                    <th> 批次号 </th>
		                                    <th> 导入条数 </th>
		                                    <th> 成功条数 </th>
		                                    <th> 失败条数 </th>
		                                    <th> 处理状态 </th>
		                                    <th> 导入时间 </th>
		                                    <th> 类型 </th>
		                                    <th> 详细数据导出</th>
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
   
    <!-- 双传批量导打开附件模态框（Modal） -->
	<div class="modal fade" id="importFile_openWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="600px"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	       <div class="modal-header">
	          <button type="button" class="close" 
	             data-dismiss="modal" aria-hidden="true">
	                &times;
	          </button>
	          <h4 class="modal-title" id="">批量导入开通</h4>
	       </div>
	    <!--   <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="exportform">
                           <div class="form-body">
                               <div class="row norow">
                                    <div class="row norow">
	                                   <div class="col-lg-12 col-md-12 col-sm-8 col-xs-12">
	                                        <div class="form-group">
	                                            <label class="control-label col-md-0 text-right"></label>
	                                            <div class="col-md-6 paddingnone">
	                                                <div class="input-group">
	                                                    <input type="file" class="form-control col-md-4" id="file_open" name="file" accept=".xlsx"/>
	                                                    <span id="error"  style="font-color:red"></span>
	                                                </div>
	                                            </div>
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
                                           <div class="col-md-5" style="text-align:center;">
                                               <button type="button" id="open_confirmUpload" class="btn btn-success"><i class="fa fa-sign-out"></i>上传</button>
                                               <button type="button" onclick="javascript:$('#importFile_openWin').modal('hide');" class="btn red"> <i class="fa fa-share"></i> 取消</button>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </form>
                   </div>
	         </div>	-->
	       
	       <div class="modal-body" style="height:150px; padding:30px; text-align:center;">
	           	<div class="row fileupload-buttonbar" style="margin-top:20px;border: 1px solid #ccc;width:70%;">
					<span style="float:left;">
                        <input id="file_open" type="file" name="file"  accept=".xlsx" multiple  style="width:68px;"/> </span>    
                        <input style="float:left; width:70%; border: 0px;background: #fff;"  name="fileattr" id="open_fileattr" readonly
							class="form-control" placeholder="请选择文件">
		        </div>
	            <br/> 
	            <div class="row">
	               <div class="col-md-12"  style="text-align:left;">
	                   <div class="row">
	                       <div class=" col-md-11">
	                       	  <button type="button"  id="open_confirmUpload" class="btn btn-success"> <i class="fa fa-sign-out"></i> 上传</button>
	                           <button type="button" onclick="javascript:$('#importFile_openWin').modal('hide');" id="" class="btn red"> <i class="fa fa-share"></i> 取消</button>
	                       </div>
	                   </div>
	              </div>
	        </div>   
		</div><!-- /.modal -->
    </div>   
    
    <!-- 双传批量导入关闭附件模态框（Modal） -->
	<div class="modal fade" id="importFile_closeWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="600px"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	  
	       <div class="modal-header">
	          <button type="button" class="close" 
	             data-dismiss="modal" aria-hidden="true">
	                &times;
	          </button>
	          <h4 class="modal-title" id="">批量导入关闭</h4>
	       </div>
	  <!--   <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="exportform">
                           <div class="form-body">
                               <div class="row norow">
                                    <div class="row norow">
	                                   <div class="col-lg-12 col-md-12 col-sm-8 col-xs-12">
	                                        <div class="form-group">
	                                            <label class="control-label col-md-0 text-right"></label>
	                                            <div class="col-md-6 paddingnone">
	                                                <div class="input-group">
	                                                    <input type="file" class="form-control col-md-4" name="file" id="file_close" accept=".xlsx"/>
	                                                    <span id="error"  style="font-color:red"></span>
	                                                </div>
	                                            </div>
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
                                           <div class="col-md-5" style="text-align:center;">
                                               <button type="button" id="close_confirmUpload" class="btn btn-success"><i class="fa fa-sign-out"></i>上传</button>
                                               <button type="button" onclick="javascript:$('#importFile_closeWin').modal('hide');" class="btn red"> <i class="fa fa-share"></i> 取消</button>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </form>
                   </div>
	       </div>	 -->   
	       <div class="modal-body" style="height:150px;  padding:30px; text-align:center;">
	           	<div class="row fileupload-buttonbar" style="margin-top:20px;border: 1px solid #ccc;width:70%;">
					<span style="float:left;">
                        <input id="file_close" type="file" name="file" accept=".xlsx"  multiple  style="width:68px;"/> </span>    
                        <input style="float:left; width:70%; border: 0px;background: #fff;"  name="fileattr" id="close_fileattr" readonly
							class="form-control" placeholder="请选择文件">
		        </div>
	            <br/> 
	            <div class="row">
	               <div class="col-md-12"  style="text-align:left;">
	                   <div class="row">
	                       <div class=" col-md-11">
	                       	  <button type="button"  id="close_confirmUpload" class="btn btn-success"> <i class="fa fa-sign-out"></i> 上传</button>
	                           <button type="button" onclick="javascript:$('#importFile_closeWin').modal('hide');" id="" class="btn red"> <i class="fa fa-share"></i> 取消</button>
	                       </div>
	                   </div>
	              </div>
	        </div>    
		</div><!-- /.modal -->
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
    	$("#queryMecTzeroAndDOneStlGridPanel tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
	//封装查询参数
	function packageArg(){
		var param = {};
		var dtCteStart =  $("#MecTzeroAndDOneStlPanel_Form_dtCte").val().replace('/', '').replace('/', '');
		var dtCteEnd =  $("#MecTzeroAndDOneStlPanel_Form_dtCteEnd").val().replace('/', '').replace('/', '');		

		param.dtCteStart=dtCteStart;
		param.dtCteEnd=dtCteEnd;
		
		return param;
	}
	
	//列表中数据导出超链接
	function batchResultExportExcel(batchNumber){
		window.open(baseURL+"/mecBatchOpe/batchResultExportExcel?batchNumber="+batchNumber);
	}
	
    //查询数据
    function reloadGrid() {
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
    	var param = packageArg();
    	if(null == param){
    		return;
    	}
    	param.page=page;
    	param.start=start;
    	param.limit=limit;
			
    	var query_Path = baseURL + "/mecBatchOpe/queryData";
    	App.blockUI({target:"body",boxed:!0,message:"读取中...",zIndex:20000});
		$.ajax({
            type: "POST",
            url: query_Path,
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
    			$("#queryMecTzeroAndDOneStlGridPanel").DataTable().clear().draw();
    			
                $.each(data.items, function(index, obj) {
                	
                	var trData = [];
                	trData.push("<input type=\"checkbox\" data-chkBatNo='"+ obj.chkBatNo +"' class=\"checkboxes\" rownum=\""+index+"\" />");
                	trData.push(start + index + 1);
                	
                	
                	trData.push(obj.batchNumber);
                	trData.push(obj.importCount);
                	trData.push(obj.successCount);
                	trData.push(obj.failureCount);

                	
                	
                	if(obj.handleSts=="00"){
                    	trData.push("处理中");
                	}else{
                    	trData.push("已处理");
                	}
                	
                	trData.push(obj.importDate+" " + obj.importTime);
                	
                	if("00"==obj.openOrCloseSts){
                    	trData.push("批量导入关闭");
                	}else{
                    	trData.push("批量导入开通");
                	}
                	if (!hasPermission(PERMISSSIONCONST.TZERO949)) {
                		trData.push("");
                	} else {
                		trData.push("<div><a href=\"javascript:batchResultExportExcel('"+ obj.batchNumber +"')\">数据导出</a></div>");                		
                	}
                	 for(i=0; i < trData.length; i++){
                    	 if(trData[i] == undefined){
                    		 trData[i] = ''; 
                    	 }
                     }

                    	 $("#queryMecTzeroAndDOneStlGridPanel").DataTable().row.add(trData).draw();
                    	
                    	
                    });
                    $("#queryMecTzeroAndDOneStlGridPanel").DataTable().order([1, 'asc']).draw();
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
  	
    $(function(){
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.TZERO946)) {$("#download_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO947)) {$("#MecTzeroAndDOneStlPanel_Form_btn_importFile_open").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO948)) {$("#MecTzeroAndDOneStlPanel_Form_btn_importFile_open").hide();}
    	
    	
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
		//重置按钮
		$("#reset_btn").on('click', function() {
			$("#querypsmtckct_myForm")[0].reset();
			$("#querypsmtckct_myForm .bs-select").selectpicker('val','');
			$("#MecTzeroAndDOneStlPanel_Form_btn_importFile_open").datepicker('update', "");
	    	$("#MecTzeroAndDOneStlPanel_Form_btn_importFile_open").datepicker('update', "");
		});
		
		
		
		//下载模板按钮
		$("#download_btn").on('click', function() {
			window.open( baseURL + "/mecBatchOpe/downloadBatchOpe");
		});
		
		//打开上传插件-批量打开
		$("#MecTzeroAndDOneStlPanel_Form_btn_importFile_open").on("click",function(){
			$("#open_fileattr").val("");
			$("#open_confirmUpload").on("click",function(){
				bootbox.alert("请选择文件！");
        	});
			$("#importFile_openWin").modal("show");
		});
		$(document).on('hide.bs.modal','#importFile_openWin', function () {
			$("#open_confirmUpload").unbind("click");
		});
		
		//初始化上传插件-批量打开
		$('#file_open').fileupload({
	        dataType: 'json',
	        url:baseURL + "/mecBatchOpe/importExcelOpenDone",//文件上传地址，当然也可以直接写在input的data-url属性内
	        add: function (e, data) {
//	        	console.log(data);
	        	$("#open_fileattr").val(data.files[0].name);
	        	$("#open_confirmUpload").unbind("click");
	        	$("#open_confirmUpload").on("click",function(){
	        		App.blockUI({target:"body",boxed:!0,message:"导入中...",zIndex:20000});
	        		data.submit();
	        	});
	        },
	        done: function (e, data) {
	        	if (data.result && data.result.success) {
	        		$("#open_confirmUpload").unbind("click");
					bootbox.alert(data.result.msgInfo);
					$("#importFile_openWin").modal("hide");
				}else{
					if(data.result.msgInfo){
						bootbox.alert(data.result.msgInfo);
						reloadGrid();
					}else {
						bootbox.alert("导入失败");
					}
					return;
				}
	        }
	    });
		
		//打开上传插件-批量打开
		$("#MecTzeroAndDOneStlPanel_Form_btn_importFile_close").on("click",function(){
			$("#close_fileattr").val("");
			$("#close_confirmUpload").on("click",function(){
				bootbox.alert("请选择文件！");
        	});
			$("#importFile_closeWin").modal("show");
		});
		
		$(document).on('hide.bs.modal',"#importFile_closeWin",function () {
			$("#close_confirmUpload").unbind("click");
		})
		
		//初始化上传插件-批量关闭
		$('#file_close').fileupload({
	        dataType: 'json',
	        url:baseURL + "/mecBatchOpe/importExcelCloseDone",//文件上传地址，当然也可以直接写在input的data-url属性内
	        add: function (e, data) {
//	        	console.log(data);
	        	$("#close_fileattr").val(data.files[0].name);
	        	$("#close_confirmUpload").unbind("click");
	        	$("#close_confirmUpload").on("click",function(){
	        		App.blockUI({target:"body",boxed:!0,message:"导入中...",zIndex:20000});
	        		data.submit();
	        	});
	        },
	        done: function (e, data) {
	        	if (data.result && data.result.success) {
	        		$("#close_confirmUpload").unbind("click");
					bootbox.alert( data.result.msgInfo);
					$("#importFile_closeWin").modal("hide");
				}else{
					if(data.result.opMsg){
						bootbox.alert(data.result.msgInfo);
						reloadGrid();
					}else{
						bootbox.alert(data.result.msgInfo);
					}
					return;
				}
	        }
	    });
    });
    </script>  
</body>

</html>
