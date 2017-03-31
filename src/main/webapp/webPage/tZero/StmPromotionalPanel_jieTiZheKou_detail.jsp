<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh-hans">
<!--<![endif]-->

<%
 String promotNo=request.getParameter("promotNo");
%>
<head>
    <meta charset="utf-8" />
    <title>随行付收单管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=320, initial-scale=1" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <jsp:include page="../common/resource.jsp" flush="true"/>
    
    <style type="text/css">
    body {
    	background-color:#FFFFFF;
    }
    </style>
    
</head>

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md">

	<!-- BEGIN CONTAINER -->
	<div class="clearfix"></div>
	<div class="page-container">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<h4 class="modal-title" id="">阶梯折扣</h4>
		</div>
		<div class="modal-body">
			<div class="portlet-body form">
				<form action="<%=request.getContextPath()%>/"
					class="form-horizontal" id="">
					<div class="form-body">
							<div class="row norow">
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
									<div class="form-group">
										<label for="span-medium-2"
											class="control-label col-md-6 text-center">&nbsp;&nbsp;&nbsp;</label>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center">
									<div class="form-group">
										<label class="control-label col-md-12 text-center">即日付周期累计结算金额</label>
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 text-center">
									<div class="form-group">
										<label for="span-medium-2"
											class="control-label col-md-12 text-center">折扣比例</label>
									</div>
								</div>
							</div>
							<br />
							<!-- 折扣1 -->
							<div class="row norow">
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
									<div class="form-group">
										<label for="span-medium-2"
											class="control-label col-md-6 text-right">阶梯1: </label>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center">
									<div class="form-group">
										<label id="jieTiZheKou_AddForm_ladderBeginAmtL1"
											class="control-label col-md-6 text-center">0-------</label>
										<div class="col-md-6 paddingnone">
											<input name="jieTiZheKou_AddForm_ladderEndAmtL1"
												id="jieTiZheKou_AddForm_ladderEndAmtL1" type="number"
												class="form-control onlyNum">
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
									<div class="form-group">
										<div class="col-md-6 paddingnone">
											<input name="ladderL1" id="ladderL1" type="number"
												class="form-control onlyNum">
										</div>
										<label class="control-label col-md-3 text-right">%</label>
									</div>
								</div>
							</div>
							<!-- 折扣2 -->
							<div class="row norow">
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
									<div class="form-group">
										<label for="span-medium-2"
											class="control-label col-md-6 text-right">阶梯2: </label>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center">
									<div class="form-group">
										<label id="jieTiZheKou_AddForm_ladderBeginAmtL2"
											class="control-label col-md-6 text-center">-------</label>
										<div class="col-md-6 paddingnone">
											<input name="jieTiZheKou_AddForm_ladderEndAmtL2"
												id="jieTiZheKou_AddForm_ladderEndAmtL2" type="number"
												class="form-control onlyNum">
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
									<div class="form-group">
										<div class="col-md-6 paddingnone">
											<input name="ladderL2" id="ladderL2" type="number"
												class="form-control onlyNum">
										</div>
										<label class="control-label col-md-3 text-right">%</label>
									</div>
								</div>
							</div>
							<!-- 折扣3 -->
							<div class="row norow">
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
									<div class="form-group">
										<label for="span-medium-2"
											class="control-label col-md-6 text-right">阶梯3: </label>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center">
									<div class="form-group">
										<label id="jieTiZheKou_AddForm_ladderBeginAmtL3"
											class="control-label col-md-6 text-center">-------</label>
										<div class="col-md-6 paddingnone">
											<input name="jieTiZheKou_AddForm_ladderEndAmtL3"
												id="jieTiZheKou_AddForm_ladderEndAmtL3" type="number"
												class="form-control onlyNum">
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
									<div class="form-group">
										<div class="col-md-6 paddingnone">
											<input name="ladderL3" id="ladderL3" type="number"
												class="form-control onlyNum">
										</div>
										<label class="control-label col-md-3 text-right">%</label>
									</div>
								</div>
							</div>
							<!-- 折扣4 -->
							<div class="row norow">
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
									<div class="form-group">
										<label for="span-medium-2"
											class="control-label col-md-6 text-right">阶梯4: </label>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center">
									<div class="form-group">
										<label id="jieTiZheKou_AddForm_ladderBeginAmtL4"
											class="control-label col-md-6 text-center">-------</label>
										<div class="col-md-6 paddingnone">
											<input name="jieTiZheKou_AddForm_ladderEndAmtL4"
												id="jieTiZheKou_AddForm_ladderEndAmtL4" type="number"
												value="999999999999" disabled="disabled"
												class="form-control onlyNum">
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
									<div class="form-group">
										<div class="col-md-6 paddingnone">
											<input name="ladderL4" id="ladderL4" type="number"
												class="form-control onlyNum">
										</div>
										<label class="control-label col-md-3 text-right">%</label>
									</div>
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
								style="display: none">
								<div class="form-group">
									<div class="col-md-3 paddingnone">
										<input name="jieTiZheKou_AddForm_promotNo"
											id="manZeng_AddForm_promotNo" class="form-control">
									</div>
								</div>
							</div>



							<br />
						<br />
						<div class="row norow">

							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
								<div class="form-group">
									<label for="span-medium-2" id="manzengDetail_count"
										class="control-label col-md-10 text-right"></label>

								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
								<div class="form-group">
									<label for="span-medium-2" id="manzengDetail_mexproxy"
										class="control-label col-md-10 text-right"></label>

								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
								<div class="form-group">
									<button type="button" id="manzengDetail_exportexcel"
										class="btn btn-success">
										<i class="fa fa-out"></i> 导出Excel
									</button>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="row norow"></div>
					</div>

				</form>
			</div>
		</div>
		<!-- END CONTENT -->
		
		<div class="row norow">
			<div class="panel panel-primary">
				<div class="panel-heading">阶梯折扣详情</div>
				<div class="portlet-body wheel">
					<table
						class="table table-striped table-bordered table-hover table-checkable order-column"
						id="importGridPanel">
						<thead>
							<tr>
								<th class="nowrap">序号</th>
								<th class="nowrap">分公司</th>
								<th class="nowrap">一代编号</th>
								<th class="nowrap">一代名称</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>

			<!-- 分页开始 -->
			<div class="row no-margin" id="pagination-bar">
				<div class="col-sm-4 left no-padding">
					<div class="inline fl">
						记录数共:<span id="itemCount"></span>条 当前第<span id="nowpage"></span>/<span
							id="totalPage"></span>页 每页显示:
					</div>
					<div class="inline fl">
						<select id="limit" class=" form-control "
							onchange="onChange4PageSize(this)">
							<option value="20" selected="selected">20</option>
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
		<br /> <br />
		<div class="form-actions">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12" style="text-align: center;">
							<button type="button" id=""
								onclick="javascript:parent.$.fancybox.close()"
								class="btn btn-success">
								<i class="fa fa-share"></i> 确定
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- END CONTAINER -->


	<!-- BEGIN FOOTER -->
	<jsp:include page="../common/footer.jsp" flush="true" />
	<!-- END FOOTER -->

