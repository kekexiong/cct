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
		                        <form action="<%=request.getContextPath()%>/tZero/refStmt/query" class="form-horizontal" id="querySetRefStmtMag_myForm">
		                            <div class="form-body">
		                                <div class="row norow">
		                                	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">结算单号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="setOno" id="setRefStmtForm_setOno" class="form-control" placeholder="请输入结算单号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">商编:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mno" id="setRefStmtForm_mno" class="form-control" placeholder="请输入商编">
		                                            </div>
		                                        </div>
		                                    </div>
		                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">所属分公司:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                 <select name="orgNo" id="setRefStmtForm_orgNo" data-live-search="true" class="bs-select form-control" data-show-subtext="true">
		                                                	<option value="">全部</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">协议付款日期:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange" >
		                                                    <input type="text" class="form-control col-md-3" name="argPayDtBg" id="setRefStmtForm_argPayDtBg">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="argPayDtEd" id="setRefStmtForm_argPayDtEd">
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">结算完成时间:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange" >
		                                                    <input type="text" class="form-control col-md-3" name="endDtBg" id="setRefStmtForm_endDtBg">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="endDtEd" id="setRefStmtForm_endDtEd">
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">一代编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="topAgentNo" id="setRefStmtForm_topAgentNo" class="form-control" placeholder="请输入一代编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">付款类型:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                 <select name="payTyp" id="setRefStmtForm_payTyp" class="form-control bs-select" data-show-subtext="true">
		                                                 	<!-- <option value="">全部</option>
		                                                	<option value="01">T+N结算</option>
		                                                	<option value="02">T+0结算</option>
		                                                	<option value="03">非工作日结算</option>
		                                                	<option value="04">商户付款</option>
		                                                	<option value="05">普通朝付通</option>
		                                                	<option value="06">VIP朝付通</option>
		                                                	<option value="07">即刷即到</option>
		                                                	<option value="08">全时代付</option>
		                                                	<option value="09">工作日代付</option>
		                                                	<option value="10">即时T+1结算</option>
		                                                	<option value="11">移动支付</option>
		                                                	<option value="12">自动秒到</option>
		                                                	<option value="13">跨境汇款</option>
		                                                	<option value="14">风控T+1</option>
		                                                	<option value="15">自动即时T+1</option>
		                                                	<option value="16">快捷结算</option> -->
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">T0类型:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                 <select name="payTyp" id="setRefStmtForm_t0Typ" class="form-control bs-select" data-show-subtext="true">
		                                                 	<!-- <option value="">全部</option>
		                                                	<option value="01">随意通</option>
		                                                	<option value="02">即日付</option>
		                                                	<option value="03">闪电到账</option>
		                                                	<option value="04">商户手刷</option>
		                                                	<option value="05">个人手刷</option>
		                                                	<option value="06">小福一代</option> -->
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">结算单退费标记:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                 <select name="setRefSign" id="setRefStmtForm_setRefSign" class="form-control bs-select" data-show-subtext="true">
		                                                 	<option value="">全部</option>
		                                                	<option value="01">投诉</option>
		                                                	<option value="02">差错</option>
		                                                	<option value="03">空</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">商户业务退费标记:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                 <select name="mecRefSign" id="setRefStmtForm_mecRefSign" class="form-control bs-select" data-show-subtext="true">
		                                                 	<option value="">全部</option>
		                                                	<option value="01">是</option>
		                                                	<option value="00">否</option>
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
		                                                <button type="button" id="tuifei_btn" class="btn btn-info"> <i class="fa fa-edit"></i> 标记差错退费</button>
		                                                <button type="button" id="tousu_btn" class="btn btn-info"> <i class="fa fa-edit"></i> 标记投诉退费</button>
		                                                <button type="button" id="quchutuifei_btn" class="btn btn-info"> <i class="fa fa-edit"></i> 去除退费标记</button>
		                                                <button type="button" id="bitchtuifei_btn" class="btn"  style="background-color:#56b668;color:#fff;"> <i class="fa fa-edit"></i> 批量退费标记操作</button>
		                                                <button type="button" id="bitchdaoru_btn" class="btn" style="background-color:#56b668;color:#fff;"> <i class="fa fa-import"></i> 批量导入查询</button>
		                                                <button type="button" id="caozuojilu_btn" class="btn" style="background-color:#66a19e;color:#fff;"> <i class="fa fa-query"></i>操作记录</button>
		                                                <button type="button" id="exportexcel_btn" class="btn btn-primary"> <i class="fa fa-sign-out"></i> 导出Excel</button>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">商户结算单退费流水列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="querySetRefStmtMagGridPanel">
		                            <thead>
		                                <tr>
		                                    <th>
		                                        <input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                    <th> 结算单号 </th>
		                                    <th> 协议付款日期 </th>
		                                    <th> 商编 </th>
		                                    <th> 商户名称 </th>
		                                    <th> 付款类型 </th>
		                                    <th> 付款类型 </th>
		                                    <th> 商户业务退费标记 </th>
		                                    <th> 结算金额</th>
		                                    <th> 结算手续费</th>
		                                    <th> 结算完成时间</th>
		                                    <th> 结算单退费标记 </th>
		                                    <th> 最后退费操作时间 </th>
		                                    <th> 分公司 </th>
		                                    <th> 一代编号 </th>
		                                    <th> 一代名称 </th>
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
										<select id="limit_outer" class=" form-control "
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
		                	<div class="row no-margin" id="queryResultGrid_displayInfo"></div>
		            	</div>
		        	</div>
		    	</div>
	    	</div>
		</div>
    </div>
	
	
	<!-- 批量退费标记模态框（Modal） -->
	<div class="modal fade" id="updateBatWindow" tabindex="-1" role="dialog" data-backdrop="static" data-width="40%"
	   aria-labelledby="myModalLabel" aria-hidden="true">  
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title">批量导入操作</h4>
         </div>
         <div class="modal-body" style="height:200px; text-align:center;">
        	<div style="margin-left:15%; text-align:left;">
        		<label style="width:120px; float:left;margin-top: 6px;">结算单退费标记操作</label>
            	<div class="" style="float:left; width:60%;" >
	            	<select name="optTyp" id="updateBatForm_optTyp" class="bs-select form-control" data-show-subtext="true">
	                	<option value="01">标记投诉</option>
	                	<option value="02">标记差错</option>
	                	<option value="03">取消标记</option>
	                </select>
                </div>
            </div>
            <div class="row fileupload-buttonbar" style="margin-left:15%; margin-top:40px;clear:both;">
				<span class="btn green fileinput-button" style="float:left;width:115px;margin-right: 5px;">
                     <i class="fa fa-plus"></i>
                     <span> 添加 </span>
                     <input id="file" type="file" name="file" multiple /> </span>    
                     <input style="float:left; width:55%"  name="fileattr" id="fileattr" readonly
							class="form-control" placeholder="请选择文件">
             </div>
             <br/> 
             <div class="row" style="margin-left:15%;clear:both;text-align: left;">
				<a id="exportSetStmMagModel" href="javascript:void(0);">下载模板</a>
             </div>
             <br/>
             <div class="row">
	              <div class="col-md-12"  style="text-align:center;">
	                  <div class="row">
	                      <div style="margin-left:4%;" class=" col-md-11">
	                      	  <button type="button"  id="confirmUpload" class="btn btn-success"> <i class="fa fa-sign-out"></i> 确认</button>
	                          <button type="button" onclick="javascript:$('#updateBatWindow').modal('hide');" id="" class="btn red"> <i class="fa fa-share"></i> 关闭</button>
	                      </div>
	                  </div>
	              </div>
	         </div>    
		</div><!-- /.modal -->
   	</div>
	
	
	<!-- 导入失败的数据模态框（Modal） -->
	<div class="modal fade" id="updBatErroWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="40%"
	   aria-labelledby="myModalLabel" aria-hidden="true">  
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="">导入失败的数据</h4>
         </div>
         <div class="modal-body" style="height:400px; text-align:center;">
         	<div class="portlet-body wheel">
                 <table class="table table-striped table-bordered table-hover table-checkable order-column">
                     <thead>
                         <tr>
                             <th> 位置 </th>
                             <th> 结算单号</th>
                             <th> 失败原因 </th>
                         </tr>
                     </thead>
                     <tbody>
                     	
                     </tbody>
                 </table>
             </div>	
             <div class="row">
	              <div class="col-md-12"  style="text-align:center;">
	                  <div class="row">
	                      <div style="margin-left:4%;" class=" col-md-11">
	                      	  <button type="button"  id="exportuptBatdata" class="btn btn-success"> <i class="fa fa-sign-out"></i> 导出</button>
	                      </div>
	                  </div>
	              </div>
	         </div>    	   
		</div><!-- /.modal -->
   	</div>
	
	<!-- 批量导入操作模态框（Modal） -->
	<div class="modal fade" id="importExcelWindow" tabindex="-1" role="dialog" data-backdrop="static" data-width="40%"
	   aria-labelledby="myModalLabel" aria-hidden="true">  
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title">批量导入操作</h4>
         </div>
         <div class="modal-body" style="height:340px; text-align:center;">
        	<div style="margin-left:15%; text-align:left;">
        		<label style="width:120px; float:left;margin-top: 6px;">付款类型</label>
            	<div class="" style="float:left; width:60%;" >
	            	<select name="payTyp" id="importExcelForm_payTyp" class="bs-select form-control" data-show-subtext="true">
                       	<!-- <option value="">全部</option>
                       	<option value="01">T+N结算</option>
                       	<option value="02">T+0结算</option>
                       	<option value="03">非工作日结算</option>
                       	<option value="04">商户付款</option>
                       	<option value="05">普通朝付通</option>
                       	<option value="06">VIP朝付通</option>
                       	<option value="07">即刷即到</option>
                       	<option value="08">全时代付</option>
                       	<option value="09">工作日代付</option>
                       	<option value="10">即时T+1结算</option>
                       	<option value="11">移动支付</option>
                       	<option value="12">自动秒到</option>
                       	<option value="13">跨境汇款</option>
                       	<option value="14">风控T+1</option>
                       	<option value="15">自动即时T+1</option>
                       	<option value="16">快捷结算</option> -->
	                </select>
                </div>
                <div style="clear:both;"></div>
                <label style="width:120px; float:left;margin-top: 20px;">商户业务退费标记</label>
            	<div class="" style="float:left; width:60%;margin-top: 15px;" >
	            	<select name="mecRefSign" id="importExcelForm_mecRefSign" class="bs-select form-control" data-show-subtext="true">
                       	<option value="">全部</option>
                       	<option value="01">是</option>
                       	<option value="00">否</option>
                    </select>
                </div>
                 <div style="clear:both;"></div>
                <label style="width:120px; float:left;margin-top:20px;">T0类型</label>
            	<div class="" style="float:left; width:60%;margin-top: 15px" >
	            	<select name="t0Typ" id="importExcelForm_t0Typ" class="bs-select form-control" data-show-subtext="true">
                       	<!-- <option value="">全部</option>
                       	<option value="01">随意通</option>
                       	<option value="02">即日付</option>
                       	<option value="03">闪电到账</option>
                       	<option value="04">商户手刷</option>
                       	<option value="05">个人手刷</option>
                       	<option value="06">小福一代</option> -->
                    </select>
                </div>
                <div style="clear:both;"></div>
                <label style="width:120px; float:left;margin-top:20px;">结算单退费标记</label>
            	<div class="" style="float:left; width:60%;margin-top: 15px" >
	            	<select name="t0Typ" id="importExcelForm_setRefSign" class="bs-select form-control" data-show-subtext="true">
                       	<option value="">全部</option>
                       	<option value="01">投诉</option>
                       	<option value="02">差错</option>
                       	<option value="03">空</option>
                    </select>
                </div>
            </div>
            <div class="row fileupload-buttonbar" style="margin-left:15%; margin-top:55px;clear:both;">
				<span class="btn green fileinput-button" style="float:left;width:115px;margin-right: 5px;">
                     <i class="fa fa-plus"></i>
                     <span> 添加 </span>
                     <input id="bifile" type="file" name="file" multiple /> </span>    
                     <input style="float:left; width:55%"  name="fileattr" id="bifileattr" readonly
							class="form-control" placeholder="请选择文件">
             </div>
             <br/> 
             <div class="row" style="margin-left:15%;clear:both;text-align: left;">
				<a id="exportbitchimportModel" href="javascript:void(0);">下载模板</a>
             </div>
             <br/>
             <div class="row">
	              <div class="col-md-12"  style="text-align:center;">
	                  <div class="row">
	                      <div style="margin-left:4%;" class=" col-md-11">
	                      	  <button type="button"  id="importExcelconfirmUpload" class="btn btn-success"> <i class="fa fa-sign-out"></i> 确认</button>
	                          <button type="button" onclick="javascript:$('#importExcelWindow').modal('hide');" id="" class="btn red"> <i class="fa fa-share"></i> 关闭</button>
	                      </div>
	                  </div>
	              </div>
	         </div>    
		</div><!-- /.modal -->
   	</div>
    
    <!-- 批量导入查询结果错误数据模态框（Modal） -->
	<div class="modal fade" id="queryErroWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="40%"
	   aria-labelledby="myModalLabel" aria-hidden="true">  
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title">导入失败数据</h4>
         </div>
         <div class="modal-body" style="height:400px; text-align:center;">
         	<h5 class="modal-title" style="text-align:left;" id="queryErrotitle"></h5>
         	<div class="portlet-body wheel">
                 <table class="table table-striped table-bordered table-hover table-checkable order-column">
                     <thead>
                         <tr>
                             <th> 行数 </th>
                             <th> 商户编号</th>
                             <th> 起始日期 </th>
                             <th> 终止日期 </th>
                             <th> 失败原因 </th>
                         </tr>
                     </thead>
                     <tbody>
                     </tbody>
                 </table>
             </div>	
             <div class="row">
	              <div class="col-md-12"  style="text-align:center;">
	                  <div class="row">
	                      <div style="margin-left:4%;" class=" col-md-11">
	                      	  <button type="button"  id="importqueryerrdata" class="btn btn-success"> <i class="fa fa-sign-out"></i> 导出</button>
	                          <button type="button" onclick="javascript:$('#queryErroWin').modal('hide');" id="" class="btn red"> <i class="fa fa-share"></i> 取消</button>
	                      </div>
	                  </div>
	              </div>
	         </div>    	   
		</div><!-- /.modal -->
   	</div>
   	
   	
   	<!-- 操作记录模态框（Modal） -->
	<div class="modal fade" id="logGridWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="40%"
	   aria-labelledby="myModalLabel" aria-hidden="true">  
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title">操作记录</h4>
         </div>
         <div class="modal-body" style="height:400px; text-align:center;">
         	<div class="portlet-body wheel">
                 <table class="table table-striped table-bordered table-hover table-checkable order-column">
                     <thead>
                         <tr>
                             <th> 序号 </th>
                             <th> 操作员</th>
                             <th> 操作时间 </th>
                             <th> 动作 </th>
                         </tr>
                     </thead>
                     <tbody>
                     </tbody>
                 </table>
             </div>  	   
		</div><!-- /.modal -->
   	</div>
   	
   	
   	<!-- 批量导入查询结果数据模态框（Modal） -->
	<div class="modal fade" id="queryResultWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="85%"
	   aria-labelledby="myModalLabel" aria-hidden="true">  
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title">批量导入查询结果</h4>
         </div>
         <div class="modal-body" style="height:400px; text-align:center;">
         	<div class="portlet-body wheel">
                 <table id="tableresult" class="table table-striped table-bordered table-hover table-checkable order-column">
                     <thead>
                         <tr>
                             <th> 序号 </th>
                             <th> 结算单号</th>
                             <th> 协议付款日期 </th>
                             <th> 商编 </th>
                             <th> 商户名称 </th>
                             <th> 付款类型 </th>
                             <th> T+0类型 </th>
                             <th> 商户业务退费标记</th>
                             <th> 结算金额</th>
                             <th> 结算手续费</th> 
                             <th> 结算完成时间</th>
                             <th> 结算单退费标记</th>
                             <th> 最后退费操作时间</th>
                             <th> 分公司</th>
                             <th> 一代编号</th>
                             <th> 一代名称</th>
                         </tr>
                     </thead>
                     <tbody>
                     </tbody>
                 </table>
             </div>  
             <div class="row">
	              <div class="col-md-12"  style="text-align:center;">
	                  <div class="row">
	                      <div style="margin-left:4%;" class=" col-md-11">
	                      	  <button type="button"  id="importResultdata" class="btn btn-success"> <i class="fa fa-sign-out"></i> 导出</button>
	                          <button type="button" onclick="javascript:$('#queryResultWin').modal('hide');" id="" class="btn red"> <i class="fa fa-share"></i> 取消</button>
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
    
    var totalCount = 0;

    //分页
    function pageing(opp) {
    	$(window.top.document).scrollTop(0,500);
    	limit=$("#limit_outer  option:selected").text();
    //	if(!/^[1-9]\d*$/.test(opp)){
    		$(".p").val("");
    //	} 
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
    	$("#querySetRefStmtMagGridPanel tbody").empty();
    	//$("table tbody [id^='resutl_']").remove();
    	reloadGrid();
    }
    
  //批量导入下载模板
    window.downChgChannelTemplate_PayOptPanel=function(){
    	var url=baseURL+'/ses/pay/downChgChannelTemplate';
    	window.open(url);
    }
    
    
    //全选列表数据
    function checkAll(checked) {
    	$("#querySetRefStmtMagGridPanel tbody :checkbox").prop('checked', checked);
    }

    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
    function onChange4PageSize_inner(select) {
    	limit = select.value;
    	reloadConfirmData();
    }
    
    //显示导入查询结果
    function queryResultWin(){
    	$("#queryResultWin tbody").empty();
    	
    	var query_Path = baseURL + "/tZero/refStmt/queryResult?page=1&start=0&limit=20";
    	App.blockUI({target:"body",boxed:!0,message:"读取中...",zIndex:20000});
		$.ajax({
            type: "GET",
            url: query_Path,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
    			var list = {};
    			list.items = data.items;
    			tableData = $.extend(true, {}, list);//cache
                $("#tableresult").DataTable().clear().draw();
    			if(list.items.length>0){
    				$.each(list.items, function(index, obj) {
                    	var trData = [];
                    	trData.push("<input type=\"checkbox\" data-chkBatNo='"+ obj.chkBatNo +"' class=\"checkboxes\" rownum=\""+index+"\" />");         	
                    	
                    	trData.push(obj.setOno);
                    	trData.push(obj.argPayDt);
                    	trData.push(obj.mno);
                    	trData.push(obj.mecNm);
                    	trData.push(obj.payTyp);
                    	trData.push(obj.t0Typ);
                    	
                    	if(obj.mecRefSign=="01"){
                    		trData.push("是");
                    	}else{
                    		trData.push("否");
                    	}
                    	trData.push(obj.setAmt);
                    	
                    	trData.push(obj.setFeeAmt);
                    	trData.push(obj.endDt);
                  
                    	if(obj.setRefSign=="01"){
                    		trData.push("投诉");
                    	}else if(obj.setRefSign=="02"){
                    		trData.push("差错");
                    	}else{
                    		trData.push("");
                    	}
                    	trData.push(obj.refOptDt);
                    	trData.push(obj.orgNm);
                    	trData.push(obj.topAgentNo);
                    	trData.push(obj.topAgentNm);
                    
                    	
                    	for(i=0; i < trData.length; i++){
                       		if(trData[i] == undefined){
                       		 	trData[i] = ''; 
                       	 	}
                        }
    					$("#tableresult").DataTable().row.add(trData).draw();	
                    });
                    $("#tableresult").DataTable().order([1, 'asc']).draw();	
    			}
                
                $("#queryResultWin").modal("show");
            },
            error: function(error) {
            }
        });
    }
    
  //日期格式化
    Date.prototype.format = function(format){
    	var o = {
    	"M+" : this.getMonth()+1, //month
    	"d+" : this.getDate(), //day
    	"h+" : this.getHours(), //hour
    	"m+" : this.getMinutes(), //minute
    	"s+" : this.getSeconds(), //second
    	"q+" : Math.floor((this.getMonth()+3)/3), //quarter
    	"S" : this.getMilliseconds() //millisecond
    	}

    	if(/(y+)/.test(format)) {
    		format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    	}

    	for(var k in o) {
	    	if(new RegExp("("+ k +")").test(format)) {
	    		format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
	    	}
    	}
    	return format;
    } 
    
  //计算天数差的函数，通用  
    function diffDate(sDate1,  sDate2){//sDate1和sDate2是2014-07-16格式  
    	var aDate,  oDate1,  oDate2,  iDays;  
    	oDate1  =  new  Date(sDate1); 
    	oDate2  =  new  Date(sDate2);
    	iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24) ;//把相差的毫秒数转换为天数
        return	iDays;
    }  
  
	function getDate4YYYYMM(strDate){
		if(null == strDate || "" == strDate){
			return null;
		}
		var newDate =  strDate.replace(/-/g, "").replace(/ /g, "").replace(/:/g, "").replace(/\//g, "");
		return newDate;
	};
    
	//校验时间条件大小
	function checkData(starData,endData){
		if(starData!=null && endData!=null){
			if(starData > endData){
				bootbox.alert("开始时间不能大于结束时间");
		        return false;
			}
		}
		return true;
	};
	//封装查询参数
	function packageArg(){
		var setOno = $('#setRefStmtForm_setOno').val().trim();
	    var mno = $('#setRefStmtForm_mno').val().trim();
	    
	    var reg =/^[0-9]*$/ ;
		if(mno!=undefined  && mno!=''){
			if(!reg.test(mno)){
				bootbox.alert("一代编号只能是15位数字");
				return false;
			}
			if (mno.length != 15) {
				bootbox.alert("一代编号只能是15位数字");
				return false;
			}
		}
	    
	    var argPayDtBg = $('#setRefStmtForm_argPayDtBg').val();
	    var argPayDtEd = $('#setRefStmtForm_argPayDtEd').val();
	    var days = diffDate(argPayDtEd,argPayDtBg);
	    if(days>180){
	    	bootbox.alert("时间段查询最多可为180天");
			return null;
		}
	    argPayDtBg = getDate4YYYYMM(argPayDtBg);
	    argPayDtEd = getDate4YYYYMM(argPayDtEd);

	    var orgNo = $('#setRefStmtForm_orgNo').val();
	    
	    var endDtBg = $('#setRefStmtForm_endDtBg').val();
	    var endDtEd = $('#setRefStmtForm_endDtEd').val();
	    var days2 = diffDate(endDtEd,endDtBg);
	    if(days2>180){
	    	bootbox.alert("时间段查询最多可为180天");
			return null;
		}
	    endDtBg = getDate4YYYYMM(endDtBg);
	    endDtEd = getDate4YYYYMM(endDtEd);
	    
	    var topAgentNo = $('#setRefStmtForm_topAgentNo').val().trim();
	    var payTyp = $('#setRefStmtForm_payTyp').val();
	    var t0Typ = $('#setRefStmtForm_t0Typ').val();
	    var setRefSign = $('#setRefStmtForm_setRefSign').val();
	    var mecRefSign = $('#setRefStmtForm_mecRefSign').val();
	    if(!checkData(argPayDtBg,argPayDtEd)){
	    	return;
	    }
	    if(!checkData(endDtBg,endDtEd)){
	    	return null;
	    }
	    
	    var new_params = {
			"setOno":setOno,
			"mno":mno,
			"argPayDtBg":argPayDtBg,
			"argPayDtEd":argPayDtEd,
			"orgNo":orgNo,
			"endDtBg":endDtBg,
			"endDtEd":endDtEd,
			"topAgentNo":topAgentNo,
			"payTyp":payTyp,
			"t0Typ":t0Typ,
			"setRefSign":setRefSign,
			"mecRefSign":mecRefSign
		};
		return new_params;
	}
	
	//修改退费标记
	function updateRefSign(optTyp){
		var selectRecords = $("#querySetRefStmtMagGridPanel tbody input:checked");
		if(null !=selectRecords && selectRecords.length==0){
			bootbox.alert("请选择操作数据");
			return;
		}
		var setOnos = "";
		var opNm = "";
		for(i=0;i<selectRecords.length;i++){
			var data = selectRecords[i];
			var index= $(data).attr("rownum");
			var record = tableData.items[index]
			var setRefSign = record.setRefSign;
			if(record.setSts != "付款成功"){
				bootbox.alert( "存在不可修改的结算单");
				return;
			}
			if(optTyp == "03"){
				opNm = "取消标记";
				if(setRefSign == "01" || setRefSign == "02"){
					setOnos = record.setOno+"-"+setOnos;
				}else{
					bootbox.alert( "存在不可修改的结算单");
					return;
				}
			}else{
				opNm = "标记退费";
				if(setRefSign == optTyp){
					bootbox.alert("存在不可修改的结算单");
					return;
				}
				setOnos = record.setOno+"-"+setOnos;
			}
		}
		var param = {
			"setOnos" : setOnos,
			"optTyp"  : optTyp	
		}
		bootbox.confirm( "是否确定要"+opNm,function(y){
			if(y){
				App.blockUI({target:"body",boxed:!0,message:"提交数据中...",zIndex:20000});
				$.ajax({
		            type: "POST",
		            url: baseURL+"/tZero/refStmt/update",
		            contentType: "application/x-www-form-urlencoded;charset=utf-8",
		            data: param,
		            dataType: "json",
		            success: function(data) {
		            	if(data.timeout){
		            		ajaxTimeout();
		                }
		            	bootbox.alert(data.msg,function(){
	            			reloadGrid();		
		            	});
		            },
		            error:function(){
		            	bootbox.alert("连接超时！");
		            }
				});
			}
		});
	}
	
	//查看操作记录
	function refStmtOptHis(setOno){
		App.blockUI({target:"body",boxed:!0,message:"查询数据中...",zIndex:20000});
		$.ajax({
            type: "POST",
            url: baseURL+'/tZero/refStmt/log?setOno='+setOno,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	$("#logGridWin tbody").empty();
            	$.each(data.items,function(index, obj){
           			var tr = $("<tr></tr>").append($("<td>"+(index+1)+"</td>"));
                	tr.append($("<td></td>").text(obj.mno));
                	tr.append($("<td></td>").text(obj.argPayDtBg));
                	tr.append($("<td></td>").text(obj.argPayDtEd));
                	tr.append($("<td></td>").text(obj.erroMsg));
            		$("#logGridWin tbody").append(tr);
           		});
            	$("#logGridWin").modal("show");
            },
            error:function(){
            	bootbox.alert("连接超时！");
            }
		});
		
	}
	
    //查询数据
    function reloadGrid() {
    	$("#querySetRefStmtMagGridPanel tbody").empty();
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
		
    	var query_Path = baseURL + "/tZero/refStmt/query";
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
            	totalCount = data.totalCount;
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
    			
    			var list = {};
    			list.items = data.items;
    			tableData = $.extend(true, {}, list);//cache
                $("#querySetRefStmtMagGridPanel").DataTable().clear().draw();
                $.each(list.items, function(index, obj) {
                	var trData = [];
                	trData.push("<input type=\"checkbox\" data-chkBatNo='"+ obj.chkBatNo +"' class=\"checkboxes\" rownum=\""+index+"\" />");         	
                	
                	trData.push(obj.setOno);
                	trData.push(obj.argPayDt);
                	trData.push(obj.mno);
                	trData.push(obj.mecNm);
                	trData.push(obj.payTyp);
                	if("1"==obj.t0Typ){
                		trData.push('');
					}else{
						trData.push(obj.t0Typ);
					}
                	if(obj.mecRefSign=="01"){
                		trData.push("是");
                	}else{
                		trData.push("否");
                	}
                	trData.push(obj.setAmt);
                	
                	trData.push(obj.setFeeAmt);
                	trData.push(obj.endDt);
              
                	if(obj.setRefSign=="01"){
                		trData.push("投诉");
                	}else if(obj.setRefSign=="02"){
                		trData.push("差错");
                	}else{
                		trData.push("");
                	}
                	trData.push(obj.refOptDt);
                	trData.push(obj.orgNm);
                	trData.push(obj.topAgentNo);
                	trData.push(obj.topAgentNm);
                
                	
                	for(i=0; i < trData.length; i++){
                   		if(trData[i] == undefined){
                   		 	trData[i] = ''; 
                   	 	}
                    }
					$("#querySetRefStmtMagGridPanel").DataTable().row.add(trData).draw();	
                });
                $("#querySetRefStmtMagGridPanel").DataTable().order([1, 'desc']).draw();
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
                $("#pagination-bar").show();
              	//动态设置iframe高度
                var currentTabId = $("#tab-bar", parent.document).children('li.active').children('a').attr('href').replace('#tab_','');
                setIframeHeight($('#frame_'+currentTabId,parent.document)[0]);
            },
            error: function(error) {
            }
        });
	}

  //下拉框加载数据
    function getComboStore(element, type_code) {
    	$.ajax({
            type: "GET",
            url: "/bap/code/query/typ/" + type_code,
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
                $("#" + element).empty();
                $("#" + element).append($("<option></option>").val("").text("全部"));
                $.each(data, function(index, obj) {
                	$("#" + element).append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
                });
              	//更新内容刷新到相应的位置
                $("#" + element).selectpicker('render');
                $("#" + element).selectpicker('refresh');
            },
            error: function(error) {
            }
        });
    }
  
    $(function(){
    	//权限限制
    	if(!hasPermission(PERMISSSIONCONST.SETREF0101)){
    		$("#query_btn").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.SETREF0102)){
    		$("#tuifei_btn").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.SETREF0103)){
    		$("#tousu_btn").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.SETREF0104)){
    		$("#quchutuifei_btn").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.SETREF0105)){
    		$("#bitchtuifei_btn").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.SETREF0106)){
    		$("#bitchdaoru_btn").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.SETREF0107)){
    		$("#caozuojilu_btn").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.SETREF0108)){
    		$("#exportexcel_btn").hide();
    	}
    	
    	getComboStore('setRefStmtForm_payTyp', 'PAY_TYP');
    	getComboStore('setRefStmtForm_t0Typ', 'T0_TYP');
    	getComboStore('importExcelForm_payTyp', 'PAY_TYP');
    	getComboStore('importExcelForm_t0Typ', 'T0_TYP');
    	//初始化日期(将当前日期设置在日期控件中)
    	var date = new Date();
    	$("#setRefStmtForm_argPayDtBg").datepicker('update', date);
    	$("#setRefStmtForm_argPayDtEd").datepicker('update', date);
    	
    	//加载所属分公司
    	var url = baseURL + "/tZero/orgRule/getAllOrgUuids";
		$.ajax({
            type: "GET",
            url: url,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
        //    data: param,
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	 $.each(data, function(index, obj) {
                 	$("#setRefStmtForm_orgNo").append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
   
                 });
               	//更新内容刷新到相应的位置
                 $("#setRefStmtForm_orgNo").selectpicker('render');
                 $("#setRefStmtForm_orgNo").selectpicker('refresh');
            },
            error:function(){
            	
            }
		});
		
		
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		//标记差错退费
		$("#tuifei_btn").on("click",function(){
			updateRefSign("02"); 
		});
		//标记投诉退费
		$("#tousu_btn").on("click",function(){
			updateRefSign("01"); 
		});
		//去除退费标记
		$("#quchutuifei_btn").on("click",function(){
			updateRefSign("03"); 
		});
		
		//批量退费标记操作
		$("#bitchtuifei_btn").on("click",function(){
			$("#fileattr").val("");
			$("#confirmUpload").on("click",function(){
				bootbox.alert("请选择文件！");
        	});
			$("#updateBatWindow").modal("show");
		});
		
		$(document).on('hide.bs.modal',"#updateBatWindow",function () {
			$("#confirmUpload").unbind("click");
		})
		
		//初始化上传插件
		$('#file').fileupload({
	        dataType: 'json',
	        url:baseURL + "/tZero/refStmt/updBat",
	        add: function (e, data) {
	        	$("#fileattr").val(data.files[0].name);
	        	$("#confirmUpload").unbind("click");
	        	$("#confirmUpload").on("click",function(){
	        		bootbox.confirm("确认要批量导入操作吗?",function(y){
	        			if(y){
	        				var optTyp = $('#updateBatForm_optTyp').val();
	        				data.formData ={
								"optTyp":optTyp
 							};
	        				App.blockUI({target:"body",boxed:!0,message:"文件上传中...",zIndex:20000});
	        				data.submit();
	        			}
	        		})
	        	});
	        },
	        done: function (e, data) {
				$("#confirmUpload").unbind("click");
				if(data.result.hasErro){
					bootbox.alert(data.result.msg+"详情如下",function(){
						$("#updBatErroWin tbody").empty();
						$.each(data.result.errors,function(index, obj){
	            			var tr = $("<tr></tr>").append($("<td></td>").text(obj.place));
		                	tr.append($("<td></td>").text(obj.setOno));
		                	tr.append($("<td></td>").text(obj.erroMsg));
		            		$("#updBatErroWin tbody").append(tr);
	            		});
						$("#updBatErroWin").modal("show");
					});
				}else{
					bootbox.alert(data.result.msg);
				}
	        	reloadGrid();
				$("#updateBatWindow").modal("hide");
	        }
	    });
		
		$("#exportuptBatdata").on("click",function(){
			 var opt = "01";
    		 window.open(baseURL+"/tZero/refStmt/exportErro?opt="+opt);
    		 $("#updBatErroWin").modal("hide")
		});
		
		//下载模板
		$("#exportSetStmMagModel").on("click",function(){
			var opt = "01";
			window.open(baseURL+'/tZero/refStmt/download?opt='+opt);
		});
		
		//批量导入操作
		$("#bitchdaoru_btn").on("click",function(){
			$("#bifileattr").val("");
			$("#importExcelconfirmUpload").on("click",function(){
				bootbox.alert("请选择文件！");
			});
			$("#importExcelWindow").modal("show");
		});
		
		$(document).on('hide.bs.modal',"#importExcelWindow",function () {
			$("#importExcelconfirmUpload").unbind("click");
		});
		
		
		$(document).on('hide.bs.modal',"#queryErroWin",function () {
			queryResultWin();
		})
		
		$("#bifile").fileupload({
	        dataType: 'json',
	        url:baseURL + "/tZero/refStmt/queryBat",
	        add: function (e, data) {
	        	$("#bifileattr").val(data.files[0].name);
	        	$("#importExcelconfirmUpload").unbind("click");
	        	$("#importExcelconfirmUpload").on("click",function(){
	        		bootbox.confirm("确认要批量导入查询吗?",function(y){
	        			if(y){
	        				var optTyp = $('#importExcelForm_payTyp').val();
	        				var t0Typ =  $('#importExcelForm_t0Typ').val();
						    var setRefSign =  $('#importExcelForm_setRefSign').val();
						    var mecRefSign =  $('#importExcelForm_mecRefSign').val();
						    data.formData ={
									"payTyp" 	  : optTyp,
									"t0Typ"  	  : t0Typ,
									"setRefSign"  : setRefSign,
									"mecRefSign"  : mecRefSign
							};
	        				App.blockUI({target:"body",boxed:!0,message:"文件上传中...",zIndex:20000});
	        				data.submit();
	        			}
	        		})
	        	});
	        },
	        done: function (e, data) {
	        	$("#importExcelconfirmUpload").unbind("click");
				$("#queryResultGrid_displayInfo").html(data.msg+",查询结果详情如下");
				if(data.result.hasErro){
					$("#queryErrotitle").html(data.result.msg+",失败详情如下");
					$("#queryErroWin tbody").empty();
					$.each(data.result.errors,function(index, obj){
	           			var tr = $("<tr></tr>").append($("<td></td>").text(obj.place));
	                	tr.append($("<td></td>").text(obj.mno));
	                	tr.append($("<td></td>").text(obj.argPayDtBg));
	                	tr.append($("<td></td>").text(obj.argPayDtEd));
	                	tr.append($("<td></td>").text(obj.erroMsg));
	            		$("#queryErroWin tbody").append(tr);
	           		});
					
					$("#queryErroWin").modal("show");
					$("#importExcelWindow").modal("hide");
					reloadGrid();
				}else if(data.result.hasResult){
					$("#queryErrotitle").html(data.result.msg+",查询结果详情如下");
					$("#importExcelWindow").modal("hide");
					queryResultWin();
				}else{
					bootbox.alert(data.result.msg);
					$("#importExcelWindow").modal("hide");
					reloadGrid();
				}
	        	
				//$("#updateBatWindow").modal("hide");
	        }
	    });
		//下载模板
		$("#exportbitchimportModel").on("click",function(){
			var opt = "02";
			window.open(baseURL+'/tZero/refStmt/download?opt='+opt);
		});
		
		//导出错误数据
		$("#importqueryerrdata").on("click",function(){
			var opt = "02";
			window.open(baseURL+"/tZero/refStmt/exportErro?opt="+opt);
			queryResultWin();
			reloadGrid();
			$("#queryErroWin").modal("hide");
		});
		
		//查询操作记录
		$("#caozuojilu_btn").on("click",function(){
			var selectRecords = $("#querySetRefStmtMagGridPanel tbody input:checked");
			if(null ==selectRecords || selectRecords.length==0){
				bootbox.alert("请选择一条数据");
				return;
			}
			if(null !=selectRecords && selectRecords.length>1){
				bootbox.alert("只能选择一条数据数据");
				return;
			}
			var index= $(selectRecords[0]).attr("rownum");
			var record = tableData.items[index]
			var setOno = record.setOno;
			refStmtOptHis(setOno);
		});
		
		//导出结果数据
		$("#importResultdata").on("click",function(){
			window.open(baseURL+"/tZero/refStmt/exportQurResult");
			$('#queryResultWin').modal('hide');
		})
		
		//导出Excel
		$("#exportexcel_btn").on("click",function(){
			if(totalCount>0){
				if(totalCount > 100000){
					bootbox.alert("导出数据大于十万条，请筛选后导出！");
					return;
				}else{
					bootbox.confirm("共"+totalCount+'条数据,确定要导出吗?',function(y){
						if(y){
							window.open(baseURL+"/tZero/refStmt/export")
						}
					})
				}
			}else{
				bootbox.alert("没有可导出的数据！");
			}
		});
   	});
    </script>  
</body>

</html>
