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
        <!-- BEGIN CONTENT -->
        <div class="page-content-wrapper">
		    <!-- 主体-->
		    <!-- <div class="page-content"> -->
		    <div class="">
		        <div class="page-bar">
		            <ul class="page-breadcrumb">
		                <li> <i class="fa fa-home"></i> <a href="index.html">结算增值业务管理</a> <i class="fa fa-minus"></i> </li>
		                <li> <span>秒到等级规则管理</span> </li>
		            </ul>
		        </div>
		        <!-- 右边开始 -->
		        <div class="row">
		            <div class="col-md-12">
		                <div class="portlet light bordered scaffold-list">
		                    <!-- 查询信息 -->
		                    <div class="portlet-body form">
		                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="queryMecPanel_Form">
		                        	<div class="form-body"></div>
		                            <div class="form-actions">
		                                <div class="row">
		                                    <div class="col-md-12">
		                                        <div class="row">
		                                            <div class="col-md-offset-1 col-md-11">
														<button type="button" id="query_btn" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
		                                                <button type="button" id="add_btn" class="btn tn btn btn-primary"><i class="fa fa-edit"></i> 添加</button>
		                                                <button type="button" id="edit_btn" class="btn tn btn btn-primary"> <i class="fa fa-edit"></i> 修改</button>	
		                                                <button type="button" id="delete_btn" class="btn tn btn btn-primary"> <i class="fa fa-edit"></i> 删除</button>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">信息列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table  class="table table-striped table-bordered table-hover table-checkable order-column" id="queryMdLevelGrid">
		                            <thead>
		                                <tr> 
		                                    <th>
		                                    	<input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                    <th class="nowrap"> 等级</th>
		                                    <th class="nowrap"> 等级类型</th>
		                                    <th class="nowrap"> 限额</th>
		                                    <th class="nowrap"> 秒到单笔交易上限</th>
		                                    <th class="nowrap"> 秒到日限额 </th>
		                                    <th class="nowrap"> 结算人认证</th>
		                                    <th class="nowrap"> 信用卡绑定数量</th>
		                                	<th class="nowrap"> 手持身份证照片</th>
		                                	<th class="nowrap"> 有效在网天数</th>
		                                	<!-- <th class="nowrap"> 有效交易笔数 </th>
		                                	<th class="nowrap"> 有效交易天数 </th>
		                                	<th class="nowrap"> 有效交易金额 </th> -->
		                                	<th class="nowrap"> 信用卡有效交易笔数 </th>
		                                	<th class="nowrap"> 信用卡有效交易天数 </th>
		                                	<th class="nowrap"> 信用卡有效交易金额 </th>
		                                	<th class="nowrap"> 阶段活跃天数 </th>
		                                	<th class="nowrap"> 额度使用过半天数 </th>
		                                	<th class="nowrap"> 阶段累计秒到金额 </th>
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
	</div>

