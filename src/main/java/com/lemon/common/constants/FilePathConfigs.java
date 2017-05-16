package com.lemon.common.constants;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.lemon.common.utils.log.BapLogUtil;
import com.lemon.core.context.EnvVar;

public class FilePathConfigs {
	//BAP下载文件时路径
	public static String bap_file_path = "";
	//结算系统下载文件时路径
	public static String ses_file_path = "";
	//交易路由系统下载文件时路径
	public static String trs_file_path = "";
	//用户系统下载文件时路径
	public static String usr_file_path = "";
	//业务平台系统下载文件时路径
	public static String msp_file_path = "";
	//MBS下载文件时路径
	public static String mbs_file_path = "";
	//朝付通下载文件时路径
	public static String zft_file_path = "";
	static final Logger logger = LoggerFactory.getLogger(FilePathConfigs.class);
	
	static{
		 bap_file_path =  EnvVar.curEnv().getVar("filePath.bap");//从config.properties取值
		 ses_file_path =  bap_file_path + File.separator + "SES" + File.separator;
		 trs_file_path =  bap_file_path + File.separator + "trs" + File.separator;
		 msp_file_path =  bap_file_path + File.separator + "msp" + File.separator;
		 usr_file_path =  bap_file_path + File.separator + "usr" + File.separator;
		 mbs_file_path =  bap_file_path + File.separator + "mbs" + File.separator;
		 zft_file_path =  bap_file_path + File.separator + "zft" + File.separator;
		 logger.info(BapLogUtil.genLogs("filePathConfigs", "----ses_file_path="+ses_file_path));
	}
}
