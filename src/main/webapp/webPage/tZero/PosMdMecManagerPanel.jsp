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
    <input type="hidden" id="data" value=""/> 
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
		                            	<div class="row norow">
		                                   <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">商户编号:</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <input name="mno" id="mno" class="form-control" placeholder="请输入商户编号">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">商户名称:</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <input name="regNm" id="regNm" class="form-control" placeholder="请输入商户名称">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-5 text-right">自动秒到业务状态:</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <select name="posMdSts" id="posMdSts" class="bs-select form-control" data-show-subtext="true">
				            								<option value="">全部</option>	
				            								<option value="01">开通</option>
				            								<option value="00">关闭</option>
		                                                </select>
		                                            </div> 
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">秒到类型:</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <select name="posMdTyp" id="posMdTyp" class="bs-select form-control" data-show-subtext="true">
		                                                </select> 
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
														<button type="button" id="query_btn" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
		                                                 <button type="button" id="reset_btn" class="btn red"> <i class="fa fa-refresh"></i> 重置</button> 
		                                                <button type="button" id="down_btn" class="btn btn-success"><i class="fa fa-download"></i> 下载模板</button>
		                                                <button type="button" id="edit_btn" class="btn tn btn btn-primary"> <i class="fa fa-edit"></i> 开通</button>	
		                                                <button type="button" id="exportexcel_btn" class="btn btn-info"> <i class="fa fa-import"></i> 批量导入操作</button>
		                                                <button type="button" id="detail_btn" class="btn tn btn btn-primary"> <i class="fa fa-edit"></i> 查看费率详情</button>
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
		                    <div class="portlet-body wheel"  >
		                        <table  class="table table-striped table-bordered table-hover table-checkable order-column" id="queryMecGrid">
		                            <thead>
		                                <tr> 
		                                    <th>
		                                    	<input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                    <th class="nowrap"> 商编</th>
		                                    <th class="nowrap"> 商户名称</th>
		                                    <th class="nowrap"> 自动秒到业务状态 </th>
		                                    <th class="nowrap"> 秒到单笔交易上限</th>
		                                    <th class="nowrap"> 秒到日限额</th>
		                                	<th class="nowrap"> 秒到类型</th>
		                                	<th class="nowrap"> 等级</th>
		                                	<th class="nowrap"> 等级状态</th>
		                                	<th class="nowrap"> 开通渠道 </th>
		                                	<th class="nowrap"> 动作类型 </th>
		                                	<th class="nowrap"> 操作记录 </th>
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
<!-- Excel的模态框（Modal） -->
	<div class="modal fade" id="exportExcelWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
	                  &times;
	        </button>
	        <h4 class="modal-title" id="">批量导入操作</h4>
	    </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="exportform">
                           <div class="form-body">
                               <div class="row norow">
                                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right">操作类型:</label>
                                             <div class="col-md-8 paddingnone">
		                                                <select name="_optTyp" id="_optTyp" class="bs-select form-control" data-show-subtext="true">
		                                                    <option value="">请选择</option>
				            								<option value="01">开通</option> 
				            								<option value="00">关闭</option>  
				            								<option value="03">修改限额</option>
				            								<option value="04">修改日限额</option>
				            								<option value="05">修改等级</option>
				            								<option value="06">修改等级状态</option>
		                                                </select>
		                                      </div> 
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-2 text-right" id="exp_goodsId_Title">计费产品:</label>
		                                            <div class="col-md-8 paddingnone" id="exp_goodsId_check">
		                                                <select name="export_goodsId" id="export_goodsId" class="bs-select form-control" data-show-subtext="true">
		                                   
		                                                </select>
		                                                <!-- 手动书写加载信息  export_goodsId -->
		                                            </div>
		                                        </div>
		                                    </div>
                               
	                               		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
	                                        <div class="form-group"> 
	                                            <label class="control-label col-md-2 text-right">操作备注:</label>
	                                            <div class="col-md-8 paddingnone">
	                                                <input id="_rmk" class="bs-select form-control"  data-show-subtext="true"/>
	                                            </div>
	                                            <label class="control-label col-md-2 text-right"></label>
	                                        </div>
	                                    </div>
                               
                               
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                       <div class="form-group">
                                           <label for="span-medium-2" class="control-label col-md-4 text-right">选择文件:</label>
                                           <label class="checkbox-inline">
										      <input type="file" name="file" id="file"   checked aria-label="...">
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
                                           <div class="col-md-offset-1 col-md-11">
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
    <!-- Excel的模态框（Modal） -->
	<div class="modal fade" id="downLoadExcelWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">下载模板</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="exportform">
                           <div class="form-body">
                               <div class="row norow">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right"></label>
                                            <div class="col-md-8 paddingnone">
                                                <input type="button" id="download1" value="点击下载开通关闭模板" style="margin-left:-50px" class="bs-select form-control"  data-show-subtext="true"/>
                                            </div>
                                        </div>
                                    </div>
                                    
                                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right"></label>
                                            <div class="col-md-8 paddingnone">
                                                <input type="button" id="download2" value="点击下载修改费率模板" style="margin-left:-50px" class="bs-select form-control"  data-show-subtext="true"/>
                                            </div>
                                        </div> 
                                    </div>
                                    
                                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right"></label>
                                            <div class="col-md-8 paddingnone">
                                                <input type="button" id="download3" value="点击下载修改限额模板" style="margin-left:-50px" class="bs-select form-control"  data-show-subtext="true"/>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right"></label>
                                            <div class="col-md-8 paddingnone">
                                                <input type="button" id="download4" value="点击下载修改等级模板" style="margin-left:-50px" class="bs-select form-control"  data-show-subtext="true"/>
                                            </div>
                                        </div> 
                                    </div>
                                    
                                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right"></label>
                                            <div class="col-md-8 paddingnone">
                                                <input type="button" id="download5" value="点击下载修改等级状态模板" style="margin-left:-50px" class="bs-select form-control"  data-show-subtext="true"/>
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
                                               <button type="button" id="downLoad_cancel_btn" class="btn red" style="margin-left:150px"> <i class="fa fa-share"></i>关闭</button>
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
   

  <!-- 动作类型关闭操作Model -->
	<div class="modal fade" id="closeWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">动作原因</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="closeForm">
                           <div class="form-body">
                               <div class="row norow">
                               <input type="hidden" name="c_mon" id="c_mon" />
                               <input type="hidden" name="c_type" id="c_type" />
		                                    
                               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-2 text-right" id="c_goodsId_Title">计费产品:</label>
		                                            <div class="col-md-8 paddingnone" id="c_goodsId_check">
		                                                <select name="c_goodsId" id="c_goodsId" class="bs-select form-control" data-show-subtext="true">
		                                   
		                                                </select>
		                                                <!-- 手动书写加载信息  c_goodsId -->
		                                            </div>
		                                        </div>
		                                    </div>
                               
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                                  <label class="control-label col-md-2 text-right">动作原因:</label>
                                                 <div class="col-md-8 paddingnone">
                                                    <textarea name="c_rmk" data-provide="markdown" id="c_rmk" rows="10" data-width="250" class="form-control"></textarea>
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
                                            <button type="button" id="close_save_btn" class="btn btn-success" ><i class="fa fa-save"></i> 确认</button>
                                               <button type="button" id="close_cancel_btn" class="btn red" > <i class="fa fa-share"></i>关闭</button>
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

 
 <!-- 文件模板导入 -->
	<div class="modal fade" id="importExcelWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="excelTitle">新增商户</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="addUserform">
                           <div class="form-body">
                               <div class="row norow">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right">商户编号:</label>
                                            <div class="col-md-6 paddingnone">
                                                <input id="_mno" class="bs-select form-control"  data-show-subtext="true"/>
                                            </div>
                                            <label class="control-label col-md-2 text-right"><input type="button" id="queryMessage" value="查询" style="width:50px;height:28px;margin-bottom:5px;margin-top:-4px"/></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-2 text-right" id="_goodsId_Title">计费产品:</label>
		                                            <div class="col-md-6 paddingnone" id="_goodsId_check">
		                                                <select name="_goodsId" id="_goodsId" class="bs-select form-control" data-show-subtext="true">
		                                   
		                                                </select>
		                                                <!-- 手动书写加载信息  _goodsId -->
		                                            </div>
		                                        </div>
		                                    </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right">商户名称:</label>
                                            <div class="col-md-6 paddingnone">
                                                <input id="_regNm"  disabled="disabled" class="bs-select form-control"  data-show-subtext="true"/>
                                            </div>
                                        </div>
                                    </div>
                                       <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label class="control-label col-md-2 text-right">一代名称:</label>
                                            <div class="col-md-6 paddingnone">
                                                <input id="_orgNm" disabled="disabled"  class="bs-select form-control"  data-show-subtext="true"/>
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
   
