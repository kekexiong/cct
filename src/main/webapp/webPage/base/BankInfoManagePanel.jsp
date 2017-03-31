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
		                        <form action="<%=request.getContextPath()%>/bnk/queryMccInfo" class="form-horizontal" id="BankInfoManagePanel_Form">
		                            <div class="form-body">
		                                <div class="row norow">
		                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">MCC:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <input name="mccCd" id="BankInfoManagePanel_Form_mccCd" class="form-control">
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
		                                        <div class="form-group">
		                                            <label class="control-label col-md-4 text-right">行业大类:</label>
		                                            <div class="col-md-8 paddingnone">
		                                                <select name="idtTyp" id="BankInfoManagePanel_Form_idtTyp" class="bs-select form-control" data-show-subtext="true">
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
		                                                <button type="button" id="add_btn" class="btn btn-info"> <i class="fa fa-pencil"></i> 添加</button>
		                                                <button type="button" id="edit_btn" class="btn tn btn btn-primary"> <i class="fa fa-edit"></i> 修改</button>
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
		                        <div class="caption"> <i class="fa fa-search font-blue"></i> <span class="caption-subject font-blue bold uppercase">行业大类列表</span> </div>
		                        <div class="tools">
		                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
		                        </div>
		                    </div>
		                    <div class="portlet-body wheel">
		                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="BankInfoManagePanel_Grid">
		                            <thead>
		                                <tr>
		                                    <th>
		                                        <input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" />
		                                    </th>
		                                    <th> 序号 </th>
		                                    <th> MCC </th>
		                                    <th> 行业大类 </th>
		                                    <th> 创建时间 </th>
		                                    <th> 最后操作时间 </th>
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
												
												<li class="prev "> <a href="javascript:;" onclick="javascript:pageing('1')"> 首页</a> </li>
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
		<!-- 添加/修改数据的模态框（Modal） -->
		<div class="modal fade" id="BankInfoManagePanel_addOrUpdateWin" tabindex="-1" role="dialog" data-backdrop="static"
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
                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="BankInfoManagePanel_addOrUpdateForm">
                            <div class="form-body">
                                <div class="row norow">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label for="span-medium-2" class="control-label col-md-4 text-right">MCC:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="mccCd" id="BankInfoManagePanel_addOrUpdateForm_mccCd" class="form-control" >
                                            	<input  name="idtTypOld" type="hidden" id="BankInfoManagePanel_addOrUpdateForm_idtTyp_Old" />
                                            	<input  name="mccOld" type="hidden" id="BankInfoManagePanel_addOrUpdateForm_mccCd_Old" />
                                            </div>
                                        </div>
                                    </div>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">行业大类:</label>
                                            <div class="col-md-8 paddingnone">
                                                <select name="idtTyp" id="BankInfoManagePanel_addOrUpdateForm_idtTyp" class="bs-select form-control" data-show-subtext="true">
                                                	<option value="">----请选择行业-----</option>
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
    <!-- END CONTAINER -->
    </div>
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
    	}else if (opp=='last'){
    		   if(page == toalPage){
    	            return;
    	        }
    		page = $("#toalPage").text();
    		if(page>toalPage){
    			bootbox.alert("对不起每月您要跳转的页面");
    			return;
    		}else if(page<1){
    			bootbox.alert("对不起，每月您要跳转的页面");
    			return;
    		}
    		
    		
    	}else if (opp=='next'){
    		if(page==toalPage){
    			bootbox.alert('已经是最后一页');
    			return;
    		}
    		page=page+1;
    		start=(page-1)*limit;
    	}else{
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
    	$("#BankInfoManagePanel_Grid tbody :checkbox").prop('checked', checked);
    }
    
    function onChange4PageSize(select) {
    	limit = select.value;
    	reloadGrid();
    }
    
    var BankInfoManagePanel_Path = baseURL + "/bnk/queryMccInfo";
    var BankInfoManagePanel_isReaptMccPath = baseURL + "/bnk/isRepeatMcc";
  	//行业大类，商户推展类型,商户类型在码表中加载数据
    function getComboStore(element,element2,type_code) {
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
                $("#" + element2).empty();
                $("#" + element).append($("<option></option>").val("").text("全部"));
                $("#" + element2).append($("<option></option>").val("").text("全部"));
                $.each(data, function(index, obj) {
                	$("#" + element).append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
                	$("#" + element2).append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
                });
              	//更新内容刷新到相应的位置
                $("#" + element).selectpicker('render');
                $("#" + element).selectpicker('refresh');
              	//更新内容刷新到相应的位置
                $("#" + element2).selectpicker('render');
                $("#" + element2).selectpicker('refresh');
              	
            },
            error: function(error) {
            }
        });
    }
    /** 添加或者修改 **/
    function showAddOrUpdate(type) {
    	var title = '', iconCls = '', btnText = '', url = '', record = null;
    	if (type == 'add') {
    		title = '添加用户', iconCls = 'add', btnText = '保存', url = baseURL + '/bnk/insertNewMcc';
    	} else if (type == 'update') {
    		title = '修改用户', iconCls = 'update', btnText = '修改', url = baseURL + '/bnk/updateMcc';
    		
    		var selectRocords = $("#BankInfoManagePanel_Grid tbody input:checked");
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
    	//$("#BankInfoManagePanel_addOrUpdateForm_idtTyp").prop('disabled',type=='add'?false:true);
    	//弹出窗口保存按钮
    	$("#addform_save_btn").off('click').on('click', function() {
    		if (!$('#BankInfoManagePanel_addOrUpdateForm').valid()) {
    			return;
    		}
    		var mccCd = $('#BankInfoManagePanel_addOrUpdateForm_mccCd').val();
    		var idtTypOld = $('#BankInfoManagePanel_addOrUpdateForm_idtTyp_Old').val();
    		var mccOld = $('#BankInfoManagePanel_addOrUpdateForm_mccCd_Old').val();
    		var idtTyp = $('#BankInfoManagePanel_addOrUpdateForm_idtTyp').val();
    		var idtNm = $('#BankInfoManagePanel_addOrUpdateForm_idtTyp')[0].options[$('#BankInfoManagePanel_addOrUpdateForm_idtTyp')[0].selectedIndex].text;
			var flg=false;
    		if(type == 'update'){
				if(mccOld==mccCd){
					if(idtTypOld==idtTyp){
						bootbox.alert( "没有变化，无需修改");
					}else{
						flg=true;
					}
				}else{
					flg=true;
					//验证mcc是否重复
					 $.ajax({	 
						type: "POST",
			            url: BankInfoManagePanel_isReaptMccPath,
			            data : {
			            	mccCd : mccCd
						},
						contentType: "application/x-www-form-urlencoded;charset=utf-8",
			            dataType: "json",
			            async:false,
						success : function(response) {
							var json = response;  
							if (!json.success) {
								bootbox.alert(json.msgInf); 
								flg =false;
							}else{
								flg=true;
							}
						}	
					});
					
				}
				if(!flg){
					 return flg;
				 }
			}
			
			if(type == 'add'){
				//验证mcc是否重复
				 $.ajax({
					type: "POST",
		            url: BankInfoManagePanel_isReaptMccPath,
		            data : {
		            	mccCd : mccCd
					},
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
		            dataType: "json",
		            async:false,
					success : function(response) {
						var json = response; 
						if (!json.success) {
							bootbox.alert(json.msgInf); 
							flg =false;
						}else{
							flg=true;
						}
					}
				});
			}
			if(!flg){
				return flg;
			}
    		App.blockUI({target:"body",boxed:!0,message:CONST.TIP016,zIndex:20000});
			$.ajax({
	            type: "POST",
	            url: url,
	            data : {
					mccCd : mccOld,
					idtTyp :idtTyp,
					idtNm : idtNm,
					newMccCd:mccCd
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
						$("#BankInfoManagePanel_addOrUpdateForm")[0].reset();
						$("#BankInfoManagePanel_addOrUpdateWin").modal('hide');
					}else{
						bootbox.alert("此科目"+data.msgInf); 
					}
	            },
	            error: function(error) {
	            	$("#BankInfoManagePanel_addOrUpdateWin").modal('hide');
	            }
	        });
    	});
    	//弹出窗口取消按钮
		$("#addform_cancel_btn").off('click').on('click', function() {
			$("#BankInfoManagePanel_addOrUpdateWin").modal('hide');
    	});
		if (type == 'update') {
    		$('#BankInfoManagePanel_addOrUpdateForm_mccCd').val(record.mccCd);
			$('#BankInfoManagePanel_addOrUpdateForm_idtTyp_Old').val(record.idtTyp);
			$('#BankInfoManagePanel_addOrUpdateForm_mccCd_Old').val(record.mccCd);
			$('#BankInfoManagePanel_addOrUpdateForm_idtTyp').val(record.idtTyp);
			
		}else{
			$('#BankInfoManagePanel_addOrUpdateForm_mccCd').val("");
			$('#BankInfoManagePanel_addOrUpdateForm_idtTyp_Old').val("");
			$('#BankInfoManagePanel_addOrUpdateForm_mccCd_Old').val("");
			$('#BankInfoManagePanel_addOrUpdateForm_idtTyp').val("".trim());
			
		}
		 $("#BankInfoManagePanel_addOrUpdateForm_idtTyp").selectpicker('render');
         $("#BankInfoManagePanel_addOrUpdateForm_idtTyp").selectpicker('refresh');
    	$("#BankInfoManagePanel_addOrUpdateWin").modal('show');

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
		var mccCd = $("#BankInfoManagePanel_Form_mccCd").val();
		var idtTyp = $("#BankInfoManagePanel_Form_idtTyp").val();
		param.mccCd = mccCd;
		param.idtTyp = idtTyp;//----------------------------------------
		App.blockUI({target:"body",boxed:!0,message:"读取中",zIndex:20000});
		$.ajax({
            type: "POST",
            url: BankInfoManagePanel_Path,
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
    			$("#BankInfoManagePanel_Grid").DataTable().clear().draw();
                $.each(data.items, function(index, obj) {
                	
                	var trData = [];
                	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
                	trData.push(start + index + 1);
                	trData.push(obj.mccCd);
                	trData.push(obj.idtNm);
                	trData.push(obj.dttmCte);
                	trData.push(obj.dttmUte);
                	trData.push(obj.uteStffNo);
                   	
                    for(i=0; i < trData.length; i++){
                     	 if(trData[i] == undefined){
                     		 trData[i] = ''; 
                     	 }
                      }

                     	 $("#BankInfoManagePanel_Grid").DataTable().row.add(trData).draw();
                     	
                     	
                     });
                     $("#BankInfoManagePanel_Grid").DataTable().order([1, 'asc']).draw();
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
    	if (!hasPermission(PERMISSSIONCONST.BASEINFO002)) {$("#add_btn").hide();}
    	if (!hasPermission(PERMISSSIONCONST.BASEINFO003)) {$("#edit_btn").hide();}
    	//初始化页面表单数据源
		getComboStore('BankInfoManagePanel_Form_idtTyp', 'BankInfoManagePanel_addOrUpdateForm_idtTyp','IDT_TYP');
		
    	
    	//添加/修改表单的校验
    	//添加/修改表单的校验
		$('#BankInfoManagePanel_addOrUpdateForm').validate({
			errorElement:"span",
			errorClass:"help-block help-block-error",
			focusInvalid:!1,
			ignore:"",
			highlight:function(e){$(e).closest(".form-group").addClass("has-error")},
	        rules: {
	        	mccCd: {
	        		required:true,
	        		regex: /^[0-9]*$/,
	        		minlength:4,
	        		maxlength:4
	            }
	        },
	        messages: {
	        	mccCd: {
	        		required:'MCC必填',
	        		regex: '只能是数字',
	        		minlength:'只能是4个字符',
	        		maxlength:'只能是4个字符'
	            }
	        }
	    });

		//查询按钮
		$("#query_btn").on('click', function() {
			page = 1;
			reloadGrid();
		});
		
		//重置按钮
		$("#reset_btn").on('click', function() {
			$("#BankInfoManagePanel_Form")[0].reset();
			$("#BankInfoManagePanel_Form .bs-select").selectpicker('val','');
		});
		
		//添加按钮
		$("#add_btn").on('click', function() {
			showAddOrUpdate('add');
		});
		
		//修改按钮
		$("#edit_btn").on('click', function() {
			showAddOrUpdate('update');
		});
   	});
    </script>
    
</body>

</html>
