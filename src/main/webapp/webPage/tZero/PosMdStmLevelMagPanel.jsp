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
		                    	<form action="<%=request.getContextPath()%>/mec/queryData" class="form-horizontal" id="queryMecStmLevel_Form">
		                            <div class="form-body">
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">结算人姓名:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="actNm" id="actNm" class="form-control" placeholder="请输入结算人姓名">
		                                            </div>
		                                        </div> 
		                                    </div>
		                                   
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">结算人身份证号:</label>
		                                            <div class="col-md-8 paddingnone"> 
		                                            	<input name="idCardNo" id="idCardNo" class="form-control" placeholder="请输入结算人身份证号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">商户编号:</label>
		                                            <div class="col-md-8 paddingnone"> 
		                                            	<input name="mno" id="mno" class="form-control" placeholder="请输入商户编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">结算人等级:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="stmLevelVl" id="stmLevelVl" class="bs-select form-control" data-show-subtext="true">
				            								<option value="">全部</option>	
							            					<option value="1">1</option>	
							            					<option value="2">2</option>
							            					<option value="3">3</option>
							            					<option value="4">4</option>
							            					<option value="5">5</option>
							            					<option value="6">6</option>
							            					<option value="7">7</option>
							            					<option value="8">8</option>
							            					<option value="9">9</option>
							            					<option value="10">10</option>
		                                                </select>
		                                            </div> 
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="clearfix"></div>
		                                    
		                                    <div class="form-actions">
		                                <div class="row">
		                                    <div class="col-md-12">
		                                        <div class="row">
		                                            <div class="col-md-offset-1 col-md-11">
		                                             	<button type="button" id="query_btn" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
		                                             	 <button type="button" id="update_btn" class="btn red"> <i class="fa fa-edit"></i> 修改</button>
		                                            	 <button type="button" id="down_btn" class="btn btn-success"><i class="fa fa-download"></i>导出excel</button>
		                                            	 <button type="button" id="insert_btn" class="btn btn-success"><i class="fa fa-refresh"></i>初始化数据</button>	
		                                            </div>
		                                        </div>
		                         	</form>
		                                    </div> 
		                                </div>
		                            </div>
		                           </div>
		                         </div>
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
		                        <table  class="table table-striped table-bordered table-hover table-checkable order-column" id="queryMecStmLevelGrid">
		                            <thead>
		                                <tr>
		                                	<th>
		                                    	<input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                	<th class="nowrap">序号</th>
		                                    <th class="nowrap">结算人姓名</th>
		                                    <th class="nowrap">结算人身份证号 </th>
		                                    <th class="nowrap">结算人等级</th>
		                                    <th class="nowrap"> 名下商户详情 </th>
		                                    <th class="nowrap"> 操作 </th>
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
		
		<!-- 修改结算人等级Model -->
		<div class="modal fade" id="updateStmLevelWin" tabindex="-1" role="dialog" data-backdrop="static"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="">修改结算人等级</h4>
					</div>
					<div class="modal-body">
						<div class="portlet-body form">
							<form action="<%=request.getContextPath()%>/"
								class="form-horizontal" id="updateStmLevelForm">
								<div class="form-body">
									<div class="row norow">
										<input type="hidden" id="ul_mno" />
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
												<label class="control-label col-md-2 text-right">当前等级:</label>
												<div class="col-md-8 paddingnone">
													<input id="stmLevelBf" class="bs-select form-control"
														disabled="disabled" data-show-subtext="true" />
												</div>
											</div>
										</div>
	
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
												<label class="control-label col-md-2 text-right">变更等级:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="stmLevelAf" id="stmLevelAf" class="bs-select form-control" data-show-subtext="true">
							            					<option value="1">1</option>	
							            					<option value="2">2</option>
							            					<option value="3">3</option>
							            					<option value="4">4</option>
							            					<option value="5">5</option>
							            					<option value="6">6</option>
							            					<option value="7">7</option>
							            					<option value="8">8</option>
							            					<option value="9">9</option>
							            					<option value="10">10</option>
		                                                </select>
		                                            </div> 
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
												<label class="control-label col-md-2 text-right"></label>
											</div>
										</div>
	
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="form-group">
												<label class="control-label col-md-2 text-right">操作备注:</label>
												<div class="col-md-8 paddingnone">
													<textarea name="upd_rmk" data-provide="markdown" id="upd_rmk"
														rows="10" data-width="250" class="form-control"></textarea>
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
												<div class="col-md-offset-1 col-md-11">
													<button type="button" id="update_save_btn"
														class="btn btn-success">
														<i class="fa fa-save"></i> 确认
													</button>
													<button type="button" id="update_cancel_btn"
														class="btn red">
														<i class="fa fa-share"></i>关闭
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
    	$("#queryMecStmLevelGrid tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
  	
    //查询数据
    function reloadGrid() {
    	if(!$('#queryMecStmLevel_Form').valid()){ 
    		bootbox.alert("查询条件不正确");
            return ; 
        }
    	$('#queryMecStmLevelGrid > tbody').empty();
		var url=baseURL+"/tZero/posMdStmLevel/query";
		
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
		
		param.mno=$('#mno').val()
		param.actNm=$('#actNm').val()
		param.idCardNo=$('#idCardNo').val()
		param.stmLevelVl=$('#stmLevelVl').val()
		
		var reg = /^(\d|[a-zA-Z])+$/;
        // 如果验证失败给出警告
        if($('#idCardNo').val()!="" && !reg.test($('#idCardNo').val())){
        	bootbox.alert("身份证号只能输入数字、字母");
            return ;
        }
		
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
    			$("#queryMecStmLevelGrid").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {  
                	var trData = [];
                	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                	trData.push(start + index + 1);
                	
                	trData.push(obj.actNm);
                	trData.push(obj.idCardNo);
                	trData.push(obj.stmLevelVl);
                	var mecDetail = oprateDetail(obj); //商户详情
					trData.push(mecDetail);
					var oprate = oprateRecord(obj); //操作记录
					trData.push(oprate);
                	
                	for(i=0; i < trData.length; i++){
                   	 if(trData[i] == undefined){
                   		 trData[i] = ''; 
                   	 }
                    }

                   	 $("#queryMecStmLevelGrid").DataTable().row.add(trData).draw();
                   	
                   	
                   });
                   $("#queryMecStmLevelGrid").DataTable().order([0, 'asc']).draw();
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
    
    $('#queryMecStmLevel_Form').validate({
        rules: {
        	idCardNo: {
                rangelength:[18,18]
        	},
          	mno: {
                digits: true,
                rangelength:[15,15]
            }
        },
        messages: {
        	idCardNo: {
                rangelength: '结算人身份证号为18位数字及字母'
           	},
           	mno: {
                digits: '只能为数字',
                rangelength: '商编为15位数字'
           	}
        }
    });
    
    $(function(){
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.POSMD036)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.POSMD037)) {$("#update_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.POSMD040)) {$("#down_btn").hide();}
    	$("#update_btn").hide();
    	$("#insert_btn").hide();
    	
    	//添加/修改表单的校验
		$('#updateStmLevelForm').validate({
			errorElement:"span",
			errorClass:"help-block help-block-error",
			focusInvalid:!1,
			ignore:"",
			highlight:function(e){
				$(e).closest(".form-group").addClass("has-error")
			},
			success:function(e){
				$(e).closest(".form-group").removeClass("has-error");
				$(e).remove();
			},
			rules: {
				stmLevelAf:{
					required:true
				},
				upd_rmk:{
					maxlength:60
				}
	        },
	        messages: {
	        	stmLevelAf:{
					required:'不能为空'
				},
				upd_rmk:{
		        	maxlength:'最大输入60位'
				}
	        }
	    });
    	
    	//导出excel
    	$("#down_btn").bind("click",function(){
    		var count = $("#itemCount").text();
    		if(count==0){
    			bootbox.alert("请先查询数据，再导出");
    			return;
    		}
			bootbox.confirm('共'+count+'条记录，确定要导出excel?',function(btn){
				if(btn){
					var url = baseURL+"/tZero/posMdStmLevel/export";
					window.location.href =url; 
				}
			})
			
    	});
    	
    	//初始化
    	$("#insert_btn").bind("click",function(){
			bootbox.confirm('初始化秒到结算人等级信息，请确认',function(btn){
				if(btn){
					var url = baseURL+"/tZero/posMdStmLevel/insert";
					window.location.href =url; 
				}
			})
			
    	});

		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
   	});
    
    
  //名下商户详情
	oprateDetail = function(obj) {
		var relVal = '';
		if(hasPermission(PERMISSSIONCONST.POSMD041)){
			var uuid = obj.uuid;
			var str;
			str = "<a href='javascript:void(0);' onclick=PosMdStmMecDetail('"
					+ uuid + "')>商户详情</a>	"
			relVal = str;
		}
		
		return relVal;
	}
  
	//操作记录
	oprateRecord = function(obj) {
		var relVal = '';
		if(hasPermission(PERMISSSIONCONST.POSMD042)){
			var uuid = obj.uuid;
			var stmLevelVl = obj.stmLevelVl;
			var actNm = obj.actNm;
			var idCardNo = obj.idCardNo;
			var str = "";
			str += "<a href='javascript:void(0);' onclick=updatePosMdStmLevel('"
				+ actNm + "','"+ idCardNo +"','"+ stmLevelVl +"')>修改</a>	"
			str += "<a href='javascript:void(0);' onclick=PosMdStmLevelOptHis('"
					+ uuid + "')>操作记录查询</a>	"
			relVal = str;
		}
		return relVal;
	}

    
	//结算人名下商户详情
	function PosMdStmMecDetail(uuid) {
		var url = baseURL + '/tZero/posMdStmLevel/detail?uuid=' + uuid;
		var param = {
			page : 1,
			start : 0,
			limit : 20
		};
		$.ajax({
			type : "POST",
			url : url,
			data : param,
			dataType : "json",
			success : function(data) {
				if (data.timeout) {
					ajaxTimeout();
				}
				if (data.totalCount == 0) {
					bootbox.alert("没有操作数据");
					return;
				} else {
					$.fancybox({afterLoad:fancyboxCenterOnViewport,
						href : 'PosMdStmMecDetail.jsp?uuid='
								+ uuid,
						type : 'iframe',
						padding : 5,
						margin : 60,
						scrolling : 'no',
						fitToView : true,
						width : 1200,
						height : 490,
						autoSize : false,
						closeClick : false,
						afterClose : function() {
							/* reloadGrid(); */
						}
					});
				}
			}
		});
	
	}
	
	//修改结算人等级信息
	function updatePosMdStmLevel(actNm,idCardNo,stmLevelVl) {
		
		$("#updateStmLevelForm")[0].reset();
		$("#updateStmLevelForm .bs-select").selectpicker('val','');
		$("#updateStmLevelForm .form-group").removeClass("has-error");
		$("#updateStmLevelForm .help-block-error").remove();
		$("#stmLevelBf").val(stmLevelVl);
		$("#updateStmLevelWin").modal('show');
    	//弹出窗口取消按钮
		$("#update_cancel_btn").off('click').on('click', function() { 
			$("#updateStmLevelWin").modal('hide');
			$("#updateStmLevelForm")[0].reset();
			$("#updateStmLevelForm .bs-select").selectpicker('val','');
    	});

    	//保存
		$("#update_save_btn").off('click').on('click', function() { 
			if(!$("#updateStmLevelForm").valid()){ 
				 bootbox.alert("输入项数据不正确，验证未通过！");
				 return;
			}
			var stmLevelBf =  $("#stmLevelBf").val();
			var stmLevelVl  = $("#stmLevelAf").val();
			var rmk = $("#upd_rmk").val();
			if(stmLevelBf == stmLevelVl){
				bootbox.alert("结算人等级未作变动"); 
				return;
			}
			bootbox.confirm("确认要提交吗？", function(flg){
				if(flg){
					$("#updateStmLevelWin").modal('hide');
		    		App.blockUI({target:"body",boxed:!0,message:"正在处理中，请稍等...",zIndex:20000});
		    		$.ajax({
	    	            type: "POST",
	    	            url: baseURL + "/tZero/posMdStmLevel/update",
	    	            data:{
	    	            	actNm : actNm,
	    	            	idCardNo : idCardNo,
	    	            	stmLevelBf : stmLevelBf,
	    	            	stmLevelVl : stmLevelVl,
	    	            	rmk : rmk
    					},
    					contentType: "application/x-www-form-urlencoded;charset=utf-8",
	    	            dataType: "json",
	    	            success: function(data) {
	    	            	if(data.timeout){
			            		ajaxTimeout();
			                }
	    	            	
	    	            	if (data.success) {
	    	            		reloadGrid();
	    						bootbox.alert(data.msg);
	    						$("#updateStmLevelForm")[0].reset();
	    					}else{
	    						bootbox.alert("错误信息: "+data.msg); 
	    					}
	    	            },
	    	            error: function(error) {
	    	            	bootbox.alert("修改失败");
	    	            }
		    		});
				}
			});
		});
	}
	
	//结算人等级变更操作记录
	function PosMdStmLevelOptHis(uuid) {
		var url = baseURL + '/tZero/posMdStmLevel/log?uuid=' + uuid;
		var param = {
			page : 1,
			start : 0,
			limit : 20
		};
		$.ajax({
			type : "POST",
			url : url,
			data : param,
			dataType : "json",
			success : function(data) {
				if (data.timeout) {
					ajaxTimeout();
				}
				if (data.totalCount == 0) {
					bootbox.alert("没有操作数据");
					return;
				} else {
					$.fancybox({afterLoad:fancyboxCenterOnViewport,
						href : 'PosMdStmLevelOptHis.jsp?uuid='
								+ uuid,
						type : 'iframe',
						padding : 5,
						margin : 60,
						scrolling : 'no',
						fitToView : true,
						width : 1200,
						height : 490,
						autoSize : false,
						closeClick : false,
						afterClose : function() {
							/* reloadGrid(); */
						}
					});
				}
			}
		});

	}

    </script>
    
</body>

</html>