<!-- 修改限额Model -->
	<div class="modal fade" id="updateLimitWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">修改限额</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="updateLimitForm">
                           <div class="form-body">
                               <div class="row norow">
                               <input type="hidden" id="ul_mno" />
                               <input type="hidden" id="ul_limitAmt" />
                               <input type="hidden" id="ul_dayLimitAmt" />
                               <input type="hidden" id="ul_isDayLimit" />
                               
                               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-2 text-right">限额类型:</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <select name="limitType" id="limitType" class="bs-select form-control" data-show-subtext="true">
				            								<option value="">请选择</option>
				            								<option value="00">秒到单笔交易上限</option>	
				            								<option value="01">秒到日限额</option>
		                                                </select> 
		                                            </div> 
		                                        </div>
		                                    </div>
		                                    
                               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
		                                        <div class="form-group">
		                                            <label class="control-label col-md-2 text-right">当前限额:</label>
		                                            <div class="col-md-8 paddingnone">
		                                               <input name="ul_oldLimitAmt" id="ul_oldLimitAmt" class="bs-select form-control" disabled="disabled"  	 data-show-subtext="true"/>
		                                            </div> 
		                                        </div>
		                                    </div>
                               
                               
                                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
		                                        <div class="form-group">
		                                            <label class="control-label col-md-2 text-right">变更限额:</label>
		                                            <div class="col-md-8 paddingnone">
		                                               <input name="ul_limitAmtNew" id="ul_limitAmtNew" class="bs-select form-control" size="15"  type="number" placeholder="填写新限额"  data-show-subtext="true"/>
		                                            </div> 
		                                            <label class="control-label col-md-2 text-right" id="ul_checkbox"><input type="checkBox" id="ul_check" >无上限</label>
		                                        </div>
		                                    </div>
                               
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                                  <label class="control-label col-md-2 text-right">操作备注:</label>
                                                 <div class="col-md-8 paddingnone">
                                                    <textarea name="ul_rmk" data-provide="markdown" id="ul_rmk" rows="10" data-width="250" class="form-control"></textarea>
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
                                            <button type="button" id="updateLimit_save_btn" class="btn btn-success" ><i class="fa fa-save"></i> 确认</button>
                                               <button type="button" id="updateLimit_cancel_btn" class="btn red" > <i class="fa fa-share"></i>关闭</button>
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
      
<!-- 修改等级Model -->
	<div class="modal fade" id="updateMecLevelWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">修改等级</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="updateMecLevelForm">
                           <div class="form-body">
                               <div class="row norow">
                               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
		                                        <div class="form-group">
		                                            <label class="control-label col-md-2 text-right">当前等级:</label>
		                                            <div class="col-md-8 paddingnone">
		                                               <input id="ul_oldMecLevel" class="bs-select form-control" disabled="disabled"  	 data-show-subtext="true"/>
		                                            </div> 
		                                        </div>
		                                    </div>
                               
                               
                                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
		                                        <div class="form-group">
		                                            <label class="control-label col-md-2 text-right">变更等级:</label>
		                                            <div class="col-md-8 paddingnone">
		                                               <input name="ul_mecLevel" id="ul_mecLevel" class="bs-select form-control" size="10"  type="number" data-show-subtext="true"/>
		                                            </div> 
		                                        </div>
		                                    </div>
                               
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                                  <label class="control-label col-md-2 text-right">操作备注:</label>
                                                 <div class="col-md-8 paddingnone">
                                                    <textarea name="mecLevel_rmk" data-provide="markdown" id="mecLevel_rmk" rows="10" data-width="250" class="form-control"></textarea>
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
                                            <button type="button" id="updateMecLevel_save_btn" class="btn btn-success" ><i class="fa fa-save"></i> 确认</button>
                                               <button type="button" id="updateMecLevel_cancel_btn" class="btn red" > <i class="fa fa-share"></i>关闭</button>
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

