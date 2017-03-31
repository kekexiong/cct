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
		                    	<form action="<%=request.getContextPath()%>/mec/queryData" class="form-horizontal" id="queryMecPanel_Form">
		                            <div class="form-body">
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">商编:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mno" id="mno" class="form-control" placeholder="请输入商户编号">
		                                            </div>
		                                        </div> 
		                                    </div>
		                                   

		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">一代编号:</label>
		                                            <div class="col-md-8 paddingnone"> 
		                                            	<input name="orgUuid" id="orgUuid" class="form-control" placeholder="请输入一代编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
		                                    
		                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">业务状态:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="podMdSts" id="podMdSts" class="bs-select form-control" data-show-subtext="true">
				            								<option value="">全部</option>	
				            								<option value="00">关闭</option>
				            								<option value="01">开通</option>
		                                                </select>
		                                            </div> 
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">所属分公司:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="owningCompany" id=owningCompany class="bs-select form-control" data-show-subtext="true">
		                                                </select>
		                                            </div> 
		                                        </div> 
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">最后操作日期:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange date-picker input-daterange" data-date="2016/08/04" data-date-format="yyyy/mm/dd">
		                                                    <input type="text" class="form-control col-md-3" name="expDtBg" id="expDtBg">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control" name="expDtEd" id="expDtEd"> 
		                                                </div>
		                                            </div>
		                                        </div> 
		                                    </div>
		                                    
		                                      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">秒到日限额:</label>
		                                            <div class="col-md-6 paddingnone"> 
		                                            	<div class="input-group " >
			                                            	 <input type="number"  name="dayLimitAmtBg" id="dayLimitAmtBg" class="form-control col-md-3" placeholder="">
			                                            	 	<span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
			                                            	 <input type="number" name="dayLimitAmtEd" id="dayLimitAmtEd" class="form-control" placeholder="">
		                                            	 </div>
		                                            </div>
		                                             <input type="hidden" id="isDayLimit" value=''/>
		                                             <input type="checkbox"  id="isLimit" /> 无上限
		                                        </div>
		                                    </div> 
		                                    
		                                     
		                                    <div class="clearfix"></div>
		                                    
		                                    <div class="form-actions">
		                                <div class="row">
		                                    <div class="col-md-12">
		                                        <div class="row">
		                                            <div class="col-md-offset-1 col-md-11">
		                                             	<button type="button" id="query_btn" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
		                                             	 <button type="button" id="reset_btn" class="btn red"> <i class="fa fa-refresh"></i> 重置</button>
		                                             	<!--  <button type="button" id="mecq_detail_btn" class="btn tn btn btn-primary"> <i class="fa fa-edit"></i> 查看详情</button>
		                                            	<button type="button" id="down_btn" class="btn btn-success"><i class="fa fa-download"></i>导出excel</button> -->	
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
		                        <table  class="table table-striped table-bordered table-hover table-checkable order-column" id="queryMecGrid">
		                            <thead>
		                                <tr>
		                                	<th>
		                                    	<input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                	<th class="nowrap">序号</th>
		                                    <th class="nowrap">商户编号</th>
		                                    <th class="nowrap">商户名称 </th>
		                                    <th class="nowrap">交易限额 </th>
		                                    <th class="nowrap">业务状态</th>
		                                    <th class="nowrap"> 秒到单笔交易上限 </th>
		                                    <th class="nowrap"> 秒到日限额 </th>
		                                    <th class="nowrap"> 一代名称</th>
		                                    <th class="nowrap"> 一代编号 </th>
		                                    <th class="nowrap"> 分公司 </th>
		                                    <th class="nowrap">最后操作时间 </th>
		                                    <th class="nowrap">进件日期</th>
		                                    <th class="nowrap">业务人员 </th>
		                                    <th class="nowrap">业务人员编号</th>
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

   <!-- 订单详情（Modal） -->
		<div class="modal fade" id="mecMagDdetailWin" tabindex="-1" data-backdrop="static" data-width="1000px">
		         <div class="modal-header">
		            <button type="button" class="close" 
		               data-dismiss="modal" aria-hidden="true">
		                  &times;
		            </button>
		            <h4 class="modal-title" id="">POS秒到商户费率详情</h4>
		         </div>
		         <div class="modal-body">
		            <div class="portlet-body form">
                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="alterform">
                            <div class="form-body">
                                <div class="row norow">
		                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">商户编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="d_mno" readonly id="d_mno" class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">商户名称:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="d_regNm" readonly id="d_regNm" class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">计费产品:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="d_goodsNm" readonly id="d_goodsNm"  class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">内部编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="d_inMno" readonly id="d_inMno"  class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">生效时间:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="d_effDt" readonly id="d_effDt"  class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">失效时间:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="d_expDt" readonly id="d_expDt"  class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>

                                </div>
                                
                                <!-- ----------------------开始----------------------  -->
                                <div class="row norow">
                             		     <div class="portlet light bordered scaffold-list">
		                    <div class="portlet-body">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="queryMecRateGridPanel">
		                            <thead>
		                                <tr>
		                                    <th>规则</th>
		                                    <th>费率 </th>
		                                    <th>固定费用</th>
		                                    <th>封顶金额</th>
		                                    <th>最低收费 </th>
		                                </tr>
		                            </thead>
		                            <tbody id="tbody1">
		                            </tbody>
		                        </table>
		                    </div>
		                    
		            	</div>
                    </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12" style="text-align:center;">
                                                <button type="button" id="detail_cancel_btn" class="btn red"> <i class="fa fa-share"></i>返回</button>
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
    
    	<!-- 订单详情（Modal） -->
		<div class="modal fade" id="posMdMecTranLimitWin" tabindex="-1" data-backdrop="static" data-width="1100px" data-height="400px">
		         <div class="modal-header">
		            <button type="button" class="close" 
		               data-dismiss="modal" aria-hidden="true">
		                  &times;
		            </button>
		            <h4 class="modal-title" id="">查看限额</h4>
		         </div>
		         <div class="modal-body">
		            <div class="portlet-body form">
                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="posMdMecTranLimitform">
                            <div class="form-body">
                                <div class="row norow">
											<h4 class="panel-title">单笔限额</h4>
		                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">IC借记卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="icDdSingleLimit" readonly id="icDdSingleLimit" class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">IC信用卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="icCdSingleLimit" readonly id="icCdSingleLimit" class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">磁条借记卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mgDdSingleLimit" readonly id="mgDdSingleLimit"  class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">磁条信用卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mgCdSingleLimit" readonly id="mgCdSingleLimit"  class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
											<h4 class="panel-title">单卡单日限额</h4>
		                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">IC借记卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="icDdSingleCardLimit" readonly id="icDdSingleCardLimit" class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">IC信用卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="icCdSingleCardLimit" readonly id="icCdSingleCardLimit" class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">磁条借记卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mgDdSingleCardLimit" readonly id="mgDdSingleCardLimit"  class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">磁条信用卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mgCdSingleCardLimit" readonly id="mgCdSingleCardLimit"  class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
											<h4 class="panel-title">日累计限额</h4>
		                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">IC借记卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="icDdDayLimit" readonly id="icDdDayLimit" class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">IC信用卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="icCdDayLimit" readonly id="icCdDayLimit" class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">磁条借记卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mgDdDayLimit" readonly id="mgDdDayLimit"  class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">磁条信用卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mgCdDayLimit" readonly id="mgCdDayLimit"  class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
											<h4 class="panel-title">月累计限额</h4>
		                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">IC借记卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="icDdMonthLimit" readonly id="icDdMonthLimit" class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">IC信用卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="icCdMonthLimit" readonly id="icCdMonthLimit" class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">磁条借记卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mgDdMonthLimit" readonly id="mgDdMonthLimit"  class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-3">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">磁条信用卡:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mgCdMonthLimit" readonly id="mgCdMonthLimit"  class="form-control"  >
		                                            </div>
		                                        </div>
		                                    </div>
                                </div>
                                
                            <br/>
                            <br/>
                            <br/>
                            <br/>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12" style="text-align:center;">
                                                <button type="button" id="tranLimit_cancel_btn" class="btn red"> <i class="fa fa-share"></i>关闭</button>
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
    	$("#queryMecGrid tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
     
  	
    //查询数据
    function reloadGrid() {
		var url=baseURL+"/posMdMecQuery/queryS0MdMecInfoList";
		
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
		
		/* param.orgNo  = $('#orgNo').val();//合作商编号
		param.orgNm  = $('#orgNm').val();//合作商名称 
		param.yMBg = $('#yMBg').val().replace('/', '').replace('/', '').trim(); //开始时间
		param.yMEd   = $('#yMEd').val().replace('/', '').replace('/', '').trim(); //结束时间 */
		
		param.mno=$('#mno').val()
		param.orgUuid=$('#orgUuid').val()
		param.podMdSts=$('#podMdSts').val()
		param.owningCompany=$('#owningCompany').val()
		param.expDtBg=$('#expDtBg').val().replace('/', '').replace('/', '').trim(); //开始时间
		param.expDtEd=$('#expDtEd').val().replace('/', '').replace('/', '').trim();
		param.dayLimitAmtBg=$('#dayLimitAmtBg').val()
		param.dayLimitAmtEd=$('#dayLimitAmtEd').val()
		param.isDayLimit=$('#isDayLimit').val()
		
		if(param.dayLimitAmtBg==''){
			if(param.dayLimitAmtEd!=''){
				bootbox.alert("日限额查询条件不完整");
				return;
			}
		}
		
		if(param.dayLimitAmtEd==''){
			if(param.dayLimitAmtBg!=''){
				bootbox.alert("日限额查询条件不完整");
				return;
			}
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
    			$("#queryMecGrid").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {  
                	var trData = [];
                	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                	trData.push(start + index + 1);
                	
                	trData.push(obj.mno);
                	trData.push(obj.cprRegNmCn);
					trData.push(posMdMecTranLimit(obj));//交易限额
                	trData.push(formatSts(obj.posMdSts));
                	trData.push(obj.limitAmt);
                	trData.push(obj.dayLimitAmt);
                	
                	//trData.push(obj.rat+"%");
                	trData.push(obj.orgNm);
                	trData.push(obj.orgUuid);
                	trData.push(obj.orgCoPanNm);

                	if(obj.dtTime && obj.dtTime!=''){
                		trData.push(obj.dtTime.substring(0,4)+"-"+obj.dtTime.substring(4,6)+"-"+obj.dtTime.substring(6,8)+" "+obj.dtTime.substring(8,10)+":"+obj.dtTime.substring(10,12)+":"+obj.dtTime.substring(12,14));
                	}else{
                		trData.push("");
                	}
                	if(obj.mecDtCte && obj.mecDtCte!=''){
                		trData.push(obj.mecDtCte.substring(0,4)+"-"+obj.mecDtCte.substring(4,6)+"-"+obj.mecDtCte.substring(6,8));
                	}else{
                		trData.push("");
                	}                	
                	trData.push(obj.empNm);
                	trData.push(obj.empNo);
                	
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
    	/* if (!hasPermission(PERMISSSIONCONST.POSMD011)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.POSMD010)) {$("#down_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.POSMD039)) {$("#mecq_detail_btn").hide();} */
		//详情按钮
		$("#mecq_detail_btn").on('click', function() {
			detailQuery();
		});
		
    	//加载数据
    	/* reloadGrid(); */
    	
    	//重置按钮
		 $("#reset_btn").on('click', function() {
			$("#queryMecPanel_Form")[0].reset();
			$("#queryMecPanel_Form .bs-select").selectpicker('val','');//重置select元素
			$("#dayLimitAmtBg").attr('disabled',false);
  			$("#dayLimitAmtEd").attr('disabled',false);  
		});  
    	
    	//查询分公司
    	queryOrgNmComboList();
    	
    	//无上限绑定事件
    	$("#isLimit").bind("click",function(){
    	 var flag = $(this).prop("checked");
    	 
    	 if(flag){
  			$("#dayLimitAmtBg").attr('disabled',true);
  			$("#dayLimitAmtEd").attr('disabled',true);
  			$("#isDayLimit").val("00");
  			$("#dayLimitAmtBg").val('');
  			$("#dayLimitAmtEd").val('');
  		}else{
  			$("#dayLimitAmtBg").attr('disabled',false);
  			$("#dayLimitAmtEd").attr('disabled',false);
  			$("#isDayLimit").val("");
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
					var url = baseURL+"/posMdMecQuery/epexcel";
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
    
    
 	  //  查询所属分公司
 function queryOrgNmComboList(){
 	var url = baseURL+"/tZero/org/queryOrgNmComboList";
 	
 	$.ajax({ 
        type: "GET", 
        url: url, 
        success: function(data){ 
     	   var data = $.parseJSON(data); 
     	  $("#owningCompany").append("<option value=''>全部</option>");
     	
     	     for (var i = 0; i < data.length; i++) {
        	      $("#owningCompany").append("<option value='" + data[i].cdVl + "'>"   + data[i].cdNm   + "</option>"); 
        	     }
     	    //更新内容刷新到相应的位置
             $("#owningCompany").selectpicker('render');
             $("#owningCompany").selectpicker('refresh');
         } 

 });
  }

//格式化状态
function formatSts(item){
	var str = "";
	if("00"==item){
		str = "关闭";
	}
	if("01" == item ){
		str = "开通";
	}
   return str;
} 	  

//格式化时间
function _formatDatetime(datetime) {
	if (datetime === null) {
		return '';
	}
	datetime = new Date(datetime);
	return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) + ' '
			+ _fillZero(datetime.getHours()) + ':' + _fillZero(datetime.getMinutes()) + ':' + _fillZero(datetime.getSeconds());
}
//补零
function _fillZero(data) {
	if (data < 10) {
		return "0" + data;
	}
	return data;
}
//格式化时间
function _formatSimpleDatetime(datetime) {
	if (datetime === null) {
		return '';
	}
	datetime = new Date(datetime);
	return datetime.getFullYear() + _fillZero((datetime.getMonth() + 1)) + _fillZero(datetime.getDate());
}
//格式化字符串时间
function _formatStrtime(datetime) {
	if (datetime === null) {
		return '';
	}
	return datetime.substr(0,datetime.length-2);
}

//详情显示
function detailQuery(){
		
		var record;
		var selectRocords = $("#queryMecGrid tbody input:checked");
		if (selectRocords.length <= 0) {
			bootbox.alert("请选中数据行...");
			return;
		} else if (selectRocords.length > 1) {
			bootbox.alert("只能选择一条数据");
			return;
		} else {
			var index = $(selectRocords[0]).attr("rownum");
			record = tableData.items[index];
			console.log(record);
		}
		
		var url = baseURL + '/tZero/posMd/rateDetail/'+ record.inMno;
		$("#d_mno").val(record.mno);
    	$("#d_regNm").val(record.cprRegNmCn);
    	$("#d_inMno").val(record.inMno);
    	
		/* 初始化订单状态流水   */
			$.ajax({
            type: "POST",
       		url: baseURL + '/tZero/posMd/rateDetail/'+ record.inMno,
            dataType: "json",
            success: function(result) {
            	$("#d_goodsNm").val(result.goodsNm);
            	$("#d_effDt").val(result.effDt);
	        	$("#d_expDt").val(result.expDt);
	        	
            	$("#queryMecRateGridPanel").DataTable().clear().draw();
            	$.each(result.rate,function(index,obj){
            		var trData = [];
                	trData.push(obj.pricSectionNm);
                	trData.push(obj.rate);
                	trData.push(obj.fixedFee);
                	trData.push(obj.maxFee);
                	trData.push(obj.minFee);
                	
                	for(i=0; i < trData.length; i++){
	                   	 if(trData[i] == undefined){
	                   		 trData[i] = ''; 
	                   	 }
	                    }
	                 $("#queryMecRateGridPanel").DataTable().row.add(trData);
            	});
            	  $("#queryMecRateGridPanel").DataTable().order([1, 'desc']).draw();
            	
            },
            error: function(result) {
            	bootbox.alert("读取失败！");
            }
        });
		
		//弹出窗口取消按钮
		$("#detail_cancel_btn").off('click').on('click', function() {
			$("#mecMagDdetailWin").modal('hide');
    	});
    	$("#mecMagDdetailWin").modal('show');
    	
	}
	
	//交易限额
	posMdMecTranLimit = function(obj) {
		var relVal = '';
		/* hasPermission(PERMISSSIONCONST.POSMD025) */
		if (true) {
			var inMno = obj.inMno;
			var str;
			str = "<a href='javascript:void(0);' onclick=queryPosMdMecTranLimit('"
					+ inMno + "')>限额查询</a>	"
			relVal = str;
		}
		return relVal;
	}
	
	function queryPosMdMecTranLimit(inMno){
		
		/* 初始商户限额详情   */
		$.ajax({
			type: "POST",
	   		url: baseURL + '/tZero/posMd/TranLimit/'+ inMno,
	        dataType: "json",
	        success: function(result) {
	        	if(result.success){
	        		var limitInfo = result.limitInfo;
		        	console.log(limitInfo);
		        	$("#icDdSingleLimit").val(limitInfo.icDdSingleLimit);
		        	$("#icCdSingleLimit").val(limitInfo.icCdSingleLimit);
		        	$("#mgDdSingleLimit").val(limitInfo.mgDdSingleLimit);
		        	$("#mgCdSingleLimit").val(limitInfo.mgCdSingleLimit);
		        	
		        	$("#icDdSingleCardLimit").val(limitInfo.icDdSingleCardLimit);
		        	$("#icCdSingleCardLimit").val(limitInfo.icCdSingleCardLimit);
		        	$("#mgDdSingleCardLimit").val(limitInfo.mgDdSingleCardLimit);
		        	$("#mgCdSingleCardLimit").val(limitInfo.mgCdSingleCardLimit);
		        	
		        	$("#icDdDayLimit").val(limitInfo.icDdDayLimit);
		        	$("#icCdDayLimit").val(limitInfo.icCdDayLimit);
		        	$("#mgDdDayLimit").val(limitInfo.mgDdDayLimit);
		        	$("#mgCdDayLimit").val(limitInfo.mgCdDayLimit);
		        	
		        	$("#icDdMonthLimit").val(limitInfo.icDdMonthLimit);
		        	$("#icCdMonthLimit").val(limitInfo.icCdMonthLimit);
		        	$("#mgDdMonthLimit").val(limitInfo.mgDdMonthLimit);
		        	$("#mgCdMonthLimit").val(limitInfo.mgCdMonthLimit);
		        	
		        	$("#posMdMecTranLimitWin").modal('show');
	        	}else{
	        		bootbox.alert(result.msg);
	        	}
	        },
	        error: function(result) {
	        	bootbox.alert("读取失败！");
	        }
		});
		//弹出窗口取消按钮
		$("#tranLimit_cancel_btn").off('click').on('click', function() {
			$("#posMdMecTranLimitWin").modal('hide');
    	});
		
	}

    </script>
    
</body>

</html>
 
