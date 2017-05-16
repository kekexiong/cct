package com.lemon.usr.util;

import java.math.BigDecimal;
import java.util.EnumSet;

import com.lemon.utils.StringUtils;

/**
 * 
 * @Title: Contant.java
 * @Package: com.lemon.usr.util
 * @Description: 用户体系常量类，
 * @author: NieJun
 * @date: 2014年6月18日
 * @version: V1.0
 */
public class Contant {
	/**
	 * 返回值 
	 * 成功 ： 
	 * 失败：
	 */
	public static final String REGIST_SUCCESS_CODE="SXF00000";
	public static final String REGIST_SUCCESS_MSG="注册成功";
	public static final String MODIFY_SUCCESS_MSG="修改成功";
	public static final String DEL_SUCCESS_MSG="删除成功";
	public static final String USER_IS_NOT_EXSITED="用户号码不存在请检查参数是否正确";
	public static final String SUCCESS_CODE="SXF00000";
	public static final String SUCCESS_MSG="成功";
	public static final String NOT_OPEN_CODE="SXF11111";
	public static final String NOT_OPEN_MSG="未开通";
	public static final String Y="Y";
	public static final String N="N";
	
	public static final String KEY_SUCCESS = "success";
	/**
	 * songyingmei
	 * 2015/03/07
	 */
	public static final String SUPPORT_OPEN_D_ONE_TYP="POS,SMS,VBILL,客服";
	public static final String INMNO_IS_NOT_EXSITED="内部商编不存在请检查参数是否正确";
	public static final String QUERY_FAILE_MSG="查询失败";
	/**
	 * songyingmei
	 * 2014/07/17
	 */
	public static final String EXPORTEXCEL_SUCCESS_MSG="导出EXCEL文件成功";
	public static final String EXPORTEXCEL_FAILE_MSG="导出EXCEL文件失败";
	
	public static final String FAILE_CODE="SXF00001";
	public static final String FAILE_MSG="失败";
	public static final String MODIFY_FAILE_MSG="修改失败";
	public static final String DEL_FAILE_MSG="删除失败";
	
	public static final String LOG_CHANGE_TYPE_INSERT = "1";
	public static final String LOG_CHANGE_TYPE_UPDATE = "2";
	public static final String LOG_CHANGE_TYPE_DELETE = "3";
	
	public static final String NO_SYSID_MSG="";
	
	public static final String NO_CTESTFF_NO="没有首次创建人";
	
	/**
	 * zhou_jn 2016-08-01 pos秒到开通规则是否启用
	 */
	public static final String IS_START="1";
	public static final String POS_MD_TYP01="1";//秒到开通类型：打包
	public static final String POS_MD_TYP02="2";//秒到开通类型：标准
	
	/**
	 * chaihf
	 * 20160514
	 */
	public static final BigDecimal VVMEC_MINSTMAMT = new BigDecimal("99.99");//V V商户起结金额从 100 改为 99.99
	/**
	 * 
	 * 删除01 标志 
	 */
	public static final String DEL_FLAG="01";
	
	/**
	 * 用户状态 未删除 初始 00
	 */
	public static final String INIT_STATUS="00";
	public static final String DEL_STATUS="01";
	public static final String FREEZE_STATUS="03";
	public static final String DESTORY_STATUS="02";
	
	
	/**
	 * 用户类型(个人:00，企业:01，内部用户02 )
	 */
	public static final String PSN_USER="00";
	public static final String CRP_USER="01";
	public static final String INNER_USER="02";
	
	/**
	 * 个人证件类型 01:身份证 02：护照 03：其他待补充
	 */
	public static final String[] ID_CARD_TYPE={"01","02","03"}; 
	
	
	/**
	 * 性别 01 ：男 02 女 03 ：其他
	 */
	public static final String[] GENDAR={"01","02","03"};
	
	/**
	 * 企业类型
	 * 01:国有
	 * 02:私有
	 * 03:外资
	 * 04:合资
	 * 08:个人
	 * 10:公司
	 * 11：个人独资
	 */
	
	public static final String[] CRP_TYPE={"01","02","03","04","08","10","11"};
	
	/**
	 * 产品编号
	 */
	public static final String SENIOR_PROD="01";
	public static final String PUBLIC_PROD="02";
	
	/**
	 * 用户产品绑定状态
	 */
	public static final String IS_START_USE="0";
	public static final String IS_SHENHE="1";
	public static final String IS_STOP_USE="2";
	
	 /**
	  * 维护通(月)、POS维护费(日)开关
	  */
	public static final String MAINT_CHAR_FLG_OPEN = "01";//开了维护通 
	public static final String MAINT_CHAR_FLG_CLOSED = "00";//即没有开维护通，也没有开pos维护费
	public static final String MAINT_POS_FLG_OPEN = "02";//开了pos维护费
	/**
	 * 类型：00 维护通(月)、01POS维护费(日累计)、02 POS维护费(日不累计)
	 */
	public static final String MAINT_CHAR_TYPE = "00";// 00 维护通 
	public static final String MAINT_POS_LJ_TYPE = "01";//01 POS维护费(日累计)
	public static final String MAINT_POS_TYPE = "02";//02 POS维护费(日不累计)
	

	/**商户拓展类型
	 * 01:直营,02:机构代理，03：伙伴拓展
	 */
	
	public static final String[] MEC_DEV_TYP ={"01","02","03"};
	
	/**行业大类
	 * 01餐娱类，02一般类，03民生类，04房产汽车类，05批发类，06公益类,07其他类
	 */
	  
