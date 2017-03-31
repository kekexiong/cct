package com.zqg.cct.domain;
import java.math.BigDecimal;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

/**
 * @description  TSesErrorLogdomain
 * @author zhao_qg
 * @date   20170331 15:40:42
 * @review zhao_qg/2017-03-31
 */
public class TSesErrorLog {
	/**
	 * 数据主键
	 */
	public String uuid;
	/**
	 * 业务类型(01:秒到自动结算;02即刷接到结算;03:闪电到账;04:TN直连付款)
	 */
	public String bizType;
	/**
	 * 错误码
	 */
	public String errorCode;
	/**
	 * 错误原因
	 */
	public String errorMsg;
	/**
	 * 备注
	 */
	public String rmk;
	/**
	 * 金额
	 */
	public BigDecimal payAmt;
	/**
	 * 商户编号
	 */
	public String inMno;
	/**
	 * 创建日期
	 */
	public String dtCte;
	/**
	 * 创建时间
	 */
	public String tmCte;
	/**
	 * 手续费
	 */
	public BigDecimal feeAmt;
	/**
	 * 结算子类型
	 */
	public String subType;
	/**
	 * 交易流水号
	 */
	public String ordNo;
	
	public TSesErrorLog() {
		super();
	}
	
	/**
	 * get 数据主键
	 */
	public String getUuid() {
		return uuid;
	}
	/**
	 * set 数据主键
	 */
	public void setUuid(String uuid) {
		this.uuid = uuid;
	} 
	/**
	 * get 业务类型(01:秒到自动结算;02即刷接到结算;03:闪电到账;04:TN直连付款)
	 */
	public String getBizType() {
		return bizType;
	}
	/**
	 * set 业务类型(01:秒到自动结算;02即刷接到结算;03:闪电到账;04:TN直连付款)
	 */
	public void setBizType(String bizType) {
		this.bizType = bizType;
	} 
	/**
	 * get 错误码
	 */
	public String getErrorCode() {
		return errorCode;
	}
	/**
	 * set 错误码
	 */
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	} 
	/**
	 * get 错误原因
	 */
	public String getErrorMsg() {
		return errorMsg;
	}
	/**
	 * set 错误原因
	 */
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	} 
	/**
	 * get 备注
	 */
	public String getRmk() {
		return rmk;
	}
	/**
	 * set 备注
	 */
	public void setRmk(String rmk) {
		this.rmk = rmk;
	} 
	/**
	 * get 金额
	 */
	public BigDecimal getPayAmt() {
		return payAmt;
	}
	/**
	 * set 金额
	 */
	public void setPayAmt(BigDecimal payAmt) {
		this.payAmt = payAmt;
	} 
	/**
	 * get 商户编号
	 */
	public String getInMno() {
		return inMno;
	}
	/**
	 * set 商户编号
	 */
	public void setInMno(String inMno) {
		this.inMno = inMno;
	} 
	/**
	 * get 创建日期
	 */
	public String getDtCte() {
		return dtCte;
	}
	/**
	 * set 创建日期
	 */
	public void setDtCte(String dtCte) {
		this.dtCte = dtCte;
	} 
	/**
	 * get 创建时间
	 */
	public String getTmCte() {
		return tmCte;
	}
	/**
	 * set 创建时间
	 */
	public void setTmCte(String tmCte) {
		this.tmCte = tmCte;
	} 
	/**
	 * get 手续费
	 */
	public BigDecimal getFeeAmt() {
		return feeAmt;
	}
	/**
	 * set 手续费
	 */
	public void setFeeAmt(BigDecimal feeAmt) {
		this.feeAmt = feeAmt;
	} 
	/**
	 * get 结算子类型
	 */
	public String getSubType() {
		return subType;
	}
	/**
	 * set 结算子类型
	 */
	public void setSubType(String subType) {
		this.subType = subType;
	} 
	/**
	 * get 交易流水号
	 */
	public String getOrdNo() {
		return ordNo;
	}
	/**
	 * set 交易流水号
	 */
	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	} 
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.SHORT_PREFIX_STYLE);
	}
}