<!-- 修改等级状态Model -->
	<div class="modal fade" id="updateLevelStatusWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">修改等级状态</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="updateLevelStatusForm">
                           <div class="form-body">
                               <div class="row norow">
                               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
		                                        <div class="form-group">
		                                            <label class="control-label col-md-2 text-right">当前等级状态:</label>
		                                            <div class="col-md-8 paddingnone">
		                                               <input id="ul_oldLevelStatus" class="bs-select form-control" disabled="disabled"  	 data-show-subtext="true"/>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    
                                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
		                                        <div class="form-group">
		                                            <label class="control-label col-md-2 text-right">变更等级状态:</label>
		                                            <div class="col-md-8 paddingnone">
		                                            <select name="ul_levelStatus" id="ul_levelStatus" class="bs-select form-control" data-show-subtext="true">
				            								<option value="">请选择</option>
				            								<option value="00">不升不降</option>	
				            								<option value="01">可升可降</option>
				            								<option value="02">只升不降</option>
		                                                </select>
		                                            </div> 
		                                        </div>
		                                    </div>
                               
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                                  <label class="control-label col-md-2 text-right">操作备注:</label>
                                                 <div class="col-md-8 paddingnone">
                                                    <textarea name="levelStatus_rmk" data-provide="markdown" id="levelStatus_rmk" rows="10" data-width="250" class="form-control"></textarea>
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
                                            <button type="button" id="updateLevelStatus_save_btn" class="btn btn-success" ><i class="fa fa-save"></i> 确认</button>
                                               <button type="button" id="updateLevelStatus_cancel_btn" class="btn red" > <i class="fa fa-share"></i>关闭</button>
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