	public static final String[] IDT_TYP ={"01","02","03","04","05","06","07"};
	
	/**清结算暂停标志
	 * 0正常，1暂停
	 */
	
	public static final String[] STL_PAS_FLG ={"0","1"};
	
	
	/**
	 * 超时异常时间
	 */
	public static final int timeount=800;
	
	/**
	 * 商户类型（总分店）
	 * 1－普通商户，2－连锁总店，3－连锁分店，4 1+N总店，5-1+N分店
	 */
	public static final String[] MEC_TYP={"01","02","03","04","05"};
	
	/**
	 * 商户性质
	 * 1-国有，2-私有，3-外资，4-合资（8个人，10公司，11个人独资）
	 */
	public static final String[] CPR_TYP={"01","02","03","04","08","10","11"};
	
	/**
	 * 
	 * 法人证件类型
	 * 01身份证，02军人证，03警察证，04港澳居民往来内地通行证，05台湾居民来往大陆通行证，06护照，07其他
	 */
	public static final String[] LEG_PER_CRD_TYP={"01","02","03","04","05","06","07"};
	
	/**
	 * 收取模式(01,预收、02,后收,char(2))
	 */
	public static final String[] CHAR_MOD={"01","02"};
	
	/**
	 * 收取方式((01,刷卡、02,汇款、03,坐扣))
	 */
	public static final String[] CHAR_METH={"01","02","03"};
	
	/**
	 * 	免收月数（收取周期）01,0个月、02,1个月、03,2个月、04,3个月

	 */
	public static final String[] MAINT_FREE_MON={"01","02","03","04"};
	
	
	
	/**
	 *  银行卡类型	
	 *  1：对公，2:对私，
	 */
	public static final String[] ACT_TYP ={"1","2"};
	
	/**
	 *  用户状态
	 *  00：正常，01:销户，02：停用
	 */
	public static final String[] USR_STS ={"00","01","02"};
	
	/**
	 *  手刷商户的经营方式：LS0001-零售  
	 */
	public static final String MOBILE_OPER_TYP_LS = "LS0001";
	/**
	 *  手刷商户的经营方式：TG0001-团购   
	 */
	public static final String MOBILE_OPER_TYP_TG = "TG0001";
	/**
	 *  手刷商户的经营方式：JSJD01-即刷即到业务  
	 */
	public static final String MOBILE_OPER_TYP_JSJD = "JSJD01";
	
	/**
	 *  手刷商户的经营方式：JSJD02-即刷即到二代业务  
	 */
	public static final String MOBILE_OPER_TYP_JSJD2 = "JSJD02";
	
	/**
	 *  商户二维码支付功能状态：0-关闭；1-开通
	 */
	public static final String QRCODE_FLAG_CLOSE = "0";
	/**
	 *  商户二维码支付功能状态：0-关闭；1-开通
	 */
	public static final String QRCODE_FLAG_OPEN = "1";
	
	/**
	 *  二维码支付商户默认费率 0.006 默认带 百分号单位
	 */
	public static final BigDecimal QRCODE_RAT_DEFAULT = new BigDecimal("0.6");
	
	/**
	 * @author matieli
	 * 银行卡状态  00：异常 01:正常
	 */
	public enum ActSts{
		TYPE_01("01"), TYPE_00("00");
		private String nCode;
		private ActSts(String _nCode) {
			this.nCode = _nCode;
		}
		@Override
        public String toString() {
            return String.valueOf(this.nCode);
        }
		public static boolean isExist(String code){
			if(StringUtils.isNullOrEmpty(code)){
				return false;
			}
			EnumSet<ActSts> all = EnumSet.allOf(ActSts.class);
			for(ActSts s :all){
				if(s.toString().equals(code)){
					return true;
				}
			}
			return false;
		}
	} 
	
	/**
	 * @author matieli
	 * 默认结算账户 是否默认账号00-否，01-是
	 *
	 */
	public enum DefaultFlg {
		TYPE_01("01"), TYPE_00("00");
		private String nCode;
		private DefaultFlg(String _nCode) {
			this.nCode = _nCode;
		}
		@Override
        public String toString() {
            return String.valueOf(this.nCode);
        }
		public static boolean isExist(String code){
			if(StringUtils.isNullOrEmpty(code)){
				return false;
			}
			EnumSet<DefaultFlg> all = EnumSet.allOf(DefaultFlg.class);
			for(DefaultFlg s :all){
				if(s.toString().equals(code)){
					return true;
				}
			}
			return false;
		}
	} 
	
	/**
	 * @author matieli
	 * 结算方式编号  00 手动 01：自动
	 * StmMetNo  结算方式编号
				 * 00    手动          多条记录
				 * 01    自动          一条记录
				 * 02  T+0            一条记录
				 * 03    非工作日    一条记录
	 */

	public enum StmMetNo {
		TYPE_01("01"),TYPE_02("02"),TYPE_03("03"),TYPE_00("00");
		private String nCode;
		private StmMetNo(String _nCode) {
			this.nCode = _nCode;
		}
		@Override
        public String toString() {
            return String.valueOf(this.nCode);
        }
		
		public static boolean isExist(String code){
			if(StringUtils.isNullOrEmpty(code)){
				return false;
			}
			EnumSet<StmMetNo> all = EnumSet.allOf(StmMetNo.class);
			for(StmMetNo s :all){
				if(s.toString().equals(code)){
					return true;
				}
			}
			return false;
		}

	} 
	
