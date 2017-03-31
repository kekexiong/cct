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
		                                            <label class="control-label col-md-4 text-right">日期:</label>
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
		                                            <label class="control-label col-md-5 text-right">结算类型:</label>
		                                            <div class="col-md-6 paddingnone">
		                                                <select name="bizType" id="bizType" class="bs-select form-control" data-show-subtext="true">
				            								<option value="">全部</option>	
				            								<option value="01">秒到</option>
															<option value="02">即刷即到</option>
															<option value="03">闪电到账</option>
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
		                                	<th class="nowrap">序号</th>
		                                    <th class="nowrap">商编</th>
		                                    <th class="nowrap">交易流水号 </th>
		                                    <th class="nowrap">金额 </th>
		                                    <th class="nowrap">手续费</th>
		                                    <th class="nowrap">日期 </th>
		                                    <th class="nowrap">结算类型</th>
		                                    <th class="nowrap">结算子类型 </th>
		                                    <th class="nowrap">错误码</th>
		                                    <th class="nowrap">错误原因 </th>
		                                 
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
		var url=baseURL+"/errorLogQuery/querErrorLogList";
		
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};

		param.mno=$('#mno').val()
		param.bizType=$('#bizType').val()
		param.expDtBg=$('#expDtBg').val().replace('/', '').replace('/', '').trim(); //开始时间
		param.expDtEd=$('#expDtEd').val().replace('/', '').replace('/', '').trim();
		
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
                	trData.push(start + index + 1);
                	
                	trData.push(obj.mno);
                	trData.push(obj.ordNo);
					trData.push(obj.patAmt);//交易限额
					trData.push(obj.feeAmt);
					trData.push(obj.dtCte);
					var bizTypeStr ="";
					if("01"==obj.bizType){
						bizTypeStr = "秒到";
					}else if("02"==obj.bizType){
						bizTypeStr = "即刷即到";
					}else if("03"==obj.bizType){
						bizTypeStr = "闪电到账";
					}
					
					trData.push(bizTypeStr);
					trData.push(obj.subType);
					trData.push(obj.errorCode);
					trData.push(obj.errorMsg);

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
    	if (!hasPermission(PERMISSSIONCONST.POSMD011)) {$("#query_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.POSMD010)) {$("#down_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.POSMD039)) {$("#mecq_detail_btn").hide();}
    	
    	$('#mecLevel').keypress(function(e) {
    		  if (!String.fromCharCode(e.keyCode).match(/[0-9]/)) {
    		    return false;
    		  }
    	});
    	//加载数据
    	 reloadGrid(); 
    	
    	//重置按钮
		 $("#reset_btn").on('click', function() {
			$("#queryMecPanel_Form")[0].reset();
			$("#queryMecPanel_Form .bs-select").selectpicker('val','');//重置select元素
			$("#dayLimitAmtBg").attr('disabled',false);
  			$("#dayLimitAmtEd").attr('disabled',false);  
		});  
    	
		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
   	});
    

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
	

    </script>
    
</body>

</html>
 
