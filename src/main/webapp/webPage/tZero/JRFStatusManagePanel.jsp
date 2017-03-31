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
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">商户编号:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mno" id="mno" class="form-control" placeholder="请输入商户编号:">
		                                            </div>
		                                        </div> 
		                                    </div>
		                                    
		                                     <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-2" class="control-label col-md-4 text-right">商户名称:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="cprRegNmCn" id="cprRegNmCn" class="form-control" placeholder="请输入商户名称:">
		                                            </div>
		                                        </div> 
		                                    </div>
		                                   
	                                 <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
	                                        <div class="form-group">
	                                            <label class="control-label col-md-4 text-right"><font color="red">*</font>即日付状态:</label>
	                                            <div class="col-md-8 paddingnone">
	                                                <select name="JRFSts" id="JRFSts" class="bs-select form-control" >
	                                                	<option value="">全部</option>
	                                                	<option value="1">正常</option> 
	                                                	<option value="2">暂停</option>
	                                                	<option value="0">关闭</option> 
	                                                	<option value="3">未开通</option>
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
		                                                <button type="button" id="reset_btn" class="btn red"> <i class="fa fa-refresh"></i> 重置</button>
		                                                <button type="button" id="downLoadExcel_btn" class="btn btn btn-primary"> <i class="fa fa-sign-out"></i> 下载模板</button>
		                                            	<button type="button" id="exportexcel_btn" class="btn btn btn-primary"> <i class="fa fa-sign-out"></i> 批量开通导入操作</button>
<!-- 		                                            	<button type="button" id="exportexcel_btn2" class="btn btn btn-primary"> <i class="fa fa-sign-out"></i> 批量修改费率操作</button> -->
		                                            	<button type="button" id="batchQueryByMnoButton" class="btn btn btn-primary"> <i class="fa fa-sign-out"></i> 商编批量查询</button>
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
		                                    <th class="nowrap"> 序号</th>   
		                                    <th class="nowrap"> 商户编号 </th>
		                                    <th class="nowrap"> 商户名称 </th>
		                                    <th class="nowrap"> 即日付状态 </th>
		                                    <th class="nowrap"> 最后开通渠道 </th>
		                                    <th class="nowrap"> 最后操作时间 </th>
		                                    <th class="nowrap"> 动作类型</th>
		                                    <th class="nowrap"> 操作记录</th> 
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
	            <h4 class="modal-title" id="excelTitle_bat">批量开通/关闭即日付</h4>
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
                                           <label for="span-medium-2" class="control-label col-md-1 text-right"><font color="red">*</font></label>
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
  
  
  
  
  
  <!-- 添加/修改数据的模态框（Modal） -->
		<div class="modal fade" id="downLoadWin" tabindex="-1" data-backdrop="static" data-width="760px">
		         <div class="modal-header">
		            <button type="button" class="close" 
		               data-dismiss="modal" aria-hidden="true">
		                  &times;
		            </button>
		            <h4 class="modal-title" id="addOrUpdateWin_title">下载模板</h4>
		         </div>
		         <div class="modal-body">
		            <div class="portlet-body form">
                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="addform">
                            <div class="form-body">
                                <div class="row norow">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                       <div class="form-group">
                                           <label for="span-medium-2" class="control-label col-md-4 text-right">请选择下载模板:</label>
                                           <label class="checkbox-inline">
										      <input type="radio" name="templateType" value="1" checked aria-label="...">批量开通导入模板