	/**
	 * @author matieli
	 * 结算银行卡账户类型（00：对公，01：对私）
	 *
	 */
	public enum ActTyp {
		TYPE_01("01"), TYPE_00("00");
		private String nCode;
		private ActTyp(String _nCode) {
			this.nCode = _nCode;
		}
		@Override
        public String toString() {
            return String.valueOf(this.nCode);
        }
		public static boolean isExist(String code){
			if(StringUtils.isNullOrEmpty(code)){
				return false;
			}
			EnumSet<ActTyp> all = EnumSet.allOf(ActTyp.class);
			for(ActTyp s :all){
				if(s.toString().equals(code)){
					return true;
				}
			}
			return false;
		}

	} 
	/**
	 * @author matieli
	 * 结算模式，（00：自动结算；01：手动结算）
	 *
	 */
	public enum StmMod {
		TYPE_01("01"), TYPE_00("00");
		private String nCode;
		private StmMod(String _nCode) {
			this.nCode = _nCode;
		}
		@Override
        public String toString() {
            return String.valueOf(this.nCode);
        }
		public static boolean isExist(String code){
			if(StringUtils.isNullOrEmpty(code)){
				return false;
			}
			EnumSet<StmMod> all = EnumSet.allOf(StmMod.class);
			for(StmMod s :all){
				if(s.toString().equals(code)){
					return true;
				}
			}
			return false;
		}

	} 
	/**
	 * @author matieli
	 * 是否已逻辑删除(00:不是,01:是)
	 *
	 */
	public enum DelFlg {
		TYPE_01("01"), TYPE_00("00");
		private String nCode;
		private DelFlg(String _nCode) {
			this.nCode = _nCode;
		}
		@Override
        public String toString() {
            return String.valueOf(this.nCode);
        }

		public static boolean isExist(String code){
			if(StringUtils.isNullOrEmpty(code)){
				return false;
			}
			EnumSet<DelFlg> all = EnumSet.allOf(DelFlg.class);
			for(DelFlg s :all){
				if(s.toString().equals(code)){
					return true;
				}
			}
			return false;
		}
	} 
	

	/**商户状态
	 * 01-正常，02-注销，03-冻结
	 * @author songyingmei
	 */
	public static final String[] MEC_STS ={"01","02","03"};
	public enum mecSts{
		TYPE_00("00"),TYPE_01("01"),TYPE_02("02"),TYPE_03("03");
		private String nCode;
		private mecSts(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
	}
	/**
	 * 是否逻辑删除
	 * 00-未删除，01-已删除
	 * @author Administrator
	 *
	 */
	public enum atvFlg{
		TYPE_00("00"),TYPE_01("01");
		private String nCode;
		private atvFlg(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
	}
	/*
	 * 外卡接入方类别
	 * 01-中行外卡，02-交行外卡
	 */
	
	public enum foreignCcyCardTyp{
		TYPE_01("01"),TYPE_02("02");
		private String nCode;
		private foreignCcyCardTyp(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
	}
	
	/**
	 * 是否带密码键盘
	 * 01—是，00-否
	 * @author Administrator
	 *
	 */
	public enum isHavePinPad{
		TYPE_01("01"),TYPE_00("00");
		private String nCode;
		private isHavePinPad(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
	}
	
	/**个企标识
	 * 00-个人，01-企业，02-内部
	 * @author songyingmei
	 */
	public enum psnCrpFlg{
		TYPE_00("00"),TYPE_01("01"),TYPE_02("02");
		private String nCode;
		private psnCrpFlg(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
	}
	
