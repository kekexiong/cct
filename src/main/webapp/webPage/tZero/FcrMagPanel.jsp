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
											<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">起止日期:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <div class="input-group input-daterange" >
		                                                    <input type="text" class="form-control col-md-4" name="dtOpenBg" id="dtOpenBg">
		                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i> </span>
		                                                    <input type="text" class="form-control col-md-4" name="dtOpenEd" id="dtOpenEd">
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
														<div class="col-md-offset-1 col-md-11">
															<button type="button" id="query_btn"
																class="btn btn-success">
																<i class="fa fa-search"></i> 查询
															</button>
															<button type="button" id="reset_btn" class="btn red">
																<i class="fa fa-refresh"></i> 重置
															</button>
															<button type="button" id="importPanel_download_btn" class="btn red">
															    <i class="fa fa-out"></i> 下载模板
															</button>
		                                                    <button type="button" id="importPanel_add_btn" class="btn btn-info">
		                                                     <i class="fa fa-add"></i>批量导入
		                                                     </button>
														</div>
													</div>
												</div>
											</div>
										</div>
								</form>
							</div>


						</div>
						<div class="clearfix"></div>
						<div class="portlet light bordered scaffold-list">
							<div class="portlet-title">
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">资金成本比例信息列表</span> </div>
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
												<th class="nowrap">日期</th>
												<th class="nowrap">D+1资金成本比例</th>
												<th class="nowrap">随意通资金成本比例</th>
												<th class="nowrap">即日付资金成本比例</th>
												<th class="nowrap">闪电到账资金成本比例</th>
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
											<option value="10" >10</option>
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
												<li class="prev "> <a href="javascript:;" onclick="javascript:pageing(1)"> 首页</a> </li>
												<li class="prev "> <a href="javascript:;" onclick="javascript:pageing('pro')"> 上一页</a> </li>
												<li class="next "><a href="javascript:;" onclick="javascript:pageing('next')">下一页</a></li>
												<li class="next "><a href="javascript:;" onclick="javascript:pageing('last')">末页</a></li>
											</ul>
											<div class="input-group pull-right col-sm-2"
												style="float: left;">
												<input min="1" class="form-control p"
													style="height: 31px; width: 50px;" type="number"> <a
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

	</div>


    
     
     <div class="modal fade" id="importExcelWin" tabindex="-1" data-backdrop="static" data-width="600px">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="">EXCEL文件导入</h4>
	         </div>
	         <div class="modal-body">
	            <div class="portlet-body form">
                       <form action="<%=request.getContextPath()%>/" enctype="multipart/form-data" class="form-horizontal" id="exportform">
                           <div class="form-body">
  
                                   <div class="clearfix"></div>
                                   <div class="row norow">
                                   <div class="col-lg-12 col-md-12 col-sm-8 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">上传文件路径:</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <div class="input-group">
		                                                    <input type="file" class="form-control col-md-4" name="file" id="file">
		                                                    <span id="error"  style="font-color:red"></span>
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
                                           <div class="col-md-12" style="text-align:center;">
                                               <button type="button" id="importform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 上传</button>
                                               <button type="button" id="importform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
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
<div class="modal fade" id="errorWindow" tabindex="-1" data-backdrop="static" data-width="800px">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="">批量修改失败的商编</h4>
            </div>
            <div class="modal-body">
                <div class="portlet-body form">
                                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                                       id="errorGrid">
                                    <thead>
                                    <tr>
                                        <th class="nowrap"> 序号</th>
                                        <th class="nowrap"> 错误信息</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                    
                    
               				 </div>
           					 </div>
                                    <div class="form-actions">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-offset-1 col-md-11">
                                        <button type="button" onclick="javascript:window.open('ses/payChanBlack/getPayChanFailExport')"
                                                    id="" class="btn red"><i class="fa fa-share"></i> 确定
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
            
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
    
    var constTotalCount;

    function changeTabName(obj){
    	tab = obj;
    	//重新加载表格数据
    	
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

    
    
  
    
    //查询数据
    function reloadGrid() {
    //http://127.0.0.1:8080/bap/tZero/FcrMag/queryFcrInfo?_dc=1472111617720	
    	
     	 if(limit==0) {
        	//默认20条
        	limit=20;
        }
       	start=(page-1)*limit;
    		//流水结果
    	var	url = baseURL + "/tZero/FcrMag/queryFcrInfo";
		var	param = {start:start,page:page,limit:limit};
  
    
    	//获取查询的参数
		var dtOpenBg  = $('#dtOpenBg').val().replace('/', '').replace('/', '');
		var dtOpenEd  = $('#dtOpenEd').val().replace('/', '').replace('/', '');

		
		param.dtOpenBg = dtOpenBg;
		param.dtOpenEd = dtOpenEd;
		App.blockUI({target:"body",boxed:!0,message:"读取中",zIndex:20000});
		$.ajax({
			//http://127.0.0.1:8080/bap/posAD_Mec/index?_dc=1471942708283&page=1&start=0&limit=15
            type: "POST",
            url: url,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data:param,
            dataType: "json",
            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
            	
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
    	    	    $("#queryMecGrid").DataTable().clear().draw();
                    //data = Object {items: Array[20], totalCount: 269}
                    $.each(data.items, function(index, obj) {
                    	var trData = [];
                    	trData.push(start+index+1);
                    	
                    	trData.push(obj.fcrDate);
                    	trData.push(obj.fcrD1 + '%');
                    	trData.push(obj.fcrSyt + '%');
                    	trData.push(obj.fcrJrf + '%');
                    	trData.push(obj.fcrSd + '%');
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
            },
            error: function(error) {
            	bootbox.alert("连接超时！");
            }
        });
	}
    
    
    
 
    $(function(){
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.STM2301)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.STM2302)) {$("#importPanel_download_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.STM2303)) {$("#importPanel_add_btn").hide();}
    	
    
         initDefaultDate();
         
         
 		//初始化模板下载按钮
 		$("#importPanel_download_btn").on('click', function(){
 			window.location.href = baseURL + "/tZero/FcrMag/downLoadFcrTemplate";
 			
 		});
 		
 		
		//修改按钮
		$("#importPanel_add_btn").on('click', function() {
			openImportExcelWin();
		});
         

    	
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		

	
	

		//重置按钮
		$("#reset_btn").on('click', function() {
			$("#queryMecPanel_Form")[0].reset();
			$("#queryMecPanel_Form .bs-select").selectpicker('val','');//重置select元素
			initDefaultDate();

		});

		
		
   	});
    
    
    
	
   
    
    
    // ----------------------------------------------------------------------
    // <summary>
    // 限制只能输入数字
    // </summary>
    // ----------------------------------------------------------------------
    $.fn.onlyNum = function () {
        $(this).keypress(function (event) {
            var eventObj = event || e;
            var keyCode = eventObj.keyCode || eventObj.which;
           if ((((keyCode >= 48 && keyCode <= 57) || (keyCode == 8 || keyCode == 46)))&&keyCode != 46)
               return true;
           else
               return false;
       }).focus(function () {
       //禁用输入法
           this.style.imeMode = 'disabled';
       });
  };
    
  function initDefaultDate(){
  	
  	var myDate = new Date();
  	
  	var tempMonth;
  	if(myDate.getMonth()<9){
  		tempMonth = '0'+ (myDate.getMonth() + 1);
  	}else{
  		tempMonth = myDate.getMonth() + 1;
  	}
  	
  	var tempDay;
  	if(myDate.getDate()<=9){
  		tempDay = '0'+ myDate.getDate();
  	}else{
  		tempDay = myDate.getDate();
  	}
  
  	var dateString = myDate.getFullYear()+"/"+tempMonth+"/"+tempDay;
  	//bootbox.alert(myDate.getMonth() +" hello "+myDate.getDate());
  	
  	$("#dtOpenBg").datepicker('update', dateString);
  	$("#dtOpenEd").datepicker('update', dateString);
  	
  }
  
  
  
//打开导入文件按钮
  function openImportExcelWin(){

	  $("#exportform")[0].reset();
  	$("#importform_save_btn").off('click').on('click', function() {

  		
  		var filepath = $("#file").val();
  		if(filepath==undefined||filepath==""){ 
  			//fileObject.focus(); 
  			bootbox.alert("请选择上传文件");
			return;
  		}
  		else{ 
  			var fileArr=filepath.split("\\"); 
  			var fileTArr=fileArr[fileArr.length-1].toLowerCase().split("."); 
  			var filetype=fileTArr[fileTArr.length-1]; 
  			
  			if(filetype!="xls"){ 
  				//fileObject.focus(); 
  				bootbox.alert("上传文件必须为03版Excel文件(后缀.xls)!");
  				return;
  		 	}
  	   } 
  		
  			  var fileObj = document.getElementById("file").files[0]; // 获取文件对象
  	  		  var form = new FormData();
  	  		   // FormData 对象
  	  		  form.append("uploadFile", fileObj); // 文件对象
  	  		App.blockUI({target:"body",boxed:!0,message:"正在处理，请稍后...",zIndex:20000});
  	         $.ajax({
  	             url:baseURL + "/tZero/FcrMag/upload/fcrInfo",
  	             type:"post",
  	             data:form,
  	             processData:false,
  	             contentType:false,
  	           	 dataType: "json",
  	  	         success:function(result){
  	  	        		   $("#importExcelWin").modal('hide');
  	  	        	       if(!result.success){
  	  	            		bootbox.alert(result.message);
  	  	            		reloadGrid();
  	  	            	}else{
  	  	            		
  	  	            		bootbox.alert("操作成功, 添加或更新了" + result.dealNum+"条记录");
  	  	            		//将返回的数据绑定到列表中
  	  	                    reloadGrid();
  	  	            	}
  	  	           },
  	  	           error:function(e){
  	  	               bootbox.alert("连接超时！！");
  	  	              // window.clearInterval(timer);
  	  	           }
  	         });
  		
  	});
	        
  	//弹出窗口取消按钮
	$("#importform_cancel_btn").off('click').on('click', function() {
			$("#importExcelWin").modal('hide');
  	});

  	$("#importExcelWin").modal('show');
  	
  	}


  /* 写到流水模板下载 流水批量导入，需要重新考虑（页面没有实现） */
  
    </script>
    
</body>

</html>
