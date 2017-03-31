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
		                        <form action="<%=request.getContextPath()%>/tZero/orgRule/query" class="form-horizontal" id="queryMecDOneFreeLimitPanel">
		                            <div class="form-actions">
		                            	<div class="row norow">
		                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">所属分公司:</label>
		                                            <div class="col-md-8 paddingnone">
		                                            	<select name="orgUuid" id="DOneFreeLimitForm_orgUuid" class="bs-select form-control" data-live-search="true" data-show-subtext="true">
		                                                	<option value="">全部</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">免费额度:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group ">
		                                                    <input type="number" class="form-control col-md-3" min="0" name="freeAmtMin" id="DOneFreeLimitForm_freeAmtMin">
		                                                    <span class="input-group-addon"> 至 </span>
		                                                    <input type="number" class="form-control" min="0" name="freeAmtMax" id="DOneFreeLimitForm_freeAmtMax">
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="row">
		                                    <div class="col-md-12">
		                                        <div class="row">
		                                            <div class="col-md-offset-1 col-md-11">
		                                            	<button type="button" id="query" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
		                                                <button type="button" id="exportexcel" class="btn btn-info"> <i class="fa fa-out"></i> 导出</button>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </form>
		                    </div>
		                </div>
		                <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-title">
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">D+1商户默认免费额度列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="DOneFreeLimitGrid">
		                            <thead>
		                                <tr>
		                                	<th> 分公司 </th>
		                                    <th> 所属商户默认免费额度(元)</th>
		                                	<th> 操作 </th> 
		                                    <th> 操作记录 </th>
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
    
    <!-- END CONTENT -->
   
   <!-- 修改额度模态框 -->
    <div class="modal fade" id="DoneFreeeLimitUpdWindow" tabindex="-1" role="dialog" data-backdrop="static" data-width="600px"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">修改额度</h4>
	         </div>
	         <div class="modal-body">
	         	<input type="hidden" id="edit_uuid" />
            	<div class="portlet-body form">
					<div class="form-body">
		                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							 <input name="uuid" id="DOneOrgRuleUpdForm_uuid" class="form-control" style="display:none;" />
							 <input name="orgUuid" id="DOneOrgRuleUpdForm_orgUuid" class="form-control" style="display:none;" />
                             <div class="row norow">
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="width:80%;">
                                     <div class="form-group">
                                         <label for="span-medium-1" class="control-label col-md-6 text-right">分公司:</label>
                                         <div class="col-md-6 paddingnone">
                                             <input name="orgNm" id="DOneOrgRuleUpdForm_orgNm" readonly="readonly" style="background:#fff;" class="form-control">
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <div class="row norow">
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="width:80%;">
                                     <div class="form-group">
                                         <label for="span-medium-1" class="control-label col-md-6 text-right">所属商户默认D+1免费额度:</label>
                                         <div class="col-md-6 paddingnone">
                                             <input name="freeAmt" id="DOneOrgRuleUpdForm_freeAmt" readonly="readonly" style="background:#fff;" class="form-control" placeholder="">
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <div class="row norow">
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="width:80%;">
                                     <div class="form-group">
                                         <label for="span-medium-1" class="control-label col-md-6 text-right"><font color="red">*</font>额度调整为:</label>
                                         <div class="col-md-6 paddingnone">
                                             <input name="newFreeAmt" id="DOneOrgRuleUpdForm_newFreeAmt" max="9999999999" class="form-control" type="number" style="width: 90%; float:left;" placeholder="">元
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <div class="row norow">
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="width:80%;">
                                     <div class="form-group">
                                         <label for="span-medium-1" class="control-label col-md-6 text-right"><font color="red">*</font>调整原因：</label>
                                         <div class="col-md-6 paddingnone">
                                             <textarea id="DOneOrgRuleUpdForm_rmk" name="rmk" class="form-control" ></textarea>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                        </div>	
		            	<div class="clearfix"></div>
		            	<div class="form-actions" style="padding:15px;">
		                  	<div class="row">
		                      <div class="col-md-12"  style="text-align:center;">
                              	  <button type="button"  id="DoneFreeeLimitUpdWindow_confirm_btn" class="btn green"> <i class="fa fa-success"></i> 确定</button>
                                  <button type="button" onclick="javascript:$('#DoneFreeeLimitUpdWindow').modal('hide');" id="" class="btn red"> <i class="fa fa-share"></i> 关闭</button>
		                      </div>
		                  </div>
		                  <div class="clearfix"></div>
		              </div>
					  <div class="clearfix"></div>	
				</div>
			</div>
		</div>
       <!-- END CONTENT -->
   </div>
   
   
   <!-- 额度操作记录模态框 -->
    <div class="modal fade" id="DOneFreeLimitOptHisWin" tabindex="-1" role="dialog" style="width:80%;" data-backdrop="static" data-width="80%"
	   aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-header">
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="">修改免费额度日志</h4>
         </div>
         <div class="modal-body">
         	<div class="portlet light bordered scaffold-list">
         	<div class="portlet-body wheel">
                <table class="table table-striped table-bordered table-hover table-checkable order-column" id="DOneFreeLimitOptHisGrid">
                    <thead>
                        <tr>
                        	<th> 序号 </th>
                            <th> 操作时间 </th>
                        	<th> 分公司 </th> 
                            <th> 操作前额度 </th>
                            <th> 操作后额度</th>
                            <th> 操作原因 </th>
                            <th> 操作人 </th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div class="row no-margin" id="pagination-bar_inner">
				<div class="col-sm-4 left no-padding">
					<div class="inline fl">
						记录数共:<span id="itemCount_inner"></span>条 当前第<span id="nowpage_inner"></span>/<span id="toalPage_inner"></span>页 每页显示:
					</div>
					<div class="inline fl">
						<select id="limit_inner" class=" form-control "
							onchange="onChange4PageSize_inner(this)">
							<option value="10" selected="selected" >10</option>
							<option value="20" >20</option>
							<option value="30">30</option>
							<option value="45">45</option>
							<option value="60">60</option>
							<option value="75">75</option>
						</select>
					</div>
					<div class="inline fl">条</div>
				</div>

				<div class="col-sm-6 pull-right no-padding">


					<div id="pagination_inner"
						class="dataTables_paginate paging_simple_numbers clearfix pull-right">
						<nobr>
							<ul class="pagination no-padding" style="float: left">
								<li class="prev "> <a href="javascript:;" onclick="javascript:pageing_inner(1)"> 首页</a> </li>
								<li class="prev "> <a href="javascript:;" onclick="javascript:pageing_inner('pro')"> 上一页</a> </li>
								<li class="next "><a href="javascript:;" onclick="javascript:pageing_inner('next')">下一页</a></li>
								<li class="next "><a href="javascript:;" onclick="javascript:pageing_inner('last')">末页</a></li>
							</ul>
							<div class="input-group pull-right col-sm-2" style="float: left;">
								<input min="1" class="form-control p" style="height: 31px; width: 80px;" type="number">
								<a href="javascript:;" class="input-group-addon" onclick="javascript:pageing_inner($('.p').val())"><i class="fa fa-mail-forward brown"></i></a>
							</div>
						</nobr>
					</div>
				</div>
              	</div>
            </div>
		</div> 
	</div>
    <!-- END CONTENT -->
   
   
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
	
    var totalCount;
    
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
    	$("#DOneFreeLimitGrid").find('tbody').empty();
    	//$("table tbody [id^='resutl_']").remove();
    	reloadGrid();
    }
    
    //全选列表数据
    function checkAll(checked) {
    	$("#DOneFreeLimitGrid tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    

    //每页多少条
    var limit_inner=10;
    //当前页
    var page_inner=1;
    //起始条
    var start_inner=0;
    //总页数
    var toalPage_inner;
    //数据列表缓存
    var tableData_inner; 
    
    var orgUuid = null;
  //分页
    function pageing_inner(opp) {
    	$(window.top.document).scrollTop(0,500);
    	limit_inner=$("#limit_inner  option:selected").text();
    	 
    	if(opp=='pro')
    	{
    		if(page_inner>1)
    		{
    			page_inner=page_inner-1;
    			start_inner=(page_inner-1)*limit_inner;
    		}
    		else
    		{
    			bootbox.alert('已经是第一页');
    			return;
    		}
    	}
    	else if (opp=='next')
    	{
    		if(page_inner==toalPage_inner)
    		{
    			bootbox.alert('已经是最后一页');
    			return;
    		}
    		page_inner=page_inner+1;
    		start_inner=(page_inner-1)*limit_inner;
    	}
    	else if (opp=='last')
    	{
    		if (page_inner == toalPage_inner) {
    			return;
    		}
    		page_inner=$("#toalPage_inner").text();
    		if(page_inner>toalPage_inner)
    		{
    			bootbox.alert('对不起没有你要跳转的页面');
    			return;
    		}
    		else if(page_inner<1)
    		{
    			bootbox.alert('对不起没有你要跳转的页面');
    			return;
    		}
    		
    		start_inner=(page_inner-1)*limit_inner;
    	}
    	else
    	{
    		 if (page_inner == 1 && opp == 1) {
                 return;
             }
             
             if(opp>toalPage_inner)
             {
                 bootbox.alert('对不起没有你要跳转的页面');
                 return;
             }
             else if(opp<1)
             {
                 bootbox.alert('对不起没有你要跳转的页面');
                 return;
             }
             page_inner=opp*1;
             start_inner=(page_inner-1)*limit_inner;
    	}
    	//$("#DOneFreeLimitOptHisGrid").find('tbody').empty();
    	//$("table tbody [id^='resutl_']").remove();
    	reloadGrid_history();
    }
  
    function onChange4PageSize_inner(select) {
    	limit_inner = select.value;
    	reloadGrid_history();
    }
    
    
    function reloadGrid_history(){
    	
    	App.blockUI({target:"body",boxed:!0,message:"加载中...",zIndex:20000});
    	var param = {};
    	start=(page_inner-1)*limit_inner;

    	param.page=page_inner;
    	param.start=start;
    	param.limit=limit_inner;
    	$.ajax({
            type: "POST",
            url: baseURL+"/tZero/orgRule/log?orgUuid="+orgUuid,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: param,
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	toalPage_inner=Math.ceil(data.totalCount/limit_inner);
    			$("#itemCount_inner").text(data.totalCount);
    			totalCount_inner = data.totalCount;
    			$("#nowpage_inner").text(page_inner);
    			$("#toalPage_inner").text(toalPage_inner);
    			
    			
            	$("#DOneFreeLimitOptHisGrid").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	var trData = [];
                	trData.push(start_inner+index+1);
                	trData.push(obj.tmCte!=null?obj.tmCte:"");
                	trData.push(obj.orgNm!=null?obj.orgNm:"");
                	trData.push(obj.freeAmtB);
                	trData.push(obj.freeAmtA);
                	trData.push(obj.rmk);
                	trData.push(obj.opCte);
                	
                	for(i=0; i < trData.length; i++){
                   	 	if(trData[i] == undefined){
                   		 	trData[i] = ''; 
                   	 	}
                    }
                   	$("#DOneFreeLimitOptHisGrid").DataTable().row.add(trData);
                   	
                });
                $("#DOneFreeLimitOptHisGrid").DataTable().order([0, 'asc']).draw();
                $("#DOneFreeLimitOptHisWin").modal("show");
            },
            error: function(error) {
            }
        });
    	
    }
    
    //获取一键参数
    function  getParams () {
    	var orgUuid = $('#DOneFreeLimitForm_orgUuid').val();
    	var freeAmtMin = $('#DOneFreeLimitForm_freeAmtMin').val().trim();
		var freeAmtMax = $('#DOneFreeLimitForm_freeAmtMax').val().trim();
		var regrex = /^[1-9]\d*$/;
		if(("" != freeAmtMin && "" !=freeAmtMax) && (!regrex.test(freeAmtMin) || !regrex.test(freeAmtMax))){
			bootbox.alert( "默认额度仅支持正整数！");
			return;
		}
		if(("" != freeAmtMin && "" !=freeAmtMax) && (freeAmtMin>9999999999 || freeAmtMax>9999999999)){
			bootbox.alert( "默认额度最大值不能超过9999999999！");
			return;
		}
		if(""!=freeAmtMin && ""!=freeAmtMax &&parseInt(freeAmtMin)>parseInt(freeAmtMax)){
			bootbox.alert( "起始免费额度不能大于截止额度！");
			return;
		}
		
       	var curParams = {
   		   	"orgUuid":orgUuid,
			"freeAmtMin":freeAmtMin,
			"freeAmtMax":freeAmtMax
		};
        return curParams;
    }
    
    
    var query_Path = baseURL + "/tZero/orgRule/query";
    //查询数据
    function reloadGrid() {
    	$("#DOneFreeLimitGrid").find('tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
    	var param = getParams();
    	
    	if(param == null){
    		return;
    	}
 	  	
    	param.page=page;
    	param.start=start;
    	param.limit=limit;
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
    			totalCount = data.totalCount;
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
    			
    			//填充统计数据
    			$("#DOneFreeLimitGrid").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	
                	var trData = [];
                	trData.push(obj.orgNm!=null?obj.orgNm:"");
                	trData.push(obj.freeAmt!=null?obj.freeAmt:"");
                	
                	trData.push("<div><a href = 'javascript:void(0)' class='updateopt' data-orgNm='"+ obj.orgNm+"' data-freeAmt='"+obj.freeAmt+"' data-orgUuid='"+ obj.orgUuid +"' data-uuid='"+ obj.uuid +"' >修改额度</a></div>");
                	trData.push("<div><a href = 'javascript:void(0)' class='updateoptHis' data-orgUuid='"+ obj.orgUuid+"'>操作记录查询</a></div>");
                	
                	for(i=0; i < trData.length; i++){
                   	 	if(trData[i] == undefined){
                   		 	trData[i] = ''; 
                   	 	}
                    }

                   	$("#DOneFreeLimitGrid").DataTable().row.add(trData).draw();
                });
                $("#DOneFreeLimitGrid").DataTable().order([0, 'asc']).draw();
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
    	if(!hasPermission(PERMISSSIONCONST.TZER8601)){  
    		$("#query").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.TZER8602)){  
    		$("#exportexcel").hide();
    	}
    	
    	var url = baseURL + "/tZero/orgRule/getAllOrgUuids";
		$.ajax({
            type: "GET",
            url: url,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
          //  data: param,
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	 $.each(data, function(index, obj) {
                 	$("#DOneFreeLimitForm_orgUuid").append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
   
                 });
               	//更新内容刷新到相应的位置
                 $("#DOneFreeLimitForm_orgUuid").selectpicker('render');
                 $("#DOneFreeLimitForm_orgUuid").selectpicker('refresh');
            },
            error:function(){
            	
            }
		});
    	
    	//查询按钮
		$("#query").on('click', reloadGrid);
    
		//打开修改额度窗口
		$(document).on("click",".updateopt",function(){
			var uuid = $(this).attr("data-uuid");
			var orgUuid = $(this).attr("data-orgUuid");
			var orgNm = $(this).attr("data-orgNm");			
			var freeAmt = $(this).attr("data-freeAmt");
			
			$('#DOneOrgRuleUpdForm_uuid').val(uuid);
			$('#DOneOrgRuleUpdForm_orgUuid').val(orgUuid);
			$('#DOneOrgRuleUpdForm_orgNm').val(orgNm);
			$('#DOneOrgRuleUpdForm_freeAmt').val(freeAmt);
			
			$('#DOneOrgRuleUpdForm_newfreeAmt').val("");
			$('#DOneOrgRuleUpdForm_rmk').val("");
			$("#DoneFreeeLimitUpdWindow").modal("show");
		});
		
		//修改单笔免费额度确定按钮
		$("#DoneFreeeLimitUpdWindow_confirm_btn").on("click",function(){
			var uuid = $('#DOneOrgRuleUpdForm_uuid').val();
			var orgUuid = $('#DOneOrgRuleUpdForm_orgUuid').val();
			var freeAmt = $('#DOneOrgRuleUpdForm_freeAmt').val();
			var newFreeAmt = $('#DOneOrgRuleUpdForm_newFreeAmt').val();
			var rmk = $('#DOneOrgRuleUpdForm_rmk').val();
			
			if(""==newFreeAmt){
    			bootbox.alert( "调整后额度不能为空");
				return;    		
			}
			if(freeAmt == newFreeAmt){
				bootbox.alert( "调整前后额度一致");
				return;
			}
			if(newFreeAmt >9999999999){
				bootbox.alert( "调整额度最大值不能超过9999999999");
				return;
			}
			var regex = /^[1-9]\d*$/;
    		if(!regex.test(newFreeAmt)){
    			bootbox.alert( "调整额度仅支持输入正整数");
				return;
    		}
    		if(""==rmk){
    			bootbox.alert( "调整原因不能为空");
				return;    		
			}
			App.blockUI({target:"body",boxed:!0,message:"保存中...",zIndex:20000});
			var param ={
				"uuid"       : uuid,
				"orgUuid"    : orgUuid,
				"freeAmt"    : freeAmt,
				"newFreeAmt" : newFreeAmt,
				"rmk"        : rmk
			};
			$.ajax({
	            type: "POST",
	            url: baseURL+"/tZero/orgRule/update",
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            data: param,
	            dataType: "json",
	            success: function(data) {
	            	if(data.timeout){
	            		ajaxTimeout();
	                }
	            	if(data.success){
	            		bootbox.alert(data.msg);
	            	}else{
	            		bootbox.alert(data.msg);
	            	}
	            	$("#DoneFreeeLimitUpdWindow").modal("hide");
	            	page = 1;
	            	reloadGrid();
	            },
	            error:function(){bootbox.alert("连接超时！");}
			});   	
		});
   
    
	    //打开历史操作记录
	    $(document).on("click",".updateoptHis",function(){
	    	orgUuid = $(this).attr("data-orgUuid");
	    	reloadGrid_history();
	    });
	    	
    	//导出excel记录
    	$("#exportexcel").on("click",function(){
    		if(totalCount>0){
    			bootbox.confirm( "共"+totalCount+'条数据,确定要导出吗?',function(y){
    				if(y){
    					window.open(baseURL + "/tZero/orgRule/export")
    				}
    			});
    		}else{
    			bootbox.alert( "没有可导出的数据！");
    		}
    	});
    });
    </script>  
</body>

</html>
