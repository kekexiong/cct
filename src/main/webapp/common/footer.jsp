<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- <div class="page-footer">
    <div class="page-footer-inner"> 2016 &copy; 版权所有 </div>
    <div class="scroll-to-top"> <i class="icon-arrow-up"></i> </div>
</div> -->

<!--[if lt IE 9]>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/respond.min.js"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->

<!-- BEGIN CORE PLUGINS -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/pages/scripts/components-select2.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<!-- table js -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/pages/scripts/table-datatables-managed.min.js" type="text/javascript"></script>
<!-- table js end-->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/pages/scripts/components-date-time-pickers.min.js" type="text/javascript"></script>
<!-- 上传插件 -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js" type="text/javascript"></script>
<!-- 下拉 -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/pages/scripts/components-bootstrap-select.min.js" type="text/javascript"></script>
<!-- jstree -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/pages/scripts/ui-tree.min.js" type="text/javascript"></script>
<!-- 表格组件 -->
<script src="<%=request.getContextPath()%>/webPage/common/js/datatables.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/webPage/common/js/bootstrapValidator.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/webPage/common/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/webPage/common/js/jquery.form.js" type="text/javascript"></script>

<!-- jquery ui 和bootstrap datepicker样式冲突-->
<%-- <script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script> --%>

<script type="text/javascript">
/* 日期range汉化 最大可选日期和最小可选日期*/
$('.input-daterange input').each(function(index, input) {
    $(this).datepicker({
        language: 'zh-CN',
        autoclose: true,
        todayHighlight: true,
        todayBtn:'linked',
        orientation:'left bottom'
    }).on('changeDate', function(e) {
    	if ($(this).nextAll('input').length==1) {
    		$($(this).nextAll('input')[0]).datepicker('setStartDate',$(this).datepicker('getDate'));
    	}
    	if ($(this).prevAll('input').length==1) {
    		$($(this).prevAll('input')[0]).datepicker('setEndDate',$(this).datepicker('getDate'));
    	}
    });
});

$('.form_datetime').datetimepicker({
	autoclose:true,
    format:"yyyy/mm/dd hh:ii:ss",
    language: 'zh-CN'
});
//$('.form_datetime input').datetimepicker('update', new Date());
/* ajax blockui */
App.setGlobalImgPath("<%=request.getContextPath()%>/takin_theme/assets/global/img/");
$(document).ajaxStop(
  	function() {
  		App.unblockUI("body");
  	}
);
/* ie兼容placeholder */
if ((navigator.userAgent.indexOf('MSIE') >= 0) 
    && (navigator.userAgent.indexOf('Opera') < 0)){
    $('input, textarea').removeAttr('placeholder');
}
/* 多选下拉列表初始化 */
$(".bs-select").each(function(index,element) {
	if(typeof($(element).attr("multiple"))=="undefined") {
		
	} else {
		$(this).on('changed.bs.select',function(event, clickedIndex, newValue, oldValue) {
			if (clickedIndex == 0) {
				if (newValue) {
					$(this).selectpicker('selectAll');
				} else {
					$(this).selectpicker('deselectAll');
				}
				
			} else {
				if (!newValue) {
					//取消多选项中的某一个项的选中，第一项'全部'也自动取消选中
					var o = $(this).val();
					var n = new Array();
					$.each(o,function(i,option) {
						if ('' != option) {
							n.push(option);
						}
					});
					$(this).selectpicker('val', n);
				} else {
					//多选项中的某一个项选中时，如果所有选项都已经选中，那么第一项'全部'也自动选中
					if ($(this).find('option').length == $(this).val().length + 1) {
						var o = $(this).val();
						o.push('');
						$(this).selectpicker('val', o);
					}
				}
			}
		});
	}
});
/* bootstrap-select 未选择选项时默认显示请选择  */
$(".bs-select").selectpicker({noneSelectedText:'请选择',dropupAuto:false});
/* jquery.validate增加正则表达式校验规则 */
jQuery.validator.addMethod("regex",function(value, element, params){　　　　　　　　　　  
    var exp = new RegExp(params); //params rules的value传入的正则表达式  
    return exp.test(value);       //value  被验证的input传入的值  
},"输入格式有误");  
/* bootbox设置中文显示 */
bootbox.setLocale("zh_CN");

