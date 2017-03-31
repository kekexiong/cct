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
		        <div class="page-bar">
		            <ul class="page-breadcrumb">
		                <li> <i class="fa fa-home"></i> <a href="index.html">结算增值业务</a> <i class="fa fa-minus"></i> </li>
		                <li> <span>快速提现手续费管理</span> </li> 
		            </ul>
		        </div>
		        <!-- 右边开始 -->  
		        <div class="row">
		            <div class="col-md-12">
		                <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-title">
		                        <div class="caption"> <i class="fa fa-desktop font-blue"></i> <span class="caption-subject font-blue bold uppercase">快速提现手续费管理</span> </div>
		                        <div class="tools">
		                            <a href="javascript:;" class="collapse" data-original-title="折叠" title=""> </a>
		                        </div>
		                    </div>
		                    <!-- 查询信息 -->
		                    <div class="portlet-body form">
		                     <form action="<%=request.getContextPath()%>/mec/queryData" class="form-horizontal" id="queryMecPanel_Form">
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
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">商户名称:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="regNm" id="regNm" class="form-control" placeholder="请输入商户名称">
		                                            </div>
		                                        </div> 
		                                    </div>
		                                   
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">手机号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="phoneNo" id="phoneNo" class="form-control" placeholder="请输入手机号">
		                                            </div>
		                                        </div> 
		                                    </div>
		                                   
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<div class="form-group">
													<label for="span-medium-1"
														class="control-label col-md-4 text-right">归属分公司:</label>
													<div class="col-md-8 paddingnone">
														<select name="branchNo" id="branchNo" data-live-search="true"
															class="selectpicker bs-select form-control"
															data-show-subtext="true">
														</select>
														<!--  需要弹出窗口，进行选择-->
													</div>
												</div>
											</div>
		                                    
		                                      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">归属一代:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="orgNm" id="orgNm" class="form-control" placeholder="请输入归属一代">
		                                            </div>
		                                        </div> 
		                                    </div>
		                                    
		                                      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">直属机构:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="rootOrgNm" id="rootOrgNm" class="form-control" placeholder="请输入直属机构">
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
		                                                <button type="button" id="reset_btn" class="btn red"> <i class="fa fa-refresh"></i> 清空检索条件</button>
		                                            	<button type="button" id="exportexcel_btn2" class="btn btn btn-primary"> <i class="fa fa-sign-out"></i> 批量修改</button>
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
		                                 		<input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                    <th class="nowrap"  style="display:none"> RN </th>
		                                    <th class="nowrap" > 商编 </th>
		                                    <th class="nowrap"> 商户名称 </th>
		                                    <th class="nowrap"> 手机号 </th>
		                                    <th class="nowrap"> 归属一代 </th>
		                                    <th class="nowrap"> 手续费</th>
		                                    <th class="nowrap"> 单笔收取最低</th> 
		                                    <th class="nowrap"> 单笔收取最高</th> 
		                                    <th class="nowrap"> 操作</th> 
		                                </tr>
		                            </thead>
		                            <tbody>
		                            </tbody>
		                        </table>
		                    </div>
		                    <!-- 分页开始 -->
		                    <div class="row no-margin" id="pagination-bar">
								<div class="col-sm-5 left no-padding" style="margin-left:15px">
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
											<option value="500">500</option>
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

 <!-- 批量开通/关闭即日付（Modal） -->
	<div class="modal fade" id="exportExcelWin" tabindex="-1" data-backdrop="static" data-width="600px">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="excelTitle">批量开通/关闭即日付</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="exportform">
                           <div class="form-body">
                               <div class="row norow">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="actDiv" >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right"><font color="red">*</font>动作类型:</label>
                                            <div class="col-md-8 paddingnone">
                                                <select name="actType" id="actType" class="bs-select form-control" data-show-subtext="true">
                                                	<option value="">请选择</option>	
                                                	<option value="1">开通</option>
                                                	<option value="0">关闭</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="contentDiv">
                                        <div class="form-group">
                                                  <label class="control-label col-md-2 text-right"><font color="red">*</font>内容描述:</label>
                                                 <div class="col-md-8 paddingnone">
                                                    <textarea name="content" data-provide="markdown" id="issContent" rows="10" data-width="250" class="form-control"></textarea>
                                                    <span class="help-block"> </span>
                                                </div>
                                        </div>
                                    </div>
                                   
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                       <div class="form-group">
                                           <label for="span-medium-2" class="control-label col-md-1 text-right"></label>
                                           <label class="checkbox-inline">
										      <input type="file" name="file" id="file"   checked aria-label="...">
										   </label>
                                       </div>
                                   </div>
                                   
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                       <div class="form-group">
                                           <label for="span-medium-2" class="control-label col-md-1 text-right"></label>
                                           <label class="checkbox-inline">
										      <input type="button" value="下载模板" id="downLoadExcel_btn">
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
  
  
  <!-- 关闭（Modal） -->
	<div class="modal fade" id="closeWin" tabindex="-1" data-backdrop="static" data-width="600px">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">动作原因</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/tzeroStl/opeateJRF" class="form-horizontal" id="closeForm" method="post">
                           <div class="form-body">
                               <div class="row norow">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                       <div class="form-group">
                                           <label for="span-medium-2" class="control-label col-md-4 text-right"><font color="red">*</font>动作原因:</label>
                                           <label class="checkbox-inline">
										      <textarea id="rmk" name="rmk" rows="5" cols="40">
										      </textarea>
										      <input type="hidden" id="_mno" name="mno"/>
										      <input type="hidden" id="_inMno" name="inMno"/>
										      <input type="hidden" id="_usrId" name="usrId"/>
										      <input type="hidden" id="_operateTyp" name="operateTyp"/>
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
                                               <button type="button" id="close_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 确认</button>
                                               <button type="button" id="close_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
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
	<div class="modal fade" id="updateWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="excelTitle">修改提现费率</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="updateform">
                           <div class="form-body"> 
                               <div class="row norow">
                               <input type="hidden" id="u_inMno"/>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                   	<input type="hidden" type="hidden" id="u_mno"/>
                                        <div class="form-group"> 
                                            <label class="control-label col-md-4 text-right">当前手续费(%):</label>
                                            <div class="col-md-6 paddingnone">
                                               <input name="acRate" id="acRate" readonly class="form-control" placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-4 text-right">变更手续费(%):</label>
                                             <div class="col-md-6 paddingnone">
		                                             <input name="rateNew" id="rateNew"  class="form-control" placeholder="填写新费率">
		                                      </div> 
                                        </div>
                                    </div>
                                    
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-4 text-right">当前单笔最低收取:</label>
                                            <div class="col-md-6 paddingnone">
                                                <input name="minAmt" id="minAmt" readonly class="form-control" placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label class="control-label col-md-4 text-right">变更单笔最低收取:</label>
                                            <div class="col-md-6 paddingnone">
                                                <input name="minAmtNew"  id="minAmtNew"  class="form-control" placeholder="填写新单笔最低收取">
                                            </div>
                                        </div>
                                    </div>
                                             
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label class="control-label col-md-4 text-right">当前单笔最高收取:</label>
                                            <div class="col-md-6 paddingnone">
                                                <input name="maxAmt" id="maxAmt" readonly class="form-control" placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                    
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label class="control-label col-md-4 text-right">变更单笔最高收取:</label>
                                            <div class="col-md-6 paddingnone">
                                                <input name="maxAmtNew" id="maxAmtNew"  class="form-control" placeholder="填写新单笔最高收取">
                                            </div>
                                        </div>
                                    </div>
                                   
                                   <div class="clearfix"></div>
                               </div>
                           </div>
                           <div class="form-actions">
                               <div class="row">
                                   <div class="col-md-12">
                                       <div class="row" style="text-align:center;margin-left:-80px">
                                           <div class="col-md-offset-1 col-md-11">
                                               <button type="button" id="importform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 确认</button>
                                               <button type="button" id="importform_cancle_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
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
		var url=baseURL+"/tZero/vvRate/query";

		/*  if(!$('#queryMecPanel_Form').valid()){  
			bootbox.alert("查询条件不正确");
			return;
		} */
		
		
          
         var phoneNo  = $('#phoneNo').val();
  		 var mno  = $('#mno').val();
         if(mno!=''){
        	 if(mno.length!=15||isNaN(mno)){
        		 bootbox.alert("商编只能是15位数字");
        		 return;
        	 	}
       		}
          	
         if(phoneNo!=''){
        	 if(phoneNo.length!=11||isNaN(phoneNo)){
        		 bootbox.alert("手机号只能是11位数字");
        		 return;
        	 	}
       		}
		
		
		
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
		
		param.regNm  = $('#regNm').val();
		param.phoneNo  = $('#phoneNo').val();
		param.mno  = $('#mno').val();
		param.branchNo  = $('#branchNo').val();
		param.orgNm  = $('#orgNm').val();
		param.rootOrgNm  = $('#rootOrgNm').val();
		
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
                	trData.push("<input id='tt' type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                    
                	var mno=obj.mno;
					var rate=obj.rate;
					var minAmt=obj.minAmt;
					var maxAmt=obj.maxAmt;
					if(minAmt=='' || minAmt == null){
						minAmt = 0;
					}
					if(maxAmt=='' || maxAmt == null){
						maxAmt = 0;
					}
					if(rate=='' || rate == null){
						rate = 0;
					}
					
					var str ;
					
					if(hasPermission(PERMISSSIONCONST.TZER9003)){
						str = "<a href='javascript:void(0);' onclick=updateRateFun('"+mno+"'," +
								rate+","+minAmt+","+maxAmt+")>修改费率</a>	"
						str += "<a href='javascript:void(0);' onclick=JRFOperateHis('"+mno+"')>操作记录</a>   "
					}
                	
					
					trData.push("<td hidden='true'>"+obj.RN+"</td>"); 
                	trData.push(obj.mno);
                	trData.push(obj.regNm);
                	trData.push(obj.phoneNo);
                	trData.push(obj.orgNm);
                	trData.push(formartRate(obj.rate));
                	trData.push(formartData(obj.minAmt));
                	trData.push(formartData(obj.maxAmt));
                	
                	trData.push(str);
                	
                	 for(i=0; i < trData.length; i++){
                    	 if(trData[i] == undefined){
                    		 trData[i] = ''; 
                    	 }
                     }

                    	 $("#queryMecGrid").DataTable().row.add(trData).draw();
                    	
                    	
                    });
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
                $("input[id='tt']").parent().next().hide();
                
            }, 
            error: function(error) {
            	bootbox.alert("读取失败！");
            }
        }); 
	}
    var queryMethod=0;
    

    $(function(){
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.TZER9001)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZER9002) ) {$("#exportexcel_btn2").hide();} 
    	
		
    	//加载数据
    	/* reloadGrid(); */
    	
    	//重置按钮
		$("#reset_btn").on('click', function() {
			$("#queryMecPanel_Form")[0].reset();
			/* $("#queryMecPanel_Form").resetForm(); */
			$("#queryMecPanel_Form .bs-select").selectpicker('val','');//重置select元素
		});
    	
    	
		/*  $('#queryMecPanel_Form').validate({
			 errorElement:"span",
				errorClass:"help-block help-block-error",
				focusInvalid:!1,
				ignore:"",
				highlight:function(e){$(e).closest(".form-group").addClass("has-error")},
				success:function(e){$(e).closest(".form-group").removeClass("has-error")},
		        rules: {
		        	  mno: {
		              digits: true,
		              rangelength:[15,15]
		            },
		            phoneNo: {
		            	  digits: true,
			              rangelength:[11,11]
				            }
		            
		          },
		          messages: {
		        	  mno: {
		              digits: '只能为数字',
		              rangelength: '商编只能是15位数字'
		            },
		            phoneNo: {
		            	digits:'手机号只能是11位数字',
		            	rangelength:'手机号只能是11位数字'
				            }
		          }
		      }); */
		 
		 //修改校验
		 $('#updateform').validate({
			 errorElement:"span",
				errorClass:"help-block help-block-error",
				focusInvalid:!1,
				ignore:"",
				highlight:function(e){
					$(e).closest(".form-group").addClass("has-error")
					},
				success:function(e){
					$(e).closest(".form-group").removeClass("has-error")
					},
		        rules: {
		        	rateNew: {
		        	  number: true,
		              max:1,
		              min:0,
		              required:true
		            },
		            minAmtNew: {
			        	  number: true,
			              max:999999999.99,
			              min:0,
			              required:true
			         },
			         maxAmtNew: {
			        	  number: true,
			              max:999999999.99,
			              min:0,
			              required:true
			            }   
		            
		          },
		          messages: {
		        	  rateNew:{
		        	  number: "不是有效数值",
	            	  max:'该输入项最大值为1',
	            	  min:'该输入项最小值为0',
	            	  required:'不能为空'
		            },
		            minAmtNew:{
			        	  number: "不是有效数值",
		            	  max:'该输入项最大值为999999999.99',
		            	  min:'该输入项最小值为0',
		            	  required:'不能为空'
			        },
			        maxAmtNew:{
			        	  number: "不是有效数值",
		            	  max:'该输入项最大值为999999999.99',
		            	  min:'该输入项最小值为0',
		            	  required:'不能为空'
			            }    
		          }
		      });
		
    
		//查询分公司
		sbjStore('branchNo', true);
    	
    	//关闭功能
    	$("#close_save_btn").bind("click",function(){
    		var  rmk = $("#rmk").val();
    		if(rmk.trim()==''){ 
    			bootbox.alert("请填写原因!");				
    			return;
    		}
	
    		App.blockUI({target:"body",boxed:!0,message:CONST.TIP016,zIndex:20000});
    		var data = $("#closeForm").serialize();
    		var url=baseURL+"/tzeroStl/opeateJRF"; 
    		$.ajax({ 
                type: "POST", 
                url: url, 
                data:data,
                success: function(data){ 
                	data = $.parseJSON(data);
                	if(data.success){
                		bootbox.alert("操作成功!");
                		reloadGrid(); 
                		$("#closeWin").modal('hide'); 
                		
                	}else{
                		bootbox.alert(data.msgInf);
                	}
                	
                }
    		});
    		
    	});
    	
    	$("#close_cancel_btn").bind("click",function(){
    		$("#closeWin").modal('hide'); 
    		$("#rmk").text("");
    	})
    	
    	
    	
    	
    	
    	
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
		//跳转到 下载excel页面
		$("#downLoadExcel_btn").on('click',function(){
			 window.location.href = baseURL+'/tZero/vvRate/downloadTemplate';	 
		})
		
		$("#downLoad_save_btn").on("click",function(){
			var excelType =$("input[name='templateType']:checked").val();
			if (excelType == '1') {
				window.location.href =baseURL+ "/tzeroStl/downloadJRFTemplate";
			}
			if (excelType == '2') {
				if(hasPermission(PERMISSSIONCONST.TZER1016)){
					window.location.href =baseURL+"/busRate/downloadJRFRateTemplate";
				}else{
					bootBox.alert("没有权限下载批量修改费率模板"); 
				}
			}
			$("#downLoadWin").modal("hide");
		});
		
		$("#downLoad_cancel_btn").on("click",function(){
			$("#downLoadWin").modal("hide");
		});
		
		
		
		// 批量修改随意通工作日费率
		 $("#exportexcel_btn").on('click', function() {
			 var optType = '1';
			 
			 $("#contentDiv").show();
			 $("#actDiv").show();
			 $("#excelTitle").text("批量开通/关闭即日付");
			
			$("#exportExcelWin").modal('show');
			
			batchOpt(optType);
			$("#exportform_cancel_btn").off('click').on('click', function() {
				$("#exportExcelWin").modal('hide');
			});
			
		}); 
		
		
		// 批量修改费率操作
		 $("#exportexcel_btn2").on('click', function() {
			 var optType = '2';
			 $("#contentDiv").hide();
			 $("#actDiv").hide();
			 $("#excelTitle").text("批量导入操作");
			 
			 $("#exportExcelWin").modal('show');
			
			batchOpt(optType);
			$("#exportform_cancel_btn").off('click').on('click', function() {
				$("#exportExcelWin").modal('hide');
			});
			
		}); 
		
		
		
		
		//修改费率
		 $("#importform_save_btn").on("click",function(){
			 updateStatus();
		 });
		 $("#importform_cancle_btn").on("click",function(){
			 $("#updateWin").modal("hide");
		 });
		
		
   	});
  
  //修改状态
    function updateStatus(){

    	 if(!$('#updateform').valid()){  
    	             bootbox.alert("查询条件不正确");
    	              return;  
    	    }  

		var mno = $("#u_mno").val();
		var rate = $("#acRate").val();
		var rateNew = $("#rateNew").val();
		var minAmt = $("#minAmt").val();
		var minAmtNew = $("#minAmtNew").val();
		var maxAmt = $("#maxAmt").val();
		var maxAmtNew = $("#maxAmtNew").val();
		if(rateNew > 1 || rateNew < 0){
			bootbox.alert("VV快速提现手续费超出规定范围");
			return false;
		}
		if(maxAmtNew > 999999999.99 || maxAmtNew < 0){
			bootbox.alert("VV快速提现单笔最高收取超出规定范围");
			return false;
		}
		if(minAmtNew > 999999999.99 || minAmtNew < 0){s
			bootbox.alert("VV快速提现单笔最低收取超出规定范围");
			return false;
		}
		if(minAmtNew > maxAmtNew){
			bootbox.alert("单笔最低收取输入应小于单笔最高收取");
			return false;
		}
	  
	  
    		
    	
    	var url = baseURL+"/tZero/vvRate/updateRate"
    	
    	App.blockUI({target:"body",boxed:!0,message:CONST.TIP016,zIndex:20000});
    	
    	 $.ajax({
    	    type: "POST",
    	    url: url,
    	    data :{
    	    	mno : mno,
    			rate : rate,
    			rateNew : rateNew,
    			minAmt:minAmt,
    			minAmtNew:minAmtNew,
    			maxAmt:maxAmt,
    			maxAmtNew:maxAmtNew
    	    },
    	    dataType: "json",
    	    success: function(data) {
                	if(data.timeout){
                		ajaxTimeout();
                    }
    	    	if (data && data.success == true) { 
    	    		bootbox.alert(data.msg);
    	    		//关闭弹窗
    	    		reloadGrid();
    	    		$("#updateWin").modal("hide");
    			}else{
    				bootbox.alert(data.msg);
    				$("#updateWin").modal("hide");
    			}
    	    },
    	    error: function(error) {
    	    }
    	});		

    }  
    
  
