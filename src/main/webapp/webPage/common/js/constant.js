var CONST = (function() {
	return {
		TIP001 : '请选择一条记录进行修改！',
		TIP002 : '只能选择一条记录进行修改！',
		TIP003 : '请选择对象进行删除！',
		TIP004 : '异常错误！',
		TIP005 : '删除成功！',
		TIP006 : '删除失败！',
		TIP007 : '操作成功！',
		Tip008 : '操作失败！',
		TIP009 : '授权成功！',
		TIP010 : '授权失败！',
		TIP011 : '添加成功！',
		TIP012 : '添加失败，当前角色名已存在！',
		TIP013 : '修改成功！',
		TIP014 : '修改失败，当前角色名已存在！',
		TIP015 : '请选择对象！',
		TIP016 : '正在保存数据...',
		TIP017 : '正在加载数据...',
		TIP018 : '正在删除数据...',
		TIP019 : '请选择一个节点进行修改！',
		TIP020 : '添加失败,当前唯一标识已存在！',
		TIP021 : '修改失败,当前唯一标识已存在！',
		TIP022 : '当前登录用户已经停止使用，不能登录系统！',
		TIP023 : '确定要删除吗？',
		TIP024 : '添加失败,当前日期的假日信息已经存在！',
		TIP025 : '修改失败,当前日期的假日信息已经存在！',
		TIP026 : '请选择非根节点！',
		TIP027 : '添加失败,当前地区代码已存在！',
		TIP028 : '修改失败,当前地区代码已存在！',
		TIP029 : '添加失败,当前字典名称已经存在！',
		TIP030 : '修改失败,当前字典名称已经存在！',
		TIP031 : '您当前登录用户已经失效,请重新登录！',
		TIP032 : '确定要退出吗？',
		TIP033 : '确认密码与新密码不一致！',
		TIP034 : '添加失败,当前用户名已存在！',
		TIP035 : '修改失败,当前用户名已存在！',
		TIP036 : '用户名或密码不正确！',
		TIP037 : '验证码不正确！',
		TIP038 : '添加失败,当前字典编码已经存在！',
		TIP039 : '修改失败,当前字典编码已经存在！',
		TIP040 : '保存成功！',
		TIP041 : '当前登录用户已过期，请重新登录！',
		TIP042 : '请选择一条记录！',
		TIP043 : '只能选择一条记录！',
		TIP044 : '当前证件号码还未添加到”个人档案“中',
		TIP045 : '添加失败,当前单位编码已存在！',
		TIP046 : '修改失败,当前单位编码已存在！',
		TIP047 : '请选择一个单位进行分配管理范围！',
		TIP048 : '请选择叶子节点进行删除！',
		TIP049 : '请求的路径不存在',
		TIP050 : '服务器内部出错',
		TIP051 : '请求服务器超时',
		TIP052 : '添加失败，当前分组名已存在！',
		TIP053 : '修改失败，当前分组名已存在！',
		TIP054 : '获取序列传递参数错误!',
		TIP055 : '添加失败,当前证件号码已存在！',
		TIP056 : '修改失败,当前证件号码已存在！',
		TIP057 : '添加失败,当前编号已经存在！',
		TIP058 : '修改失败,当前编号已经存在！',
		TIP059 : '确定要上报吗？',
		TIP060 : '请选择对象进行上报！',
		TIP061 : '确定要通过吗？',
		TIP062 : '确定要驳回吗？',
		TIP063 : '正在上报数据...',
		TIP064 : '正在审核数据...',
		TIP065 : '请选择对象进行审核！',
		TIP066 : '添加失败！',
		TIP067 : '修改失败！',
		TIP068 : '孕产妇的证件号码已存在！',
		TIP069 : '丈夫的证件号码已存在！',
		TIP070 : '产次不能大于孕次！',
		TIP071 : '天数的低范围数值不能大于高范围数值！',
		TIP072 : '末次妊娠时间应小于当前时间！',
		TIP073 : '请输入末次月经！',
		TIP074 : '当前孕产妇档案还未建册，请先建册！',
		TIP075 : '当前孕产妇档案还未初诊，请先初诊！',
		TIP076 : '访视日期不能小于分娩日期！',
		TIP077 : '请先删除初诊记录后，再删除建册记录！',
		TIP078 : '请先删除复诊记录后，再删除初诊记录！',
		TIP079 : '',
		TIP080 : '新生儿数大于胎儿数，不能添加！',
		TIP081 : '您没有预约下次检查！是否需要预约？',
		TIP082 : '本单位的数据只能有本单位进行删除！',
		TIP083 : '状态为“已接入”的记录不能再进行修改！',
		TIP084 : '当前CA证书已过期！',
		TIP085 : '当前证件号码的孕产妇的建档处于“管理中”，结案之后方可添加或者修改！',
		TIP086 : '请输入正确末次月经！',
		TIP087 : '请输入窒息时间！',
		TIP088 : '当前出生证号的儿童的建档处于“管理中”，结案之后方可添加或者修改！',
		TIP089 : '输入密码错误！',
		TIP090 : '密码不能为空！',
		TIP091 : '当前儿童年龄超过6岁，不能再添加体格检查记录',
		TIP092 : '添加失败，当前的随访月份已经存在！',
		TIP093 : '存在无法完成数据',
		TIP094 : '脱落日期只能在出生时间和访视时间之间选择',
		TIP095 : '您确定发布此信息吗？',
		TIP096 : '您确定撤销此信息吗？',
		// 叶酸管理模块-start
		TIP103 : '请选择一个库存批次！',
		TIP104 : '确定取消该条报废记录？',
		TIP105 : '请选择失访原因！',
		TIP106 : '确定取消该条下发记录？',
		TIP107 : '当前孕妇没有孕期管理记录，请先创建孕期管理记录，再下发叶酸。',
		TIP109 : '普通孕妇单次叶酸下发量不能超过3瓶！',
		TIP110 : '该孕妇在当前孕期内，已随访了6次，不能再进行随访！',
		TIP111 : '叶酸报废原因不能为空！',
		TIP112 : '接收单位不能为空！',
		TIP113 : '下发数量不能为空！',
		TIP114 : '神经管畸形高风险孕妇单次叶酸下发量不能超过30瓶！',
		TIP115 : '普通孕妇累计叶酸下发量累计不能超过6瓶！',
		TIP116 : '神经管畸形高风险孕妇叶酸下发量累计不能超过60瓶！',
		TIP117 : '该孕妇尚无叶酸发放记录！',
		TIP118 : '该批次叶酸库存数量不足！',
		TIP119 : '起止时间录入错误！终止时间不能小于起始时间！',
		TIP120 : '未检索到任何数据！',
		TIP121 : '叶酸报废数量不能为空或小于零！',
		TIP122 : '叶酸下发数量不能为空或小于零！',
		// 叶酸管理模块-end
		TIP123 : '请先提交数据！',
		TIP124 : '没有可操作的数据！',
		TIP125 : '有证件编码重叠入库存在！',
		TIP126 : '证件编码区间可能不在入库时的编码区间内或者下发重复编码！',
		TIP127 : '该出生证编号不可使用！',
		TIP128 : '该出生证编号可以使用！',
		TIP129 : '该出生证编号已使用或已作废！',
		TIP130 : '原出生证编号无效！',
		TIP131 : '该证件已打印使用！',
		TIP132 : '证件编码区间可能不在现有编码区间内或者废证中存在重叠编码！',
		TIP133 : '该证件编码区间内存在已使用编码！',
		TIP134 : '该证件编码区间内存在其他状态的编码或不属于当前操作单位！',
		TIP135 : '该证件编码区间内可能出现无效的编码或其他状态的编码！',
		TIP136 : '申请单送检成功！',
		TIP137 : '申请单已驳回！',
		TIP138 : '申请单驳回失败，请重试！',
		TIP139 : '请选择您要编号的申请单！',
		TIP140 : '申请单实验编号成功！',
		TIP141 : '已上报！',
		TIP142 : '已送检',
		TIP143 : '审批通过，不能再修改！',
		TIP144 : '修改失败,当前住院补贴号不存在！',
		TIP145 : '导出Excel至少选择一条记录！',
		TIP146 : '每次只能打印一条数据，请重新选择要打印的数据！',
		TIP147 : '您没有选择要打印的数据，请选择要打印的数据！',
		TIP148 : '操作失败,可用磁卡不足，请修改磁卡的起止卡号！',
		TIP149 : '领用新的卡片失败!',
		TIP150 : '只能转出管理单位是本单位的儿童！',
		TIP151 : '只能接收要转入本单位的儿童！',
		TIP152 : '确定要接收吗？',
		TIP153 : '确定要取消吗？',
		TIP154 : '还没有做初诊！',
		// 叶酸管理模块-start
		TIP200 : '叶酸库存信息更新失败！',
		TIP201 : '叶酸发放信息保存失败！',
		TIP202 : '叶酸服药期间信息保存失败！',
		TIP203 : '当前孕妇发药数量已超过普通孕妇上限，不能重置为普通孕妇！',
		TIP204 : '确定要取消该次发放吗？',
		TIP205 : '只能取消最近的叶酸下发，请确认！',
		TIP206 : '叶酸发放信息删除失败！',
		TIP207 : '检索下级单位出错！',
		TIP208 : '叶酸动态库存检索为空！',
		TIP209 : '叶酸服用随访明细信息为空！',
		TIP240 : '',
		// 叶酸管理模块-end
		// 短信模块
		TIP501 : '发送短信时，手机号码不能为空！',
		TIP502 : '发送短信时，发送通道不能为空,并且没有配置默认短信通道，请选择或请管理员配置！',
		TIP503 : '修改失败，当前会员已经终止！',
		TIP504 : '修改失败，当前会员还在申请中！',
		TIP505 : '修改失败，当前会员已经结束！',
		TIP506 : '修改失败，会员不存在！',
		TIP507 : '请先录入切值标准！',
		TIP508 : '修改失败,某些磁卡编号已经存在！',
        //用户体系
        TIP509 : 'SXF00000',
        /**
         *描述： 内部用户查询界面
         * 作者：songyingmei
         * 时间： 2014/07/15
         */
        TIP510 : '请选择一条记录进行详情查看！',
        TIP511 : '只能选择一条记录进行详情查看！',
        TIP512 : '确定要导出excel吗！',
        TIP513 : '请选择一条或者多条记录进行导出excel！',
        TIP514 : 'SXF00001'
       
	};
})();

