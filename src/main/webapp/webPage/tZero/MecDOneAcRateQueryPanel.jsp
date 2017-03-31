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
		                        <form action="<%=request.getContextPath()%>/tZero/acRate/query" class="form-horizontal" id="queryMecDOneAcRate_myForm">
		                            <div class="form-body">
		                                <div class="row norow">
		                                	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">商户编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mno" id="mecDOneAcRateQueryPanel_mno" class="form-control" placeholder="请输入商户编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">所属机构:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="orgNo" id="mecDOneAcRateQueryPanel_orgNo" class="bs-select form-control" data-live-search="true" data-size="12" data-show-subtext="true">
		                                                	<option value="">全部</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">所属分公司:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="companyNo" id="mecDOneAcRateQueryPanel_companyNo" class="bs-select form-control" data-size="12" data-show-subtext="true">
		                                                	<option value="">全部</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">D+1状态:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="busSts" id="mecDOneAcRateQueryPanel_busSts" class="bs-select form-control" data-show-subtext="true">
		                                                	<option value="">全部</option>
		                                                	<option value="0">关闭</option>
		                                                	<option value="1">开通</option>
		                                                	<option value="2">暂停</option>
		                                                </select>
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
		                                                <button type="button" id="importMecDOneRate" class="btn btn-info"> <i class="fa fa-search-unlock"></i> 批量导入调整结算费率</button>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">D+1商户结算费率管理列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="queryMecDOneAcRateGridPanel">
		                            <thead>
		                                <tr>
		                                    <th>
		                                        <input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                    <th> 序号 </th>
		                                    <th> 商户编号 </th>
		                                    <th> 商户名称 </th>
		                                    <th> 所属机构 </th>
		                                    <th> 所属分公司 </th>
		                                    <th> D+1状态 </th>
		                                    <th> 当前结算费率 </th>
		                                    <th> 操作 </th>
		                                    <th> 操作记录</th>
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
   
    <!-- 批量导入调整结算费率模态框（Modal） -->
	<div class="modal fade" id="bitch_importFileWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="50%"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	  
	       <div class="modal-header">
	          <button type="button" class="close" 
	             data-dismiss="modal" aria-hidden="true">
	                &times;
	          </button>
	          <h4 class="modal-title" id="">批量添加</h4>
	       </div>
	       <div class="modal-body" style="height:200px; text-align:center;">
	       
	               <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
	           	<div class="row fileupload-buttonbar" style="margin-left:15%; margin-top:20px;">
					<span class="btn green fileinput-button" style="float:left;">
		                        <i class="fa fa-plus"></i>
		                        <span> 选择文件 </span>
		                        <input id="file" type="file" name="file"  accept=".xlsx" multiple /> </span>    
		                        <input style="float:left; width:45%"  name="fileattr" id="open_fileattr" readonly
									class="form-control" placeholder="请选择文件">
		        </div>
	            <br/> 
	            <div class="row">
	               <div class="col-md-12"  style="text-align:center;">
	                   <div class="row">
	                       <div style="margin-left:4%;" class=" col-md-11">
	                       	  <button type="button"  id="confirmUpload" class="btn btn-success"> <i class="fa fa-sign-out"></i> 上传</button>
	                           <button type="button" onclick="javascript:$('#bitch_importFileWin').modal('hide');" id="" class="btn red"> <i class="fa fa-share"></i> 取消</button>
	                       </div>
	                   </div>
	              </div>
	        </div>       
		</div><!-- /.modal -->
    </div>   
    
    
    <!-- 修改D+1结算费率模态框 -->
    <div class="modal fade" id="updateMecDoneAcRateWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="50%"
	   aria-labelledby="myModalLabel" aria-hidden="true">

         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="">修改D+1结算费率</h4>
         </div>
         <div class="modal-body" style="height:200px;">
         	<input type="hidden" id="edit_uuid" />
           	<div class="portlet-body form">
				<div class="form-body">
					<div class="row norow">
						<div class="panel panel-primary">
							<div class="panel-body">
								<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
									<div class="form-group">
										<label for="span-medium-3"
											class="control-label col-md-5 text-right">商户编码:</label>
										<div class="col-md-7 paddingnone" style="margin-top:5px;">
											<input name="mno" readOnly id="mecDOneAcRate_updateAcRateForm_mno" class="form-control" placeholder="请输入商户编码">
										</div>
									</div>
								</div>
								<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
									<div class="form-group">
										<label for="span-medium-3"
											class="control-label col-md-5 text-right">商户名称:</label>
										<div class="col-md-7 paddingnone" style="margin-top:5px;">
											<input name="mnoNm" readOnly id="mecDOneAcRate_updateAcRateForm_mnoNm" class="form-control" placeholder="请输入商户名称">
										</div>
									</div>
								</div>
								<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
									<div class="form-group">
										<label for="span-medium-3"
											class="control-label col-md-5 text-right">当前结算费率(%):</label>
										<div class="col-md-7 paddingnone" style="margin-top:5px;">
											<input name="acRate" readOnly id="mecDOneAcRate_updateAcRateForm_acRate" class="form-control" placeholder="请输入当前结算费率(%)">
										</div>
									</div>
								</div>
								<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
									<div class="form-group">
										<label for="span-medium-3"
											class="control-label col-md-5 text-right">新结算费率(%):<font style="color:red">*</font></label>
										<div class="col-md-7 paddingnone" style="margin-top:5px;">
											<input name="acRateNew" id="mecDOneAcRate_updateAcRateForm_acRateNew" class="form-control" type="number" min="0" max="1" placeholder="填写新费率">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
         </div>
         <div class="form-actions" style="padding:15px;">
             <div class="row">
                 <div class="col-md-12" style="text-align:center;">
                     <div class="row">
                         <div class="col-md-offset-1 col-md-11">
                         	  <button type="button"  id="updateSubmit_btn" class="btn green"> <i class="fa fa-success"></i> 确认提交</button>
                             <button type="button" onclick="javascript:$('#updateMecDoneAcRateWin').modal('hide');" id="" class="btn red"> <i class="fa fa-share"></i> 取消</button>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
	</div>
    
    
    <!-- 批量导入调整费率失败数据模态框（Modal） -->
	<div class="modal fade" id="DOneAcRateImportErroWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="40%"
	   aria-labelledby="myModalLabel" aria-hidden="true">  
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title">批量导入调整商户D+1结算费率结果</h4>
         </div>
         <div class="row" style="padding:5px 25px;">
         	<h5 id="mecDOneAcRateImportErrTitle"></h5>
         </div>
         <div class="modal-body" style="min-height:200px; text-align:center;">
         	<div class="portlet-body wheel" style="overflow-x: hidden;">
                 <table class="table table-striped table-bordered table-hover table-checkable order-column">
                     <thead>
                         <tr>
                             <th> 序号 </th>
                             <th> 商户编号</th>
                             <th> 失败原因 </th>
                         </tr>
                     </thead>
                     <tbody>
                     </tbody>
                 </table>
             </div>
             <div class="clearfix"></div>  
		</div><!-- /.modal -->
		<br/>
		<br/>
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
    	$("#queryMecDOneAcRateGridPanel tbody").empty();
    	//$("table tbody [id^='resutl_']").remove();
    	reloadGrid();
    }
    
    //全选列表数据
    function checkAll(checked) {
    	$("#queryMecDOneAcRateGridPanel tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
	//封装查询参数
	function packageArg(){
		var param = {};
		var mno = $("#mecDOneAcRateQueryPanel_mno").val();
		var orgNo = $("#mecDOneAcRateQueryPanel_orgNo").val();
		var companyNo = $("#mecDOneAcRateQueryPanel_companyNo").val();
		var busSts = $("#mecDOneAcRateQueryPanel_busSts").val();
		var wdcFlgPaused,wdcFlgOpen;
		if(busSts=="0"){//关闭
			wdcFlgPaused ="0";
			wdcFlgOpen ="0";
		}else if(busSts=="1"){//开通
			wdcFlgPaused ="1";
			wdcFlgOpen ="1";
		}else if(busSts=="2"){//暂停
			wdcFlgPaused ="0";
			wdcFlgOpen ="1";
		}
		
		param.mno = mno;
		param.topOrgNo=orgNo;
		param.companyNo=companyNo;
		param.wdcFlgPaused=wdcFlgPaused;
		param.wdcFlgOpen=wdcFlgOpen;
		return param;
	}
	
	//打开修改费率窗口
	function updateRate(mno,mnoNm,acRate){
		$("#mecDOneAcRate_updateAcRateForm_mno").val(mno);
		$("#mecDOneAcRate_updateAcRateForm_mnoNm").val(mnoNm);
		$("#mecDOneAcRate_updateAcRateForm_acRate").val(acRate);
		$("#mecDOneAcRate_updateAcRateForm_acRateNew").val("");
		$("#updateMecDoneAcRateWin").modal("show");
	}
	
	//打开查看日志
	function queryLog(mno){
		$.fancybox({afterLoad:fancyboxCenterOnViewport,
    		href:'mecDOneAcRateQueryPanel_payApplyGridWin.jsp?mno='+mno ,
    		type: 'iframe',
    		padding: 5,
    		margin:60,
    		scrolling: 'no',
    		fitToView: true,
    		width: 1000,
    		height: 470,
    		autoSize: false,
    		closeClick: false,
    		afterClose:function(){}
    	});
	}
	
	
	//提交费率修改保存
	function updateAcRate(mno, acRate, acRateNew,mnoNm){
		App.blockUI({target:"body",boxed:!0,message:"正在处理中，请稍等...",zIndex:20000});
		var updateUrl = baseURL +"/tZero/acRate/updateAcRate";

		var param = {};
		param.mno =mno;
		param.acRate =acRate;
		param.acRateNew =acRateNew;
		param.mnoNm =mnoNm;

		$.ajax({
            type: "POST",
            url: updateUrl,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: param,
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	if(data.success){
            		reloadGrid();
            		bootbox.alert(data.msg);
            		$("#updateMecDoneAcRateWin").modal("hide");
            	}else{
            		bootbox.alert(data.msg);
            	}
            	
            },
            error:function(){bootbox.alert("操作失败!");}
		});
	}
	
	function dealResult(record){
		 var  titileWain='本次批量导入调整商户D+1结算费率共成功<font color="red">'+record.successCount+'</font>条,失败<font color="red">'+
		 			record.failCount+'</font>条'+", 失败商户及原因如下:";
		 var  titileWainNotError='本次批量导入调整商户D+1结算费率共成功<font color="red">'+record.successCount+'</font>条,失败<font color="red">'+record.failCount+'</font>条';
		 if(record.failCount==0){
			 bootbox.alert(titileWainNotError);	
		 }else{
			$("#mecDOneAcRateImportErrTitle").html(titileWain);
			$("#DOneAcRateImportErroWin tbody").empty();
			$.each(record.items,function(index, obj){
				var num = index+1;
				var tr = $("<tr></tr>").append($("<td></td>").text(index + 1));
				tr.append($("<td></td>").text(obj.mno));
               	tr.append($("<td></td>").text(obj.errorMsg));
           		$("#DOneAcRateImportErroWin tbody").append(tr);
       		});
			$("#DOneAcRateImportErroWin").modal("show");
		 }
	}
	
    //查询数据
    function reloadGrid() {
    	$("#queryMecDOneAcRateGridPanel tbody").empty();
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
			
    	var query_Path = baseURL + "/tZero/acRate/query";
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
    			$("#queryMecDOneAcRateGridPanel").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	
                	var trData = [];
                	trData.push("<input type=\"checkbox\" data-chkBatNo='"+ obj.chkBatNo +"' class=\"checkboxes\" rownum=\""+index+"\" />");
                	trData.push(start + index + 1);
                	
                	trData.push(obj.mno);
                	trData.push(obj.mnoNm);
                	trData.push(obj.topOrgNm);
                	trData.push(obj.companyNm);
                	
                	
                	if(obj.busSts=="0"){
                		trData.push("关闭");
                	}else if(obj.busSts=="1"){
                		trData.push("开通");
                	}else{
                		trData.push("暂停");
                	}
                	
                	trData.push(obj.acRate+"%");
                	if(hasPermission(PERMISSSIONCONST.TZERO949)){
                		trData.push("<a href=\"javascript:void(0);\" onclick=\"updateRate('"+obj.mno+"','"+obj.mnoNm+"','"+obj.acRate+"')\">修改</a>");
                	}else{
                		trData.push("");
                	}
                	
                	
                	if(hasPermission(PERMISSSIONCONST.TZER2005)){
                		trData.push("<INPUT type='button' value='查看日志' onclick=queryLog('"+obj.mno+"')>");
                	}else{
                		trData.push("");
                	}
                	
                	
                	for(i=0; i < trData.length; i++){
                   	 if(trData[i] == undefined){
                   		 trData[i] = ''; 
                   	 }
                    }

                   	 $("#queryMecDOneAcRateGridPanel").DataTable().row.add(trData).draw();
                   	
                   	
                   });
                   $("#queryMecDOneAcRateGridPanel").DataTable().order([1, 'asc']).draw();

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
    	if (!hasPermission(PERMISSSIONCONST.TZER2004)) {$("#download_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZER2006)) {$("#importMecDOneRate").hide();}
    	
    	//加载查询条件-所属机构
    	var orgurl = baseURL+"/tZero/acRate/queryTopOrg";
    	$.ajax({
            type: "GET",
            url: orgurl,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	$.each(data,function(index, obj){
            		$("#mecDOneAcRateQueryPanel_orgNo").append($("<option></option>").val(obj.ORGNO).text(obj.ORGNM));
            	});
            	//更新内容刷新到相应的位置
                $("#mecDOneAcRateQueryPanel_orgNo").selectpicker('render');
                $("#mecDOneAcRateQueryPanel_orgNo").selectpicker('refresh');
            },
            error:function(){}
		});
    	
    	//加载查询条件-所属分公司
    	var companyurl = baseURL+"/tZero/org/queryOrgNmComboList";
    	$.ajax({
            type: "GET",
            url: companyurl,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	$.each(data,function(index, obj){
            		$("#mecDOneAcRateQueryPanel_companyNo").append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
            	});
            	//更新内容刷新到相应的位置
                $("#mecDOneAcRateQueryPanel_companyNo").selectpicker('render');
                $("#mecDOneAcRateQueryPanel_companyNo").selectpicker('refresh');
            },
            error:function(){}
		});
    	
		//查询按钮
		$("#query_btn").on('click', function(){
			page = 1;
			reloadGrid();
		});
		
		//重置按钮
		$("#reset_btn").on('click', function() {
			$("#queryMecDOneAcRate_myForm")[0].reset();
			$("#queryMecDOneAcRate_myForm .bs-select").selectpicker('val','');
		});
		
		
		
		//下载模板按钮
		$("#download_btn").on('click', function() {
			window.open( baseURL + "/tZero/acRate/downloadBatchTemplate");
		});
		
		//打开上传插件-批量导入调整结算费率
		$("#importMecDOneRate").on("click",function(){
			$("#open_fileattr").val("");
			$("#confirmUpload").on("click",function(){
				bootbox.alert("请选择文件！");
        	});
			$("#bitch_importFileWin").modal("show");
		});
		
		
		
		//初始化上传插件-批量导入调整结算费率
		$('#file').fileupload({
	        dataType: 'json',
	        url:baseURL + "/tZero/acRate/batchImportRcRate",//文件上传地址，当然也可以直接写在input的data-url属性内
	        add: function (e, data) {
//	        	console.log(data);
	        	$("#open_fileattr").val(data.files[0].name);
	        	$("#confirmUpload").unbind("click");
	        	$("#confirmUpload").on("click",function(){
	        		data.submit();
	        	});
	        },
	        done: function (e, data) {
	        
	        	if (data.result && data.result.success) {
	        		$("#confirmUpload").unbind("click");
	        		dealResult(data.result);
					$("#bitch_importFileWin").modal("hide");
					reloadGrid();
				}else{
					if(data.result.msg){
						bootbox.alert(data.result.msg);
					}else {
						bootbox.alert("上传失败");
					}
					return;
				}
	        }
	    });
		
		
		//提交修改费率按钮
		$("#updateSubmit_btn").on("click",function(){
			var mno = $("#mecDOneAcRate_updateAcRateForm_mno").val();
			var acRate = $("#mecDOneAcRate_updateAcRateForm_acRate").val();
			var acRateNew = $("#mecDOneAcRate_updateAcRateForm_acRateNew").val();
			var mnoNm = $("#mecDOneAcRate_updateAcRateForm_mnoNm").val();
			if(acRateNew==""){
				bootbox.alert("费率不能为空");
				return;
			}
			if(acRateNew>1){
				bootbox.alert("费率不能为大于1");
				return;
			}
			if(acRateNew<0){
				bootbox.alert("费率不能为负值");
				return;
			}
			updateAcRate(mno, acRate, acRateNew, mnoNm);
			
		});
    });
    </script>  
</body>

</html>
