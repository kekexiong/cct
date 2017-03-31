<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		                        <form action="<%=request.getContextPath()%>/cupcode/queryCupcodeInfo" class="form-horizontal" id="queryInnerPanel_myForm">
		                            <div class="form-body">
		                                <div class="row norow">
		                                    <div class="col-lg-4 col-md-4 col-sm-8 col-xs-16">
		                                        <div class="form-group">
		                                            <label for="span-medium-1" class="control-label col-md-4 text-right">地域码:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="cupCode" id="queryInnerPanel_cupCode" class="form-control" placeholder="请输入地域码(数字编号)">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-8 col-xs-16">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">选择省/直辖市:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="provinceCombo" id="queryInnerPanel_provinceCombo" class="bs-select form-control" data-show-subtext="true">
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                   <div class="col-lg-4 col-md-4 col-sm-8 col-xs-16">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">选择市:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="cityCombo" id="queryInnerPanel_cityCombo" placeholder="全部" class="bs-select form-control" data-show-subtext="true">
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-4 col-sm-8 col-xs-16">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">选择区:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="districtCombo" id="queryInnerPanel_districtCombo" placeholder="全部" class="bs-select form-control" data-show-subtext="true">
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
		                                               <!--  <button type="button" id="add_btn" class="btn btn-info"> <i class="fa fa-pencil"></i> 添加</button> -->
		                                                <button type="button" id="edit_btn" class="btn tn btn btn-primary"> <i class="fa fa-edit"></i> 修改</button><!--  
		                                                <button type="button" id="info_btn" class="btn btn-success"> <i class="fa fa-search-plus"></i> 详情</button>
		                                                <button type="button" id="exportexcel_btn" class="btn btn btn-primary"> <i class="fa fa-sign-out"></i> 导出excel</button>
	 --> 
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">地域码信息列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="queryInnerGridPanel">
		                            <thead>
		                                <tr>
		                                    <th>
		                                        <input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                    <th> 序号 </th>
		                                    <th> 地域码 </th>
		                                    <th> 省/直辖市 </th>
		                                    <th> 市 </th>
		                                    <th> 区/县 </th>
		                                    <th> 最后操作日期 </th>
		                                    <th> 操作人 </th>
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
												