<!-- 添加Model -->
	<div class="modal fade" id="addLevelWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true" data-width="1000px">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">添加</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="addLevelForm">
                           <div class="form-body">
                               <div class="row norow">
                               <div class="row">
                               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                               		<div class="form-group">
		                           		<label class="control-label col-md-2 text-right">选择等级</label>
		                            	<div class="col-md-2 paddingnone">
		                                	<select name="ad_levelVl" id="ad_levelVl" class="bs-select form-control" data-show-subtext="true">
				            					<option value="">请选择</option>
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
		                       </div>
		                       <div class="row">
                               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
									<div class="form-group">
			                       		<label for="span-medium-1" class="control-label col-md-6 text-right">秒到单笔上限</label>
			                            <div class="col-md-4 paddingnone">
			                            	<input name="ad_limitAmt" id="ad_limitAmt" class="form-control" />
			                            </div> 
		                       		</div>
		                       	</div>
		                       	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
		                       		<div class="form-group">
			                       		<label for="span-medium-1" class="control-label col-md-6 text-right">秒到日限额</label>
			                            <div class="col-md-4 paddingnone">
			                            	<input id="ad_dayLimitAmt" name="ad_dayLimitAmt" class="form-control"/>
			                            </div> 
		                       		</div>
		                       	</div>
		                       	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
		                       		<div class="form-group">
			                       		<label for="span-medium-1" class="control-label col-md-6 text-right">有效在网天数</label>
			                            <div class="col-md-4 paddingnone">
			                            	<input id="ad_effOnLineDays" name="ad_effOnLineDays" class="form-control"/>
			                            </div> 
		                       		</div>
		                       	</div>
		                       	</div>
		                       	
								<ul id="mdLevelTab" class="nav nav-tabs"> 
									<li class="active"> <a href="#upLevelTab" data-toggle="tab">升级规则</a> </li> 
									<li><a href="#downLevelTab" data-toggle="tab">降级规则</a></li> 
								</ul> 
								<div id="mdLevelTabContent" class="tab-content"> 
								<div class="tab-pane fade in active" id="upLevelTab"> 
									<div class="row">
	                               	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                               		<div class="form-group">
	                                    	<label class="control-label col-md-6 text-right">结算人认证</label>
	                                    	<div class="col-md-4 paddingnone">
			                                	<select name="ad_stmPersonCer" id="ad_stmPersonCer" class="bs-select form-control" data-show-subtext="true">
					            					<option value="">请选择</option>
					            					<option value="01">是</option>	
					            					<option value="00">否</option>
			                                    </select>
			                                </div>
	                                    </div>
	                                </div>    
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                                    <div class="form-group">
	                                    	<label class="control-label col-md-6 text-right">手持身份证</label>
	                                    	<div class="col-md-4 paddingnone">
			                                	<select name="ad_idCrdCer" id="ad_idCrdCer" class="bs-select form-control" data-show-subtext="true">
					            					<option value="">请选择</option>
					            					<option value="01">是</option>	
					            					<option value="00">否</option>
			                                    </select>
			                                </div>
	                                    </div>
	                                </div>    
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                                    <div class="form-group">
				                       		<label for="span-medium-1" class="control-label col-md-6 text-right">信用卡绑定数</label>
				                            <div class="col-md-4 paddingnone">
				                            	<input name="ad_crdNum" id="ad_crdNum" class="bs-select form-control"/>
				                            </div> 
			                       		</div>
	                                </div>
	                                </div>
	                                <div class="row">
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                               		<div class="form-group">
	                                    	<label for="span-medium-1" class="control-label col-md-6 text-right">信用卡有效交易笔数</label>
	                                    	<div class="col-md-4 paddingnone">
				                            	<input name="ad_creditTransNum" id="ad_creditTransNum" class="bs-select form-control"/>
				                            </div>
	                                    </div>
	                                </div> 
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                                    <div class="form-group">
	                                    	<label for="span-medium-1" class="control-label col-md-6 text-right">信用卡有效交易天数</label>
	                                    	<div class="col-md-4 paddingnone">
				                            	<input name="ad_creditTransDays" id="ad_creditTransDays" class="bs-select form-control"/>
				                            </div>
	                                    </div>
	                                </div> 
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                                    <div class="form-group">
				                       		<label for="span-medium-1" class="control-label col-md-6 text-right">信用卡有效交易金额</label>
				                            <div class="col-md-4 paddingnone">
				                            	<input name="ad_creditTransAmt" id="ad_creditTransAmt" class="bs-select form-control"/>
				                            </div> 
			                       		</div>
	                                </div> 
	                                </div>
	                                <div class="row">
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                               		<div class="form-group">
	                                    	<label for="span-medium-1" class="control-label col-md-6 text-right">阶段活跃天数</label>
	                                    	<div class="col-md-4 paddingnone">
				                            	<input name="ad_activeDays" id="ad_activeDays" class="bs-select form-control"/>
				                            </div>
	                                    </div>
	                                </div>
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                                    <div class="form-group">
	                                    	<label for="span-medium-1" class="control-label col-md-6 text-right">额度使用过半天数</label>
	                                    	<div class="col-md-4 paddingnone">
				                            	<input name="ad_limitUsedDays" id="ad_limitUsedDays" class="bs-select form-control"/>
				                            </div>
	                                    </div>
	                                </div>
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                                    <div class="form-group">
				                       		<label for="span-medium-1" class="control-label col-md-6 text-right">阶段累计秒到金额</label>
				                            <div class="col-md-4 paddingnone">
				                            	<input name="ad_stmAmt" id="ad_stmAmt" class="bs-select form-control"/>
				                            </div> 
			                       		</div>
	                                </div> 
	                                </div>  
	                               <div class="clearfix"></div>
								</div> 
								<div class="tab-pane fade" id="downLevelTab"> 
									<div class="row">
	                               	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                               		<div class="form-group">
	                                    	<label class="control-label col-md-6 text-right">结算人认证</label>
	                                    	<div class="col-md-4 paddingnone">
			                                	<select name="ad_stmPersonCerD" id="ad_stmPersonCerD" class="bs-select form-control" data-show-subtext="true">
					            					<option value="">请选择</option>
					            					<option value="01">是</option>	
					            					<option value="00">否</option>
			                                    </select>
			                                </div>
	                                    </div>
	                                </div>    
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                                    <div class="form-group">
	                                    	<label class="control-label col-md-6 text-right">手持身份证</label>
	                                    	<div class="col-md-4 paddingnone">
			                                	<select name="ad_idCrdCerD" id="ad_idCrdCerD" class="bs-select form-control" data-show-subtext="true">
					            					<option value="">请选择</option>
					            					<option value="01">是</option>	
					            					<option value="00">否</option>
			                                    </select>
			                                </div>
	                                    </div>
	                                </div>    
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                                    <div class="form-group">
				                       		<label for="span-medium-1" class="control-label col-md-6 text-right">信用卡绑定数</label>
				                            <div class="col-md-4 paddingnone">
				                            	<input name="ad_crdNumD" id="ad_crdNumD" class="bs-select form-control"/>
				                            </div> 
			                       		</div>
	                                </div>
	                                </div>
	                                <div class="row">
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                               		<div class="form-group">
	                                    	<label for="span-medium-1" class="control-label col-md-6 text-right">信用卡有效交易笔数</label>
	                                    	<div class="col-md-4 paddingnone">
				                            	<input name="ad_creditTransNumD" id="ad_creditTransNumD" class="bs-select form-control"/>
				                            </div>
	                                    </div>
	                                </div> 
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                                    <div class="form-group">
	                                    	<label for="span-medium-1" class="control-label col-md-6 text-right">信用卡有效交易天数</label>
	                                    	<div class="col-md-4 paddingnone">
				                            	<input name="ad_creditTransDaysD" id="ad_creditTransDaysD" class="bs-select form-control"/>
				                            </div>
	                                    </div>
	                                </div> 
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                                    <div class="form-group">
				                       		<label for="span-medium-1" class="control-label col-md-6 text-right">信用卡有效交易金额</label>
				                            <div class="col-md-4 paddingnone">
				                            	<input name="ad_creditTransAmtD" id="ad_creditTransAmtD" class="bs-select form-control"/>
				                            </div> 
			                       		</div>
	                                </div> 
	                                </div>
	                                <div class="row">
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                               		<div class="form-group">
	                                    	<label for="span-medium-1" class="control-label col-md-6 text-right">阶段活跃天数</label>
	                                    	<div class="col-md-4 paddingnone">
				                            	<input name="ad_activeDaysD" id="ad_activeDaysD" class="bs-select form-control"/>
				                            </div>
	                                    </div>
	                                </div>
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                                    <div class="form-group">
	                                    	<label for="span-medium-1" class="control-label col-md-6 text-right">额度使用过半天数</label>
	                                    	<div class="col-md-4 paddingnone">
				                            	<input name="ad_limitUsedDaysD" id="ad_limitUsedDaysD" class="bs-select form-control"/>
				                            </div>
	                                    </div>
	                                </div>
	                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
	                                    <div class="form-group">
				                       		<label for="span-medium-1" class="control-label col-md-6 text-right">阶段累计秒到金额</label>
				                            <div class="col-md-4 paddingnone">
				                            	<input name="ad_stmAmtD" id="ad_stmAmtD" class="bs-select form-control"/>
				                            </div> 
			                       		</div>
	                                </div> 
	                                </div>  
	                               <div class="clearfix"></div>
								</div> 
								</div>
                           </div>
                           </div>
                           <br/>
                           <div class="form-actions form-group">
                               <div class="row">
                                   <div class="col-md-12">
                                       <div class="row">
                                           <div class="col-md-11" align="center">
                                            	<button type="button" id="addLevel_save_btn" class="btn btn-success" ><i class="fa fa-save"></i> 确认</button>
                                               	<button type="button" id="addLevel_cancel_btn" class="btn red" > <i class="fa fa-share"></i>关闭</button>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                           <br/>
                       </form>
                   </div>
	         </div>
		</div>
	</div>