	/**
	 *	用户状态	00-正常，01-销户，02-停用																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																						
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																
															
	 */
	public enum usrSts{
		TYPE_00("00"),TYPE_01("01"),TYPE_02("02");
		private String nCode;
		private usrSts(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	
	/**
	 * PROD_CD	产品编号   目前只有线下收单 01
	 */
	public enum prodCd{
		TYPE_01("01");
		private String nCode;
		private prodCd(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	/**
	 * T_BAP_USR_PROD_BIND	状态	
	 * 00-已开通，01-审核中，02-已停用
	 * @author songyingmei
	 *
	 */
	public enum sts{
		TYPE_00("00"),TYPE_01("01"),TYPE_02("02");
		private String nCode;
		private sts(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	
	/**
	 * PROD_TYP	收单产品类型  收单类型 00 ：普通收单，01：T+0一般收单 02：T+0会生活收单

	 */
	public enum prodTyp{
		TYPE_00("00"),TYPE_01("01"),TYPE_02("02");
		private String nCode;
		private prodTyp(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	/**
	 * MEC_TYP	商户类型	CHAR	2	00－普通商户

	 * @author Administrator
	 *
	 */
	public enum mecTyp{
		TYPE_00("00","普通"),HSH("01","会生活"),SS2("02","手刷"),OL("03","在线"),VV("04","VV商户"),MM("05","移动商户");
		private String code;
		private String codeNm;
		private mecTyp(String _nCode,String _nCodeNm){
			this.code = _nCode;
			this.codeNm=_nCodeNm;
		}
		
		public String getCode() {
			return code;
		}


		public String getCodeNm() {
			return codeNm;
		}


		@Override
		public String toString(){
			return String.valueOf(this.code);
		}
		
		public static String getCodeNmByCode(String nCode) {
			EnumSet<mecTyp> all = EnumSet.allOf(mecTyp.class);
			for (mecTyp s : all) {
				if (s.getCode().equals(nCode)) {
					return s.getCodeNm();
				}
			}
			return null;
		}
		
	}
	
	/**
	 * PROD_NM	产品编号   目前只有线下收单 01
	 */
	public enum prodNm{
		TYPE_01("线下收单");
		private String nCode;
		private prodNm(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	
	/**
	 * RAT_TYP	商户阶梯费率类型  	CHAR	2	01-普通，02－阶梯（01 消费佣金，02渠道佣金，03商户返点费率，04代理商分成费率）

	 */
	
	public enum ratTyp{
		TYPE_01("01"),TYPE_02("02");
		private String nCode;
		private ratTyp(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	/**
	 * 		MERC_TYP_RATE	商户费率类型	CHAR	2					
	 *           01：交易  02:T+N 03:非工作日，04：T+0工作日 05：T+0非工作日 06手刷
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																					
	 */
	
	public enum mercTypRate{
		TYPE_01("01"),TYPE_02("02"),TYPE_03("03"),TYPE_04("04"),TYPE_05("05"),TYPE_06("06"),TYPE_07("07");
		private String nCode;
		private mercTypRate(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	/**
	 * 
	 * @author sym
	 * T+0   手工提现T+0到账
	 * T+N 正常
	 * NOTWEEKDAYS   非工作日付款
	 * 
	 *
	 */
	public enum wdcFlgIsT0OrNotWeekDays{
		TYPE_01("T+0"),TYPE_03("T+N"),TYPE_04("NOTWEEKDAYS");
		private String nCode;
		private wdcFlgIsT0OrNotWeekDays(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
	}
	/**
	 * 
	 * sym
	 * 结算费率信息
	 * T+0工作日费率0.2% TYPE_01
	 * T+0非工作日费率0.2% TYPE_02
	 * T+N费率0 TYPE_03
	 * 非工作日费率0.2%  TYPE_04
	 *
	 */
	
	public enum wdcFlgIsT0OrNotWeekDaysRate{
		TYPE_01("0.2"),TYPE_02("0.2"),TYPE_03("0"),TYPE_04("0.2");
		private String nCode;
		private wdcFlgIsT0OrNotWeekDaysRate(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
	}
	/**
	 * 
	 * 
	 * @Title: Contant.java
	 * @Package: com.lemon.usr.util
	 * @Description: T+0商户结算状态
	 * @author: sym
	 * @date: 2014年9月20日
	 * @version: V1.0
	 * 01：已开通
	 */
	public enum stlSts{
		/*TYPE_01("01"),*/
		OPEN("01"),
		PAUSE("02"),
		CLOSE("00");
		private String nCode;
		private stlSts(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	
	public static final String close="close";	
	public static final String open="open";
	

/**
 * 
 * @author sym
 * 开关默认值
 *
 */
	public enum funSwInit{
		BNK_FLG("00111000001111100000"),
		OVERSEA_CRAD_FLG("00111000001011100000"),
		PRE_FLG("00000000000000000000"),
		DT_FLG("00010000000000000000"),
	    WK_PAY("00"),
	    UGT_PAY("00") ,
	    MERGE_PAY("00") ,
	    MAINT_CHAR_FLG("00") ,
	    JY_FLG("00000000000000000000") ,
	    HAND_FLG("00111110000000000000") ,
		BUS_STS("00000000000000000000") ,
	    BMP_FLG("00000001100000000000"),
	    OTH_FLG("00000001000110000000"),
	    WDC_FLG("00010000111110000000"),
	    PAY_FLG("00111000000000000000");
		private String nCode;
		private funSwInit(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}

/**
 * @author sym
 * 商户的业务类型
 *2015-03-08
 */
	public enum mecBusType{
		TZERO("01"),DONE("02"),NORMALZFT("03"),VIPZFT("04"),POSMD("06"),AUTOINTIME("08"),MECVVRATE("09");
		private String nCode;
		private mecBusType(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	
	/**
	 * @author sym
	 * 商户的推送类型
	 * 2015-03-08
	 * CMS:客服系统
	 */
	public enum mecPushType{
		POS("01"),SMS("02"),VBILL("03"),CMS("04"),BAP("05"),AGENT("06");
		private String nCode;
		private mecPushType(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	
	//发送类型， 00，D+1推送，01，D+1开通成功 ，02，T+0推送 ，03T+0推送回复
	public enum sendMsgType{
		Done_push("00"),Done_push_succ("01"),
		Done_push_dealMecResponse_tzeroOpend("04"),
		Done_push_dealMecResponse_doneOpend("05"),
		Done_push_dealMecResponse_logoff("06"),
		Done_push_JH("20"),
		
		
		TZero_push("02"),TZero_push_succ("03"),
		TZero_push_dealMecResponse_tzeroJRFOpend("07"),
		TZero_push_dealMecResponse_doneOpend("08"),
		TZero_push_dealMecResponse_logoff("09"),
		TZero_push_dealMecResponse_org_tzeroOpend("10"),
		TZero_push_dealMecResponse_zftOpend("11"),
		TZero_push_dealMecResponse_tzeroSYTOpend("12"),
		TZero_push_dealMecResponse_tzeroBIZChannelClose("13"),
		TZero_push_dealMecResponse_overrun("21"),
		TZero_push_dealMecResponse_posMdOpened("22")
		;
		private String nCode;
		private sendMsgType(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	
	

	//发送类型内容， 00，D+1推送，01，D+1开通成功 ，02，T+0推送 ，03T+0推送回复
	public enum sendMsgTypeContent{

		                        TZero_push("尊敬的随行付商户，现随行付推出“即日付”服务，开通后每日20点前的刷卡资金当日到账。回复JRF可立即开通。退订此类短信回复N"),
		               TZero_push_response("JRF"),
		       TZero_push_response_open_ok("尊敬的随行付商户，已为您开通即日付，每日额度defaultLimit元。"),
		 TZero_push_response_tzeroJRFOpend("尊敬的随行付商户，您之前已开通即日付。敬请知悉。"),
		 TZero_push_response_tzeroSYTOpend("尊敬的随行付商户，非常抱歉您无法开通即日付。详询随行付客服4000887626。"),
		TZero_push_response_org_tzeroOpend("尊敬的随行付商户，非常抱歉您无法开通即日付。详询随行付客服4000887626。"),
		     TZero_push_response_doneOpend("尊敬的随行付商户，非常抱歉您无法开通即日付。详询随行付客服4000887626。"),
		 TZero_push_dealMecResponse_logoff("尊敬的随行付商户，非常抱歉您无法开通即日付。详询随行付客服4000887626。"),
	   TZero_push_dealMecResponse_zftOpend("尊敬的随行付商户，非常抱歉您无法开通即日付。详询随行付客服4000887626。"),
		Done_push_JH("尊敬的随行付商户，周末将至，提醒您周末刷卡次日也会到账。因为您已开通假日付业务，一年365天，天天到账。详询4000887626.退订此类短信回复N"),
		Biz_Channel_Close("尊敬的随行付商户，很抱歉，系统目前暂停受理短信开通即日付，如有疑问请联系当地代理商。详询4000887626"),
		 TZero_push_dealMecResponse_overrun("尊敬的随行付商户，非常抱歉您无法开通即日付。详询随行付客服4000887626。"),
		;
		private String nCode;
		private sendMsgTypeContent(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	/**
	 * T+0类型 ：01 老T+0商户，02新T+0商户
	 * @author winAbc
	 *
	 */
	public enum stlTyp{
		Old_TZ("01"),NEW_TZ("02"),HOUR_TZ("03");
		private String nCode;
		private stlTyp(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	
	
	public enum openSrc{
		open_Tz_Src_OA("01"),open_Tz_Src_POS("02"),open_Tz_Src_SMS("03"),open_Tz_Src_BAP("04"),open_Tz_Src_WX("05");
		private String nCode;
		private openSrc(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	
	//00：d+1，01:新t+0,02：老t+0
	public enum busTyp{
		dOne_bus("00"),new_TZero_bus("01"),old_TZero_bus("03");
		private String nCode;
		private busTyp(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	
	/**
	 * @author sym
	 * 普通朝付通要判断的19家银行  2015-07-23
	 * 普通朝付通增加可受理的行别：'恒丰银行'、'华商银行'、'徽商银行'、'上海农村商业银行'、'外资银行'、'中国农业发展银行'  by chf 2016-04-21
	 */
	public enum zftBnks{
	     ABC("103","中国农业银行"),
	     CCB("105","中国建设银行"),
		 ICBC("102","中国工商银行"),
		 BOC("104","中国银行"),//104	中国银行  505	中国银行（香港）
		 CMB("308","招商银行"),
		 CEBB("303","中国光大银行"),
		 CMBC("305","中国民生银行"),
		 BC("301","交通银行"),
		 CIB("309","兴业银行"),//309	兴业银行691	法国兴业银行
		 ECITIC("302","中信银行"),
		 PSBC("403","中国邮政储蓄银行"),
		 CZB("316","浙商银行"),
		 HXB("304","华夏银行"),
		 CGB("306","广发银行"),
		 SPDB("310","上海浦东发展银行"),
		 PINGAN("307","平安银行"),
		 CBHB("318","渤海银行"),
	     UCB("313","城市商业银行"),
	     RCB("314","农村商业银行"),
	     EGB("315","恒丰银行"),
	     CMBCN("785","华商银行"),
	     HSB("319","徽商银行"),
	     SRCB("322","上海农村商业银行"),
	     WZB("888","外资银行"),
	     ADBC("203","中国农业发展银行");
	     
		private String bnkCd;
		private String bnkNm;
		private zftBnks(String _bnkCd,String _bnkNm) {
			this.bnkCd = _bnkCd;
			this.bnkNm = _bnkNm;
		}
		
		public String getBnkCd() {
			return bnkCd;
		}
		
		public String getBnkNm() {
			return bnkNm;
		}
	
		public static boolean isExist(String bnkCd){
			if(StringUtils.isNullOrEmpty(bnkCd)){
				return false;
			}
			EnumSet<zftBnks> all = EnumSet.allOf(zftBnks.class);
			for(zftBnks s :all){
				if(s.bnkCd.equals(bnkCd)){
					return true;
				}
			}
			return false;
		}
	} 
	
	/**
	 * VIP普通朝付通增加可受理的行别：'中国农业发展银行'  by chf 2016-04-21
	 */
	public enum zftBnksForVip{
	     ABC("103","中国农业银行"),
	     CCB("105","中国建设银行"),
		 ICBC("102","中国工商银行"),
		 BOC("104","中国银行"),//104	中国银行  505	中国银行（香港）
		 CMB("308","招商银行"),
		 CEBB("303","中国光大银行"),
		 CMBC("305","中国民生银行"),
		 BC("301","交通银行"),
		 CIB("309","兴业银行"),//309	兴业银行691	法国兴业银行
		 ECITIC("302","中信银行"),
		 PSBC("403","中国邮政储蓄银行"),
		 CZB("316","浙商银行"),
		 HXB("304","华夏银行"),
		 CGB("306","广发银行"),
		 SPDB("310","上海浦东发展银行"),
		 PINGAN("307","平安银行"),
		 CBHB("318","渤海银行"),
	     //UCB("313","城市商业银行"),
	     //RCB("314","农村商业银行");
	     ADBC("203","中国农业发展银行");
		
		private String bnkCd;
		private String bnkNm;
		private zftBnksForVip(String _bnkCd,String _bnkNm) {
			this.bnkCd = _bnkCd;
			this.bnkNm = _bnkNm;
		}
		
		public String getBnkCd() {
			return bnkCd;
		}
		
		public String getBnkNm() {
			return bnkNm;
		}
	
		public static boolean isExist(String bnkCd){
			if(StringUtils.isNullOrEmpty(bnkCd)){
				return false;
			}
			EnumSet<zftBnksForVip> all = EnumSet.allOf(zftBnksForVip.class);
			for(zftBnksForVip s :all){
				if(s.bnkCd.equals(bnkCd)){
					return true;
				}
			}
			return false;
		}
	}
	
	//00：未开通，01：普通朝付通，02：VIP朝付通
	public enum zftStatus{
		noOpenZft("00"),generalZft("01"),vipZft("02");
		private String nCode;
		private zftStatus(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		public static boolean isExist(String nCode){
			if(StringUtils.isNullOrEmpty(nCode)){
				return false;
			}
			EnumSet<zftStatus> all = EnumSet.allOf(zftStatus.class);
			for(zftStatus s :all){
				if(s.toString().equals(nCode)){
					return true;
				}
			}
			return false;
		}
	}
	
	//01：申请中，02：通过，03：不通过
	public enum zftApplyStatus{
		waiting("01"),pass("02"),reject("03");
		private String nCode;
		private zftApplyStatus(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		public static boolean isExist(String nCode){
			if(StringUtils.isNullOrEmpty(nCode)){
				return false;
			}
			EnumSet<zftStatus> all = EnumSet.allOf(zftStatus.class);
			for(zftStatus s :all){
				if(s.toString().equals(nCode)){
					return true;
				}
			}
			return false;
		}
	}

	
	public enum zftTyp{
		normalZft("NORMALZFT"),vipZft("VIPZFT");
		private String nCode;
		private zftTyp(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	
	public enum mecSsAuthSts{
		noAuth("00"),alreadyAuth("01"),exception("02"),authing("03");
		private String nCode;
		private mecSsAuthSts(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
	}
	
	public enum authSts{
		waitAuth("00"),passAuth("01"),refuseAuth("02");
		private String nCode;
		private authSts(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
	}
	//public static final String timePoint = "00,09,12,16,20";
	//public static final String timePoint = "00,09,12,14,16,20";//即日付时间点 xingxin 2015-07-15
	public static final String timePoint = "00,09,10,11,12,13,14,15,16,17,20";//即日付时间点 xingxin 2015-10-29
	public static final String timePointHour = "09,10,11,12,13,14,15,16,17,20";//小时付付时间点 
		
	public enum funSwInitMobile{
		BNK_FLG("00111000000100000000"),
		OVERSEA_CRAD_FLG("00000000000000000000"),
		PRE_FLG("00000000000000000000"),
		DT_FLG("00010000000000000000"),
	    WK_PAY("00"),
	    UGT_PAY("00") ,
	    MERGE_PAY("00") ,
	    MAINT_CHAR_FLG("00") ,
	    JY_FLG("00000000000000000000") ,
	    HAND_FLG("00111110000000000000") ,
		BUS_STS("00000000000000000000") ,
	    BMP_FLG("00001101100000000000"),
	    OTH_FLG("00000001000110000000"),
	    WDC_FLG("00110100100100000000"),
	    PAY_FLG("00111000000000000000");
		
		private String nCode;
		private funSwInitMobile(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	
	
	//0:绑定,1：删除,2:校验
	public enum mobileCardBnkOperTyp{
	     BIND("0"),
	     DELETE("1"),
		 CHECK("2");
		
		private String code;
		private mobileCardBnkOperTyp(String _code) {
			this.code = _code;
		}
		
		
		public String getCode() {
			return code;
		}


		public static boolean isExist(String _code){
			if(StringUtils.isNullOrEmpty(_code)){
				return false;
			}
			EnumSet<mobileCardBnkOperTyp> all = EnumSet.allOf(mobileCardBnkOperTyp.class);
			for(mobileCardBnkOperTyp s :all){
				if(s.getCode().equals(_code)){
					return true;
				}
			}
			return false;
		}
	} 
	
	
	public enum bnkInfoChangetype{
		ADD("1"),MODIFY("2"),DELETE("3"),NOT_MODIFY("4");
		private String nCode;
		private bnkInfoChangetype(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		public static boolean isExist(String nCode){
			if(StringUtils.isNullOrEmpty(nCode)){
				return false;
			}
			EnumSet<bnkInfoChangetype> all = EnumSet.allOf(bnkInfoChangetype.class);
			for(bnkInfoChangetype s :all){
				if(s.toString().equals(nCode)){
					return true;
				}
			}
			return false;
		}
	}
	

	//系统来源
	public enum channelId {
		POS("01", "POS"), SMS("02", "SMS"), VBILL("03", "VBILL"), CMS("04",
				"CSM"), BAP("05", "BAP"), AGENT("06", "AGENT"), WEIXIN("07",
				"WEIXIN"),
				AGENT_BACK_SINGLE("08","AB01"),
				AGENT_BACK_BATCH("09","AB02"),
			    AGENT_FRONT_SINGLE("10","AF01"),
				AGENT_FRONT_BATCH("11","AF02")
				;
		
		private String code;
		private String codeNm;

		private channelId(String _nCode, String _nCodeNm) {
			this.code = _nCode;
			this.codeNm = _nCodeNm;
		}

		public String getCode() {
			return code;
		}

		public String getCodeNm() {
			return codeNm;
		}

		public String toString(){
			return String.valueOf(this.code);
		}
		public static boolean isExistCode(String nCode) {
			if (StringUtils.isNullOrEmpty(nCode)) {
				return false;
			}
			EnumSet<channelId> all = EnumSet.allOf(channelId.class);
			for (channelId s : all) {
				if (s.getCode().equals(nCode)) {
					return true;
				}
			}
			return false;
		}
		
		public static String getCodeNmByCode(String nCode) {
			EnumSet<channelId> all = EnumSet.allOf(channelId.class);
			for (channelId s : all) {
				if (s.getCode().equals(nCode)) {
					return s.getCodeNm();
				}
			}
			return null;
		}
		
		public static String getCodeByCodeNm(String nCodeNm) {
			EnumSet<channelId> all = EnumSet.allOf(channelId.class);
			for (channelId s : all) {
				if (s.getCodeNm().equals(nCodeNm)) {
					return s.getCode();
				}
			}
			return null;
		}
		
		public static boolean isExistCodeNm(String nCodeNm) {
			if (StringUtils.isNullOrEmpty(nCodeNm)) {
				return false;
			}
			EnumSet<channelId> all = EnumSet.allOf(channelId.class);
			for (channelId s : all) {
				if (s.getCodeNm().equals(nCodeNm)) {
					return true;
				}
			}
			return false;
		}

	}

	

	
	//		comment on column BAP.T_BAP_MEC_TZERO_STL .OPEN_SRC is '开通渠道(01：OA/代理商系统，02：POS，03：短信，04：BAP,05：微信);
	public enum MecTzeroStlOpenSrc {
		AGENT("01", "AGENT"), OA("01", "OA"), POS("02", "POS"), SMS("03", "SMS"), BAP(
				"04", "BAP"), WEIXIN("05", "WEIXIN");

		private String code;
		private String codeNm;

		private MecTzeroStlOpenSrc(String _nCode, String _nCodeNm) {
			this.code = _nCode;
			this.codeNm = _nCodeNm;
		}

		public String getCode() {
			return code;
		}

		public String getCodeNm() {
			return codeNm;
		}

		
	  public static String getCodeByCodeNm(String nCodeNm) {
			EnumSet<MecTzeroStlOpenSrc> all = EnumSet.allOf(MecTzeroStlOpenSrc.class);
			for (MecTzeroStlOpenSrc s : all) {
				if (s.getCodeNm().equals(nCodeNm)) {
					return s.getCode();
				}
			}
			return null;
		}
		
		public static boolean isExistCode(String nCode) {
			if (StringUtils.isNullOrEmpty(nCode)) {
				return false;
			}
			EnumSet<MecTzeroStlOpenSrc> all = EnumSet
					.allOf(MecTzeroStlOpenSrc.class);
			for (MecTzeroStlOpenSrc s : all) {
				if (s.getCode().equals(nCode)) {
					return true;
				}
			}
			return false;
		}

		public static boolean isExistCodeNm(String nCodeNm) {
			if (StringUtils.isNullOrEmpty(nCodeNm)) {
				return false;
			}
			EnumSet<MecTzeroStlOpenSrc> all = EnumSet
					.allOf(MecTzeroStlOpenSrc.class);
			for (MecTzeroStlOpenSrc s : all) {
				if (s.getCodeNm().equals(nCodeNm)) {
					return true;
				}
			}
			return false;
		}

	}

	
	//二代手刷即刷即到状态
	//0：关闭，1：开通，2：暂停,3:未开通
	public enum mobileJsjdSts {
		close("0"), open("1"), stop("2"), not_open("3");

		private String code;

		private mobileJsjdSts(String _nCode) {
			this.code = _nCode;
		}

		public String getCode() {
			return code;
		}
	}
	//二代手刷即刷即到操作类型  00：关闭，01：开通，02：暂停，03：恢复
	public enum mobileJsjdOpenTyp {
		close("00"), open("01"), stop("02"), recover("03");

		private String code;

		private mobileJsjdOpenTyp(String _nCode) {
			this.code = _nCode;
		}

		public String getCode() {
			return code;
		}
	}

	
	/**
	 * bap.t_bap_mec_bus_typ 里面的bus_typ
	 * @author SYM
	 */
	public enum mecBusTyp{
		NONJRF("00");
		private String nCode;
		private mecBusTyp(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
	}
	
	
	/**
	 * bap.t_bap_mec_bus_typ 里面的bus_sts 0：关闭，1：开通，2:暂停
	 * @author SYM
	 */
	public enum mecBusSts{
		close("0"),open("1"),stop("2");
		private String nCode;
		private mecBusSts(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
	}
			
	
	public enum mecBusSysId{
		AGENTBACK_SINGLE("AB01"),
		AGENTBACK_BATCH("AB02"),
		AGENTFRONT_SINGLE("AF01"),
		AGENTFRONT_BATCH("AF02");
		private String nCode;
		private mecBusSysId(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
		public static boolean isExistCode(String nCode) {
			if (StringUtils.isNullOrEmpty(nCode)) {
				return false;
			}
			EnumSet<mecBusSysId> all = EnumSet.allOf(mecBusSysId.class);
			for (mecBusSysId s : all) {
				if (s.toString().equals(nCode)) {
					return true;
				}
			}
			return false;
		}
	}

	/**
	 * 在线商户的开关初始化
	 * @author SYM
	 *
	 */
	public enum OlSwInit{
		olBnkModSw("0000000000"),
		cashDeskVerSw("0000000000"),
		payModSw("0000000000"),
		tranSw  ("0000000000"),
		settFlg ("2222222222"),
		WDC_FLG("00000000111110000000");
		private String nCode;
		private OlSwInit(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		
	}
	
	
	public enum funSwValue{
		open("1"),close("0"),not_opened("2");
		private String nCode;
		private funSwValue(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
		public static boolean isExist(String nCode){
			if(StringUtils.isNullOrEmpty(nCode)){
				return false;
			}
			EnumSet<funSwValue> all = EnumSet.allOf(funSwValue.class);
			for(funSwValue s :all){
				if(s.toString().equals(nCode)){
					return true;
				}
			}
			return false;
		}
	}

	
	public enum funSwInitWeChat{
		BNK_FLG("00100000000100000000"),
		OVERSEA_CRAD_FLG("00000000000000000000"),
		PRE_FLG("00000000000000000000"),
		DT_FLG("00010000000000000000"),
	    WK_PAY("00"),
	    UGT_PAY("00") ,
	    MERGE_PAY("00") ,
	    MAINT_CHAR_FLG("00") ,
	    JY_FLG("00000000000000000000") ,
	    HAND_FLG("00000000000000000000") ,
		BUS_STS("00000000110000000000") ,
	    BMP_FLG("00001101100000000000"),
	    OTH_FLG("00000000000000000000"),
	    WDC_FLG("00001000000101110000"),
	    PAY_FLG("00000000000000000000");
		
		private String nCode;
		private funSwInitWeChat(String _nCode){
			this.nCode = _nCode;
		}
		@Override
		public String toString(){
			return String.valueOf(this.nCode);
		}
	}
	public static final BigDecimal LIMIT_AMT_HOUR = new BigDecimal("999999999.99");
	
	public enum WECHAR_IDTYP{
	     IDTYP_01("01","1001"),//餐娱类
	     IDTYP_02("02","3001"),//一般类
	     IDTYP_03("03","3002"),//批发类
	     IDTYP_04("04","1002"),//房产汽车类
	     IDTYP_05("05","2001"),//民生类
	     IDTYP_06("06","4001");//公益类
	    
		private String idtyp;
		private String idtypOa;
		private WECHAR_IDTYP(String _idtyp,String _idtypOa) {
			this.idtyp = _idtyp;
			this.idtypOa = _idtypOa;
		}
		public String getIdtyp() {
			return idtyp;
		}
		public void setIdtyp(String idtyp) {
			this.idtyp = idtyp;
		}
		public String getIdtypOa() {
			return idtypOa;
		}
		public void setIdtypOa(String idtypOa) {
			this.idtypOa = idtypOa;
		}
		public static String getIdtypOa(String idtyp){
			if(StringUtils.isNullOrEmpty(idtyp)){
				return "0000";
			}
			EnumSet<WECHAR_IDTYP> all = EnumSet.allOf(WECHAR_IDTYP.class);
			for(WECHAR_IDTYP s :all){
				if(s.idtyp.equals(idtyp)){
					return s.idtypOa;
				}
			}
			return "0000";
		}
	} 

	
	
	public enum mobileAppType {
		 handApp("01", "handApp","01"),mpos("02", "mpos","04"); 

		private String bapCode;
		private String codeNm;
		private String vbillCode;
		
		
		private mobileAppType(String _bapCode, String _codeNm,String  _vbillCode) {
			this.bapCode = _bapCode;
			this.codeNm = _codeNm;
			this.vbillCode = _vbillCode;
		}
		
	   public String getBapCode() {
			return bapCode;
		}

		public String getCodeNm() {
			return codeNm;
		}

		public String getVbillCode() {
			return vbillCode;
		}

   	 public static String getBapCodeByCodeNm(String nCodeNm) {
			EnumSet<mobileAppType> all = EnumSet.allOf(mobileAppType.class);
			for (mobileAppType s : all) {
				if (s.getCodeNm().equals(nCodeNm)) {
					return s.getBapCode();
				}
			}
			return null;
		}
		

   	 public static String getVbillCodeByCodeNm(String nCodeNm) {
			EnumSet<mobileAppType> all = EnumSet.allOf(mobileAppType.class);
			for (mobileAppType s : all) {
				if (s.getCodeNm().equals(nCodeNm)) {
					return s.getVbillCode();
				}
			}
			return null;
		}
		

  	public static boolean isExistCodeNm(String nCodeNm) {
			if (StringUtils.isNullOrEmpty(nCodeNm)) {
				return false;
			}
			EnumSet<mobileAppType> all = EnumSet
					.allOf(mobileAppType.class);
			for (mobileAppType s : all) {
				if (s.getCodeNm().equals(nCodeNm)) {
					return true;
				}
			}
			return false;
		}

	}


}