<!-- 操作记录查询Model -->
	<div class="modal fade" id="queryPosMdOptLogWin" tabindex="-1" style="height: 66px; width: 160px;" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">操作记录</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="queryPosMdOptLogForm">
                           <div class="form-body">
                               <div class="row norow">
                               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
		                                        <div class="form-group">
		                                            <label class="control-label col-md-2 text-right">操作记录类型:</label>
		                                            <div class="col-md-8 paddingnone">
		                                            	<select name="log_optTyp" id="log_optTyp" class="bs-select form-control" data-show-subtext="true">
				            								<option value="">请选择</option>
				            								<option value="01">业务状态记录</option>
				            								<option value="02">单笔限额变更记录</option>
				            								<option value="03">日限额变更记录</option>
				            								<option value="04">等级变更记录</option>
				            								<option value="05">等级状态变更记录</option>
		                                                </select>
		                                            </div> 
		                                        </div>
		                                        <div class="col-md-offset-1 col-md-11">
														<button type="button" id="log_query_btn"
															class="btn btn-success">
															<i class="fa fa-search"></i> 查询
														</button>
												</div>
		                                    </div>
                                   <div class="clearfix"></div>
                               </div>
                           </div>
					</form>
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
    	$("#queryMecGrid tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
    //关闭下载弹窗
    $("#downLoad_cancel_btn").bind('click',function(){
    	$("#downLoadExcelWin").modal('hide');
    })
    
    $("#download1").bind("click",function(){
    	window.location.href=baseURL+"/tZero/posMd/downloadTemplate?downType=01";
    	$("#downLoadExcelWin").modal('hide');
    })	
    
    $("#download2").bind("click",function(){
    	window.location.href=baseURL+"/tZero/posMd/downloadTemplate?downType=02";
    	$("#downLoadExcelWin").modal('hide');
    })	
     
    $("#download3").bind("click",function(){
    	window.location.href=baseURL+"/tZero/posMd/downloadTemplate?downType=03";
    	$("#downLoadExcelWin").modal('hide');
    })
    
    $("#download4").bind("click",function(){
    	window.location.href=baseURL+"/tZero/posMd/downloadTemplate?downType=04";
    	$("#downLoadExcelWin").modal('hide');
    })	
     
    $("#download5").bind("click",function(){
    	window.location.href=baseURL+"/tZero/posMd/downloadTemplate?downType=05";
    	$("#downLoadExcelWin").modal('hide');
    })
    
    
  	
    //查询数据
    function reloadGrid() {
    	var url = baseURL + "/tZero/posMd/query"; //查询数据URL 
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
		
		
		param.mno = $('#mno').val(); //商务编号
		param.regNm = $('#regNm').val();//终端编号
		param.posMdSts = $('#posMdSts').val();//终端编号
		param.posMdTyp = $('#posMdTyp').val();//终端编号
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
            	console.log(data);
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
                //$("#queryMecGrid tbody").empty();
                //data = Object {items: Array[20], totalCount: 269}
                $.each(data.items, function(index, obj) {
                	var trData = [];
                	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                	
                	trData.push(obj.mno);
                	trData.push(obj.regNm);
                	
                	if(obj.posMdSts=='00'){
                		trData.push('关闭');
                	}else if(obj.posMdSts='01'){
                    	trData.push('开通'); 
                	}else {
                    	trData.push(''); 
                	}
                	
                	trData.push(obj.limitAmt); 
                	if(obj.isDayLimit=='01'){
                		trData.push(obj.dayLimitAmt);
                	}else if(obj.isDayLimit='00'){
                		trData.push('无上限'); 
                	}else {
                		trData.push(''); 
                	}
                	trData.push(obj.posMdTyp);
                	if(obj.mecLevel == "" || obj.mecLevel == null ){
                		trData.push("");
                	}else{
                		trData.push(obj.mecLevel+"级");
                	}
                	trData.push(obj.mecLevelStatus);
                	trData.push(obj.openSysFlag);
                	var type = actType(obj); //动作类型
                	var record = oprateRecord(obj); //操作记录
                	trData.push(type); 
                	trData.push(record);
                	
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
                
             	 //控制 复选框只能选中一个
           		 $('input[type=checkbox]').bind('click', function(){
	       		 $('input[type=checkbox]').not(this).attr("checked", false);
	       		 }); 
              //绑定 变更状态事件
            	$("a[name='changests']").bind("click", changests);  
            },
            error: function(error) {
            	bootbox.alert("读取失败！");
            }
        });
	}
    var queryMethod=0;
    
   //跳转到变更状态页面
   function changests(){
	   var uuid = $(this).attr("UUID");
	    $.fancybox({afterLoad:fancyboxCenterOnViewport,
   		href:'SecondCfmUpdatePanel.jsp?uuid='+uuid,  
   		type: 'iframe',
   		padding: 5,
   		margin:60, 
   		scrolling: 'no',
   		fitToView: true,
   		width: 1000,
   		height: 800,
   		autoSize: false, 
   		autoResize:false,
   		closeClick: false,
   		afterClose:function(){
   			reloadGrid();
   		} 
   	}); 
   } 
	var flag = false;
    $(function(){
    	
    	/*初始化页面按钮权限*/
    	
    	if (!hasPermission(PERMISSSIONCONST.POSMD008)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.POSMD009)) {$("#down_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.POSMD004)) {$("#edit_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.POSMD005)) {$("#exportexcel_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.POSMD038)) {$("#detail_btn").hide();}
    	//隐藏费率
    	$("#ul_checkbox").hide();
    	$("#download2").hide();
    	$("#exp_goodsId_Title").hide();
    	$("#exp_goodsId_check").hide();
    	$("#c_goodsId_Title").hide();
    	$("#c_goodsId_check").hide();
    	
    	getComboStore('posMdTyp', 'POS_MD_TYP');
    	
    	$("#_optTyp").bind("change", function() {
    		var optTyp = $("#_optTyp").val();
    		if(optTyp=="01"){
				$("#exp_goodsId_Title").show();
				$("#exp_goodsId_check").show();
			}else{
				$("#exp_goodsId_Title").hide();
				$("#exp_goodsId_check").hide();
			}
		});
    	
    	loadGoodId("export_goodsId");
    	loadGoodId("_goodsId");
    	loadGoodId("c_goodsId");
    	//限额类型绑定事件
    	$("#limitType").bind("change", function() {
				var val = $(this).val();
				var limitAmt = $("#ul_limitAmt").val();
				var dayLimitAmt = $("#ul_dayLimitAmt").val();
				var isDayLimit = $("#ul_isDayLimit").val();
				if (val == "00") {
					$("#ul_oldLimitAmt").val(limitAmt);
					$("#ul_checkbox").hide();
				} else if (val == "01") {
					$("#ul_checkbox").show();
					if(isDayLimit == "01"){
						$("#ul_oldLimitAmt").val(dayLimitAmt);
					}else{
						$("#ul_oldLimitAmt").val("无上限");
					}
				}
			});
    	//无上限选定事件
    	$("#ul_check").bind("click",function(){
    		var check = $(this).prop("checked");
    		console.log(check);
    		if(check){
    			$("#ul_limitAmtNew").attr("readonly",true);
    			$("#ul_limitAmtNew").val("");
    		}else{
    			$("#ul_limitAmtNew").attr("readonly",false);
    			$("#ul_limitAmtNew").val("");
    		} 
    	});
    	
    	//添加/修改表单的校验
		$('#updateLimitForm').validate({
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
				limitType:{
					required:true
				},
				ul_oldLimitAmt:{
					required:true
				},
				ul_limitAmtNew: {
					number: true,
		            max:10000000,
		            min:0
	            },
	            ul_rmk:{
					required:true
				}
	        },
	        messages: {
	        	limitType:{
					required:'不能为空'
				},
				ul_oldLimitAmt:{
					required:'不能为空'
				},
				ul_limitAmtNew: {
					number: "不是有效数值",
	            	max:'该输入项最大值为10000000',
	            	min:'该输入项最小值为0'
	            },
		        ul_rmk:{
					required:'不能为空'
				}
	        }
	    });
    	
		//添加/修改表单的校验
		$('#updateMecLevelForm').validate({
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
				ul_mecLevel: {
					number: true,
		            max:10000,
		            min:0,
		            required:true
	            },
	            mecLevel_rmk:{
					required:true
				}
	        },
	        messages: {   
	        	ul_mecLevel:{
		        	number: "不是有效数值",
	            	max:'该输入项最大值为10000000',
	            	min:'该输入项最小值为0',
	            	required:'不能为空'
		        },
		        mecLevel_rmk:{
					required:'不能为空'
				}
	        }
	    });
    	
    	
    	//异步查询状态
		/* querySts(); */
    	
    	//自动秒到业务状态 默认选择开通
    	$("#posMdSts option[value='01']").attr("selected", true);
    	//更新内容刷新到相应的位置 
        $("#posMdSts").selectpicker('render');
        $("#posMdSts").selectpicker('refresh');
		
		
    	//推送类型选中事件
    	$("#_pushType").bind("change",function(){
    		var type = $("#_pushType").val()
    		if(type=='02'){
    			$("#_smsPassDiv").show();
    			$("#_sengMsgInfoDiv").show();
    		}else{
    			$("#_smsPassDiv").hide();
    			$("#_sengMsgInfoDiv").hide();
    		}
    		
    	})
    	
    	
    	//添加/修改表单的校验
		$('#addform').bootstrapValidator({trigger:'blur',
	        fields: {
	        	usrNm: {
	                validators: {
	                    notEmpty: {
	                        message: '用户名称必填'
	                    },
	                    stringLength: {
	                    	max: '32',
	                    	message: '用户名称不能超过32个字符'
	                    }
	                }
	            }
	        },
	        submitHandler: function(validator, form, submitButton) {
	            /* var fullName = [validator.getFieldElements('firstName').val(),
	                            validator.getFieldElements('lastName').val()].join(' ');
	            $('#helloModal')
	                .find('.modal-title').html('Hello ' + fullName).end()
	                .modal(); */
	        }
	    });

		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		//重置按钮
		 $("#reset_btn").on('click', function() {
			$("#queryMecPanel_Form")[0].reset();
			$("#queryMecPanel_Form .bs-select").selectpicker('val','01');//重置select元素
			 
	    	//更新内容刷新到相应的位置  
			/* $("#posMdSts").find("option[value='01']").attr("selected", true);
	        $("#posMdSts").selectpicker('render');  */
	       /*  $("#posMdSts").selectpicker('refresh');  */
		}); 
		
		//模板下载
		$("#down_btn").bind("click",function(){
				/* window.location.href = baseURL+"/tzeroStl/downloadExcel";	 */	
			$("#downLoadExcelWin").modal("show");	
				
		});
	
		
		//开通页面查询
		$("#queryMessage").bind("click",function(){
			var url = baseURL+"/tZero/posMd/queryMec";
			var mno = $("#_mno").val();
			
			if(mno==''){
				bootbox.alert("请输入商户编号!");
				return;
			}
			
			$.ajax({
				url:url,
				type:"POST",
				data:{mno:mno},
				success:function(data){
					data = $.parseJSON(data);
					if(data.success){
						$("#_orgNm").val(data.orgNm);
						$("#_regNm").val(data.regNm); //商户名称
						flag = true;
					}else{
						bootbox.alert(data.msg);
					}
				}
			});
			
		});
		
		
		
		
		//修改限额页面
		$("#edit_btn").on('click', function() {
			openImportExcelWin();
		});
		 
		
		//批量导入excel修改
		// 批量修改随意通工作日费率
		 $("#exportexcel_btn").on('click', function() {
			$("#exportform")[0].reset();
			$("#exportform .bs-select").selectpicker('val','');
			$("#exportform .form-group").removeClass("has-error");
			$("#exportform .help-block-error").remove();
			
			$("#_rmk").val("");
			$("#exportExcelWin").modal('show');
			
			batchOpt('04');
			$("#exportform_cancel_btn").off('click').on('click', function() {
				$("#exportExcelWin").modal('hide');
				$("#exportform")[0].reset();
				$("#exportform .bs-select").selectpicker('val','');
				$("#_optTyp").trigger('change');
			});
			
		});
		
		//详情按钮
		$("#detail_btn").on('click', function() {
			detailQuery();
		});
		
		$("#limitType").change(function(){  
			$(this).valid();  
		}); 
   	});
    
