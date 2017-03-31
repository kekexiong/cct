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
		                        <form action="<%=request.getContextPath()%>/HandImportSearch/index?mecType=02" class="form-horizontal" id="setWorkDayProperty_myForm">
		                            <div class="form-body">
		                                <div class="row norow">
		                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">开通时间:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange" >
		                                                    <input type="text" class="form-control col-md-3" name="wdDtOpenStart" id="wdProperty_miDtStartCombo_open">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="wdDtOpenEnd" id="wdProperty_miDtEndCombo_open">
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                
			                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">用户编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="usrId" id="wdProperty_usrId" class="form-control" placeholder="请输入用户编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">用户名称:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="cprRegNmCn" id="wdProperty_userName" class="form-control" placeholder="请输入用户名称">
		                                            </div>
		                                        </div>
		                                    </div>
	                                    
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">商户编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mno" id="wdProperty_mecNo" class="form-control" placeholder="请输入商户编号">
		                                            </div>
		                                        </div>
		                                    </div>
			                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">非工作日结算状态:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                 <select name="wdcFlg" id="wdProperty_wdcFlg" class="bs-select form-control" data-show-subtext="true">
		                                                	<option value="">全部</option>
		                                                	<option value="1">正常</option>
			                                                <option value="0">暂停</option>
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
		                                                <button type="button" id="reset_btn" class="btn btn-info"><i class="fa fa-refresh"></i> 重置</button> 
		                                            	<button type="button" id="exportInfoList_btn" class="btn btn btn-primary"> <i class="fa fa-share"></i> 导出EXCEL</button>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">D+1商户业务状态列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="setWorkDayPropertyGridPanel">
		                            <thead>
		                                <tr>
		                                    <th>
		                                        <input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                    <th> 序号 </th>
		                                    <th> 用户编号 </th>
		                                    <th> 用户名称 </th>
		                                    <th> 商户编号 </th>
		                                    <th> 非工作日结算状态 </th>
		                                    <th> 操作员 </th>
		                                    <th> 备注</th>
		                                    <th> 开通时间</th>
		                                    <th> 开通渠道</th>
		                                    <th> 归属分公司</th>
		                                    <th> 归属机构</th>
		                                    <th> 操作流水</th>
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
	<div class="modal fade" id="importFile_Win" tabindex="-1" role="dialog" data-backdrop="static" data-width="20%"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	       <div class="modal-header">
	          <button type="button" class="close" 
	             data-dismiss="modal" aria-hidden="true">
	                &times;
	          </button>
	          <h4 class="modal-title" id="">手工导入D+1商户</h4>
	       </div>
	       <div class="modal-body" style="height:200px; text-align:center;">
	       		<div class="col-lg-12 col-md-10 col-sm-10 col-xs-16">
                    <div class="form-group">
                        <label for="span-medium-1" class="control-label col-md-4 text-right">推送类型:</label>
                        <div class="col-md-6 paddingnone">
                             <select name="pushType" id="HandImportSearchPanel_pushType" class="bs-select form-control" data-show-subtext="true">
                            	<option value="01">POS</option>
                             	<option value="02">SMS</option>
                            </select>
                        </div>
                    </div>
                </div>
	       		<div class="clearfix"></div>
	               <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
	           	<div class="row fileupload-buttonbar" style="margin-left:15%; margin-top:20px;">
					<span class="btn green fileinput-button" style="float:left;">
		                         <i class="fa fa-plus"></i>
		                        <span> 添加 </span>
		                        <input id="file" type="file" name="file" accept=".xlsx"  multiple  /> </span>    
		                        <input style="float:left; width:50%"  name="fileattr" id="fileattr" readonly
									class="form-control" placeholder="请选择文件">
		        </div>
	            <br/> 
	            <div class="row">
	               <div class="col-md-12"  style="text-align:center;">
	                   <div class="row">
	                       <div style="margin-left:4%;" class=" col-md-11">
	                       	  <button type="button"  id="confirmUpload" class="btn btn-success"> <i class="fa fa-sign-out"></i> 确认</button>
	                           <button type="button" onclick="javascript:$('#importFile_Win').modal('hide');" id="" class="btn red"> <i class="fa fa-share"></i> 关闭</button>
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
    	$("#setWorkDayPropertyGridPanel tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
    function notWeekdsOperateHis(mno){
    	$.fancybox({afterLoad:fancyboxCenterOnViewport,
    		href:"NotWeekdsOperateHis.jsp?mno="+mno,
    		type: 'iframe',
    		padding: 5,
    		margin:60,
    		scrolling: 'no',
    		fitToView: true,
    		width: 750,
    		height: 300,
    		autoSize: false,
    		closeClick: false,
    		afterClose:function(){}
    	});
    }
    
	//封装查询参数
	function packageArg(){
		var param = {};
		var wdDtStartOpen = $('#wdProperty_miDtStartCombo_open').val().replace('/', '').replace('/', '');
		var wdDtEndOpen   = $('#wdProperty_miDtEndCombo_open').val().replace('/', '').replace('/', '');
		var usrId = $('#wdProperty_usrId').val();
		var cprRegNmCn = $('#wdProperty_userName').val();
		var mno = $('#wdProperty_mecNo').val();
		var wdcFlg = $('#wdProperty_wdcFlg').val();
		
		param.wdDtStartOpen=wdDtStartOpen;
		param.wdDtEndOpen=wdDtEndOpen;
		param.usrId=usrId;
		param.cprRegNmCn=cprRegNmCn;
		param.mno=mno;
		param.wdcFlg=wdcFlg;  
		
		return param;
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
			
    	var query_Path = baseURL + "/ses/spc/getWorkDayPropertyList";
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
    			 $("#setWorkDayPropertyGridPanel").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	
                	var trData = [];
                	trData.push("<input type=\"checkbox\" data-chkBatNo='"+ obj.chkBatNo +"' class=\"checkboxes\" rownum=\""+index+"\" />");
                	trData.push(start + index + 1);
                	
                	trData.push(obj.usrId);
                	trData.push(obj.cprRegNmCn);
                	trData.push(obj.mno);
                	if(obj.wdcFlg=="1"){
                		trData.push("正常");
                	}else{
                		trData.push("<font color='red'>暂停</font>");
                	}
                	
                	trData.push(obj.cteStffNo);
                	trData.push(obj.rmk);
                	trData.push(obj.openDttm);
                	trData.push(obj.openSysId);
                	trData.push(obj.orgBranch);
                	trData.push(obj.orgNm);
                	
                	if(hasPermission(PERMISSSIONCONST.TZERO905)){
                		trData.push('<span class="notWeekdsOperateHis" data-mno="'+ obj.mno +'" style="text-decoration:underline;cursor:pointer;color:blue">查看</span>');
                	}
                	
                	for(i=0; i < trData.length; i++){
                   	 if(trData[i] == undefined){
                   		 trData[i] = ''; 
                   	 }
                    }

                   	 $("#setWorkDayPropertyGridPanel").DataTable().row.add(trData).draw();
                   	
                   	
                   });
                   $("#setWorkDayPropertyGridPanel").DataTable().order([1, 'asc']).draw();

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
    	
    	if (!hasPermission(PERMISSSIONCONST.TZERO901)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO904)) {$("#exportInfoList_btn").hide();}
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
        //重置按钮
        $("#reset_btn").on("click",function(){
        	$('#wdProperty_miDtStartCombo_open').val("");
    		$('#wdProperty_miDtEndCombo_open').val("");
    		$('#wdProperty_usrId').val("");
    		$('#wdProperty_userName').val("");
    		$('#wdProperty_mecNo').val("");
    		$('#wdProperty_wdcFlg').selectpicker("val","");
    		
        });
		
		$(document).on("click",".notWeekdsOperateHis",function(){
			var mno =$(this).attr("data-mno");
			notWeekdsOperateHis(mno);
		});
        
		//导出按钮
		$("#exportInfoList_btn").on('click', function() {
			if(tableData != null && tableData.items.length>0){
				bootbox.confirm("确定要导出所查询到的数据吗?",function(y){
					if(y){
						window.open( baseURL + "/ses/spc/epexcelWorkDayPty");
					}
				});
			}else{
				bootbox.alert("没有查询到可导出数据！");
			}
		});
    });
    </script>  
</body>

</html>