<ul class="pagination no-padding" style="float: left">
												<li class="prev "> <a href="javascript:;" onclick="javascript:pageing(1)"> 首页</a> </li>
												<li class="prev "> <a href="javascript:;" onclick="javascript:pageing('pro')"> 上一页</a> </li>
												<li class="next "><a href="javascript:;" onclick="javascript:pageing('next')">下一页</a></li>
												<li class="next "><a href="javascript:;" onclick="javascript:pageing('last')">末页</a></li>
											</ul>
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
		
		<!-- 添加/修改数据的模态框（Modal） -->
		<div class="modal fade" id="addOrUpdateWin" tabindex="-1" role="dialog" data-backdrop="static"
		   aria-labelledby="myModalLabel" aria-hidden="true">
		         <div class="modal-header">
		            <button type="button" class="close" 
		               data-dismiss="modal" aria-hidden="true">
		                  &times;
		            </button>
		            <h4 class="modal-title" id="addOrUpdateWin_title"></h4>
		         </div>
		         <div class="modal-body">
		            <div class="portlet-body form">
                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="addform">
                            <div class="form-body">
                                <div class="row norow">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-4 text-right">地域码:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="cupCode" id="cupCode_update" class="form-control onlyNum" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-4 text-right">省/直辖市:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="province" readOnly="true" id="province_update" class="form-control" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-4 text-right">市:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="city" readOnly="true" id="city_update" class="form-control" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-4 text-right">区/县:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="district" readOnly="true" disable type="label" id="district_update" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  style="display:none;">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-4 text-right">区/县:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="areaId" type="label" readOnly="true" id="areaId_update" class="form-control">
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
                                            <div class="col-md-12" style="text-align:center;">
                                                <button type="button" id="addform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 提交</button>
                                                <button type="button" id="addform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
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
    	$("#queryInnerGridPanel tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
	var queryInner_Path = baseURL + "/cupcode/queryCupcodeInfo";
	
    /** 添加或者修改 **/
    function showAddOrUpdate(type) {
    	var title = '', iconCls = '', btnText = '', url = '', record = null;
    	if (type == 'add') {
    		title = '添加用户', iconCls = 'add', btnText = '保存', url = baseURL + '/usrManager/saveInnerUser';
    	} else if (type == 'update') {
    		title = '修改地域码', iconCls = 'update', btnText = '修改', url = baseURL + '/cupcode/updateCupcode';
    		
    		var selectRocords = $("#queryInnerGridPanel tbody input:checked");
    		if (selectRocords.length <= 0) {
    			bootbox.alert(CONST.TIP001);
    			return;
    		} else if (selectRocords.length > 1) {
    			bootbox.alert(CONST.TIP002);
    			return;
    		} else {
    			var index = $(selectRocords[0]).attr("rownum");
    			record = tableData.items[index];
    			//console.log(record);
    		}
    	}
    	
    	/*初始化添加修改弹出窗口*/
    	$("#addOrUpdateWin_title").text(title);
    	$("#addform_save_btn").off('click').on('click', function() {
    		var cupCode = $('#cupCode_update').val().trim();
    		var areaId = $('#areaId_update').val().trim();
			App.blockUI({target:"body",boxed:!0,message:CONST.TIP016,zIndex:20000});
			$.ajax({
	            type: "post",
	            url: url,
	            data : {
	            	areaId:areaId,
					cupCode:cupCode
				},
	            contentType: "application/x-www-form-urlencoded;charset=utf-8",
	            dataType: "json",
	            success: function(data) {
            	if(data.timeout){
            		ajaxTimeout();
                }
	            	if (data.success) {
	            		reloadGrid();
						bootbox.alert(data.msgInf);
						$("#addform")[0].reset();
						//$("#addform").clear();
						$("#addOrUpdateWin").modal('hide');

					}else{
						bootbox.alert(data.msgInf); 
					}
	            	
	            },
	            error: function(error) {
	            }
	        });
    	});
    	//弹出窗口取消按钮
		$("#addform_cancel_btn").off('click').on('click', function() {
			$("#addOrUpdateWin").modal('hide');
    	});
    	
   
		if (type == 'update') {
			//console.log(record.data);
			$('#cupCode_update').val(record.cityCd);
			$('#province_update').val(record.prov);
			$('#city_update').val(record.city);
			$('#district_update').val(record.dist);
			$('#areaId_update').val(record.areaId);
		}
    	$("#addOrUpdateWin").modal('show');

    }
    
    //查询数据
    function reloadGrid() {
    	$('table > tbody').empty();
    	if(limit==0) {
    		//默认20条
    		limit=20;
    	}
    	start=(page-1)*limit;
		var param = {page:page,start:start,limit:limit};
		var cupCode = $("#queryInnerPanel_cupCode").val();
		var prov = $("#queryInnerPanel_provinceCombo").val();
		var city = $("#queryInnerPanel_cityCombo").val();
		var dist = $("#queryInnerPanel_districtCombo").val();
		param.cupCode = cupCode;
		param.prov = prov;
		param.city = city;
		param.dist = dist;
		App.blockUI({target:"body",boxed:!0,message:"读取中",zIndex:20000});
		$.ajax({
            type: "POST",
            url: queryInner_Path,
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
    			
    			
    			$("#queryInnerGridPanel").DataTable().clear().draw();
                //data = Object {items: Array[20], totalCount: 269}
                $.each(data.items, function(index, obj) {

                	var trData = [];
                	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                	trData.push(start + index + 1);
                	trData.push(obj.cupCode);
                	trData.push(obj.prov);
                	trData.push(obj.city);
                	trData.push(obj.dist);
                	trData.push(obj.dttmUte);
                	trData.push(obj.uteStffNo);
                	
               for(i=0; i < trData.length; i++){
                	 if(trData[i] == undefined){
                		 trData[i] = ''; 
                	 }
                 }

                	 $("#queryInnerGridPanel").DataTable().row.add(trData).draw();
                	
                	
                });
                $("#queryInnerGridPanel").DataTable().order([1, 'asc']).draw();
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
    	
    	/*初始化页面按钮权限*/
    	if (!hasPermission(PERMISSSIONCONST.BASEINFO005)) {$("#edit_btn").hide();}

    	$(".onlyNum").onlyNum();
    	//下拉框数据绑定
   		getComboProvince('queryInnerPanel_provinceCombo', 'queryProvs?areaTyp=2');
    	
    	
    	//注册动态级联
    	$("#queryInnerPanel_provinceCombo").change(function(){
    		getComboProvince('queryInnerPanel_cityCombo', "queryCitys?parentId="+$(this).val())
    	});
    	$("#queryInnerPanel_cityCombo").change(function(){
    		getComboProvince('queryInnerPanel_districtCombo', "queryCitys?parentId="+$(this).val()+"&page=1&start=0&limit=25&filter=%5B%7B%22property%22%3A%22cdNm%22%7D%5D")
    	});
	

						//添加/修改表单的校验
						$('#addform').bootstrapValidator(
								{
									fields : {
										cupCode : {
											validators : {
												notEmpty : {
													message : '地域码必填'
												},
												stringLength : {
													max : '4',
													message : '地域码最多为4位'
												},
												regexp:{
													regexp:/^[0-9]$/,
													message:'只能是数字'
												}
											}
										}
									},
									submitHandler : function(validator, form,
											submitButton) {
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
							$("#queryInnerPanel_myForm")[0].reset();
							$("#queryInnerPanel_myForm .bs-select").selectpicker('val','');
						});


						//修改按钮
						$("#edit_btn").on('click', function() {
							showAddOrUpdate('update');
						});

						

					});
    
    
    //modify myang 2016-8-13
    function getComboProvince(element, type_code) {
		$.ajax({
			type : "GET",
			url : "../../cupcode/"+type_code,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success:function(data) {
				$("#" + element).empty();
				$("#" + element).append(
						$("<option></option>").val("")
								.text("全部"));
				$.each(data.items, function(index, obj) {
					$("#" + element).append(
							$("<option></option>").val(
									obj.cdVl)
									.text(obj.cdNm));
				});
				//更新内容刷新到相应的位置
				$("#" + element).selectpicker('render');
				$("#" + element).selectpicker('refresh');
			},
			error:function(error) {
				bootbox.alert("Error");
			}
		});
	}
    
    
    function getComboCity(element, parentID) {
		$.ajax({
			type : "GET",
			url : "../../cupcode/queryCitys?parentId="+parentID,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success:function(data) {
				$("#" + element).empty();
				$("#" + element).append(
						$("<option></option>").val("")
								.text("全部"));
				$.each(data.items, function(index, obj) {
					$("#" + element).append(
							$("<option></option>").val(
									obj.cdVl)
									.text(obj.cdNm));
				});
				//更新内容刷新到相应的位置
				$("#" + element).selectpicker('render');
				$("#" + element).selectpicker('refresh');
			},
			error:function(error) {
				bootbox.alert("Error");
			}
		});
	}
    
    function getComboCity(element, type_code) {
		$.ajax({
			type : "GET",
			url : "../../cupcode/queryCitys?parentId="+parentID,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success:function(data) {
				$("#" + element).empty();
				$("#" + element).append(
						$("<option></option>").val("")
								.text("全部"));
				$.each(data.items, function(index, obj) {
					$("#" + element).append(
							$("<option></option>").val(
									obj.cdVl)
									.text(obj.cdNm));
				});
				//更新内容刷新到相应的位置
				$("#" + element).selectpicker('render');
				$("#" + element).selectpicker('refresh');
			},
			error:function(error) {
				bootbox.alert("Error");
			}
		});
	}
   
    
    
    
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
</script>
    
</body>
</html>