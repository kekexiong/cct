<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
String inMno=request.getParameter("inMno");
String uuid=request.getParameter("uuid");
%>
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

		<!-- BEGIN CONTENT -->
		<div class="portlet-body form">
			<div class="form-body">
				<div class="row norow">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">详细信息</h4>
						</div>
						<div class="panel-body">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-4 text-right">商户编号:</label>
									<div class="col-md-8 paddingnone">
										<input name="usrId" id="SddzOperateAuditPanel_fields_base_mno"
											readonly class="form-control" placeholder="">
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-4 text-right">检索参考号:</label>
									<div class="col-md-8 paddingnone">
										<input name="mno"
											id="SddzOperateAuditPanel_fields_base_retReNo" readonly
											class="form-control" placeholder="">
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-4 text-right">身份证号:</label>
									<div class="col-md-8 paddingnone">
										<input name="mecTyp"
											id="SddzOperateAuditPanel_fields_base_crdId" readonly
											class="form-control" placeholder="">
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-4 text-right">交易时间:</label>
									<div class="col-md-8 paddingnone">
										<input name="cprOperNmCn"
											id="SddzOperateAuditPanel_fields_base_tranDt" readonly
											class="form-control" placeholder="">
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-4 text-right">商户名称:</label>
									<div class="col-md-8 paddingnone">
										<input name="mecDisNm"
											id="SddzOperateAuditPanel_fields_base_cprRegNmCn" readonly
											class="form-control" placeholder="">
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-4 text-right">卡号:</label>
									<div class="col-md-8 paddingnone">
										<input name="SddzOperateAuditPanel_fields_base_tranCrdNo"
											id="SddzOperateAuditPanel_fields_base_tranCrdNo" readonly
											class="form-control" placeholder="">
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-4 text-right">刷卡人姓名:</label>
									<div class="col-md-8 paddingnone">
										<input name="busOverviewBen"
											id="SddzOperateAuditPanel_fields_base_crdName" readonly
											class="form-control" placeholder="">
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-4 text-right">审核状态:</label>
									<div class="col-md-8 paddingnone">
										<input name="audSts" id="audSts" readonly class="form-control"
											placeholder="">
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-4 text-right">提取金额:</label>
									<div class="col-md-8 paddingnone">
										<input name="mecProvNm"
											id="SddzOperateAuditPanel_fields_base_stmAmt" readonly
											class="form-control" placeholder="">
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-4 text-right">结算手续费:</label>
									<div class="col-md-8 paddingnone">
										<input name="mecCityNm"
											id="SddzOperateAuditPanel_fields_base_stmFeeAmt" readonly
											class="form-control" placeholder="">
									</div>
								</div>
							</div>
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-4 text-right">刷卡人银行预留手机号:</label>
									<div class="col-md-4 paddingnone">
										<input name="mecDistNm"
											id="SddzOperateAuditPanel_fields_base_rsvPhoneNo" readonly
											class="form-control col-md-4" placeholder="">
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!--  -->
				<div class="row norow">
					<div class="panel panel-primary">
						<div class="panel-body in-line" >
								<div name="photoReceipts" id="photoReceiptsID"
								onclick="showBigPicForSDDZ('SddzOperateAuditPanel_fields_photo_receipts');"
									style="width:266px; height:200px;border:1px solid #000;">
									<img id="SddzOperateAuditPanel_fields_photo_receipts"  src="temppath.jpg"
										alt="小票照片" title="小票照片,单击查看原图片"
										style="width:100%; height:100%"
										 />
								</div>
								<div name="photoCrdAndBnk" id="photoCrdAndBnkID"
									 onclick="showBigPicForSDDZ('SddzOperateAuditPanel_fields_photo_crdAndBnk');" 
									 style="width:266px; height:200px;border:1px solid #000;">
									<img id="SddzOperateAuditPanel_fields_photo_crdAndBnk" src="temppath.jpg"
										alt="身份证、银行卡照片" title="身份证、银行卡照片,单击查看原图片"
										style="width:100%; height:100%"
										/>
								</div>
								<div name="photoPersonCrdBnk" id="photoPersonCrdBnkID"
								onclick="showBigPicForSDDZ('SddzOperateAuditPanel_fields_photo_personCrdBnk');" 
									style="width:266px; height:200px;border:1px solid #000;">
									<img id="SddzOperateAuditPanel_fields_photo_personCrdBnk"
										src="temppath.jpg" alt="持卡人与身份证、银行卡合照" title="持卡人与身份证、银行卡合照,单击查看原图片"
										style="width:100%; height:100%"
										/>
								</div>
						</div>
					</div>
				</div>
				<div class="row norow">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">请逐条核实以下信息，并作出相应选择</h4>
						</div>
						<div class="panel-body">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-3 text-right">1.资料是否齐全:</label>
									<div class="col-md-9 paddingnone">
										<label><input name="SddzAccountAuditingPanel_Form_checkFlg1" type="checkbox" value="" />正确</label>
										&nbsp;&nbsp;
										<label><input name="SddzAccountAuditingPanel_Form_checkFlg1" type="checkbox" value="" />无身份证</label>
										&nbsp;&nbsp;&nbsp;
										<label><input name="SddzAccountAuditingPanel_Form_checkFlg1" type="checkbox" value="" />无银行卡</label>
										&nbsp;&nbsp;
										<label><input name="SddzAccountAuditingPanel_Form_checkFlg1" type="checkbox" value="" />无小票</label>
										&nbsp;&nbsp;
										<label><input name="SddzAccountAuditingPanel_Form_checkFlg1" type="checkbox" value="" />照片模糊</label>
									</div>
								</div>

							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-3 text-right">2.小票:</label>
									<div class="col-md-9 paddingnone">
									<label><input name="SddzAccountAuditingPanel_Form_checkFlg2" type="checkbox" value="" />正确</label>
									&nbsp;&nbsp;
									<label><input name="SddzAccountAuditingPanel_Form_checkFlg2" type="checkbox" value="" />无签名</label>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input name="SddzAccountAuditingPanel_Form_checkFlg2" type="checkbox" value="" />签名错误</label>
									&nbsp;&nbsp;
									<label><input name="SddzAccountAuditingPanel_Form_checkFlg2" type="checkbox" value="" />小票不符</label>
									</div>
								</div>

							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-3 text-right">3.银行卡:</label>
									<div class="col-md-9 paddingnone">
									<label><input name="SddzAccountAuditingPanel_Form_checkFlg3" type="checkbox" value="" />正确</label>
									&nbsp;&nbsp;
									<label><input name="SddzAccountAuditingPanel_Form_checkFlg3" type="checkbox" value="" />卡号无法辨认</label>
									&nbsp;&nbsp;
									<label><input name="SddzAccountAuditingPanel_Form_checkFlg3" type="checkbox" value="" />非本交易卡片</label>
									</div>
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-3 text-right">4.身份证:</label>
									<div class="col-md-9 paddingnone">
									<label><input name="SddzAccountAuditingPanel_Form_checkFlg4" type="checkbox" value="" />正确</label>
									&nbsp;&nbsp;
									<label><input name="SddzAccountAuditingPanel_Form_checkFlg4" type="checkbox" value="" />已过期</label>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input name="SddzAccountAuditingPanel_Form_checkFlg4" type="checkbox" value="" />非本交易消费者</label>
									</div>
								</div>

							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="form-group">
									<label for="span-medium-2"
										class="control-label col-md-3 text-right">5.卡片一致性(网银试付):</label>
									<div class="col-md-9 paddingnone">
									<label><input name="SddzAccountAuditingPanel_Form_checkFlg5" type="checkbox" value="" />正确</label>
									&nbsp;&nbsp;
									<label><input name="SddzAccountAuditingPanel_Form_checkFlg5" type="checkbox" value="" />错误</label>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12" style="text-align:center;">
                                                <button type="button" id="addform_cancel_btn" onclick="javascript:parent.$.fancybox.close()" class="btn red"> <i class="fa fa-share"></i>关闭</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
			</div>

		</div>
		<!-- END CONTENT -->
	</div>
	<!-- END CONTAINER -->



		<!-- 添加/修改数据的模态框（Modal） -->
		<div class="modal fade" id="addOrUpdateWin" tabindex="-1" data-backdrop="static" data-width="600px" data-height="620px">
		         <div class="modal-body">
		            <div class="portlet-body form">
                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="addform">
                            <div class="form-body">
                                <div class="row norow">
                                <img id="SddzOperateAuditPanel_fields_bigPicForSDDZ" src="" style="padding:0px;margin:0px;width:100%;height:auto;" />
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12" style="text-align:center;">
                                                <button type="button" id="addform_cancel_btn" onclick="javascript:$('#addOrUpdateWin').modal('hide')" class="btn red"> <i class="fa fa-share"></i>关闭</button>
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
	<jsp:include page="../common/footer.jsp" flush="true" />
	<!-- END FOOTER -->

