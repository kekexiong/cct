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
	                                            <label class="control-label col-md-4 text-right">随意通状态:</label>
	                                            <div class="col-md-8 paddingnone">
	                                                <select name="stlSts" id="stlSts" class="bs-select form-control" >
	                                                	<option value="">全部</option>
	                                                	<option value="01">开通</option> 
	                                                	<option value="02">暂停</option>
	                                                </select>
	                                            </div>
	                                        </div>
	                                 </div>
	                                    
	                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">所属机构:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="borgName" id="queryInnerPanel_borgName"  data-live-search="true" class="selectpicker bs-select form-control" data-show-subtext="true">
		                                                </select>
		                                            <!--  需要弹出窗口，进行选择-->
		                                            </div>
		                                        </div>
		                                    </div>
	                                    
	                                    
	                                  <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
	                                        <div class="form-group">
	                                            <label class="control-label col-md-4 text-right">所属分公司:</label>
	                                            <div class="col-md-8 paddingnone">
	                                                <select name="companyNo" id="companyNo" class="bs-select form-control" >
	                                                </select>
	                                            </div>
	                                        </div>
	                                    </div>        
	                                 </div>
		                                    </form>
		                                    
		                                    
		                                    <div class="clearfix"></div>
		                                    
		                                    <div class="form-actions">
		                                <div class="row">
		                                    <div class="col-md-12">
		                                        <div class="row">
		                                            <div class="col-md-offset-1 col-md-11">
		                                                <button type="button" id="query_btn" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
		                                                <button type="button" id="reset_btn" class="btn red"> <i class="fa fa-refresh"></i> 重置</button>
		                                                <button type="button" id="downLoadExcel_btn" class="btn btn-success"> <i class="fa fa-download"></i> 下载导入模板</button>
		                                            	<button type="button" id="exportexcel_btn" class="btn btn btn-primary"> <i class="fa fa-sign-out"></i> 批量修改随意通工作日费率</button>
		                                            	<button type="button" id="exportexcel_btn2" class="btn btn btn-primary"> <i class="fa fa-sign-out"></i>批量修改随意通非工作日费率</button>
		                                            </div>
		                                        </div>
		                                    </div> 
		                                </div>
		                            </div>
		                                </div>
		                            </div>
		                   
		                   </form>
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
		                        <table  class="table table-striped table-bordered table-hover table-checkable order-column" id="queryMecGrid">
		                            <thead>
		                                <tr>
		                                 	<th>
		                                    </th>
		                                    <th class="nowrap"> 序号</th>
		                                    <th class="nowrap"> 商户编号 </th>
		                                    <th class="nowrap"> 商户名称 </th>
		                                    <th class="nowrap"> 所属机构 </th>
		                                    <th class="nowrap"> 所属分公司 </th>
		                                    <th class="nowrap"> 工作日费率</th>
		                                    <th class="nowrap"> 非工作日费率</th>
		                                    <th class="nowrap"> 随意通状态</th>
		                                    <th class="nowrap"> 操作</th>
		                                    <th class="nowrap"> 操作记录</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            </tbody>
		                        </table>
		                    </div>
		                    <!-- 分页开始 -->
		                    <div class="row no-margin" id="pagination-bar" style="margin-left:15px">
								<div class="col-sm-4 left no-padding" >
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

								<div class="col-sm-6 pull-right no-padding" >
	
	
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

 <!-- Excel的模态框（Modal） -->
	<div class="modal fade" id="exportExcelWin" tabindex="-1" data-backdrop="static" data-width="600px">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">批量修改</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="exportform">
                           <div class="form-body">
                               <div class="row norow">
                                   <div class="col-lg-12 col-md-12 col-sm-8 col-xs-12">
                                       <div class="form-group">
                                           <label class="control-label col-md-0 text-right"></label>
                                           <div class="col-md-6 paddingnone">
                                               <div class="input-group">
                                                   <input type="file" class="form-control col-md-4" name="file" id="file">
                                                   <span id="error"  style="font-color:red"></span>
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
                                               <button type="button" id="exportform_save_btn" class="btn btn-success"><i class="fa fa-save"></i>上传</button>
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
   
 <!-- 修改modal -->  
	<div class="modal fade" id="changestsWin" tabindex="-1" data-backdrop="static" data-width="600px">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="excelTitle">修改随意通结算费率</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="changestsform">
                           <div class="form-body">
                               <div class="row norow">
                               <input type="hidden" id="_inMno"/>
                                  
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label for="span-medium-2" class="control-label col-md-4 text-right">商户编码:</label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="_mno" id="_mno" readonly class="form-control" placeholder="">
	                                           </div>
                                        </div>
                                    </div>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                             <label for="span-medium-2" class="control-label col-md-4 text-right">商户名称:</label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="_regNm" id="_regNm" readonly class="form-control" placeholder="">
	                                           </div>
                                        </div>
                                    </div>
                                    
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                           <label for="span-medium-2" class="control-label col-md-4 text-right">当前工作日费率(%):</label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="_workRate" id="_workRate" readonly class="form-control" placeholder="">
	                                           </div>
                                        </div>
                                    </div>
                                       <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label for="span-medium-2" class="control-label col-md-4 text-right">新工作日费率(%):</label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="_workRateNew" type="number" id="_workRateNew" min="0.01" max="0.5" step="0.49"  class="form-control" placeholder="填写新费率">
	                                           </div> 
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label for="span-medium-2" class="control-label col-md-4 text-right">当前非工作日费率(%):</label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input name="_nworkRate" id="_nworkRate" readonly="readonly" class="form-control">
	                                           </div> 
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label for="span-medium-2" class="control-label col-md-4 text-right">新非工作日费率(%):</label>
	                                           <div class="col-md-6 paddingnone">
	                                               <input type="number" name="_nworkRateNew" id="_nworkRateNew" min="0.01" max="0.5" step="0.49" class="form-control"  placeholder="填写新费率">
	                                           </div> 
                                        </div>
                                    </div>
                                             
                                   
                                   <div class="clearfix"></div>
                               </div>
                           </div>
                           <div class="form-actions" style="text-align:center;">
                               <div class="row">
                                   <div class="col-md-12">
                                       <div class="row">
                                           <div class="col-md-offset-1 col-md-11">
                                               <button type="button" id="changests_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 确认</button>
                                               <button type="button" id="changests_cancle_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
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
    	
    	 if(!$('#queryMecPanel_Form').valid()){  
             bootbox.alert("查询条件不正确");
              return;  
          }  
    	
		var url=baseURL+"/tZero/rate/query";
		
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
		param.orgNo  = $('#queryInnerPanel_borgName').val();//合作商编号
		param.stlSts  = $('#stlSts').val();//合作商编号
		param.mno  = $('#mno').val();//合作商编号
		param.companyNo  = $('#companyNo').val();//合作商编号
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
            	
            	toalPage=Math.ceil(data.totalCount/limit);
    			$("#itemCount").text(data.totalCount);
    			$("#nowpage").text(page);
    			$("#toalPage").text(toalPage);
    			if (!data.totalCount || data.totalCount == 0) {
    				bootbox.alert("没有符合的查询结果");
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
                $.each(data.items, function(index, obj) {  
                	var trData = [];
                	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                	trData.push(start + index + 1);
                	
                	trData.push(obj.mno);
                	trData.push(obj.regNm);
                	trData.push(obj.orgNm);
                	trData.push(obj.branchNm);
                	trData.push(obj.workRate + '%');
                	trData.push(obj.nworkRate + '%');
                	
                	trData.push(formartSts(obj.sltSts));
                	
                	var updateStr="";
                	
                	if (hasPermission(PERMISSSIONCONST.TZERO1105)) {
                		updateStr='<a class="esignaure_query" rownum='+index+'   name="changests" style="text-decoration:underline;cursor:pointer;color:blue">修改</a>';
                	}
                	var logStr="";
                	
                	if (hasPermission(PERMISSSIONCONST.TZERO1106)) {
                		logStr='<input type="button"  mno='+obj.mno+' onclick="showLog('+obj.mno+')"    value="查看日志"/>';
                	}
                	
                	trData.push(updateStr);
                	trData.push(logStr);
                	 
                	
                	
                	   for(i=0; i < trData.length; i++){
                      	 if(trData[i] == undefined){
                      		 trData[i] = ''; 
                      	 }
                       }

                      	 $("#queryMecGrid").DataTable().row.add(trData).draw();
                      	
                      	 
                      });
              //绑定 修改事件
            			$("a[name='changests']").bind("click", changests);  
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
    

    $(function(){
    	
    	
    	
    	
    	
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.TZERO1101)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO1102)) {$("#downLoadExcel_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO1103)) {$("#exportexcel_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZERO1104)) {$("#exportexcel_btn2").hide();}
    	
    	/* ****************** */
    	sbjStore('queryInnerPanel_borgName', true);
		sbjStore('ticket_borg', false);
    	
    	
    	
    	//重置按钮
		$("#reset_btn").on('click', function() {
			$("#queryMecPanel_Form")[0].reset();
			$("#queryMecPanel_Form .bs-select").selectpicker('val','');//重置select元素
			/* $("#batchMnos_Form .bs-select").selectpicker('val','');
			$("#cfmFlg option:second").prop("selected", 'selected');
			$("#dropdown option:second").prop("selected", 'selected');*/ 
	    	
		});
    	//加载数据
    	/* reloadGrid(); */
    	//查询所属机构
    	/* queryTopOrg(); */
    	//查询所属分公司
    	queryOrgNmComboList();
    	
    	  //控制 复选框只能选中一个
  		 $('input[type=checkbox]').bind('click', function(){
  		 	$('input[type=checkbox]').not(this).attr("checked", false);
  		 }); 
    	
    	
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
		$("#downLoadExcel_btn").on('click',function(){
			window.location.href = baseURL+'/tZero/rate/downloadTemplate';		
		})
		
		
		// 批量修改随意通工作日费率
		 $("#exportexcel_btn").on('click', function() {
			 
			 $("#file").val("");
			 var optType = '04';
			
			$("#exportExcelWin").modal('show');
			
			batchOpt('04');
			$("#exportform_cancel_btn").off('click').on('click', function() {
				$("#exportExcelWin").modal('hide');
			});
			
		}); 
		
		
		// 批量修改随意通非工作日费率
		 $("#exportexcel_btn2").on('click', function() {
			 var optType = '05';
			 $("#file").val("");
			$("#exportExcelWin").modal('show');
			
			batchOpt('05');
			$("#exportform_cancel_btn").off('click').on('click', function() {
				$("#exportExcelWin").modal('hide');
			});
			
		}); 
		
		$("#changests_cancle_btn").bind("click",function(){
			$("#changestsWin").modal("hide");
		});
		
		$("#changests_save_btn").bind("click",function(){
			updateStatus();
		});
		
		
		
		
		
		 $('#queryMecPanel_Form').validate({
				//  errorElement:"span", errorClass:"help-block help-block-error",
				 
		          rules: {
		        	  mno: {
		              digits: true,
		            //fliterBlank: true,
		              rangelength:[15,15]
		            }
		            
		          },
		          messages: {
		        	  mno: {
		              digits: '只能为数字',
		              rangelength: '商编只能是15位数字'
		            }
		          }
		      });
		
   	});
  
    
    //跳转修改修改页面
    function changests(){
    	
    	var index = $(this).attr("rownum"); 
    	var obj = tableData.items[index];  
    	
    	var mno = obj.mno;
    	var regNm = obj.regNm;
    	var workRate = obj.workRate;
    	var nworkRate = obj.nworkRate;
    	var regNm = obj.regNm;
    	var inMno = obj.inMno; 
    	
    	$("#_mno").val(mno);
    	$("#_regNm").val(regNm);
    	$("#_workRate").val(workRate);
    	$("#_nworkRate").val(nworkRate);
    	$("#_inMno").val(inMno);
    	
    	$("#_workRateNew").val('');
    	$("#_nworkRateNew").val('');
    	$("#changestsWin").modal("show");
    } 
    
    //跳转到查看日志页面
    function showLog(mno){
    	var flag=false;
    	var url=baseURL+"/tZero/rate/queryOptLog/"+mno;
    	var param = {page:page,start:start,limit:limit};
    	$.ajax({
            type: "GET",  
            url: url,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: param,
            async : false,
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	if(data.success&&data.totalCount>0){
            		flag=true;
            	}else{ 
            		flag=false;
            	}
            	
            }
            
    	});
    	
    	if(flag){
    		 $.fancybox({afterLoad:fancyboxCenterOnViewport,
 	     		href:'OrgTZeroRateShowLog.jsp?mno='+mno,    
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
    	}else{
    		bootbox.alert("没有查到该商户修改结算费率的记录")
    	}
    	
    	
    	
    }
//跳转excel导入出错页面    
function showExcelImportErrorPanel(data){
	$("#data").val(data);
	 $.fancybox({afterLoad:fancyboxCenterOnViewport,
  		href:'OrgTZeroRateExcelErrorPanel.jsp',    
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
    
    
    
    

  	 //  查询所属机构
    function queryTopOrg(){
    	var url = baseURL+"/tZero/acRate/queryTopOrg";
    	
    	$.ajax({ 
           type: "GET", 
           url: url, 
           success: function(data){ 
        	   var data = $.parseJSON(data); 
        	  $("#orgNo").append("<option value=''>全部</option>");
        	     for (var i = 0; i < data.length; i++) {
           	      $("#orgNo").append("<option value='" + data[i].ORGNO + "'>"   + data[i].ORGNM   + "</option>"); 
           	     }
        	     //更新内容刷新到相应的位置
                 $("#orgNo").selectpicker('render');
                 $("#orgNo").selectpicker('refresh');
            } 

    });
  	 }

   	  //  查询所属分公司
     function queryOrgNmComboList(){
     	var url = baseURL+"/tZero/org/queryOrgNmComboList";
     	
     	$.ajax({ 
            type: "GET", 
            url: url, 
            success: function(data){ 
         	   var data = $.parseJSON(data); 
         	  $("#companyNo").append("<option value=''>全部</option>");
         	
         	     for (var i = 0; i < data.length; i++) {
            	      $("#companyNo").append("<option value='" + data[i].cdVl + "'>"   + data[i].cdNm   + "</option>"); 
            	     }
         	    //更新内容刷新到相应的位置
                 $("#companyNo").selectpicker('render');
                 $("#companyNo").selectpicker('refresh');
             } 

     });
   	  }
function formartSts(value){ 
	if(value == '00'){
		return "关闭";
	}else if(value == '01'){
		return "开通";
	}else if(value == '02'){
		return "暂停";
	}else{
		return "";
	}
	
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
		
		

    	bootbox.confirm("确认导入Excel文件吗?",function(btn){
    		if(btn){
    			  var fileObj = document.getElementById("file").files[0]; // 获取文件对象
    			  var form = new FormData();
    			   // FormData 对象
    			  form.append("file", fileObj); // 文件对象

    			
    	       App.blockUI({target:"body",boxed:!0,message:CONST.TIP016,zIndex:20000});
    	       $.ajax({
    	           url:baseURL + "/tZero/rate/batchOpt?optType="+optType, 
    	           type:"post",
    	           data:form,
    	           processData:false,
    	           contentType:false,
    	           success:function(result){
    	        		   $("#importExcelWin").modal('hide');
    	        		   result = jQuery.parseJSON(result);
    	        	   if(!result.success){
    	            		bootbox.alert("数据导入失败"+ result.msg + " 请检查数据后重试!");
    	            		
    	            		if(result.errors != "" && result.errors != null){
    	            			openErrorWindow(result.errors);
    	            		}
    	            		
    	            	}else{ 
    	            		var failCount = result.failCount;
    	            		if(failCount==0){
    	            		bootbox.alert('本次批量导入调整商户随意通结算费率共成功'+result.successCount+'条,失败'+result.failCount+'条');
    	            		$("#file").val('');
    	            		$("#exportExcelWin").modal('hide');
    	            		//将返回的数据绑定到列表中
    	                    	reloadGrid(); 
    	            		}else{
    	            			$("#file").val('');
    	                		$("#exportExcelWin").modal('hide');
    	            			showExcelImportErrorPanel(JSON.stringify(result));
    	            			
    	            		}
    	            		
    	            		
    	                       	   
    	           
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
	
//修改状态
function updateStatus(){
		
		var mno =$("#_mno").val();
		var regNm =$("#_regNm").val();
		var workRate =$("#_workRate").val();
		var nworkRate =$("#_nworkRate").val();
		var regNm =$("#_regNm").val();
		var inMno =$("#_inMno").val();
		var workRateNew = $("#_workRateNew").val();
		var nworkRateNew = $("#_nworkRateNew").val();
		
		if(workRateNew==''||isNaN(workRateNew)){
			bootbox.alert("请输入正确的新工作日费率!");
			return;
		}else{
			workRateNew = parseFloat(workRateNew);
		}
		
		
		if(!(0.01<=workRateNew&&workRateNew<=0.5)){
			bootbox.alert("只能输入0.01~0.5");
			return
		}
		
		
		if(nworkRateNew==''||isNaN(nworkRateNew)){
			bootbox.alert("请输入正确的新非工作日费率!");
			return;
		}else{
			nworkRateNew = parseFloat(nworkRateNew);
		}
		
		if(!(0.01<=nworkRateNew&&nworkRateNew<=0.5)){
			bootbox.alert("只能输入0.01~0.5");
			return
		}
		
		
		var data = {};
		data.mno =mno;
		data.workRate =workRate;
		data.workRateNew =workRateNew;
		data.nworkRate =nworkRate;
		data.nworkRateNew =nworkRateNew;
		data.regNm =regNm;
		data.inMno =inMno;
		
		
		
		
	
	var url = baseURL+"/tZero/rate/editRate"
	
	App.blockUI({target:"body",boxed:!0,message:CONST.TIP016,zIndex:20000});
	
	 $.ajax({
	    type: "POST",
	    url: url,
	    data :data,
	    dataType: "json",
	    success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
	    	if (data && data.success == true) { 
	    		bootbox.alert("修改成功!")
	    		//关闭弹窗
	    		reloadGrid();
	    		$("#changestsWin").modal("hide");
			}
	    },
	    error: function(error) {
	    }
	});		

}	


//拉取会计科目数据
	function sbjStore(element, isAll) {
		var param = {limit:1000, page:1, start:0}
		
		$.ajax({
        type: "GET",
        url: baseURL + "/tZero/acRate/queryTopOrg",
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        data:param,
        dataType: "json",
        async: false,
        success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            $("#" + element).empty();
            
            if(isAll){
            	
            $("#" + element).append($("<option></option>").val("").text("全部"));
            }else{
            $("#" + element).append($("<option></option>").val("").text("请选择..."));
            	
            }
            
            $.each(data, function(index, obj) { 
            	$("#" + element).append($("<option></option>").val(obj.ORGNO).text(obj.ORGNM));
            });
          	//更新内容刷新到相应的位置
            $("#" + element).selectpicker('render');
            $("#" + element).selectpicker('refresh');
        },
        error: function(error) {
        }
    });
	}
	

   	  
    </script>
    
</body>

</html>
 
