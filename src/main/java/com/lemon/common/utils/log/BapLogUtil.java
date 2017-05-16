package com.lemon.common.utils.log;

import com.lemon.core.constants.LogType;
import com.lemon.utils.LogUtils;

public class BapLogUtil {
	
	public static String genLogs(String tradeCode, String msg){
		String logs = genLogs(tradeCode, null, msg);
		return logs;
	}
	
	public static String genLogs(String tradeCode, String tradeNum, String msg){
		String logs = LogUtils.genLogs(LogType.BAP, tradeCode, tradeNum, msg);
		return logs;
	}
	
	/**
	 * Description: 去掉日志里的卡号等敏感信息
	 * @author xing_xin@suixingpay.com
	 * @param  strLog
	 * @return String
	 * @throws
	 */
	public static String removeActNo(String strLog){
		try {
			if(strLog==null||"".equals(strLog)) {
				return "";
			}
			return strLog.replaceAll("((62)\\d{14,18})|((=|\"| |>)(?!2015|62|1000)\\d{16,20})","*******");
		}catch(Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	public static void main(String[] args) {
        String str = "\"actNo\":\"6217868100000444813\",,<ACC_NO> 6015201510007396</ACC_NO>ee622575820551301339990gg\"6225758205513012<REQUEST_SN>2015092414351020</REQUEST_SN>,crdCd>1225756205513012,crdCd=6225758205513012";
        System.out.println(str);
        str = removeActNo(str);
        System.out.println(str);
	}
}
