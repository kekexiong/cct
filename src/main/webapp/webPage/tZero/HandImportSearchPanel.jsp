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
		                        <form action="<%=request.getContextPath()%>/HandImportSearch/index?mecType=02" class="form-horizontal" id="HandImportSearchPanel_myForm">
		                            <div class="form-body">
		                                <div class="row norow">
		                                	
		                                     <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">导入日期:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange" >
		                                                    <input type="text" class="form-control col-md-3" name="strDtStart" id="MecPushInfo_startDate">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="strDtEnd" id="MecPushInfo_endDate">
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
	                                        <div class="form-group">
	                                            <label for="span-medium-1" class="control-label col-md-4 text-right">导入渠道:</label>
	                                            <div class="col-md-8 paddingnone">
	                                                 <select name="pusType" id="MecPushInfo_pusType" class="bs-select form-control" data-show-subtext="true">
	                                                	<option value="">全部</option>
	                                                	<option value="01">POS</option>
		                                                <option value="02">SMS</option>
	                                                </select>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
	                                        <div class="form-group">
	                                            <label for="span-medium-1" class="control-label col-md-4 text-right">导入状态:</label>
	                                            <div class="col-md-8 paddingnone">
	                                                 <select name="importSts" id="MecPushInfo_importSts" class="bs-select form-control" data-show-subtext="true">
	                                                	<option value="">全部</option>
	                                                	<option value="00">待处理</option>
		                                                <option value="01">成功</option>
		                                                <option value="02">失败</option>
	                                                </select>
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
		                                                <button type="button" id="PosPushRulePanel_btn" class="btn btn-info"> <i class="fa fa-pencil"></i> POS自动推送规则设置</button>
		                                                <button type="button" id="SMSDOnePushRulPanel_btn" class="btn btn-info"> <i class="fa fa-pencil"></i> SMS自动推送规则设置</button>
		                                                <button type="button" id="ActiveSMSDOnePushRulPanel_btn" class="btn btn-info"> <i class="fa fa-pencil"></i> 沉默商户激活自动推送规则设置</button>
		                                            	<button type="button" id="downloadBatchPushMnoTemplate_btn" class="btn btn btn-primary"> <i class="fa fa-download"></i> 下载D+1导入模板</button>
		                                            	<button type="button" id="sgImportDaddOne_btn" class="btn btn btn-primary"> <i class="fa fa-import"></i> 手工导入D+1商户</button>
		                                            	<button type="button" id="exportInfoList_btn" class="btn btn btn-primary"> <i class="fa fa-share"></i> 明细导出</button>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">D+1推送列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="MAIN_MecPushInfoGridPanel">
		                            <thead>
		                                <tr>
		                                    <th>
		                                        <input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                    <th> 批次号 </th>
		                                    <th> 导入时间 </th>
		                                    <th> 导入渠道 </th>
		                                    <th> 导入状态 </th>
		                                    <th> 导入条数 </th>
		                                    <th> 处理结果</th>
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
    
    
    <!-- 手工导入D+1商户导入模态框（Modal） -->
	<div class="modal fade" id="importFile_Win" tabindex="-1" role="dialog" data-backdrop="static" data-width="40%"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	       <div class="modal-header">
	          <button type="button" class="close" 
	             data-dismiss="modal" aria-hidden="true">
	                &times;
	          </button>
	          <h4 class="modal-title" id="">手工导入D+1商户</h4>
	       </div>
	       <div class="modal-body" style="height:240px; text-align:center;">
	       		<div class="col-lg-12 col-md-10 col-sm-10 col-xs-16" style="width:100%;">
                    <div class="form-group">
                        <label for="span-medium-1" class="control-label col-md-4 text-right" style="width:140px;float:left;">推送类型:</label>
                        <div class="col-md-6 paddingnone" style="width:50%;float:left; padding-left: 0px;">
                             <select name="pushType" id="HandImportSearchPanel_pushType" class="bs-select form-control" data-show-subtext="true">
                            	<option value="01">POS</option>
                             	<option value="02">SMS</option>
                            </select>
                        </div>
                    </div>
                </div>
	       		<div class="clearfix"></div>
	               <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
	           	<div class="row fileupload-buttonbar col-lg-12 col-md-10 col-sm-10 col-xs-16" style="margin-top:20px;width:100%;">
					<div class="form-group">
						<span class="btn green fileinput-button" style="float:left;width:95px;margin-left:44px;margin-right: 15px;">
		                        <i class="fa fa-plus"></i>
		                        <span> 选择文件 </span> &nbsp; 
		                        <input id="file" type="file" name="file" accept=".xlsx"  multiple  /> </span>
		                        <input style="float:left; width:40%"  name="fileattr" id="fileattr" readonly
									class="form-control" placeholder="请选择文件">
					</div>
		        </div>
	            <br/> 
	            <div id="msgarea" style="display:none;width:100%;" class="col-lg-12 col-md-10 col-sm-10 col-xs-16">
                    <div class="form-group">
                        <label for="span-medium-1" class="control-label col-md-4 text-right" style="width:139px;float:left;">短信内容:</label>
                        <div class="col-md-6 paddingnone" style="width:50%;float:left;">
                             <textarea class="form-control" id="HandImportSearchPanel_sengMsgInfo"></textarea>
                        </div>
                    </div>
                </div>
                <div style="clear:both;"></div>
                
	            <div class="row" style="margin-top:28px;">
	               <div class="col-md-12"  style="text-align:center;">
	                   <div class="row">
	                       <div style="margin-left:4%;" class=" col-md-11">
	                       	  <button type="button"  id="confirmUpload" class="btn btn-success"> <i class="fa fa-sign-out"></i>上传</button>
	                           <button type="button" onclick="javascript:$('#importFile_Win').modal('hide');" id="" class="btn red"> <i class="fa fa-share"></i> 取消</button>
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
    	$("#MAIN_MecPushInfoGridPanel tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
	//封装查询参数
	function packageArg(){
		var param = {};
		var strDtStart =  $("#MecPushInfo_startDate").val().replace('/', '').replace('/', '');
		var strDtEnd =  $("#MecPushInfo_endDate").val().replace('/', '').replace('/', '');		
		var pushType = $("#MecPushInfo_pusType").val();
		var importSts = $("#MecPushInfo_importSts").val();
		param.strDtStart=strDtStart;
		param.strDtEnd=strDtEnd;
		param.pushType=pushType;
		param.importSts=importSts;
		
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
			
    	var query_Path = baseURL + "/HandImportSearch/index?mecType=02";
    	App.blockUI({target:"body",boxed:!0,message:"读取中...",zIndex:20000});
		$.ajax({
            type: "GET",
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
    			 $("#MAIN_MecPushInfoGridPanel").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	
                	var trData = [];
                	trData.push("<input type=\"checkbox\" data-chkBatNo='"+ obj.chkBatNo +"' class=\"checkboxes\" rownum=\""+index+"\" />");
                	trData.push(obj.importNo);
                	
                	var imdate = obj.importDt;
                	var imtime = obj.importTm;

                	trData.push(imdate.substr(0,4)+"-"+ imdate.substr(4,2)+"-"+ imdate.substr(6,2)+ " " + imtime.substr(0,2)+":" + imtime.substr(2,2)+":" + imtime.substr(4,2));
                	if(obj.pushType=="01"){
                		trData.push("POS");
                	}else{
                		trData.push("SMS");
                	}
                	
                	if(obj.importSts=="00"){
                		trData.push("待处理");
                	}else if(obj.importSts=="01"){
                		trData.push("成功");
                	}else{
                		trData.push("失败");
                	}
                	
                	trData.push(obj.importCount);
                	if(obj.smsSendSts=="00"){
                		trData.push("待发送");
                	}else if(obj.smsSendSts=="01"){
                		trData.push("发送成功");
                	}else if(obj.smsSendSts=="02"){
                		trData.push("发送失败");
                	}else{
                		trData.push("");
                	}
                	  for(i=0; i < trData.length; i++){
                     	 if(trData[i] == undefined){
                     		 trData[i] = ''; 
                     	 }
                      }

                     	 $("#MAIN_MecPushInfoGridPanel").DataTable().row.add(trData).draw();
                     	
                     	
                     });
                     $("#MAIN_MecPushInfoGridPanel").DataTable().order([1, 'desc']).draw();
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
    	
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
		
		//下载D+1导入模板按钮
		$("#downloadBatchPushMnoTemplate_btn").on('click', function() {
			window.open( baseURL + "/t0d1/push/downloadBatchPushMnoTemplate");
		});
		
		//POS自动推送规则设置
		$("#PosPushRulePanel_btn").on("click",function(){
			$.fancybox({afterLoad:fancyboxCenterOnViewport,
	    		href:"PosPushRulePanel.jsp",
	    		type: 'iframe',
	    		padding: 5,
	    		margin:60,
	    		scrolling: 'no',
	    		fitToView: true,
	    		width: 800,
	    		height: 260,
	    		autoSize: false,
	    		closeClick: false,
	    		afterClose:function(){}
	    	});
		});
		
		//SMS自动推送规则设置
		$("#SMSDOnePushRulPanel_btn").on("click",function(){
			$.fancybox({afterLoad:fancyboxCenterOnViewport,
	    		href:"SMSDOnePushRulPanel.jsp",
	    		type: 'iframe',
	    		padding: 5,
	    		margin:60,
	    		scrolling: 'no',
	    		fitToView: true,
	    		width: 800,
	    		height: 260,
	    		autoSize: false,
	    		closeClick: false,
	    		afterClose:function(){}
	    	});
		});
		
		//沉默商户激活自动推送规则设置
		$("#ActiveSMSDOnePushRulPanel_btn").on("click",function(){
			$.fancybox({afterLoad:fancyboxCenterOnViewport,
	    		href:"ActiveSMSDOnePushRulPanel.jsp",
	    		type: 'iframe',
	    		padding: 5,
	    		margin:60,
	    		scrolling: 'no',
	    		fitToView: true,
	    		width: 700,
	    		height: 420,
	    		autoSize: false,
	    		closeClick: false,
	    		afterClose:function(){}
	    	});
			
		});
		
		$("#HandImportSearchPanel_pushType").on("change",function(){
			if($(this).val()=="01"){
				$("#msgarea").hide();
			}else{
				$("#msgarea").show();
			}
			
		});
		
		//打开上传窗口 D+1商户
		$("#sgImportDaddOne_btn").on("click",function(){
			$("#fileattr").val("");
			$("#msgarea").hide();
			$("#HandImportSearchPanel_pushType").selectpicker('val','01');
			$("#confirmUpload").on("click",function(){
				bootbox.alert("请选择文件！");
        	});
			$("#importFile_Win").modal("show");
		});
		
/*		var pushType = $("#HandImportSearchPanel_pushType").val();
		var param = "";
		if(""!=pushType && null != pushType){
			param = "&pushType="+pushType;
		}
		var sengMsgInfo = $("#HandImportSearchPanel_sengMsgInfo").val();
		if(""!=sengMsgInfo && null !=sengMsgInfo){
			param += "&sengMsgInfo="+sengMsgInfo;
		}*/
		
		//初始化上传插件-批量关闭
		$('#file').fileupload({
	        dataType: 'json',
	        url:baseURL + "/t0d1/push/batchImportPushMno?mecType=02",//文件上传地址，当然也可以直接写在input的data-url属性内
	        add: function (e, data) {
//	        	console.log(data);
	        	$("#fileattr").val(data.files[0].name);
	        	$("#confirmUpload").unbind("click");
	        	$("#confirmUpload").on("click",function(){
	        		var sengMsgInfo = $("#HandImportSearchPanel_sengMsgInfo").val();
	        		var pushType = $("#HandImportSearchPanel_pushType").val();
	        		data.formData ={"sengMsgInfo":sengMsgInfo,"pushType":pushType};
	        		data.submit();
	        	});
	        },
	        done: function (e, data) {
	        	if (data.result && !data.result.success) {
	        		bootbox.alert("上传失败");
				}else{
					$("#confirmUpload").unbind("click");
					$("#importFile_Win").modal("hide");
					if(data.result.msg){
						bootbox.alert(data.result.msg);
						reloadGrid();
					}else{
						bootbox.alert("导入成功");
					}
					return;
				}
	        }
	    });
		
		
		//导出明细
		$("#exportInfoList_btn").on("click",function(){
			var selectRecords = $("#MAIN_MecPushInfoGridPanel tbody input:checked");
			if(null !=selectRecords && selectRecords.length==0){
				bootbox.alert(CONST.TIP042);
				return;
			}
			if(null !=selectRecords && selectRecords.length>1){
				bootbox.alert(CONST.TIP043);
				return;
			}

			var index = $(selectRecords[0]).attr("rownum");
			var rec = tableData.items[index];
			
			var arg ="";
			for(var index in rec){
				arg+="&"+index+"="+rec[index];
			}
			
			window.open( baseURL + '/HandImportSearch/exportmInfoList?mecType=02' + arg);
		});
		
    });
    </script>  
</body>

</html>
