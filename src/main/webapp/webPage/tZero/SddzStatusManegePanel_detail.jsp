<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh-hans">
<!--<![endif]-->

<%
 String inMno=request.getParameter("inMno");
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

<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md">

	<!-- BEGIN CONTAINER -->
	<div class="clearfix"></div>
	<div class="page-container">
		<div class="portlet-body form">
			<form action="<%=request.getContextPath()%>/" class="form-horizontal"
				id="moreInfoForm">
				<div class="form-body">
					<div class="row norow">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h4 class="panel-title">闪电到账操作流水</h4>
							</div>
							<div class="panel-body">
											<table
												class="table table-striped table-bordered table-hover table-checkable order-column"
												id="moreInfoGridPanel">
												<thead style="font-size: 2px">
													<tr>
														<th>商户编号</th>
														<th>闪电到账原状态</th>
														<th>操作动作</th>
														<th>操作员</th>
														<th>操作时间</th>
														<th>原因</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>


										<div class="clearfix"></div>
									</div>
									</div>
									</div>
			</form>
		</div>
	</div>
	<!-- end the modal window  -->

 
    <!-- BEGIN FOOTER -->
    <jsp:include page="../common/footer.jsp" flush="true"/>
    <!-- END FOOTER -->
    
</body>
<script type="text/javascript">

var baseURL = "<%=request.getContextPath()%>";


  $(function(){
    	
  	/*初始化页面按钮权限*/

    var	inMno = '<%=inMno%>';

		//$("#queryMecPanel_Form")[0].reset();
		var pathUrl = baseURL + '/sddz/opeateSddzHis/' + inMno+"?_dc=1472645233701&page=1&start=0&limit=20";
		showMoreInfo(pathUrl);

	});

	function showMoreInfo(pathUrl) {
		$("#moreInfoGridPanel tbody").empty();

		$.ajax({
			type : "GET",
			url : pathUrl,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(data) {
				if (data) {

					if(data.totalCount <= 0){
						bootbox.alert("没有操作记录", function(){
							parent.$.fancybox.close();
						});
						return;
					}

					$("#moreInfoGridPanel").DataTable().clear().draw();
					$.each(data.items, function(index, obj) {

						var tr = $("<tr></tr>");
						var trData = [];
						trData.push(obj.mno);
						trData.push(transfersddzSts(obj.sddzSts));
						trData.push(transferFeeCapFlg(obj.operateTyp));
						trData.push(obj.operateHisOpetater);
						trData.push(obj.operateHisDate);
						trData.push(obj.operateHisRmk);
						for(i=0; i < trData.length; i++){
		                	 if(trData[i] == undefined){
		                		 trData[i] = ''; 
		                	 }
		                 }

		                	 $("#moreInfoGridPanel").DataTable().row.add(trData);
		                	
		                	
		                });
		                $("#moreInfoGridPanel").DataTable().order([0, 'asc']).draw();


				} else {
					bootbox.alert("读取失败! ");
					parent.$.fancybox.close();
					return;
				}

			},
			error : function(error) {
				bootbox.alert("连接超时!");
				parent.$.fancybox.close();
			}
		});

	}

	function transferFeeCapFlg(value) {
		if (value == '01') {
			returnStr="恢复";
		} else if (value == '00') {
			returnStr="暂停";
		} else {
			returnStr = '无';
		}
		return returnStr;

	}
	function transfersddzSts(value) {
		if (value == '01') {
			returnStr="暂停";
		} else if (value == '00') {
			returnStr="正常";
		} else {
			returnStr = '无';
		}
		return returnStr;

	}
</script>
</html>