//修改限额s
function openImportExcelWin(){
	$("#addUserform")[0].reset();
	$("#importExcelWin .bs-select").selectpicker('val','');
	$("#importExcelWin .form-group").removeClass("has-error");
	$("#importExcelWin .help-block-error").remove();
    	//弹出窗口取消按钮
		$("#importform_cancle_btn").off('click').on('click', function() { 
			flag =false;
			$("#importExcelWin").modal('hide');
			$("#addUserform")[0].reset();
			$("#importExcelWin .bs-select").selectpicker('val','');
    	});

    	//开通保存
		$("#importform_save_btn").off('click').on('click', function() { 
			$('#importform_save_btn').prop('disabled', true);
			var mno =  $("#_mno").val();
			var goodsId = $("#_goodsId").val().split(",")[0];
			var posMdTyp = $("#_goodsId").val().split(",")[1];
			var regNm =  $("#_regNm").val();
			var orgNm = $("#_orgNm").val();
			if(goodsId==''){
				bootbox.alert('请填选择计费产品');
				$('#importform_save_btn').prop('disabled', false);
				return;
			}
			if(flag&&posMdTyp!=''&&regNm!=''&&orgNm!=''){
				var url=baseURL+"/tZero/posMd/doOpen";
				bootbox.confirm("确认要提交吗？", function(flg){
					if(flg){
						$("#importExcelWin").modal('hide');
			    		App.blockUI({target:"body",boxed:!0,message:"正在处理中，请稍等...",zIndex:20000});
						$.ajax({
							url:url,
							type:"post",
							data:{
								mno : mno,
								rmk : '',
								posMdTyp : posMdTyp,
								goodsId : goodsId
							},
							success:function(data){
								data = $.parseJSON(data);
								if(data.success){
									reloadGrid();
									$("#addUserform")[0].reset();
									bootbox.alert(data.msg);
								}else{
									bootbox.alert(data.msg);
								}
								$("#addUserform")[0].reset();
								$('#importform_save_btn').prop('disabled', false);
							},
							error:function(e){
					        	bootbox.alert("系统异常");
					        	$('#importform_save_btn').prop('disabled', false);
					        }
						});
					}else{
						bootbox.alert("请检查输入项是否正确!");
						$('#importform_save_btn').prop('disabled', false);
						return;
					}
		    	});
			}
		});
    	$("#importExcelWin").modal('show');
    }
       
//  查询所属分公司
function querySts(){
	var url = baseURL+"/code/query/typ/TZERO_STL_STS";
	$.ajax({ 
       type: "GET", 
       url: url, 
       success: function(data){ 
    	  console.log(data);
    	   var data = $.parseJSON(data); 
    	  $("#stlSts").append("<option value=''>全部</option>");
    	
    	     for (var i = 0; i < data.length; i++) {
       	      $("#stlSts").append("<option value='" + data[i].cdVl + "'>"   + data[i].cdNm   + "</option>"); 
       	     }
    	    //更新内容刷新到相应的位置
            $("#stlSts").selectpicker('render');
            $("#stlSts").selectpicker('refresh');
        	} 
		});
	  }
//加载字典表
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


