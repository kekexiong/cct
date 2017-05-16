package com.lemon.msp.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * 文件操作工具类
 * @author zhangkai
 *
 */
public class FileUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(FileUtils.class);
	
	public InputStream getUploadInputStream(HttpServletRequest request,Map<String,Object> msg) {
		MultipartHttpServletRequest mulRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = mulRequest.getFile("file");
		if (file.getSize() > 6291456) {//6*1024*1024
			msg.put("msg", "文件大于6M！");
			return null;
		}
		/*if (file.getSize() > 409600) {
			msg.put("msg", "文件大于400KB！");
			return null;
		}*/
		String filename = file.getOriginalFilename();
		if (!filename.substring(filename.length()-5).equals(".xlsx")) {
			msg.put("msg", "文件格式错误，请导入07+版本EXCEL文件！!！");
			return null;
		}
		InputStream input = null;
		try {
			input = file.getInputStream();
			return input;
		} catch (IOException e) {
			logger.info("批量添加的文件上传 获取流异常,上传文件名:{}",filename);
			e.printStackTrace();
			msg.put("msg", "获取信息流异常！");
			return null;
		}
	}
}
