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
    <%-- <jsp:include page="../common/header.jsp" flush="true"/> --%>
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
		                        <form action="<%=request.getContextPath()%>/tZero/mecQry/query" class="form-horizontal" id="queryMecDOneMagQuery_myForm">
		                            <div class="form-actions">
		                            	<div class="row norow">
		                            		<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">商编:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mno" id="DOneMecMagForm_mno" class="form-control" placeholder="请输入商编">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">商户名称:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mnoNm" id="DOneMecMagForm_mnoNm" class="form-control" placeholder="请输入商户名称">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">D+1业务状态:</label>
		                                            <div class="col-md-8 paddingnone">
		                                            	<select name="busSts" id="DOneMecMagForm_busSts" class="bs-select form-control" data-show-subtext="true">
		                                                	<option value="">全部</option>
		                                                	<option value="0">关闭</option>
		                                                	<option value="1">开通</option>
		                                                	<option value="2">暂停</option>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="clearfix"></div>
		                                </div>
		                                <div class="row">
		                                    <div class="col-md-12">
		                                        <div class="row">
		                                            <div class="col-md-offset-1 col-md-11">
		                                            	<button type="button" id="DOneMecMagPanel_query" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
		                                                <button type="button" id="DOneMecMagPanel_reset" class="btn red"> <i class="fa fa-refresh"></i> 重置</button>
		                                                <button type="button" id="DOneMecMagPanel_download_btn" class="btn btn-info"> <i class="fa fa-out"></i> 下载模板</button>
		                                                <button type="button" id="DOneMecMagPanel_export" class="btn btn-info"> <i class="fa fa-sign-out"></i> 批量导入操作</button>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">D+1商户管理列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="DOneMecMagGrid">
		                            <thead>
		                                <tr>
		                                	<th> 序号 </th>
		                                    <th> 商编 </th>
		                                	<th> 商户名称 </th> 
		                                    <th> D+1业务状态 </th>
		                                    <th> 费率</th>
		                                    <th> 单笔免费额度 </th>
		                                    <th> 动作类型 </th>
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
    
     <!-- 模板下载模态框 -->
    <div class="modal fade" id="exportmodelWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="40%"
	   aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-header">
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="">下载模板</h4>
         </div>
         <div class="modal-body">
         	<input type="hidden" id="edit_uuid" />
           	<div class="portlet-body form">
				<div class="form-body" style="text-align:center;">
					<a href="javascript:DOneMagExcelDown();" id="exporDOneMecMagModel" class="btn btn-success">点击下载“修改单笔免费额度模板”</a>
              	</div>
			  	<div class="clearfix"></div>	
			</div>
			<div class="clearfix"></div>
           	<div class="form-actions" style="padding:15px;">
                 <div class="row">
                     <div class="col-md-12"  style="text-align:center;">
                         <div class="row">
                             <div class="col-md-12">
                                 <button type="button" onclick="javascript:$('#exportmodelWin').modal('hide');" id="" class="btn red"> <i class="fa fa-share"></i> 关闭</button>
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="clearfix"></div>
             </div>
		</div> 
	</div>
    <!-- END CONTENT -->
    
    
     <!-- 批量导入操作模态框 -->
    <div class="modal fade" id="excelExportWindow" tabindex="-1" role="dialog" data-backdrop="static" data-width="40%;" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times;</button>
            <h4 class="modal-title" id="">批量导入操作</h4>
         </div>
         <div class="modal-body">
           	<div class="portlet-body form">
				<div class="form-body">
					<div class="col-lg-12 col-md-10 col-sm-10 col-xs-16" style="width:100%;">
	                    <div class="form-group">
	                        <label for="span-medium-1" class="control-label col-md-4 text-right" style="width:33.3%;float:left;">操作类型:</label>
	                        <div class="col-md-6 paddingnone" style="width:50%;float:left;">
	                             <select name="pushType" id="excelExportForm_opTyp" class="bs-select form-control" data-show-subtext="true">
	                            	<option value="01">修改单笔免费额度</option>
	                            </select>
	                        </div>
	                    </div>
	                </div>
	                <div id="rmkarea" style="margin-top:10px;width:100%;" class="col-lg-12 col-md-10 col-sm-10 col-xs-16">
	                    <div class="form-group">
	                        <label for="span-medium-1" class="control-label col-md-4 text-right" style="width:33.3%;float:left;"><font style="color:red;">*</font>操作备注:</label>
	                        <div class="col-md-6 paddingnone" style="width:50%;float:left;">
	                             <textarea class="form-control" id="excelExportForm_rmk"></textarea>
	                        </div>
	                    </div>
	                </div>
	                <div class="row fileupload-buttonbar col-lg-12 col-md-10 col-sm-10 col-xs-16" style="margin-top:10px;width:100%;">
						<span class="btn green fileinput-button" style="float:left;width:26%;margin-left:10%;">
	                        <i class="fa fa-plus"></i>
	                        <span> 选择文件 </span> &nbsp; 
	                        <input id="file" type="file" name="file" accept=".xlsx"  multiple  /> </span>
	                        <input style="float:left; width:40%"  name="fileattr" id="fileattr" readonly
								class="form-control" placeholder="请选择文件">
			        </div>
		            <br/> 
	            	<div class="clearfix"></div>
	            	<div class="form-actions" style="padding:15px;">
	                	<div class="row">
	                      	<div class="col-md-12"  style="text-align:center;">
	                          	<div class="row">
	                              	<div class="col-md-12">
	                              	  <button type="button" id="DOneMecMagPanel_confirm_btn" class="btn green"> <i class="fa fa-success"></i> 确定</button>
	                                  <button type="button" id=""  onclick="javascript:$('#excelExportWindow').modal('hide');" class="btn red"> <i class="fa fa-share"></i> 关闭</button>
	                              	</div>
	                          	</div>
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
   
   <!-- 批量导入失败数据模态框（Modal） -->
	<div class="modal fade" id="DOneMecMagImportErroWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="40%"
	   aria-labelledby="myModalLabel" aria-hidden="true">  
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title">导入失败的数据</h4>
         </div>
         <div class="row">
             <div class="col-md-offset-1 col-md-12">
                 <div class="col-md-11">
                 	
                 </div>
             </div>
         </div>
         <div class="modal-body" style="height:200px; text-align:center;">
         	<div class="portlet-body wheel">
                 <table class="table table-striped table-bordered table-hover table-checkable order-column">
                     <thead>
                         <tr>
                             <th> 位置 </th>
                             <th> 商编</th>
                             <th> 失败原因 </th>
                         </tr>
                     </thead>
                     <tbody>
                     </tbody>
                 </table>
             </div>
             <div class="clearfix"></div>
           	<div class="form-actions" style="padding:15px;">
               	<div class="row">
                    <div class="col-md-12"  style="text-align:center;">
                    	<button type="button" id="DOneMecMagPanel_importErroWin_export" class="btn btn-info"><i class="fa fa-sign-out"></i> 导出</button>
                    </div>
               	</div>
             	<div class="clearfix"></div>
            </div>   
		</div><!-- /.modal -->
   	</div>
   
   
   <!-- 修改单笔免费额度模态框 -->
    <div class="modal fade" id="DOneMagUpdWindow" tabindex="-1" role="dialog" data-backdrop="static" data-width="600px"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">修改单笔免费额度</h4>
	         </div>
	         <div class="modal-body">
	         	<input type="hidden" id="edit_uuid" />
            	<div class="portlet-body form">
					<div class="form-body">
		                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							 <input name="inMno" id="DOneMagUpdForm_inMno" class="form-control" style="display:none;" />
                             <div class="row norow">
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="width:80%;">
                                     <div class="form-group">
                                         <label for="span-medium-1" class="control-label col-md-4 text-right">商户名称:</label>
                                         <div class="col-md-8 paddingnone">
                                             <input name="mnoNm" id="DOneMagUpdForm_mnoNm" readonly="readonly" style="background:#fff;" class="form-control">
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <div class="row norow">
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="width:80%;">
                                     <div class="form-group">
                                         <label for="span-medium-1" class="control-label col-md-4 text-right">当前单笔免费额度:</label>
                                         <div class="col-md-8 paddingnone">
                                             <input name="freeAmt" id="DOneMagUpdForm_freeAmt" readonly="readonly" style="background:#fff;" class="form-control" placeholder="">
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <div class="row norow">
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="width:80%;">
                                     <div class="form-group">
                                         <label for="span-medium-1" class="control-label col-md-4 text-right"><font color="red">*</font>变更单笔免费额度:</label>
                                         <div class="col-md-8 paddingnone">
                                             <input name="newFreeAmt" id="DOneMagUpdForm_newFreeAmt" class="form-control" type="number" placeholder="">
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <div class="row norow">
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="width:80%;">
                                     <div class="form-group">
                                         <label for="span-medium-1" class="control-label col-md-4 text-right"><font color="red">*</font>操作备注：</label>
                                         <div class="col-md-8 paddingnone">
                                             <textarea id="DOneMagUpdForm_rmk" name="rmk" class="form-control" ></textarea>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                        </div>	
		            	<div class="clearfix"></div>
		            	<div class="form-actions" style="padding:15px;">
		                  	<div class="row">
		                      <div class="col-md-12"  style="text-align:center;">
                              	  <button type="button"  id="DOneMagUpdWindow_confirm_btn" class="btn green"> <i class="fa fa-success"></i> 确定</button>
                                  <button type="button" onclick="javascript:$('#DOneMagUpdWindow').modal('hide');" id="" class="btn red"> <i class="fa fa-share"></i> 关闭</button>
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
   
   
   <!-- 单笔免费额度修改记录模态框 -->
    <div class="modal fade" id="DOneMecMagOptHisWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="60%"
	   aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-header">
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="">单笔免费额度操作记录</h4>
         </div>
         <div class="modal-body">
         	<div class="portlet-body wheel">
                <table class="table table-striped table-bordered table-hover table-checkable order-column" id="DOneMecMagOptHisGrid">
                    <thead>
                        <tr>
                        	<th> 序号 </th>
                            <th> 商编 </th>
                        	<th> 商户名称 </th> 
                            <th> 原额度 </th>
                            <th> 变更额度</th>
                            <th> 操作员 </th>
                            <th> 操作来源 </th>
                            <th> 操作时间 </th>
                            <th> 原因 </th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
		</div> 
	</div>
	
	
   <!-- 业务状态修改记录模态框 -->
    <div class="modal fade" id="DOneBusStsOptHisWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="60%"
	   aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-header">
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="">D+1业务状态操作记录</h4>
         </div>
         <div class="modal-body">
         	<div class="portlet-body">
                <table class="table table-striped table-bordered table-hover table-checkable order-column" id="DOneBusStsOptHisGrid">
                    <thead>
                        <tr>
                        	<th> 序号 </th>
                            <th> 商户编号 </th>
                        	<th> 操作动作 </th> 
                            <th> 操作员 </th>
                            <th> 操作时间</th>
                            <th> 操作渠道 </th>
                            <th> 备注 </th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
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
    	$("#DOneMecMagGrid").find('tbody').empty();
    	//$("table tbody [id^='resutl_']").remove();
    	reloadGrid();
    }
    
    //全选列表数据
    function checkAll(checked) {
    	$("#DOneMecMagGrid tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
    //获取一键参数
    function  getParams () {
    	var mno = $('#DOneMecMagForm_mno').val().trim();
		var mnoNm = $('#DOneMecMagForm_mnoNm').val().trim();
		var busSts = $('#DOneMecMagForm_busSts').val();;
		
		var wdcFlgPaused = "";
		var wdcFlgOpen = "";
		if(busSts=="0"){//关闭
			wdcFlgPaused ="0";
			wdcFlgOpen ="0";
		}else if(busSts=="1"){//开通
			wdcFlgPaused ="1";
			wdcFlgOpen ="1";
		}else if(busSts=="2"){//暂停
			wdcFlgPaused ="0";
			wdcFlgOpen ="1";
		}
    	
       var curParams = {
			"mno":mno,
			"mnoNm":mnoNm,
			"wdcFlgPaused":wdcFlgPaused,
			"wdcFlgOpen":wdcFlgOpen
		};
        return curParams;
    }
    
    
    var query_Path = baseURL + "/tZero/mecQry/query";
    //查询数据
    function reloadGrid() {
    	$("#DOneMecMagGrid").find('tbody').empty();
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
    			$("#DOneMecMagGrid").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	
                	var trData = [];
                	trData.push(index+1);
                	trData.push(obj.mno!=null?obj.mno:"");
                	trData.push(obj.mnoNm!=null?obj.mnoNm:"");
                	if(obj.busSts=="0"){
                		trData.push("关闭");
                	}else if(obj.busSts=="1"){
                		trData.push("开通");
                	}else{
                		trData.push("暂停");
                	}
                	trData.push(obj.acRate!=null?obj.acRate:"");
                	trData.push(obj.freeAmt!=null?obj.freeAmt:"");
                	var updOp = "<div>";
                	if(hasPermission(PERMISSSIONCONST.TZER8704)){
                		updOp += "<a href = 'javascript:void(0)' class='updateopt' data-inMno='"+ obj.inMno+"' data-freeAmt='"+obj.freeAmt+"' data-mnoNm='"+ obj.mnoNm +"' >修改单笔免费额度</a>";
                	}
                	updOp +="</div>";
                	trData.push(updOp);
                	var op="<div>";
                	if(hasPermission(PERMISSSIONCONST.TZER8705)){
                		op += "<a href = 'javascript:void(0)' class='updateoptHis' data-inMno='"+ obj.inMno+"'>单笔免费额度修改记录</a>";
                	} 
                	if(hasPermission(PERMISSSIONCONST.TZER8706)){
                		op +="&nbsp;<a href = 'javascript:void(0)' class='DOneBusStsOptHis' data-inMno='"+ obj.inMno+"'>业务状态记录查询</a>"
                	}
                	op +="</div>";
            		trData.push(op);
                	
                	for(i=0; i < trData.length; i++){
                   	 	if(trData[i] == undefined){
                   		 	trData[i] = ''; 
                   	 	}
                    }

                   	$("#DOneMecMagGrid").DataTable().row.add(trData).draw();
                });
                $("#DOneMecMagGrid").DataTable().order([0, 'asc']).draw();
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
    	if(!hasPermission(PERMISSSIONCONST.TZER8701)){  
    		$("#DOneMecMagPanel_query").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.TZER8702)){  
    		$("#DOneMecMagPanel_download_btn").hide();
    	}
    	if(!hasPermission(PERMISSSIONCONST.TZER8812)){  
    		$("#DOneMecMagPanel_export").hide();
    	}
    	
    	$("#DOneMecMagForm_busSts").selectpicker('val','1');
    	
    	//查询按钮
		$("#DOneMecMagPanel_query").on('click', reloadGrid);
    	
    	//重置
    	$("#DOneMecMagPanel_reset").on("click",function(){
    		$("#queryMecDOneMagQuery_myForm")[0].reset();
    		$("#DOneMecMagForm_busSts").selectpicker('val','1');
    	});
    	
    	//打开下载模板弹窗
    	$("#DOneMecMagPanel_download_btn").on("click",function(){
    		$("#exportmodelWin").modal("show");
    	});
    	
    	//下载模板
    	$("#exporDOneMecMagModel").on("click",function(){
    		var url = baseURL+"/tZero/mecMag/download";
			window.open(url);
    	});
    	
		//打开批量导入操作按钮
		$("#DOneMecMagPanel_export").on('click', function() {
			$("#excelExportWindow").modal("show");
			$("#fileattr").val("");
			$("#DOneMecMagPanel_confirm_btn").on("click",function(){
				var opTyp = $('#excelExportForm_opTyp').val();
				var rmk = $('#excelExportForm_rmk').val();
				if(''==opTyp || null == opTyp){
	        		bootbox.alert("操作类型为必输项！");
	        		return;
	        	}
	        	if(''==rmk || null == rmk){
	        		bootbox.alert("操作备注为必输项！");
	        		return;
	        	}
				bootbox.alert("请选择文件！");
				return;
        	});
		});
		
		var uploadurl = baseURL + "/tZero/mecMag/import";
		//初始化上传插件
		$('#file').fileupload({
	        dataType: 'json',
	        url:uploadurl,//文件上传地址，当然也可以直接写在input的data-url属性内
	        add: function (e, data) {
	        //	console.log(data);
	        	$("#fileattr").val(data.files[0].name);
	        	$("#DOneMecMagPanel_confirm_btn").unbind("click");
	        	$("#DOneMecMagPanel_confirm_btn").on("click",function(){
	        		var opTyp = $('#excelExportForm_opTyp').val();
	        		var rmk = $('#excelExportForm_rmk').val();
	        		if(''==opTyp || null == opTyp){
		        		bootbox.alert("操作类型为必输项！");
		        		return;
		        	}
	        		console.log(data)
		        	if(''==rmk || null == rmk){
		        		bootbox.alert("操作备注为必输项！");
		        		return;
		        	}
	        		bootbox.confirm("确定要批量导入操作吗?",function(y){
	        			if(y){
	        				App.blockUI({target:"body",boxed:!0,message:"导入中...",zIndex:20000});
	        				data.formData ={"opTyp":opTyp,"rmk":rmk};
	        				data.submit();
	        			}
	        		})
	        	});
	        },
	        done: function (e, data) {  
				if(data.result.hasErro){
					$("#DOneMecMagPanel_confirm_btn").unbind("click");
					bootbox.alert(data.result.msg+"详情如下",function(y){
						$("#DOneMecMagImportErroWin tbody").empty();
						$.each(data.result.errors,function(index, obj){
							var tr = $("<tr></tr>").append($("<td></td>").text(obj.place));
		                	tr.append($("<td></td>").text(obj.mno));
		                	tr.append($("<td></td>").text(obj.erroMsg));
		            		$("#DOneMecMagImportErroWin tbody").append(tr);
	            		});
						$("#DOneMecMagImportErroWin").modal("show");
					});
				}else{
					bootbox.alert(data.result.msg);
				}
	        	reloadGrid();
				$("#excelExportWindow").modal("hide");
	        }
	    });
		
		//导出导入操作的错误数据
		$("#DOneMecMagPanel_importErroWin_export").on("click",function(){
			 window.open(baseURL + "/tZero/mecMag/exportErro");
			 $("#DOneMecMagImportErroWin").modal("hide");
		});
		
		//打开修改单笔免费额度窗口
		$(document).on("click",".updateopt",function(){
			var inMno = $(this).attr("data-inMno");
			var freeAmt = $(this).attr("data-freeAmt");
			var mnoNm = $(this).attr("data-mnoNm");
			
			$('#DOneMagUpdForm_inMno').val(inMno);

			if(freeAmt!=null && freeAmt!="undefined" && freeAmt!= undefined){
				$('#DOneMagUpdForm_freeAmt').val(freeAmt);
			}
			$('#DOneMagUpdForm_mnoNm').val(mnoNm);
			$('#DOneMagUpdForm_newFreeAmt').val("");
			$('#DOneMagUpdForm_rmk').val("");
			$("#DOneMagUpdWindow").modal("show");
		});
		
		//修改单笔免费额度确定按钮
		$("#DOneMagUpdWindow_confirm_btn").on("click",function(){
			var inMno = $('#DOneMagUpdForm_inMno').val();
			var freeAmt = $('#DOneMagUpdForm_freeAmt').val();
			var newFreeAmt = $('#DOneMagUpdForm_newFreeAmt').val();
			var rmk = $('#DOneMagUpdForm_rmk').val();
			if(freeAmt == newFreeAmt){
				bootbox.alert( "变更前后额度一致");
				return;
			}
			if(newFreeAmt >9999999999){
				bootbox.alert( "变更单笔免费额度最大值不能超过9999999999");
				return;
			}
			var regex = /^[1-9]\d*$/;
    		if(!regex.test(newFreeAmt)){
    			bootbox.alert( "变更单笔免费额度仅支持输入非负整数");
				return;
    		}
			App.blockUI({target:"body",boxed:!0,message:"保存中...",zIndex:20000});
			var param ={
				"inMno"      : inMno,
				"freeAmt"    : freeAmt,
				"newFreeAmt" : newFreeAmt,
				"rmk"        : rmk	
			};
			$.ajax({
	            type: "POST",
	            url: baseURL+"/tZero/mecMag/update",
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            data: param,
	            dataType: "json",
	            success: function(data) {
	            	if(data.timeout){
	            		ajaxTimeout();
	                }
	            	if(data.success){
	            		bootbox.alert( "成功");
	            	}else{
	            		bootbox.alert(data.msg);
	            	}
	            	$("#DOneMagUpdWindow").modal("hide");
	            	page = 1;
	            	reloadGrid();
	            },
	            error:function(){bootbox.alert("连接超时！");}
			});   	
		});
   	});
    
    //打开历史操作记录
    $(document).on("click",".updateoptHis",function(){
    	var inMno = $(this).attr("data-inMno");
    	App.blockUI({target:"body",boxed:!0,message:"加载中...",zIndex:20000});
    	$.ajax({
            type: "POST",
            url: baseURL+"/tZero/mecMag/log?inMno="+inMno,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	$("#DOneMecMagOptHisGrid").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	var trData = [];
                	trData.push(index+1);
                	trData.push(obj.mno!=null?obj.mno:"");
                	trData.push(obj.mnoNm!=null?obj.mnoNm:"");
                	trData.push(obj.freeAmtB);
                	trData.push(obj.freeAmtA);
                	trData.push(obj.opCte);
                	trData.push(obj.opS);
                	trData.push(obj.tmCte);
                	trData.push(obj.rmk);
                	
                	for(i=0; i < trData.length; i++){
                   	 	if(trData[i] == undefined){
                   		 	trData[i] = ''; 
                   	 	}
                    }

                   	$("#DOneMecMagOptHisGrid").DataTable().row.add(trData).draw();
                   	
                });
                $("#DOneMecMagOptHisWin").modal("show");
            },
            error: function(error) {
            }
        });
    });
    
    //业务状态记录
    $(document).on("click",".DOneBusStsOptHis",function(){
    	var inMno = $(this).attr("data-inMno");
    	App.blockUI({target:"body",boxed:!0,message:"加载中..."});
    	$.ajax({
            type: "POST",
            url: baseURL+"/tZero/mecMag/queryDOneBusStsOptHis?inMno="+inMno,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	$("#DOneBusStsOptHisGrid").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	var trData = [];
                	trData.push(index+1);
                	trData.push(obj.mno!=null?obj.mno:"");
                	trData.push(obj.operTypeLabel!=null?obj.operTypeLabel:"");
                	trData.push(obj.cteStffNo);
                	trData.push(obj.opTime);
                	trData.push(obj.sysId);
                	trData.push(obj.rmk);
                	
                	for(i=0; i < trData.length; i++){
                   	 	if(trData[i] == undefined){
                   		 	trData[i] = ''; 
                   	 	}
                    }

                   	$("#DOneBusStsOptHisGrid").DataTable().row.add(trData).draw();
                   	
                });
                $("#DOneBusStsOptHisWin").modal("show");
            },
            error: function(error) {
            }
        });
    });
    </script>  
</body>

</html>