</div>  
   
<!-- 修改Model -->
	<div class="modal fade" id="editLevelWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel1" aria-hidden="true" data-width="1000px" data-height="270px">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">修改</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="editLevelForm">
                           <div class="form-body">
                               <div class="row norow">
                               <div class="row">
                               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                               		<div class="form-group">
		                           		<label class="control-label col-md-2 text-right">修改等级</label>
		                            	<div class="col-md-1 paddingnone">
		                            		<input name="ul_levelVl" id="ul_levelVl" class="bs-select form-control" readonly="readonly"/>
		                                </div> 
		                                <input type="hidden" id="ul_levelType" name="levelType"/>
		                            </div>
		                       </div>
		                       </div>
		                       <div class="row">
                               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
									<div class="form-group">
			                       		<label class="control-label col-md-6 text-right">秒到单笔上限</label>
			                            <div class="col-md-4 paddingnone">
			                            	<input name="ul_limitAmt" id="ul_limitAmt" class="bs-select form-control"/>
			                            </div> 
		                       		</div>
		                       	</div>
		                       	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
		                       		<div class="form-group">
			                       		<label class="control-label col-md-6 text-right">秒到日限额</label>
			                            <div class="col-md-4 paddingnone">
			                            	<input name="ul_dayLimitAmt" id="ul_dayLimitAmt" class="bs-select form-control"/>
			                            </div> 
		                       		</div>
		                       	</div>
		                       	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
		                       		<div class="form-group">
			                       		<label for="span-medium-1" class="control-label col-md-6 text-right">有效在网天数</label>
			                            <div class="col-md-4 paddingnone">
			                            	<input id="ul_effOnLineDays" name="ul_effOnLineDays" class="form-control"/>
			                            </div> 
		                       		</div>
		                       	</div>
		                       	</div>
		                       	<div class="row">
                               	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                               		<div class="form-group">
                                    	<label class="control-label col-md-6 text-right">结算人认证</label>
                                    	<div class="col-md-4 paddingnone">
		                                	<select name="ul_stmPersonCer" id="ul_stmPersonCer" class="bs-select form-control" data-show-subtext="true">
				            					<option value="01">是</option>	
				            					<option value="00">否</option>
		                                    </select>
		                                </div>
                                    </div>
                                </div>    
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                    <div class="form-group">
                                    	<label class="control-label col-md-6 text-right">手持身份证</label>
                                    	<div class="col-md-4 paddingnone">
		                                	<select name="ul_idCrdCer" id="ul_idCrdCer" class="bs-select form-control" data-show-subtext="true">
				            					<option value="01">是</option>	
				            					<option value="00">否</option>
		                                    </select>
		                                </div>
                                    </div>
                                </div>    
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                    <div class="form-group">
			                       		<label class="control-label col-md-6 text-right">信用卡绑定数</label>
			                            <div class="col-md-4 paddingnone">
			                            	<input name="ul_crdNum" id="ul_crdNum" class="bs-select form-control"/>
			                            </div> 
		                       		</div>
                                </div>
                                </div>
                                <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                               		<div class="form-group">
                                    	<label for="span-medium-1" class="control-label col-md-6 text-right">信用卡有效交易笔数</label>
                                    	<div class="col-md-4 paddingnone">
			                            	<input name="ul_creditTransNum" id="ul_creditTransNum" class="bs-select form-control"/>
			                            </div>
                                    </div>
                                </div> 
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                    <div class="form-group">
                                    	<label for="span-medium-1" class="control-label col-md-6 text-right">信用卡有效交易天数</label>
                                    	<div class="col-md-4 paddingnone">
			                            	<input name="ul_creditTransDays" id="ul_creditTransDays" class="bs-select form-control"/>
			                            </div>
                                    </div>
                                </div> 
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                    <div class="form-group">
			                       		<label for="span-medium-1" class="control-label col-md-6 text-right">信用卡有效交易金额</label>
			                            <div class="col-md-4 paddingnone">
			                            	<input name="ul_creditTransAmt" id="ul_creditTransAmt" class="bs-select form-control"/>
			                            </div> 
		                       		</div>
                                </div> 
                                </div>
                                <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                               		<div class="form-group">
                                    	<label class="control-label col-md-6 text-right">阶段活跃天数</label>
                                    	<div class="col-md-4 paddingnone">
			                            	<input name="ul_activeDays" id="ul_activeDays" class="bs-select form-control"/>
			                            </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                    <div class="form-group">
                                    	<label class="control-label col-md-6 text-right">额度使用过半天数</label>
                                    	<div class="col-md-4 paddingnone">
			                            	<input name="ul_limitUsedDays" id="ul_limitUsedDays" class="bs-select form-control"/>
			                            </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                    <div class="form-group">
			                       		<label class="control-label col-md-6 text-right">阶段累计秒到金额</label>
			                            <div class="col-md-4 paddingnone">
			                            	<input name="ul_stmAmt" id="ul_stmAmt" class="bs-select form-control"/>
			                            </div> 
		                       		</div>
                                </div>
                                </div>  
                               <div class="clearfix"></div>
                           </div>
                           </div>
                           <br/>
                           <div class="form-actions form-group">
                               <div class="row">
                                   <div class="col-md-12">
                                       <div class="row">
                                           <div class="col-md-11" align="center">
                                            <button type="button" id="editLevel_save_btn" class="btn btn-success" ><i class="fa fa-save"></i> 确认</button>
                                               <button type="button" id="editLevel_cancel_btn" class="btn red" > <i class="fa fa-share"></i>关闭</button>
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

