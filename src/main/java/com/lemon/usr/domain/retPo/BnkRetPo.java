package com.lemon.usr.domain.retPo;

public class BnkRetPo {
	private String bnkCd;
	private String failReason;
	
	public String getBnkCd() {
		return bnkCd;
	}
	public void setBnkCd(String bnkCd) {
		this.bnkCd = bnkCd;
	}
	public String getFailReason() {
		return failReason;
	}
	public void setFailReason(String failReason) {
		this.failReason = failReason;
	}
	public BnkRetPo(String bnkCd, String failReason) {
		super();
		this.bnkCd = bnkCd;
		this.failReason = failReason;
	}
	@Override
	public String toString() {
		return "BnkRetPo [bnkCd=" + bnkCd + ", failReason=" + failReason + "]";
	}
}