function batchOpt(optType){ 
	$("#exportform_save_btn").off('click').on('click', function() { 
		var filepath = $("#file").val();
		if(filepath==undefined||filepath==""){ 
			//fileObject.focus(); 
			bootbox.alert("请选择上传文件!");
			return;
		}else{ 
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
		if(filepath==undefined||filepath==""){ 
			//fileObject.focus(); 
			bootbox.alert("请选择上传文件!");
			return;
		}
		var optTyp = $("#_optTyp").val();
		var goodsId = $("#export_goodsId").val().split(",")[0];
		var posMdTyp = $("#export_goodsId").val().split(",")[1];
		if(optTyp==''){bootbox.alert('请选择操作类型');return;}
		if(optTyp=='01' && goodsId == ''){
			bootbox.alert('请选择计费产品');
			return;
		}
		var rmk = $("#_rmk").val();
		if(rmk==''){bootbox.alert('请填写操作备注');return;}
			bootbox.confirm("确认导入Excel文件吗?",function(truthBeTold) {
				if (truthBeTold) { 
					var fileObj = document.getElementById("file").files[0]; // 获取文件对象
					  var form = new FormData();
					   // FormData 对象
					  form.append("file", fileObj); // 文件对象
					  $("#exportExcelWin").modal('hide');
					  App.blockUI({target:"body",boxed:!0,message:CONST.TIP016,zIndex:20000});
			       $.ajax({
			           url:baseURL + "/tZero/posMd/batchOpt?optTyp="+optTyp+"&rmk="+rmk+"&goodsId="+goodsId+"&posMdTyp="+posMdTyp,
			           type:"post",
			           data:form,
			           processData:false,
			           contentType:false,
			           success:function(result){
			        		   $("#exportExcelWin").modal('hide');
			        		   result = jQuery.parseJSON(result);
			        	   if(!result.success){
			            		bootbox.alert("数据导入失败,"+ result.msg + " 请检查数据后重试!");
			            		
			            		if(result.errors != "" && result.errors != null){
			            			openErrorWindow(result.errors);
			            		}
			            		$("#_rmk").val("");
			            	}else{ 
			            		var failCount = result.failureCount;
			            		if(failCount==0){
			            		//bootbox.alert('本次批量导入操作共成功'+result.successCount+'条,失败'+result.failureCount+'条');
			            		$("#file").val('');
			            		showExcelImportErrorPanel(JSON.stringify(result));
			            		//将返回的数据绑定到列表中
			                    	reloadGrid(); 
			            		}else{
			            			$("#file").val('');
			            			showExcelImportErrorPanel(JSON.stringify(result));
			            			
			            		}
			            		$("#_rmk").val("");
			                       	   
			           
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
			});
	   });
		
	}

//跳转excel导入出错页面    
function showExcelImportErrorPanel(data){
	$("#data").val(data);
	 $.fancybox({afterLoad:fancyboxCenterOnViewport,
  		href:'PosMdMecManagerExcelErrorPanel.jsp',    
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
//格式化动作类型
actType = function(obj){ 
	var relVal = '';
	if(hasPermission(PERMISSSIONCONST.POSMD006)){
		var posMdSts=obj.posMdSts;
		var mno=obj.mno;
		var rate=obj.rate;
		var limitAmt=obj.limitAmt;
		var dayLimitAmt=obj.dayLimitAmt;
		var isDayLimit=obj.isDayLimit; 
		var mecLevel=obj.mecLevel;
		var mecLevelStatus=obj.mecLevelStatus;
		if(limitAmt=='' || limitAmt == null){
			limitAmt = 0;
		}
		if(rate=='' || rate == null){
			rate = 0;
		}
		if(dayLimitAmt=='' || dayLimitAmt == null){
			dayLimitAmt = 0;
		}
		var str ="";
		if(posMdSts == '01'){
			if(hasPermission(PERMISSSIONCONST.POSMD044)){
				str += "<a href='javascript:void(0);' onclick=openOrCloseFun('"+mno+"','00')>关闭</a>	"
			}
		}else if(posMdSts == '00'){
			if(hasPermission(PERMISSSIONCONST.POSMD043)){
				str += "<a href='javascript:void(0);' onclick=openOrCloseFun('"+mno+"','01')>开通</a>	"
			}
		}
		if(hasPermission(PERMISSSIONCONST.POSMD045)){
			str += "<a href='javascript:void(0);' onclick=updateLimitAmtFun('"+mno+"',"+limitAmt+","+dayLimitAmt+",'"+isDayLimit+"')>修改限额</a>	"
		}
		if(hasPermission(PERMISSSIONCONST.POSMD046)){
			str += "<a href='javascript:void(0);' onclick=updateMecLevel('"+mno+"',"+mecLevel+")>修改等级</a>	"
		}
		if(hasPermission(PERMISSSIONCONST.POSMD047)){
			str += "<a href='javascript:void(0);' onclick=updateLevelStatus('"+mno+"','"+mecLevelStatus+"')>修改等级状态</a>	"
		}
		relVal = str;
	}
	return relVal ; 
}

//操作记录
oprateRecord = function(obj){
	var relVal='';
	if(hasPermission(PERMISSSIONCONST.POSMD007)){
		var mno=obj.mno;
		var inMno=obj.inMno;
		var str;
		str  = "<a href='javascript:void(0);' onclick=queryPosMdOptLog('"+mno+"','"+inMno+"')>操作记录</a>   "
		/*str += "<a href='javascript:void(0);' onclick=queryStsOptLog('"+mno+"')>业务状态记录</a>   "
		str += "<a href='javascript:void(0);' onclick=queryRateOptLog('"+mno+"')>费率变更记录</a>    "
		str += "<a href='javascript:void(0);' onclick=queryLimitAmtOptLog('"+inMno+"','00')>限额修改记录</a>	"
		str += "<a href='javascript:void(0);' onclick=queryLimitAmtOptLog('"+inMno+"','01')>日限额修改记录</a>"
		*/relVal = str;
	}
	return relVal; 
}

//关闭或开通win
function openOrCloseFun(mon,type){
	$("#closeForm")[0].reset();
	$("#closeForm .bs-select").selectpicker('val','');
	$('#c_mon').val(mon);
	$('#c_type').val(type);
	if(type=="01"){
		//$('#c_posMdTypDiv').show();
		$("#c_goodsId_Title").show();
		$("#c_goodsId_check").show();
	}else if(type=="00"){
		//$('#c_posMdTypDiv').hide();
		$("#c_goodsId_Title").hide();
		$("#c_goodsId_check").hide();
	}
	
	$("#closeWin").modal('show');
	
	//绑定取消事件
	$("#close_cancel_btn").off('click').on('click', function() {
		$("#closeWin").modal('hide');
		$("#closeForm")[0].reset();
		$("#closeForm .bs-select").selectpicker('val','');
	});
	//绑定保存事件
	$("#close_save_btn").off('click').on('click', function() {
		var type =$("#c_type").val();
		var mno = $("#c_mon").val();
		var rmk = $("#c_rmk").val();
		var goodsId = $("#c_goodsId").val().split(",")[0];
		var posMdTyp = $("#c_goodsId").val().split(",")[1];
		var url ='';
		if(type == "00"){
			url = baseURL+"/tZero/posMd/doClose";
		}else{
			url =baseURL+"/tZero/posMd/doOpen";
			if(goodsId == '' || posMdTyp == ''){
				bootbox.alert('请填写开通内容');
				return;
			}
		}
		if(rmk==''){
			bootbox.alert('请填写动作原因');
			return;
		}
		if(rmk.length>50){
			bootbox.alert('动作原因过长');
			return;
		}
		bootbox.confirm("确认要提交吗？", function(flg){
			if(flg){
				$("#closeWin").modal('hide');
	    		App.blockUI({target:"body",boxed:!0,message:"正在处理中，请稍等...",zIndex:20000});
				$.ajax({
					type:'post',
					url : url,
					data:{
						mno : mno,
						rmk : rmk,
						posMdTyp : posMdTyp,
						goodsId : goodsId
						},
					success:function(data){
						data = $.parseJSON(data);
						if (data.success == true) {
							bootbox.alert(data.msg);
							reloadGrid();
							
						} else {
							bootbox.alert(data.msg);
						}
						$("#closeWin").modal('hide');
					},
					error:function(e){
			        	bootbox.alert("系统异常");
			        }
				});
			}else{
				//$("#closeWin").modal('hide');
			}
		});
	});
}


function updateLimitAmtFun(mno,limitAmt,dayLimitAmt,isDayLimit){
	$("#updateLimitForm")[0].reset();
	$("#updateLimitForm .bs-select").selectpicker('val','');
	$("#updateLimitForm .form-group").removeClass("has-error");
	$("#updateLimitForm .help-block-error").remove();
	
	$('#ul_mno').val(mno);
	$('#ul_limitAmt').val(limitAmt);
	$('#ul_dayLimitAmt').val(dayLimitAmt);
	$('#ul_isDayLimit').val(isDayLimit);
	
	$("#updateLimitWin").modal('show');
	
	//绑定取消事件
	$("#updateLimit_cancel_btn").off('click').on('click', function() {
		$("#updateLimitWin").modal('hide');
		$("#updateLimitForm")[0].reset();
		$("#updateLimitForm .bs-select").selectpicker('val','');
	});
	//绑定保存事件
	$("#updateLimit_save_btn").off('click').on('click', function() {
		if(!$("#updateLimitForm").valid()){ 
			 bootbox.alert("输入项数据不正确，验证未通过！");
			 return;
		}
		var limitAmtNew =$("#ul_limitAmtNew").val();
		var limitAmt = $('#ul_limitAmt').val(); 
		var mno = $("#ul_mno").val();
		var rmk = $("#ul_rmk").val();
		var limitType = $("#limitType").val();
		var isDayLimit = $("#ul_check").prop('checked');
		var url =baseURL+'/tZero/posMd/updateLimitAmt';
		
		if(!isDayLimit && limitAmtNew==''){
			bootbox.alert('新的限额不能为空');return;
		}
		var isDayLimitNew = "00";
		if(isDayLimit){
			isDayLimitNew = "00";
		}else {
			isDayLimitNew = "01";
		}
		
		if(rmk==''){bootbox.alert('请填写操作备注');return;}
		if(rmk.length>50){bootbox.alert('操作备注过长');return;}
		$.ajax({
			type:'post',
			url : url,
			data:{
				mno : mno,
				limitAmtNew : limitAmtNew,
				rmk:rmk,
				limitType:limitType,
				isDayLimitNew:isDayLimitNew
				},
			success:function(data){
				data = $.parseJSON(data);
				if (data.success == true) {
					bootbox.alert(data.msg);
					reloadGrid();
				} else {
					bootbox.alert(data.msg);
				}
				$("#updateLimitWin").modal('hide');
			}
		});
		
	});
}

function updateMecLevel(mno,mecLevel){
	$("#updateMecLevelForm")[0].reset();
	$("#updateMecLevelForm .form-group").removeClass("has-error");
	$("#updateMecLevelForm .help-block-error").remove();
	$('#ul_oldMecLevel').val(mecLevel);
	
	$("#updateMecLevelWin").modal('show');
	
	//绑定取消事件
	$("#updateMecLevel_cancel_btn").off('click').on('click', function() {
		$("#updateMecLevelWin").modal('hide');
		$("#updateMecLevelForm")[0].reset();
		$("#updateMecLevelForm .form-group").removeClass("has-error");
		$("#updateMecLevelForm .help-block-error").remove();
	});
	//绑定保存事件
	$("#updateMecLevel_save_btn").off('click').on('click', function() {
		if(!$("#updateMecLevelForm").valid()){ 
			 bootbox.alert("输入项数据不正确，验证未通过！");
			 return;
		}
		
		var rmk = $("#mecLevel_rmk").val();
		var mecLevel = $("#ul_mecLevel").val();
		var url =baseURL+'/tZero/posMd/updateMecLevel';
		
		if(rmk==''){bootbox.alert('请填写操作备注');return;}
		if(rmk.length>50){bootbox.alert('操作备注过长');return;}
		$.ajax({
			type:'post',
			url : url,
			data:{
				mno : mno,
				mecLevel : mecLevel,
				rmk:rmk
				},
			success:function(data){
				data = $.parseJSON(data);
				if (data.success == true) {
					bootbox.alert(data.msg);
					reloadGrid();
				} else {
					bootbox.alert(data.msg);
				}
				$("#updateMecLevelWin").modal('hide');
			}
		});
		
	});
}

function updateLevelStatus(mno,mecLevelStatus){
	$("#updateLevelStatusForm")[0].reset();
	$("#updateLevelStatusForm .bs-select").selectpicker('val','');
	$("#updateLevelStatusForm .form-group").removeClass("has-error");
	$("#updateLevelStatusForm .help-block-error").remove();
	
	if(mecLevelStatus=='01'){
		$('#ul_oldLevelStatus').val("可升可降");
	}else if(mecLevelStatus=='02'){
		$('#ul_oldLevelStatus').val("只升不降");
	}else{
		$('#ul_oldLevelStatus').val("不升不降");
	}
	
	$("#updateLevelStatusWin").modal('show');
	
	//绑定取消事件
	$("#updateLevelStatus_cancel_btn").off('click').on('click', function() {
		$("#updateLevelStatusWin").modal('hide');
		$("#updateLevelStatusForm")[0].reset();
		$("#updateLevelStatusForm .bs-select").selectpicker('val','');
	});
	//绑定保存事件
	$("#updateLevelStatus_save_btn").off('click').on('click', function() {
		var rmk = $("#levelStatus_rmk").val();
		var mecLevelStatus = $("#ul_levelStatus").val();
		var url =baseURL+'/tZero/posMd/updateLevelStatus';
		if(mecLevelStatus==''){bootbox.alert('请选择变更后等级状态');return;}
		if(rmk==''){bootbox.alert('请填写操作备注');return;}
		if(rmk.length>50){bootbox.alert('操作备注过长');return;}
		$.ajax({
			type:'post',
			url : url,
			data:{
				mno : mno,
				mecLevelStatus : mecLevelStatus,
				rmk:rmk
				},
			success:function(data){
				data = $.parseJSON(data);
				if (data.success == true) {
					bootbox.alert(data.msg);
					reloadGrid();
				} else {
					bootbox.alert(data.msg);
				}
				$("#updateLevelStatusWin").modal('hide');
			}
		});
		
	});
}

function queryPosMdOptLog(mno,inMno){
	$("#queryPosMdOptLogForm")[0].reset();
	$("#queryPosMdOptLogForm .bs-select").selectpicker('val','');
	$("#queryPosMdOptLogWin").modal('show');
	//绑定保存事件
	$("#log_query_btn").off('click').on('click', function() {
		var optTyp = $("#log_optTyp").val();
		if(optTyp ==""){bootbox.alert('记录类型不能为空');return;}
		if(optTyp == "01"){
			queryStsOptLog(mno);
		}else if(optTyp == "02" || optTyp == "03"){
			queryLimitAmtOptLog(inMno,optTyp);
		}else if(optTyp == "04"){
			queryMecLevelOptLog(inMno,optTyp);
		}else if(optTyp == "05"){
			queryLevelStatusOptLog(inMno,optTyp);
		}
		$("#queryPosMdOptLogWin").modal('hide');
	});
}


//跳转业务状态页面
function queryStsOptLog(mno){
	var url=baseURL+"/tZero/posMd/queryStsOptLog/"+mno;
	var param = {page:1,start:0,limit:20};
	$.ajax({
        type: "GET", 
        url: url,
        data:param,
        dataType: "json",
        success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
        	if(data.totalCount==0){
        		bootbox.alert("没有操作数据");
        		return;
        	}else{
        		 $.fancybox({afterLoad:fancyboxCenterOnViewport,
        				href:'PosMdMecManagerStsOptLogPanel.jsp?mno='+mno,    
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
        }
        });

}

//跳转费率操作页面
function queryRateOptLog(mno){
	var url=baseURL+"/tZero/posMd/queryRateOptLog/"+mno;
	var param = {page:1,start:0,limit:20};
	$.ajax({
        type: "GET", 
        url: url,
        data:param,
        dataType: "json",
        success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
        	if(data.totalCount==0){
        		bootbox.alert("没有操作数据");
        		return;
        	}else{
        		 $.fancybox({afterLoad:fancyboxCenterOnViewport,
        				href:'PosMdMecManagerRateOptLogPanel.jsp?mno='+mno,    
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
        }
        });

}

//限额修改记录 或日限额记录页面
function queryLimitAmtOptLog(inMno,type){ 
	var url=baseURL+'/tZero/posMd/queryLimitAmtOptLog/'+ inMno;
	var param = {page:1,start:0,limit:20,optTyp:type};
	$.ajax({
        type: "GET", 
        url: url,
        data:param,
        dataType: "json",
        success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
        	if(data.totalCount==0){
        		bootbox.alert("没有操作数据");
        		return;
        	}else{
        		 $.fancybox({afterLoad:fancyboxCenterOnViewport,
        				href:'PosMdMecManagerLimitAmtOptLogPanel.jsp?inMno='+inMno+"&type="+type,    
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
        }
        });
	
}


//等级修改记录
function queryMecLevelOptLog(inMno,type){ 
	var url=baseURL+'/tZero/posMd/queryLimitAmtOptLog/'+ inMno;
	var param = {page:1,start:0,limit:20,optTyp:type};
	$.ajax({
        type: "GET", 
        url: url,
        data:param,
        dataType: "json",
        success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
        	if(data.totalCount==0){
        		bootbox.alert("没有操作数据");
        		return;
        	}else{
        		 $.fancybox({afterLoad:fancyboxCenterOnViewport,
        				href:'PosMdMecLevelOptLogPanel.jsp?inMno='+inMno+"&type="+type,    
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
        }
        });
	
}

//等级状态变更记录
function queryLevelStatusOptLog(inMno,type){ 
	console.log(type);
	var url=baseURL+'/tZero/posMd/queryLimitAmtOptLog/'+ inMno;
	var param = {page:1,start:0,limit:20,optTyp:type};
	$.ajax({
        type: "GET", 
        url: url,
        data:param,
        dataType: "json",
        success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
        	if(data.totalCount==0){
        		bootbox.alert("没有操作数据");
        		return;
        	}else{
        		 $.fancybox({afterLoad:fancyboxCenterOnViewport,
        				href:'PosMdMecLevelStatusOptLogPanel.jsp?inMno='+inMno+"&type="+type,    
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
        }
        });
	
}

					//加载计费产品下拉框
					function loadGoodId(element){
						$.ajax({
							type : "GET",
							url : baseURL+"/tZero/posMd/queryGoodsId",
							contentType : "application/json;charset=utf-8",
							dataType : "json",
							success : function(data) {
								if(data.timeout){
				            		ajaxTimeout();
				                }
								$("#" + element).empty();
								$("#" + element).append($("<option></option>").val("").text("请选择"));
				                $.each(data, function(index, obj) {
				                	$("#" + element).append($("<option></option>").val(obj.goodsId+","+obj.goodsType).text(obj.goodsNm));
				                });
				               	//更新内容刷新到相应的位置
				                $("#" + element).selectpicker('render');
				                $("#" + element).selectpicker('refresh');
							},
							error : function(error) {
							}
						});
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
			        	$("#d_regNm").val(record.regNm);
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
				            	console.log("kk");
				            }
				        });
			    		
		    			//弹出窗口取消按钮
		    			$("#detail_cancel_btn").off('click').on('click', function() {
		    				$("#mecMagDdetailWin").modal('hide');
		    	    	});
		    	    	$("#mecMagDdetailWin").modal('show');
			    		
					}

function test(){
	alert(1111);
}


    </script>
    
</body>

</html>
 