function ajaxTimeout() {
	bootbox.alert("会话超时，系统将自动跳转到登录页面！", function() {
		window.location.href = baseURL + '/login.jsp';
	});
}
/*动态设置iframe高度*/
function setIframeHeight(obj) 
{
	var cwin=obj; 
	if (document.getElementById) {
		if (cwin && !window.opera) { 
			if (cwin.contentDocument && cwin.contentDocument.body.offsetHeight)  {
				cwin.style.height = cwin.contentDocument.body.offsetHeight + 70 + "px"; //FF NS
				//cwin.style.width = window.innerWidth - 280 + "px"; //FF NS
			} else if(cwin.Document && cwin.Document.body.scrollHeight) {
				cwin.style.height = cwin.Document.body.scrollHeight + 60 + "px";//IE
				//cwin.style.width = window.innerWidth - 280 + "px";//IE
			}
		} else { 
			if(cwin.contentWindow.document && cwin.contentWindow.document.body.scrollHeight) {
				cwin.style.height = cwin.contentWindow.document.body.scrollHeight + "px";//Opera
				//cwin.style.width = window.innerWidth - 280 + "px";//Opera
			}
		} 
	} 
}
$(window).resize(function() {
	$("iframe").each(function(index,item) {
		setIframeHeight(item);
	});
});
/*modal垂直居中*/
$('.modal').on('show', function () {
	var height = $(this).attr('data-height');
	if (!height || height=='') {
		height = $(this).css('height');
	}
	var modalHeight = height.replace('px','');
	var modalWidth = $(this).css('width').replace('px','');
	$(this).css('top','50%');
	var scrollHeight = $(window.document).height();// + $(window.top.document).find('#tab-bar').height() + $(window.top.document).find('.navbar-fixed-top').height();
	console.log('iframe={height:'+scrollHeight+',width:'+$(window.top).width()+'}');
    var mt = (scrollHeight / 2 - (modalHeight / 2));
    var ml = ($(window.top).width() / 2 - (modalWidth / 2));
    //$(this).css('left',ml+40);
    if (mt>0) {
    	$(window.top.document).scrollTop(mt);
    }
    console.log('modal position={modalHeight:'+modalHeight+',modalWidth:'+modalWidth+',top offset:'+mt+',left offset:'+ml+'}');
});
/*fancybox垂直居中*/
function fancyboxCenterOnViewport() {
	var height = $(".fancybox-wrap").outerHeight();
	if (!height || height=='') {
		height = $(this).css('height');
	}
	$(this).css('top','50%');
	var modalHeight = height;
	var scrollHeight = $(window.document).height();
	console.log('iframe={height:'+scrollHeight+'}');
    var mt = (scrollHeight / 2 - (modalHeight / 2) - 100);
    if (mt>0) {
    	$(window.top.document).scrollTop(mt);
    }
    console.log('modal position={modalHeight:'+modalHeight+',top offset:'+mt+'}');
}
/* draggable modal */
/* $(".modal").draggable({   
    handle: ".modal-header",   
    cursor: 'move',   
    refreshPositions: false  
}); */
//表格的项取消选择时，整个表格的表头的复选框也要取消check
function clickCheck(box) {
	if(!$(box).prop('checked')) {
		$(box).parents('tbody').siblings('thead').find(':checkbox').prop('checked',false);
	} else {
		var selectAll = true;
		$(box).parents('tbody').find(':checkbox').each(function() {
			if (!$(this).prop('checked')) {
				selectAll = false;
				return false;
			}
		});
		if (selectAll) {
			$(box).parents('tbody').siblings('thead').find(':checkbox').prop('checked',true);
		}
	}
}
if (typeof(sinfo) != "undefined" && sinfo.userName) {
	$("#login_username").text(sinfo.userName);//导航栏显示用户名
}
</script>