<!-- 										      <input type="radio" name="templateType"  value="2" checked aria-label="...">批量修改费率导入模板 -->
										      <input type="radio" name="templateType"  value="3" checked aria-label="...">批量查询模板
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
                                                <button type="button" id="downLoad_save_btn" class="btn btn-success"><i class="fa fa-save"></i>确认</button>
                                                <button type="button" id="downLoad_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
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
    <!-- END CONTAINER -->
   
   
   
   <!-- 文件模板导入 -->
	<div class="modal fade" id="updateWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="excelTitle">修改即日付结算费率</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="updateform">
                           <div class="form-body">
                               <div class="row norow">
                               <input type="hidden" id="u_inMno"/>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-4 text-right">商户编号:</label>
                                            <div class="col-md-6 paddingnone">
                                               <input name="u_mno" id="u_mno" readonly class="form-control" placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-4 text-right">商户名称:</label>
                                             <div class="col-md-6 paddingnone">
		                                             <input name="u_cprRegNmCn" id="u_cprRegNmCn" readonly class="form-control" placeholder="">
		                                      </div> 
                                        </div>
                                    </div>
                                    
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  >
                                        <div class="form-group"> 
                                            <label class="control-label col-md-4 text-right">当前即日付费率%:</label>
                                            <div class="col-md-6 paddingnone">
                                                <input name="u_oldRate" id="u_oldRate" readonly class="form-control" placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                       <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group"> 
                                            <label class="control-label col-md-4 text-right"><font color="red">*</font>新即日付费率%:</label>
                                            <div class="col-md-6 paddingnone">
                                                <input name="u_newRate" type="number" id="u_newRate"  class="form-control" placeholder="请输入新即日付费率%">
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
  </div>
  </div>  
	
  </div>
  
  <!-- 即日付商户费率详情（Modal） -->
		<div class="modal fade" id="mecMagDdetailWin" tabindex="-1" data-backdrop="static" data-width="1000px">
		         <div class="modal-header">
		            <button type="button" class="close" 
		               data-dismiss="modal" aria-hidden="true">
		                  &times;
		            </button>
		            <h4 class="modal-title" id="">即日付商户费率详情</h4>
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
    
  	<jsp:include page="../common/page/fileupload.jsp" flush="true"/>
   	<jsp:include page="../common/page/errorgrid.jsp" flush="true"/>
   	
    <script type="text/javascript">
    var config={
    		uploadUrl: baseURL+'/tzeroStl/validateBatchQueryByMnos',
    		uploadButton: 'batchQueryByMnoButton',
    		win: 'b_q_w',
    		winTitle: '根据商编批量查询即日付商户业务状态',
    		errorWin: 'b_q_e_w',
    		errorGrid: 'b_q_e_g',
    		successCallback: function(){
    			window.location.href=baseURL+'/tzeroStl/downloadJRFBatchQueryByMnosResult'
    		}
    	};
    </script>
	<script src="<%=request.getContextPath()%>/webPage/common/page/uploadaction.js" type="text/javascript"></script>
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
		var url=baseURL+"/tzeroStl/queryJRFStatus";
		
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
		param.cprRegNmCn  = $('#cprRegNmCn').val();//商户名称 
		param.JRFSts  = $('#JRFSts').val();//状态
		param.mno  = $('#mno').val();//合作商编号
		App.blockUI({target:"body",boxed:!0,message:'读取中...',zIndex:20000});
		$.ajax({
            type: "GET",  
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
                    
                	var mno=obj.mno;
					var inMno=obj.inMno;
					var usrId=obj.usrId;
					var value=obj.JRFSts;
					var returnStr;
					var cprRegNmCn=obj.cprRegNmCn;
                	
                	trData.push(obj.mno);
                	trData.push(obj.cprRegNmCn);
                	trData.push(formartSts(value));
//                 	trData.push(obj.rate);
                	trData.push(obj.openSysIdDisplay);
                	trData.push(obj.lastModifyTime);
                	
                	
                	if(value=='1'){
// 						if(hasPermission(PERMISSSIONCONST.TZER1014)){
// 							rateUpdateStr="<a href='javascript:void(0)' style='margin:0 20px'  onclick=JRFOperateRate('"+inMno+"')>修改费率</a>";
// 						}
						 returnStr  = "<div><a href='javascript:void(0)'  onclick=JRFOperate('"+mno+"','"+inMno+"','"+usrId+"','0')>关闭</a></div>" 
					}else if(value=='0' || value=='3' ){
						 //当即日付状态为‘未开通’或‘关闭’则动作类型取值展示‘开通’，
						  returnStr  = "<div><a href='javascript:void(0)'  onclick=JRFOperate('"+mno+"','"+inMno+"','"+usrId+"','1')>开通</a></div>"
// 					}else{
// 						if(hasPermission(PERMISSSIONCONST.TZER1014)){
// 							 //当即日付状态为‘暂停’则动作类型取值展示为空，
// 							 returnStr  = "<div><a href='javascript:void(0)'  onclick=JRFOperateRate('"+inMno+"')>修改费率</a></div>";
// 						}
					
					}
                	trData.push(returnStr);
                	
                	//操作记录
                	var rateHisStr="";
					if(hasPermission(PERMISSSIONCONST.TZER1015)){
						rateHisStr="<a href='javascript:void(0)'  style='margin:0 20px' onclick=JRFOperateRateHis("+mno+")>修改查看</a>";
					} 
					if (!hasPermission(PERMISSSIONCONST.TZER1011) && !hasPermission(PERMISSSIONCONST.TZER1015)) {
						trData.push('');
					} else {
						trData.push("<div><a href='javascript:void(0)' onclick=JRFOperateHis("+inMno+")>开通查看</a>" +rateHisStr +"<a href='javascript:void(0)' onclick=JRFQueryRate('"+inMno+"','"+mno+"','"+cprRegNmCn+"')>费率查看</a></div>");
					}
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
            }, 
            error: function(error) {
            	bootbox.alert("读取失败！");
            }
        });
	}
    var queryMethod=0;
    

    $(function(){
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.TZER1009)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZER1009)) {$("#reset_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZER1010) &&  !hasPermission(PERMISSSIONCONST.TZER1016)) {$("#downLoadExcel_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZER1012) ) {$("#exportexcel_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZER1017) ) {$("#exportexcel_btn2").hide();}
    	if (!hasPermission(PERMISSSIONCONST.TZER1018) ) {}
    	if (!hasPermission(PERMISSSIONCONST.TZER1019) ) {$("#batchQueryByMnoButton").hide();}
    	
		
    	//加载数据
    	/* reloadGrid(); */
    	
    	//重置按钮
		$("#reset_btn").on('click', function() {
			$("#queryMecPanel_Form")[0].reset();
			$("#queryMecPanel_Form .bs-select").selectpicker('val','');//重置select元素
		});
    	
    	 
    	
    	
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
    	
    	
    	
    	
    	  //控制 复选框只能选中一个
  		 $('input[type=checkbox]').bind('click', function(){
  		 	$('input[type=checkbox]').not(this).attr("checked", false);
  		 }); 
    	
    	
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
		//跳转到 下载excel页面
		$("#downLoadExcel_btn").on('click',function(){
			$("#downLoadWin").modal("show");
			/* window.location.href = baseURL+'/tZero/rate/downloadTemplate';	 */	
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
			if (excelType == '3') {
				if(hasPermission(PERMISSSIONCONST.TZER1018)){
					window.location.href = baseURL+"/tzeroStl/downloadJRFBatchQueryTemplate";
				}else{
					bootbox.alert("没有权限下载批量查询模板"); 
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
			 $("#excelTitle_bat").text("批量开通/关闭即日付");
			
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
			 $("#excelTitle_bat").text("批量修改即日付结算费率");
			 
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
    		
    		var inMno =$("#u_inMno").val(); 
    		var workRateNew = $("#u_newRate").val(); 
    		
    		
    		
    		if(workRateNew==''||isNaN(workRateNew)){
    			bootbox.alert("请输入正确的新工作日费率!");
    			return;
    		}else{
    			workRateNew = parseFloat(workRateNew);
    		}
    		
    		
    		if(!(0<=workRateNew&&workRateNew<=10)){
    			bootbox.alert("只能输入0~10");
    			return;
    		}
    		
    		var data = {};
    		data.inMno =inMno;
    		data.mno = $("#u_mno").val();
    		data.cprRegNmCn =$("#u_cprRegNmCn").val();
    		data.oldRate = $("#u_oldRate").val();
    		data.newRate =$("#u_newRate").val();
    		
    		
    		
    	
    	var url = baseURL+"/busRate/saveJRFRateByInMno"
    	
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
  		href:'JRFStatusManagePanelRatebatchOperate.jsp',    
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
function formartSts(value){ 
	if(value=='0'){
		return '关闭';
	}else if(value=='1'){
		return '正常';
	}else if (value=='2'){
		return '暂停';
	}else if (value=='3'){
		return '未开通';
	}else{
		return '其他';
	}
}   	  

function batchOpt(optType){
$("#exportform")[0].reset();	//重置表单
$("#exportform .bs-select").selectpicker('val','');//重置select元素 
	
$("#exportform_save_btn").off('click').on('click', function() { 
	var url = ''; 
		
	if(optType=='1'){
		if($("#issContent").val()==''){
			bootbox.alert("请填写动作原因!");
			return ;
		}
		if($("#actType").val()==''){ 
			bootbox.alert("请选择动作类型!");
			return ;
		}
		
		
		url = baseURL + "/tzeroStl/batchOperateJrfExcel?rmk="+$("#issContent").val()+"&actType="+$("#actType").val()
	}else{
		url = baseURL+"/busRate/batchUpdateJrfRateExcel";
	}
	
		
	
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
		bootbox.confirm("确定导入Excel文件吗",function(data){
			if(data){
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
		        		   $("#importExcelWin").modal('hide');
		        		   result = jQuery.parseJSON(result);
		        		   $("#issContent").val("");
		        		   
		        		   if(result.success&&result.msgCd!='0000'&&!result.failCount>0){
		        			   bootbox.alert("操作成功");  
		        			   return;
		        		   }
		        		   
		        	   if(!result.success){
		            		bootbox.alert("数据导入失败"+ result.msgInfo + " 请检查数据后重试!");
		            		
		            		if(result.errors != "" && result.errors != null){
		            			openErrorWindow(result.errors);
		            		}
		            		
		            	}else{ 
		            		var failCount = result.failCount;
		            		if(failCount==0){
		            		bootbox.alert('本次批量导入成功'+result.successCount+'条,失败'+result.failCount+'条');
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
	
//开通即日付或者关闭即日付
JRFOperate=function(mno,inMno,usrId,type){
	$("#_mno").val(mno);
	$("#_inMno").val(inMno);
	$("#_usrId").val(usrId);
	$("#_operateTyp").val(type);
	$("#rmk").text("");
	$("#rmk").val(""); 
	$("#closeWin").modal('show'); 
}
// ------------------------------------------------------------------------------------------------------------
//查看费率
JRFQueryRate=function(inMno,mno,cprRegNmCn){
	$("#d_inMno").val(inMno);
	$("#d_mno").val(mno);
	$("#d_regNm").val(cprRegNmCn);
	$.ajax({
        url:baseURL + "/busRate/queryRateInMno", 
        type:"GET",
        data:{inMno:inMno},
        dataType: "json",
        success:function(result){
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

// -------------------------------------------------------------------------------------------------------

// 修改费率
JRFOperateRate=function(inMno){

	$("#u_newRate").val("");
	$("#updateWin").modal('show');
	
	$.ajax({
        url:baseURL + "/busRate/queryRateByInMno", 
        type:"GET",
        data:{inMno:inMno},
        success:function(data){
        	data = $.parseJSON(data);
        	if(data.inMno==null || data.inMno==''){
				bootBox.alert("数据加载异常");
				return;
			}
        	var inMno  = data.inMno;
        	var mno  = data.mno;
        	var cprRegNmCn = data.cprRegNmCn;
        	var oldRate = data.rate;
        	
        	$("#u_mno").val(mno);
        	$("#u_cprRegNmCn").val(cprRegNmCn);
        	$("#u_oldRate").val(oldRate); 
        	$("#u_inMno").val(inMno);
        } 
    });
	
	
	   
	
}


//查看即日付开通流水
JRFOperateHis=function(inMno){
	var url=baseURL+"/tzeroStl/JRFHisQuery/"+inMno;
	var param = {page:page,start:start,limit:limit};
	$.ajax({
        type: "GET", 
        url: url, 
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        data: param,
        dataType: "json",
        success: function(data) {
        	if(data.totalCount=='0'){
        		bootbox.alert("没有操作数据");
        		return;
        	}else{
        		 $.fancybox({afterLoad:fancyboxCenterOnViewport,
        	     		href:'JRFOperateHisPanel.jsp?inMno='+inMno,    
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

//查看即日付开通流水
JRFOperateRateHis=function(mno){
	var url=baseURL+"/busRate/queryJRFRateByMno/"+mno;
	var param = {page:page,start:start,limit:limit};
	
	$.ajax({
        type: "GET", 
        url: url, 
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        data: param,
        dataType: "json",
        success: function(data) {
        	console.log(data);
        	
        	if(data.totalCount=='0'){
        		bootbox.alert("没有操作数据");
        		return;
        	}else{
        		 $.fancybox({afterLoad:fancyboxCenterOnViewport,
        	     		href:'JRFOperateRateHisPanel.jsp?mno='+mno,    
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
   	  
    </script>
    
</body>

</html>
 
