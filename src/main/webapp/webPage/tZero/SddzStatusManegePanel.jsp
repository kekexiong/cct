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
      <style type="text/css">
        input.error { border: 1px solid red; }
    label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
  </style>
    

</head>

<!-- <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md"> -->
<body class="iframe-body">

    <!-- BEGIN HEADER -->
    <jsp:include page="../common/header.jsp" flush="true"/>
    <!-- END HEADER -->

	<!-- BEGIN CONTAINER -->
	<div class="clearfix"></div>
	<div class="page-container">

		<!-- BEGIN MENU -->
		<%-- <jsp:include page="../common/menu.jsp" flush="true" /> --%>
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
								<form action="<%=request.getContextPath()%>/mec/queryData"
									class="form-horizontal" id="queryMecPanel_Form">
									<div class="form-body">
										<div class="row norow">
											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-4 text-right">商户编号:</label>
													<div class="col-md-8 paddingnone">
														<input name="SddzStatusManegePanel_Form_mno"
															id="SddzStatusManegePanel_Form_mno" class="form-control"
															placeholder="请输入商户编号">
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-4 text-right">商户名称:</label>
													<div class="col-md-8 paddingnone">
														<input name="SddzStatusManegePanel_Form_cprRegNmCn"
															id="SddzStatusManegePanel_Form_cprRegNmCn"
															class="form-control" placeholder="请输入商户名称">
													</div>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-4 text-right"><font
														color="red">*</font>闪电到账状态:</label>
													<div class="col-md-8 paddingnone">
														<select name="SddzStatusManegePanel_Form_sddzSts"
															id="SddzStatusManegePanel_Form_sddzSts"
															class="bs-select form-control" data-show-subtext="true">
															<option value="0">暂停</option>
															<option value="1">正常</option>
														</select>
													</div>
												</div>
											</div>

										</div>
										<div class="form-actions">
											<div class="row">
												<div class="col-md-12">
													<div class="row">
														<div class="col-md-offset-1 col-md-11">
															<button type="button" id="query_btn"
																class="btn btn-success">
																<i class="fa fa-search"></i> 查询
															</button>
															<button type="button" id="reset_btn" class="btn red">
																<i class="fa fa-refresh"></i> 重置
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
					<div class="clearfix"></div>
					<div class="portlet light bordered scaffold-list">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-search font-blue"></i> <span
									class="caption-subject font-blue bold uppercase">闪电到账商户业务状态信息列表</span>
							</div>
							<div class="tools">
								<a href="" class="fullscreen" data-original-title="全屏" title=""></a>
							</div>
						</div>
						<div class="portlet-body wheel">
							<table
								class="table table-striped table-bordered table-hover table-checkable order-column"
								id="queryMecGrid">
								<thead>
									<tr>
										<th class="nowrap">序号</th>
										<th class="nowrap">商户编号</th>
										<th class="nowrap">商户名称</th>
										<th class="nowrap">闪电到账状态</th>
										<th class="nowrap">动作类型</th>
										<th class="nowrap">操作记录</th>
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
									记录数共:<span id="itemCount"></span>条 当前第<span id="nowpage"></span>/<span
										id="toalPage"></span>页 每页显示:
								</div>
								<div class="inline fl">
									<select id="limit" class=" form-control "
										onchange="onChange4PageSize(this)">
										<option value="10">10</option>
										<option value="20" selected="selected">20</option>
										<option value="30">30</option>
										<option value="50">50</option>
										<option value="80">80</option>
										<option value="100">100</option>
									</select>
								</div>
								<div class="inline fl">条</div>
							</div>

							<div class="col-sm-6 pull-right no-padding">
								<div id="pagination"
									class="dataTables_paginate paging_simple_numbers clearfix pull-right">
									<nobr>
										<ul class="pagination no-padding" style="float: left">
											<li class="prev "><a href="javascript:;"
												onclick="javascript:pageing(1)"> 首页</a></li>
											<li class="prev "><a href="javascript:;"
												onclick="javascript:pageing('pro')"> 上一页</a></li>
											<li class="next "><a href="javascript:;"
												onclick="javascript:pageing('next')">下一页</a></li>
											<li class="next "><a href="javascript:;"
												onclick="javascript:pageing('last')">末页</a></li>
										</ul>
										<div class="input-group pull-right col-sm-2"
											style="float: left;">
											<input min="1" class="form-control p"
												style="height: 31px; width: 80px;" type="number"> <a
												href="javascript:;" class="input-group-addon"
												onclick="javascript:pageing($('.p').val())"><i
												class="fa fa-mail-forward brown"></i></a>
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



	<div class="modal fade" id="importExcelWin" tabindex="-1" role="dialog"  data-backdrop="static"
	   aria-labelledby="myModalLabel" aria-hidden="true">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">动作原因</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" enctype="multipart/form-data" class="form-horizontal" id="exportform">
                           <div class="form-body">
  
                                   <div class="clearfix"></div>
                                   <div class="row norow">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">动作原因:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group">
		                                                	<textarea rows="5" cols="" id="SddzStatusManegePanel_operateSddzForm_rmk"></textarea>
		                                                </div>
		                                            </div>
		                                        </div>
		                            </div>
                                   <div class="col-lg-12 col-md-12 col-sm-8 col-xs-12" style="display:none">
		                                        <div class="form-group">
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group">
		                                                	<input id="SddzStatusManegePanel_operateSddzForm_inMno"></input>
		                                                </div>
		                                            </div>
		                                        </div>
		                            </div>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display:none">
		                                        <div class="form-group">
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group">
		                                                	<input id="SddzStatusManegePanel_operateSddzForm_operateTyp"></input>
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
                                               <button type="button" id="importform_save_btn" class="btn btn-success"><i class="fa fa-save"></i>保存</button>
                                               <button type="button" id="importform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </form>
                   </div>
	         </div>
	         <!-- 
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal">关闭
	            </button>
	            <button type="button" class="btn btn-primary">
	               提交更改
	            </button>
	         </div>
	          -->
       <!-- END CONTENT -->
   </div>

   
   
    <!-- BEGIN FOOTER -->
    <jsp:include page="../common/footer.jsp" flush="true"/>
    <!-- END FOOTER -->