</body>
<script type="text/javascript">
var baseURL = "<%=request.getContextPath()%>";

function sddzQueryDetailView(pathUrl, item) {
	var bView = item;
	App.blockUI({target:"body",boxed:!0,message:"正在加载中...",zIndex:20000});
	//$.unblockUI();
	$.ajax({
        type: "GET",
        url: pathUrl,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
        	if(data){
        		var path = data.path;
        		document.getElementById('SddzOperateAuditPanel_fields_photo_crdAndBnk').src = path+'/'+data.photoCrdAndBnk;
        		
        		if(data.photoReceipts == null || data.photoReceipts==''){
					$('#photoPersonCrdBnkID').css('display', 'none');//第1张
					$('#photoReceiptsID').css('display', 'none');//第3张
					$('#SddzOperateAuditPanel_fields_photo_crdAndBnk').attr('alt', '审核照片');//第一张
					$('#SddzOperateAuditPanel_fields_photo_crdAndBnk').attr('title', '审核照片,单击查看原图片');//第一张
				}else{
					$('#SddzOperateAuditPanel_fields_photo_personCrdBnk').attr('src', path+'/'+data.photoPersonCrdBnk);//第一张
					$('#SddzOperateAuditPanel_fields_photo_receipts').attr('src', path+'/'+data.photoReceipts);//第一张
				}
        		
        		if(bView){
					setCheckFlg('SddzAccountAuditingPanel_Form_checkFlg1', data.checkFlgOne1);
					setCheckFlg('SddzAccountAuditingPanel_Form_checkFlg2', data.checkFlgTwo1);
					setCheckFlg('SddzAccountAuditingPanel_Form_checkFlg3', data.checkFlgThree1);
					setCheckFlg('SddzAccountAuditingPanel_Form_checkFlg4', data.checkFlgThree1);
					setCheckFlg('SddzAccountAuditingPanel_Form_checkFlg5', data.checkFlgFive1);
				}
        		
        		
        		//详情信息赋值
        		$("#SddzOperateAuditPanel_fields_base_mno").val(data.mno);
        		$("#SddzOperateAuditPanel_fields_base_retReNo").val(data.retReNo);
        		$("#SddzOperateAuditPanel_fields_base_crdId").val(data.crdId);
        		$("#SddzOperateAuditPanel_fields_base_tranDt").val(transferDate(data.tranDt));
        		
        		$("#SddzOperateAuditPanel_fields_base_cprRegNmCn").val(data.cprRegNmCn);
        		$("#SddzOperateAuditPanel_fields_base_tranCrdNo").val(transferRetReNo(data.tranCrdNo));
        		$("#SddzOperateAuditPanel_fields_base_crdName").val(data.crdName);
        		
        		
        		$("#audSts").val(transferSts(data.audSts));
        		$("#SddzOperateAuditPanel_fields_base_stmAmt").val(data.stmAmt + '元');
        		$("#SddzOperateAuditPanel_fields_base_stmFeeAmt").val(data.stmFeeAmt + '元');
        		$("#SddzOperateAuditPanel_fields_base_rsvPhoneNo").val(data.rsvPhoneNo);
        	}
        	
        },
        error: function(error) {
        	bootbox.alert("读取失败!");
        }
    });
}