</body>
<script type="text/javascript">
var baseURL = "<%=request.getContextPath()%>";


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

var promotNo;

var constTotalCount;
//分页
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
    	importReloadGrid();
 }


//全选列表数据
function checkAll(checked) {
	$("#queryInnerGridPanel tbody :checkbox").prop('checked', checked);
}

function onChange4PageSize(select) {
	limit = select.value;
	importReloadGrid();
}



//查询数据
  function importReloadGrid() {
	  
  	$('table > tbody').empty();
  	if(limit==0) {
  		//默认20条
  		limit=20;
  	}
  	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
		
		param.promotNo = promotNo;
		$.ajax({
          type: "POST",
          url: baseURL + "/stmPromotional/queryPromotScopeList",
          contentType: "application/x-www-form-urlencoded;charset=utf-8",
          data: param,
          dataType: "json",
          success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
        	constTotalCount = data.totalCount;
          	totalPage=Math.ceil(data.totalCount/limit);
  			$("#itemCount").text(data.totalCount);
  			$("#nowpage").text(page);
  			$("#totalPage").text(totalPage);
  			if (!data.totalCount || data.totalCount == 0) {
  				$("#pagination-bar").hide();
  			$("#manzengDetail_count").text("共计分公司: " + 0);
  			$("#manzengDetail_mexproxy").text("共计代理商: " + 0);
  				return;
  			}
  			$("#manzengDetail_count").text("共计分公司: " + constTotalCount);
  			$("#manzengDetail_mexproxy").text("共计代理商: " + constTotalCount);
  			
  			
  			tableData = $.extend(true, {}, data);//cache
  			
              $("#importGridPanel tbody").empty();
              //data = Object {items: Array[20], totalCount: 269}
              $.each(data.items, function(index, obj) {
              	var tr = $("<tr></tr>");
              	tr.append($("<td></td>").text(start + index + 1));
              	tr.append($("<td class=\"nowrap\"></td>").text(obj.orgNm));
              	tr.append($("<td class=\"nowrap\"></td>").text(obj.agentCd));
              	tr.append($("<td class=\"nowrap\"></td>").text(obj.name));
              	$("#importGridPanel tbody").append(tr);
              });
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
          },
          error: function(error) {
        	  
          }
      });
	}



  $(function(){
    	
	  
	  promotNo = '<%=promotNo%>';
	  
	     $.ajax({
  	          type: "GET",
  	          url: baseURL+"/stmPromotional/jieTiZheKouDetail/" + promotNo,
  	          data:{
  	        	start:0,
  	        	page:1,
  	        	limit:25
  	          },
  	          contentType: "application/x-www-form-urlencoded;charset=utf-8",
  	          dataType: "json",
  	          success: function(json) {
  	        	  if(json){
		   				 $('#jieTiZheKou_AddForm_ladderEndAmtL1').val(json.ladderEndAmtL1);
		   		   		 $('#jieTiZheKou_AddForm_ladderEndAmtL2').val(json.ladderEndAmtL2);
		   		   		 $('#jieTiZheKou_AddForm_ladderEndAmtL3').val(json.ladderEndAmtL3);
		   		   		 $('#ladderL1').val(json.ladderL1);
		   		   		 $('#ladderL2').val(json.ladderL2);
		   		   		 $('#ladderL3').val(json.ladderL3);
		   		   		 $('#ladderL4').val(json.ladderL4);
		   				 $('#jieTiZheKou_AddForm_ladderEndAmtL1').attr('disabled', true);
		   		   		 $('#jieTiZheKou_AddForm_ladderEndAmtL2').attr('disabled', true);
		   		   		 $('#jieTiZheKou_AddForm_ladderEndAmtL3').attr('disabled', true);
		   		   		 $('#ladderL1').attr('disabled', true);
		   		   		 $('#ladderL2').attr('disabled', true);
		   		   		 $('#ladderL3').attr('disabled', true);
		   		   		 $('#ladderL4').attr('disabled', true);
		   		   		 
		   		   		 
		 	 	  		$('#jieTiZheKou_AddForm_ladderBeginAmtL1').text('0-------');
			 	  		$('#jieTiZheKou_AddForm_ladderBeginAmtL2').text(json.ladderBeginAmtL2+'-------');
			 	  		$('#jieTiZheKou_AddForm_ladderBeginAmtL3').text(json.ladderBeginAmtL3+'-------');
			 	  		$('#jieTiZheKou_AddForm_ladderBeginAmtL4').text(json.ladderBeginAmtL4+'-------');
  	        	  }  
  	          },
  	          error: function(json) {
  	        	  
  	          }
  		  });
	  
	     
	     importReloadGrid();
			//导出excel按钮
			$("#manzengDetail_exportexcel").on('click', function() {
				
				if(constTotalCount <= 0){
					bootbox.alert("当前没有数据可以导出!");
					return;
				}
			
				if(constTotalCount > 300000){
					bootbox.alert("超过了30万条数据，请筛选数据!");
					return;
				} 
				
				bootbox.confirm('共'+constTotalCount+'条记录，确定要导出excel?',function(truthBeTold) {
					if (truthBeTold) { 
			    		window.open(baseURL+"/stmPromotional/epexcel/" + promotNo);
			    	}
				}); 
				
			});
			
			
			
	   	});


  


</script>
</html>