<div class="modal fade" id="deleteLevelWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel2" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">删除</h4>
	         </div>
	         <div class="modal-body">
	         	确定删除秒到等级？
	         </div>
	         <div class="modal-footer">
	         	<button type="button" id="deleteLevel_save_btn" class="btn btn-success" ><i class="fa fa-save"></i> 确认</button>
                <button type="button" id="deleteLevel_cancel_btn" class="btn red" > <i class="fa fa-share"></i>关闭</button>
	         </div>
		</div>
	</div>
</div>  

<div class="modal fade" id="viewMdLevelLimitWin" tabindex="-1" data-backdrop="static" data-width="1000px">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
			&times;
		</button>
		<h4 class="modal-title" id="">查看限额：</h4>
	</div>
	<div class="modal-body">
		<div class="portlet-body form">
            <form action="" class="form-horizontal" id="viewMdLevelLimitForm">
			<div class="form-body">
			<div class="row norow">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h4 class="panel-title">单笔限额</h4>
					</div>
					<div class="panel-body">
						<div class="row norow">
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group"> 
									<label for="span-medium-2"
										class="control-label col-md-8 text-right">当前限额:IC卡-借记卡:</label>
									<div class="col-md-4 paddingnone">
										<input name="icDdSingleLimit" id="icDdSingleLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group">
									<label class="control-label col-md-6 text-right">磁条卡-借记卡:</label>
									<div class="col-md-6 paddingnone">
										<input name="mgDdSingleLimit" id="mgDdSingleLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group">
									<label class="control-label col-md-6 text-right">IC卡-信用卡:</label>
									<div class="col-md-6 paddingnone">
										<input name="icCdSingleLimit" id="icCdSingleLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group">
									<label class="control-label col-md-6 text-right">磁条卡-信用卡:</label>
									<div class="col-md-6 paddingnone">
										<input name="mgCdSingleLimit" id="mgCdSingleLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row norow">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h5 class="panel-title">单卡单日限额</h5>
					</div>
					<div class="panel-body">
						<div class="row norow">
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group"> 
									<label for="span-medium-2"
										class="control-label col-md-8 text-right">当前限额:IC卡-借记卡:</label>
									<div class="col-md-4 paddingnone">
										<input name="icDdSingleCardLimit" id="icDdSingleCardLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group">
									<label class="control-label col-md-6 text-right">磁条卡-借记卡:</label>
									<div class="col-md-6 paddingnone">
										<input name="mgDdSingleCardLimit" id="mgDdSingleCardLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group">
									<label class="control-label col-md-6 text-right">IC卡-信用卡:</label>
									<div class="col-md-6 paddingnone">
										<input name="icCdSingleCardLimit" id="icCdSingleCardLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group">
									<label class="control-label col-md-6 text-right">磁条卡-信用卡:</label>
									<div class="col-md-6 paddingnone">
										<input name="mgCdSingleCardLimit" id="mgCdSingleCardLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row norow">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h5 class="panel-title">日累计限额</h5>
					</div>
					<div class="panel-body">
						<div class="row norow">
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group"> 
									<label for="span-medium-2"
										class="control-label col-md-8 text-right">当前限额:IC卡-借记卡:</label>
									<div class="col-md-4 paddingnone">
										<input name="icDdDayLimit" id="icDdDayLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group">
									<label class="control-label col-md-6 text-right">磁条卡-借记卡:</label>
									<div class="col-md-6 paddingnone">
										<input name="mgDdDayLimit" id="mgDdDayLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group">
									<label class="control-label col-md-6 text-right">IC卡-信用卡:</label>
									<div class="col-md-6 paddingnone">
										<input name="icCdDayLimit" id="icCdDayLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group">
									<label class="control-label col-md-6 text-right">磁条卡-信用卡:</label>
									<div class="col-md-6 paddingnone">
										<input name="mgCdDayLimit" id="mgCdDayLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row norow">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h5 class="panel-title">月累计限额</h5>
					</div>
					<div class="panel-body">
						<div class="row norow">
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group"> 
									<label for="span-medium-2"
										class="control-label col-md-8 text-right">当前限额:IC卡-借记卡:</label>
									<div class="col-md-4 paddingnone">
										<input name="icDdMonthLimit" id="icDdMonthLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group">
									<label class="control-label col-md-6 text-right">磁条卡-借记卡:</label>
									<div class="col-md-6 paddingnone">
										<input name="mgDdMonthLimit" id="mgDdMonthLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group">
									<label class="control-label col-md-6 text-right">IC卡-信用卡:</label>
									<div class="col-md-6 paddingnone">
										<input name="icCdMonthLimit" id="icCdMonthLimit" class="form-control" readonly>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<div class="form-group">
									<label class="control-label col-md-6 text-right">磁条卡-信用卡:</label>
									<div class="col-md-6 paddingnone">
										<input name="mgCdMonthLimit" id="mgCdMonthLimit" class="form-control" readonly>
									</div>
								</div>
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
		                <div class="col-md-12" style="text-align:center">
		                	<button type="button" id="view_Limit_btn" class="btn red"> <i class="fa fa-close"></i> 关闭</button>
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
    	$("#queryMdLevelGrid tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    } 

    //查询数据
    function reloadGrid() {
    	var url = baseURL + "/tZero/posMdLevel/query"; //查询数据URL 
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
		
		App.blockUI({target:"body",boxed:!0,message:"读取中"});
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
    			$("#queryMdLevelGrid").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	var trData = [];
                	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                	trData.push(obj.levelVl);
                	if(obj.levelType=='00'){
                		trData.push('升级');
                	}else if(obj.levelType='01'){
                    	trData.push('降级'); 
                	}else {
                    	trData.push(''); 
                	}
                	var str = "<a href='javascript:void(0);' onclick=viewTransLimitFun("+obj.levelVl+")>点击查看</a>";
                	trData.push(str);
                	trData.push(obj.limitAmt);
                	trData.push(obj.dayLimitAmt);
                	if(obj.stmPersonCer=='00'){
                		trData.push('否');
                	}else if(obj.stmPersonCer='01'){
                    	trData.push('是'); 
                	}else {
                    	trData.push(''); 
                	}
                	trData.push(obj.crdNum);
                	if(obj.idCrdCer=='00'){
                		trData.push('否');
                	}else if(obj.idCrdCer='01'){
                    	trData.push('是'); 
                	}else {
                    	trData.push(''); 
                	}
                	trData.push(obj.effOnLineDays);
                	trData.push(obj.creditTranNum);
                	trData.push(obj.creditTransDays);
                	trData.push(obj.creditTransAmt);
                	trData.push(obj.activeDays);
                	trData.push(obj.limitUsedDays);
                	trData.push(obj.stmAmt); 
                	
                	for(i=0; i < trData.length; i++){
                   	 	if(trData[i] == undefined){
                   		 	trData[i] = ''; 
                   	 	}
                    }
					$("#queryMdLevelGrid").DataTable().row.add(trData).draw();
                });
                $("#queryMdLevelGrid").DataTable().order([1, 'asc']).draw();
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
	var flag = false;
	
    $(function(){
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.POSMD031)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.POSMD032)) {$("#add_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.POSMD033)) {$("#edit_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.POSMD034)) {$("#delete_btn").hide();}
    	
    	//添加/修改表单的校验
		$('#addLevelForm').validate({
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
				ad_levelVl:{
					required:true
				},
				ad_stmPersonCer:{
					required:true
				},
				ad_idCrdCer:{
					required:true
				},
	        	ad_limitAmt: {
	        		number: true,
		            max:10000000,
		            min:0,
		            required:true
	            },
	            ad_dayLimitAmt: {
	        		number: true,
		            max:10000000,
		            min:0,
		            required:true
	            },
	            ad_effOnLineDays: {
	        		digits: true,
		            max:180,
		            min:0,
		            required:true
	            },
	            ad_crdNum: {
	        		digits:true,
		            max:10000,
		            min:0,
		            required:true
	            },
	            ad_creditTransNum: {
	            	digits: true,
		            max:10000,
		            min:0,
		            required:true
	            },
	            ad_creditTransDays: {
	            	digits: true,
		            max:180,
		            min:0,
		            required:true
	            },
	            ad_creditTransAmt: {
	        		number: true,
		            max:10000000,
		            min:0,
		            required:true
	            },
	            ad_activeDays: {
	            	digits: true,
		            max:180,
		            min:0,
		            required:true
	            },
	            ad_limitUsedDays: {
	            	digits: true,
		            max:180,
		            min:0,
		            required:true
	            },
	            ad_stmAmt: {
	        		number: true,
		            max:10000000,
		            min:0,
		            required:true
	            },
				ad_stmPersonCerD:{
					required:true
				},
				ad_idCrdCerD:{
					required:true
				},
	            ad_crdNumD: {
	        		digits:true,
		            max:10000,
		            min:0,
		            required:true
	            },
	            ad_creditTransNumD: {
	            	digits: true,
		            max:10000,
		            min:0,
		            required:true
	            },
	            ad_creditTransDaysD: {
	            	digits: true,
		            max:180,
		            min:0,
		            required:true
	            },
	            ad_creditTransAmtD: {
	        		number: true,
		            max:10000000,
		            min:0,
		            required:true
	            },
	            ad_activeDaysD: {
	            	digits: true,
		            max:180,
		            min:0,
		            required:true
	            },
	            ad_limitUsedDaysD: {
	            	digits: true,
		            max:180,
		            min:0,
		            required:true
	            },
	            ad_stmAmtD: {
	        		number: true,
		            max:10000000,
		            min:0,
		            required:true
	            }
	        },
	        messages: {
	        	ad_levelVl:{
					required:'不能为空'
				},
				ad_stmPersonCer:{
					required:'不能为空'
				},
				ad_idCrdCer:{
					required:'不能为空'
				},
	        	ad_limitAmt:{
		        	number: "不是有效数值",
	            	max:'该输入项最大值为10000000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ad_dayLimitAmt:{
		        	number: "不是有效数值",
	            	max:'该输入项最大值为10000000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ad_effOnLineDays:{
		        	digits: "请输入0-180的整数",
	            	max:'该输入项最大值为180',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ad_crdNum:{
		        	digits: "请输入0-10000的整数",
	            	max:'该输入项最大值为10000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ad_creditTransNum: {
		        	digits: "请输入0-10000的整数",
	            	max:'该输入项最大值为10000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
	            },
	            ad_creditTransDays: {
	            	digits: "请输入0-180的整数",
	            	max:'该输入项最大值为180',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
	            },
	            ad_creditTransAmt: {
	            	number: "不是有效数值",
	            	max:'该输入项最大值为10000000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
	            },
		        ad_activeDays:{
		        	digits: "请输入0-180的整数",
	            	max:'该输入项最大值为180',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ad_limitUsedDays:{
		        	digits: "请输入0-180的整数",
	            	max:'该输入项最大值为180',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ad_stmAmt:{
		        	number: "不是有效数值",
	            	max:'该输入项最大值为10000000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
				ad_stmPersonCerD:{
					required:'不能为空'
				},
				ad_idCrdCerD:{
					required:'不能为空'
				},
		        ad_crdNumD:{
		        	digits: "请输入0-10000的整数",
	            	max:'该输入项最大值为10000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ad_creditTransNumD: {
		        	digits: "请输入0-10000的整数",
	            	max:'该输入项最大值为10000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
	            },
	            ad_creditTransDaysD: {
	            	digits: "请输入0-180的整数",
	            	max:'该输入项最大值为180',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
	            },
	            ad_creditTransAmtD: {
	            	number: "不是有效数值",
	            	max:'该输入项最大值为10000000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
	            },
		        ad_activeDaysD:{
		        	digits: "请输入0-180的整数",
	            	max:'该输入项最大值为180',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ad_limitUsedDaysD:{
		        	digits: "请输入0-180的整数",
	            	max:'该输入项最大值为180',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ad_stmAmtD:{
		        	number: "不是有效数值",
	            	max:'该输入项最大值为10000000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        }
	        }
	    });
    	
		$('#editLevelForm').validate({
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
	        	ul_limitAmt: {
	        		number: true,
		            max:10000000,
		            min:0,
		            required:true
	            },
	            ul_dayLimitAmt: {
	        		number: true,
		            max:10000000,
		            min:0,
		            required:true
	            },
	            ul_effOnLineDays: {
	        		digits: true,
		            max:180,
		            min:0,
		            required:true
	            },
	            ul_crdNum: {
	            	digits:true,
		            max:10000,
		            min:0,
		            required:true
	            },
	            ul_creditTransNum: {
	            	digits: true,
		            max:10000,
		            min:0,
		            required:true
	            },
	            ul_creditTransDays: {
	            	digits: true,
		            max:180,
		            min:0,
		            required:true
	            },
	            ul_creditTransAmt: {
	        		number: true,
		            max:10000000,
		            min:0,
		            required:true
	            },
	            ul_activeDays: {
	            	digits: true,
		            max:180,
		            min:0,
		            required:true
	            },
	            ul_limitUsedDays: {
	            	digits: true,
		            max:180,
		            min:0,
		            required:true
	            },
	            ul_stmAmt: {
	        		number: true,
		            max:10000000,
		            min:0,
		            required:true
	            }
	        },
	        messages: {
	        	ul_limitAmt:{
		        	number: "不是有效数值",
	            	max:'该输入项最大值为10000000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ul_dayLimitAmt:{
		        	number: "不是有效数值",
	            	max:'该输入项最大值为10000000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ul_effOnLineDays:{
		        	digits: "请输入0-180的整数",
	            	max:'该输入项最大值为180',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ul_crdNum:{
		        	digits: "请输入0-10000的整数",
	            	max:'该输入项最大值为10000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ul_creditTransNum: {
		        	digits: "请输入0-10000的整数",
	            	max:'该输入项最大值为10000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
	            },
	            ul_creditTransDays: {
	            	digits: "请输入0-180的整数",
	            	max:'该输入项最大值为180',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
	            },
	            ul_creditTransAmt: {
	            	number: "不是有效数值",
	            	max:'该输入项最大值为10000000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
	            },
		        ul_activeDays:{
		        	digits: "请输入0-180的整数",
	            	max:'该输入项最大值为180',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ul_limitUsedDays:{
		        	digits: "请输入0-180的整数",
	            	max:'该输入项最大值为180',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        ul_stmAmt:{
		        	number: "不是有效数值",
	            	max:'该输入项最大值为10000000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        }
	        }
	    });

		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		//添加
		$("#add_btn").on('click', function() {
			addLevelFun();
		});
		//修改
		$("#edit_btn").on('click', function() {
			editLevelFun();
		});
		//删除
		$("#delete_btn").on('click', function() {
			deleteLevelFun();
		});
		$("#ad_levelVl").change(function(){  
			$(this).valid();  
		}); 
		$("#ad_stmPersonCer").change(function(){  
			$(this).valid();  
		}); 
		$("#ad_idCrdCer").change(function(){  
			$(this).valid();  
		}); 
		$("#ad_stmPersonCerD").change(function(){  
			$(this).valid();  
		}); 
		$("#ad_idCrdCerD").change(function(){  
			$(this).valid();  
		});
   	});

function addLevelFun(){
	$("#addLevelWin").modal('show');
	$("#addLevelForm")[0].reset();
	$("#addLevelForm .bs-select").selectpicker('val','');
	$("#addLevelForm .form-group").removeClass("has-error");
	$("#addLevelForm .help-block-error").remove();
	
	//绑定取消事件
	$("#addLevel_cancel_btn").off('click').on('click', function() {
		$("#addLevelWin").modal('hide');
		$("#addLevelForm")[0].reset();
		$("#addLevelForm .bs-select").selectpicker('val','');
	});
	//绑定保存事件
	$("#addLevel_save_btn").off('click').on('click', function() {
		if($("#addLevelForm").valid()){  
			var param = {};
			console.log("param="+param);
			param.levelVl = $("#ad_levelVl").val();
			param.limitAmt = $("#ad_limitAmt").val();
			param.dayLimitAmt = $("#ad_dayLimitAmt").val();
			param.stmPersonCer = $("#ad_stmPersonCer").val();
			param.idCrdCer = $("#ad_idCrdCer").val();
			param.crdNum = $("#ad_crdNum").val();
			param.creditTransNum = $("#ad_creditTransNum").val();
			param.creditTransDays = $("#ad_creditTransDays").val();
			param.creditTransAmt = $("#ad_creditTransAmt").val();
			param.activeDays = $("#ad_activeDays").val();
			param.limitUsedDays = $("#ad_limitUsedDays").val();
			param.stmAmt = $("#ad_stmAmt").val();
			console.log("param.creditTransNum="+param.creditTransNum);
			param.stmPersonCerD = $("#ad_stmPersonCerD").val();
			param.idCrdCerD = $("#ad_idCrdCerD").val();
			param.crdNumD = $("#ad_crdNumD").val();
			param.transNumD = $("#ad_transNumD").val();
			param.transDaysD = $("#ad_transDaysD").val();
			param.transAmtD = $("#ad_transAmtD").val();
			param.creditTransNumD = $("#ad_creditTransNumD").val();
			param.creditTransDaysD = $("#ad_creditTransDaysD").val();
			param.creditTransAmtD = $("#ad_creditTransAmtD").val();
			param.activeDaysD = $("#ad_activeDaysD").val();
			param.limitUsedDaysD = $("#ad_limitUsedDaysD").val();
			param.stmAmtD = $("#ad_stmAmtD").val();
			param.effOnLineDays = $("#ad_effOnLineDays").val();
			console.log("param="+param);
			var url =baseURL+'/tZero/posMdLevel/addLevel';
			$.ajax({
				type:'post',
				url : url,
				dataType: "json",
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				data: param,
				success:function(data){
					if (data.success == true) {
						bootbox.alert(data.msg);
						reloadGrid();
					} else {
						bootbox.alert(data.msg);
					}
					$("#addLevelWin").modal('hide');
					$("#addLevelForm")[0].reset();
					$("#addLevelForm .bs-select").selectpicker('val','');
				}
			});
		}else {
            bootbox.alert("输入项数据不正确，验证未通过！");
        }
	});
}

function editLevelFun(){
	var record;
	var selectRocords = $("#queryMdLevelGrid tbody input:checked");
	if (selectRocords.length <= 0) {
		bootbox.alert("请选中要修改的数据行！");
		return;
	} else if (selectRocords.length > 1) {
		bootbox.alert("只能选择一条数据");
		return;
	} else {
		$("#editLevelWin").modal('show');
		$("#editLevelForm")[0].reset();
		$("#editLevelForm .form-group").removeClass("has-error");
		$("#editLevelForm .help-block-error").remove();
		
		var index = $(selectRocords[0]).attr("rownum");
		record = tableData.items[index];
		$("#ul_levelVl").val(record.levelVl);
		$("#ul_levelType").val(record.levelType);
		$("#ul_limitAmt").val(record.limitAmt);
		$("#ul_dayLimitAmt").val(record.dayLimitAmt);
		$("#ul_stmPersonCer").selectpicker('val', record.stmPersonCer);
		$("#ul_idCrdCer").selectpicker('val', record.idCrdCer);
		$("#ul_crdNum").val(record.crdNum);
		$("#ul_creditTransNum").val(record.creditTranNum);
		$("#ul_creditTransDays").val(record.creditTransDays);
		$("#ul_creditTransAmt").val(record.creditTransAmt);
		$("#ul_activeDays").val(record.activeDays);
		$("#ul_limitUsedDays").val(record.limitUsedDays);
		$("#ul_stmAmt").val(record.stmAmt);
		$("#ul_effOnLineDays").val(record.effOnLineDays);
	}
	//绑定取消事件
	$("#editLevel_cancel_btn").off('click').on('click', function() {
		$("#editLevelWin").modal('hide');
		$("#editLevelForm")[0].reset();
		$("#editLevelForm .bs-select").selectpicker('val','');
	});
	//绑定保存事件
	$("#editLevel_save_btn").off('click').on('click', function() {
		if($("#editLevelForm").valid()){  
			var levelVl = $("#ul_levelVl").val();
			var levelType = $("#ul_levelType").val();
			var limitAmt = $("#ul_limitAmt").val();
			var dayLimitAmt = $("#ul_dayLimitAmt").val();
			var stmPersonCer = $("#ul_stmPersonCer").val();
			var idCrdCer = $("#ul_idCrdCer").val();
			var crdNum = $("#ul_crdNum").val();
			var creditTransNum = $("#ul_creditTransNum").val();
			var creditTransDays = $("#ul_creditTransDays").val();
			var creditTransAmt = $("#ul_creditTransAmt").val();
			var activeDays = $("#ul_activeDays").val();
			var limitUsedDays = $("#ul_limitUsedDays").val();
			var stmAmt = $("#ul_stmAmt").val();
			var effOnLineDays = $("#ul_effOnLineDays").val();
			var url =baseURL+'/tZero/posMdLevel/editLevel';
			$.ajax({
				type:'post',
				url : url,
				data:{
					levelVl:levelVl,
					levelType:levelType,
					limitAmt:limitAmt,
					dayLimitAmt:dayLimitAmt,
					stmPersonCer:stmPersonCer,
					idCrdCer:idCrdCer,
					crdNum:crdNum,
					creditTransNum:creditTransNum,
					creditTransDays:creditTransDays,
					creditTransAmt:creditTransAmt,
					activeDays:activeDays,
					limitUsedDays:limitUsedDays,
					stmAmt:stmAmt,
					effOnLineDays:effOnLineDays
				},
				success:function(data){
					data = $.parseJSON(data);
					if (data.success == true) {
						bootbox.alert(data.msg);
						reloadGrid();
					} else {
						bootbox.alert(data.msg);
					}
					$("#editLevelWin").modal('hide');
					$("#editLevelForm")[0].reset();
					$("#editLevelForm .bs-select").selectpicker('val','');
				}
			});
		}else {
            bootbox.alert("输入项数据不正确，验证未通过！");
        }
	});
}

function deleteLevelFun(){
	var record;
	var selectRocords = $("#queryMdLevelGrid tbody input:checked");
	if (selectRocords.length <= 0) {
		bootbox.alert("请选中要删除的数据行！");
		return;
	} else if (selectRocords.length > 1) {
		bootbox.alert("只能选择一条数据");
		return;
	} else {
		var index = $(selectRocords[0]).attr("rownum");
		record = tableData.items[index];
		if(record.levelVl == 1){
			bootbox.alert("当前等级为1，不允许删除");
			return;
		}
		$("#deleteLevelWin").modal('show');
		//绑定取消事件
		$("#deleteLevel_cancel_btn").off('click').on('click', function() {
			$("#deleteLevelWin").modal('hide');
		});
		//绑定保存事件
		$("#deleteLevel_save_btn").off('click').on('click', function() {
			var url =baseURL+'/tZero/posMdLevel/delLevel';
			$.ajax({
				type:'post',
				url : url,
				data:{
					levelVl:record.levelVl,
					levelType:record.levelType,
				},
				success:function(data){
					data = $.parseJSON(data);
					if (data.success == true) {
						bootbox.alert(data.msg);
						reloadGrid();
					} else {
						bootbox.alert(data.msg);
					}
					$("#deleteLevelWin").modal('hide');
				}
			});
		});
	}
}

viewTransLimitFun = function(levelVl){
	var url =baseURL+'/tZero/posMdLevel/viewTransLimit';
	$.ajax({
		type:'post',
		url : url,
		data:{
			levelVl:levelVl,
		},
		success:function(data){
			data = $.parseJSON(data);
			if (data.success == true) {
				$("#icDdSingleLimit").val(data.result.icDdSingleLimit);
				$("#mgDdSingleLimit").val(data.result.mgDdSingleLimit);
				$("#mgCdSingleLimit").val(data.result.mgCdSingleLimit);
				$("#icCdSingleLimit").val(data.result.icCdSingleLimit);
				$("#icDdDayLimit").val(data.result.icDdDayLimit);
				$("#mgDdDayLimit").val(data.result.mgDdDayLimit);
				$("#mgCdDayLimit").val(data.result.mgCdDayLimit);
				$("#icCdDayLimit").val(data.result.icCdDayLimit);
				$("#icCdMonthLimit").val(data.result.icCdMonthLimit);
				$("#mgDdMonthLimit").val(data.result.mgDdMonthLimit);
				$("#mgCdMonthLimit").val(data.result.mgCdMonthLimit);
				$("#icDdMonthLimit").val(data.result.icDdMonthLimit);
				$("#icDdSingleCardLimit").val(data.result.icDdSingleCardLimit);
				$("#mgDdSingleCardLimit").val(data.result.mgDdSingleCardLimit);
				$("#mgCdSingleCardLimit").val(data.result.mgCdSingleCardLimit);
				$("#icCdSingleCardLimit").val(data.result.icCdSingleCardLimit);
				
				$("#view_Limit_btn").off('click').on('click', function() {
					$("#viewMdLevelLimitWin").modal('hide');
		    	});
		    	$("#viewMdLevelLimitWin").modal('show');
			} else {
				bootbox.alert(data.msg);
			}
		}
	});
}
</script>
</body>
</html>