//跳转excel导入出错页面    
function showExcelImportErrorPanel(data){
	$("#data").val(data);
	 $.fancybox({afterLoad:fancyboxCenterOnViewport,
  		href:'MecVvRateManagerExcelError.jsp',     
  		type: 'iframe',
  		padding: 5,
  		margin:60, 
  		scrolling: 'no',
  		fitToView: true, 
  		width: 1400,
  		height: 490,
  		autoSize: false, 
  		autoResize:false,
  		closeClick: false,
  		afterClose:function(){
  			 reloadGrid(); 
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
function formartData(value){ 
	if(value == '' || value == null){
		return 0;
	}else{
		return value;
	}
}   

function formartRate(value){ 
	if(value == '' || value == null){
		return '0%';
	}else{
		return value + '%';
	}
}   


function batchOpt(optType){
$("#exportform")[0].reset();	//重置表单
$("#exportform .bs-select").selectpicker('val','');//重置select元素 
	
$("#exportform_save_btn").off('click').on('click', function() { 
		var	url=baseURL+"/tZero/vvRate/batchOpt";
	
	
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
				  var fileObj = document.getElementById("file").files[0]; // 获取文件对象
				  var form = new FormData();
				   // FormData 对象
				  form.append("file", fileObj); // 文件对象
				  
				  
		       App.blockUI({target:"body",boxed:!0,message:CONST.TIP016,zIndex:20000});
		       $.ajax({
		           url:url, 
		           type:"post",
		           data:form,
		           processData:false,
		           contentType:false,
		           success:function(result){
		        		   $("#exportExcelWin").modal('hide');
		        		   result = jQuery.parseJSON(result);
		        		  
		        		   if (result.msgCd == 'MEC00000') {
		        			   showExcelImportErrorPanel(JSON.stringify(result));
							}else{
								bootbox.alert("导入文件未通过格式校验，原因："+result.msgInfo);
							}
		        		   
		        		  
		        	   //移除点击事件
		        	   $("#exportform_save_btn").unbind("click");
		           },
		           error:function(e){
		               bootbox.alert("导入错误！！");
		              // window.clearInterval(timer);
		           }
		       });   				
				
				
		
   });
	
}
	
// 修改费率
updateRateFun=function(mno,rate,minAmt,maxAmt){

	$("#updateWin").modal('show');
	
	$("#u_mno").val(mno);
	$("#acRate").val(rate);
	$("#minAmt").val(minAmt);
	$("#maxAmt").val(maxAmt);
	
	$("#rateNew").closest(".form-group").removeClass("has-error");
	$("#rateNew").next().remove();
	$("#minAmtNew").closest(".form-group").removeClass("has-error");
	$("#minAmtNew").next().remove();
	$("#maxAmtNew").closest(".form-group").removeClass("has-error");
	$("#maxAmtNew").next().remove();
	
	$("#rateNew").val("");
	$("#minAmtNew").val("");
	$("#maxAmtNew").val("");
	
	
}


//查看即日付开通流水
JRFOperateHis=function(mno){
	var url=baseURL+"/tZero/vvRate/queryOptLog/"+mno;
	var param = {page:page,start:start,limit:limit};
	$.ajax({
        type: "GET", 
        url: url, 
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        data: param,
        dataType: "json",
        success: function(data) {
        	if(data.totalCount=='0'){
        		bootbox.alert("没有查到该商户修改的记录");
        		return;
        	}else{
        		 $.fancybox({afterLoad:fancyboxCenterOnViewport,
        	     		href:'MecVvRateManagerHisPanel.jsp?mno='+mno,    
        	     		type: 'iframe',
        	     		padding: 5,
        	     		margin:60, 
        	     		scrolling: 'no',
        	     		fitToView: true,
        	     		width: 1200,
        	     		height: 490,
        	     		autoSize: false, 
        	     		autoResize:false,
        	     		closeClick: false,
        	     		afterClose:function(){
        	     			/* reloadGrid(); */
        	     		} 
        	     	}); 
        		}
        	}
		});
	
    	
}






//去空格
String.prototype.trim = function() {
	  return this.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
}

//查询分公司
function sbjStore(element, isAll) {
	var param = {
		limit : 1000,
		page : 1,
		start : 0
	}

	$
			.ajax({
				type : "GET",
				url : baseURL + "/tZero/org/queryOrgNmComboList",
				contentType : "application/x-www-form-urlencoded;charset=utf-8",
				data : param,
				dataType : "json",
				async : false,
				success : function(data) {
					if (data.timeout) {
						ajaxTimeout();
					}
					$("#" + element).empty();

					if (isAll) {

						$("#" + element).append(
								$("<option></option>").val("").text(
										"全部"));
					} else {
						$("#" + element).append(
								$("<option></option>").val("").text(
										"请选择..."));

					}
					/* cdVl + "'>"   + data[i].cdNm */
					$.each(data, function(index, obj) {
						$("#" + element).append(
								$("<option></option>").val(obj.cdVl)
										.text(obj.cdNm));
					});
					//更新内容刷新到相应的位置
					$("#" + element).selectpicker('render');
					$("#" + element).selectpicker('refresh');
				},
				error : function(error) {
				}
			});
}
  
function getInfo(successCount,failureCount,msg) {
	var info = "<font>本次批量导入操作共成功" +successCount 
			+ "条，失败" + failureCount + msg;
	return info;
}

    </script>
    
</body>

</html>
 