function transferSts(value){
	if(value=='00'){
 		return "待审核";
 	}else if(value=='01'){
 		return "通过";
 	}else if(value=='02'){
 		return "拒绝";
 	}
	return value;
}

function transferRetReNo(value){
	return value.substring(0, 4) + ' ' + value.substring(4, 8)
	+ ' ' + value.substring(8, 12) + ' '
	+ value.substring(12) ;
}

//format date and time
function transferDate(value){
	if(value.length!=14){
		return value;
	}
	return value.substring(0, 4) + '-' + value.substring(4, 6)
			+ '-' + value.substring(6, 8) + ' '
			+ value.substring(8, 10) + ':'
			+ value.substring(10, 12) + ':'
			+ value.substring(12, 14);
}



function setCheckFlg(checkFlgCmpt,value){
	
	if(value=='1'){
		$('input:checkbox[name='+checkFlgCmpt+']').eq(0).attr("checked",true);
	//	checkFlgCmpt.items.get(0).setValue(true);
	}else if(value=='0'){
		$('input:checkbox[name='+checkFlgCmpt+']').eq(1).attr("checked",true);
		//checkFlgCmpt.items.get(1).setValue(true);
	}
	// $("input[type='checkbox']").click(function(){this.checked = !this.checked;});  
	//$('input:checkbox[name='+checkFlgCmpt+']').eq(0).click(function(){this.checked = !this.checked;});
	
	var len = document.getElementsByName(checkFlgCmpt).length;
	
	for(i = 0; i < len; i++){	
		$('input:checkbox[name='+checkFlgCmpt+']').eq(i).click(function(){this.checked = !this.checked;});
	}
	
/* 		checkFlgCmpt.items.get(0).readOnly = true;
	checkFlgCmpt.items.get(1).readOnly = true; */
}

$(function(){
    	
	var inMno = '<%=inMno%>';
	var uuid = '<%=uuid%>';
	var pathUrl=baseURL + '/sddz/querySddzAccountAuditMoreInfo/?inMno='+inMno+'&uuid='+uuid+'&bView='+1;
	$(".page-footer").hide();
	sddzQueryDetailView(pathUrl, true);

});


function showBigPicForSDDZ(imgId){
    var img = document.getElementById(imgId);
    showBigPicForSDDZWin(img)
}

function showBigPicForSDDZWin(img){
	$("#SddzOperateAuditPanel_fields_bigPicForSDDZ").attr('src', img.src)
	$("#addOrUpdateWin").modal('show');
}




</script>
</html>