<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.0/js/bootstrap-select.min.js"></script> -->
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
    
    var constTotalCount = 0;

    function changeTabName(obj){
    	tab = obj;
    	//重新加载表格数据
    	
    }
    
    //全选列表数据
    function checkAll(checked) {
    	$("#queryMecGrid tbody :checkbox").prop('checked', checked);
    }
  //onedit
    function openErrorWindow(item){
    	  
    	   $('table > tbody')[1].innerHTML = "";
     	
        $.each(item, function (index, obj) {
            var tr = $("<tr></tr>").append($("<td></td>").text(index));
            tr.append($("<td></td>").text(obj.erroMsg));
            $("#errorGrid tbody").append(tr);
        });
        
        $("#errorWindow").modal('show');
    }
    
    //分页1
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
    
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }

    
    
  
    
    //行业大类，商户推展类型,商户类型在码表中加载数据
    function getComboStore(element, type_code) {
    	$.ajax({
            type: "GET",
            url: baseURL+"/code/query/typ/" + type_code,
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

    
    function sddzOperate(inMno, operateTyp){
    	
		$("#exportform")[0].reset();
    	
    	
    	$("#importform_save_btn").off('click').on('click', function() {
    		
        	var rmk = $("#SddzStatusManegePanel_operateSddzForm_rmk").val().trim();
        	if(rmk == null || rmk == ""){
        		bootbox.alert("动作原因不能为空");
        		return;
        	}
        	if(rmk.length >= 60){
        		bootbox.alert("动作原因过长")
        	}
    		
    		
			App.blockUI({target:"body",boxed:!0,message:'操作中...',zIndex:20000});
			$.ajax({
	            type: "POST",
	            url: baseURL + "/sddz/opeateSddz",
	            data : {
	            	inMno : inMno,
	            	operateTyp : operateTyp,
	            	rmk : rmk,
				},
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            dataType: "json",
	            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
	            	$("#importExcelWin").modal('hide');
	            	if (data.success) {
						bootbox.alert(data.msg);
	            		reloadGrid();
						$("#exportform").resetForm();

					}else{
						bootbox.alert(data.msg); 
					}
	            	
	            },
	            error: function(error) {
	            	$("#importExcelWin").modal('hide');
	            }
	        });
    	});
    	//弹出窗口取消按钮
		$("#importform_cancel_btn").off('click').on('click', function() {
			$("#importExcelWin").modal('hide');
    	});
    	$("#importExcelWin").modal('show');
    	
    }
  	
    
    //查询数据
    function reloadGrid() {
    //http://127.0.0.1:8080/bap/tZero/FcrMag/queryFcrInfo?_dc=1472111617720	
        if(!$('#queryMecPanel_Form').valid()){ 
        	bootbox.alert("查询条件不正确");
            return ; 
        }  
    	$('table > tbody').empty();
     	 if(limit==0) {
        	//默认20条
        	limit=20;
         }
       	start=(page-1)*limit;
       	var param = {start:start, limit:limit, page:page};
       	
       
		param.mno = $('#SddzStatusManegePanel_Form_mno').val().trim(),
		param.cprRegNmCn = $('#SddzStatusManegePanel_Form_cprRegNmCn').val().trim(),
		param.sddzSts = $('#SddzStatusManegePanel_Form_sddzSts').val()
		
		//查询条件检测
		if(param.sddzSts == 1){
			if(param.mno == "" || param.mno == null){
				bootbox.alert("商户编号不能为空!");
				return;
			}
		}
		
		
    	var	url = baseURL + "/sddz/queryStatus";
        App.blockUI({target:"body",boxed:!0,message:"读取中...",zIndex:20000});
		$.ajax({
            type: "GET",
            url: url,
            data:param,
            dataType: "json",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
           	    $("#queryMecGrid tbody").empty();
            	constTotalCount = data.totalCount;
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
    			

    	    		//流水结果
    	 
                    //data = Object {items: Array[20], totalCount: 269}
    			    $("#queryMecGrid").DataTable().clear().draw();
                    $.each(data.items, function(index, obj) {
                    	var trData = [];
                    	trData.push(start + index + 1);
                    	
                    	trData.push(obj.mno);
                    	trData.push(obj.cprRegNmCn);
                    	
                    	var temSts = '';
                    	if(obj.sddzSts=='0'){
                    		temSts = '暂停';
    					}
    					else if(obj.sddzSts=='1'){
    						temSts = '正常';
    					}else{
    						temSts = '无';
    					}
                    	trData.push(temSts);
                    	var inMno = obj.inMno;
                    	var returnStr;
                    	
                    	if(obj.operateTyp == '1'){
                    		returnStr = "<INPUT type='button' value='暂停' id='stopSddz'    onclick=sddzOperate("+inMno+",'0')>";
                    	}else if(obj.operateTyp == '0'){
                    		returnStr = "<INPUT type='button' value='恢复' id='recoverSddz' onclick=sddzOperate("+inMno+",'1')>";
                    		
                    	}else{
                    		returnStr = '无';
                    	}
                    	if (!hasPermission(PERMISSSIONCONST.SDDZ0003)) {
                    		returnStr = '';
                    	}
                    	trData.push(returnStr);
                    	if (!hasPermission(PERMISSSIONCONST.SDDZ0004)) {
                    		trData.push('');
                    	} else {
                    		trData.push("<INPUT type='button'  value='查看' onclick=sddzOperateHis("+inMno+")>");
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
            },
            error: function(error) {
            	bootbox.alert("连接超时！");
            }
        });
	}
    
    
    
  
    
 
    $(function(){
    	/*初始化页面按钮权限*/
     	/*if (!hasPermission(PERMISSSIONCONST.SDDZ0003)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.SDDZ0004)) {$("#exportexcel_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.SDDZ0003)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.SDDZ0004)) {$("#exportexcel_btn").hide();}*/
    	$("#queryMecPanel_Form")[0].reset();
    	$('#SddzStatusManegePanel_Form_sddzSts').selectpicker('val', 0)
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
    	
    	   $('#queryMecPanel_Form').validate({
    	          rules: {
    	        	  SddzStatusManegePanel_Form_mno: {
    	              digits: true,
    	              rangelength:[15,15]
    	            },
    	          },
    	          messages: {
    	        	  SddzStatusManegePanel_Form_mno: {
    	              digits: '只能为数字',
    	              rangelength: '商户编号只能是15位数字'
    	            },
    	          }
    	      });


		//重置按钮
		$("#reset_btn").on('click', function() {
			$("#queryMecPanel_Form")[0].reset();
			$("#queryMecPanel_Form .bs-select").selectpicker('val','');//重置select元素
    	$('#SddzStatusManegePanel_Form_sddzSts').selectpicker('val', 0)

		});

				
		
		
   	});
    
    
    
	
   
    
  
  
//跳转到查看日志页面
  function sddzOperateHis(inMno){
  	 $.fancybox({afterLoad:fancyboxCenterOnViewport,
   		href:'SddzStatusManegePanel_detail.jsp?inMno=' + inMno,    
   		type: 'iframe',
   		/* padding: 5,
   		margin:60, 
   		scrolling: 'no',
   		fitToView: true,
   		width: 1000,
   		height: 800,
   		autoSize: false, 
   		closeClick: false,
   		 */onStart:function(){
   			//reloadGrid();
   			//$("#fancybox-overlay").css({"position":"fixed"});
   			$("#fancybox-wrap").css({"position":"fixed"});
   			$("#fancybox-wrap").css({"overflow":"scroll"});
   		} 
   	}); 
  	
  	
  }


  /* 写到流水模板下载 流水批量导入，需要重新考虑（页面没有实现） */
  
    </script>
    
</body>

</html>