var MBS_CONST = (function() {
	return {
		SOURCE_TYPE_DZ:'1',//银行订单来源，对账差错
		
		PROCESS_TYPE_HX:'1',//处理方式， 请退核销
		PROCESS_TYPE_QK:'3',//处理方式，银行请款
		PROCESS_TYPE_TK:'4',//处理方式，银行退款
		PROCESS_TYPE_YWC:'5',//处理方式，预授权完成
		PROCESS_TYPE_YCX:'6',////处理方式，预授权撤销
		PROCESS_TYPE_ZRPF:'7',//处理方式，转入赔付
		PROCESS_TYPE_PF:'8', //处理方式，赔付
		PROCESS_TYPE_ZSR:'9',//处理方式，转收入
		
		ORDER_TYPE_QK:'2',//订单类型,银行请款
		ORDER_TYPE_TK:'1',//订单类型，银行退款
		ORDER_TYPE_YWC:'3',//订单类型，预授权完成
		ORDER_TYPE_YCX:'4',//订单类型，预授权撤销
		
		ORDER_STS_INIT:'0',//订单状态，待处理
		ORDER_STS_PROING:'1',//订单状态，处理中
		ORDER_STS_TRAN_FAILL : '3',//订单状态，交易记账失败
		ORDER_STS_SUCC : '4',//订单状态，处理成功
		ORDER_STS_FAIL : '5',//订单状态，处理失败
		
		ORDER_JF_FLG_NO : '1',
		ORDER_JF_FLG_YES : '2',
		
		BANK_STS_SUCC : '3',
		BANK_STS_FAIL : '4',
		
		ZS_STS_INIT : '0',
		ZS_STS_SUCC : '1',
		ZS_STS_FAIL : '2'
		
	};
})();
