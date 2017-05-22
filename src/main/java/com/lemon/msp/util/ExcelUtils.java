package com.lemon.msp.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.lemon.ses.util.DateUtils;
import com.lemon.usr.domain.retPo.BnkRetPo;
import com.lemon.usr.util.Contant;
import com.lemon.utils.StringUtils;

/**
 *  Excel工具类
 * @author zhangkai
 *
 */
public class ExcelUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(ExcelUtils.class);
	/**
	 * 导出excel
	 * @param response
	 * @param datas
	 * @param fields
	 * @param fileName
	 */
	public static void exportExcel(HttpServletResponse response, List<Map<String,Object>> datas,String[] fields,String[] columnName){
		XSSFWorkbook wb = crtExcel(fields);
		if(datas != null)
			inserDateToExcel(wb,datas,columnName,fields.length);
		downExcel(response,wb);
	}
	
	/**
	 * 创建excel
	 * @param fields
	 * @return
	 */
	private static  XSSFWorkbook crtExcel(String[] fields) {
		XSSFWorkbook wb = new XSSFWorkbook();
		XSSFCellStyle style = wb.createCellStyle();
		style.setDataFormat(wb.createDataFormat().getFormat("@"));
		XSSFSheet sheet = wb.createSheet("sheet");
		XSSFRow rowt = sheet.createRow(0);
		XSSFCell cell = null;
		for (int i = 0; i < fields.length; i++) {
			if (i == fields.length - 1) 
				sheet.setColumnWidth(i, 7000);
			else
				sheet.setColumnWidth(i, 5000);
			sheet.setDefaultColumnStyle(i, style);
			cell = rowt.createCell(i);
			XSSFCellStyle titleStyle = wb.createCellStyle();
			titleStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
			titleStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			titleStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
			titleStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
			cell.setCellStyle(titleStyle);
			cell.setCellValue(fields[i]);
		}
		return wb;
	}
	
	/**
	 * 向excel插入数据
	 * @param wb
	 * @param datas
	 * @param fieldsLength
	 */
	private static void inserDateToExcel(XSSFWorkbook wb,List<Map<String,Object>> datas,String[] colmnName,int fieldsLength ) {
		XSSFSheet sheet = wb.getSheet("sheet");
		XSSFCellStyle style = wb.getCellStyleAt((short)0);
		XSSFCell cell = null;
		for (int i = 1; i <= datas.size(); i++) {
			XSSFRow rowt2 = sheet.createRow(i);
			Map<String,Object> bill = datas.get(i - 1);
			for (int j = 0; j < fieldsLength; j++) {
				cell = rowt2.createCell(j, XSSFCell.CELL_TYPE_STRING);
				cell.setCellStyle(style);
				if(bill.get(colmnName[j]) == null)
					cell.setCellValue("");
				else
					cell.setCellValue(bill.get(colmnName[j])+"");
				
			}
		}
	}
	
	/**
	 * 下载excel
	 * @param response
	 * @param wb
	 * @param fileName
	 */
	private static void downExcel(HttpServletResponse response,XSSFWorkbook wb) {
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-disposition","attachment;filename="+DateUtils.getCurDTTM()+".xlsx");
		response.setCharacterEncoding("utf-8");
		OutputStream out = null;
		try {
			out = response.getOutputStream();
			wb.write(out);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static XSSFWorkbook checkUploadExcel(InputStream input,Map<String,Object> msg) {
		XSSFWorkbook xwb = null;
		try {
			xwb = new XSSFWorkbook(input);
		} catch (IOException e) {
			logger.info("excel生成对象失败！");
			msg.put("msg", "请导入07+版本EXCEL文件！");
			return null;
		} 
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet   
//		if (sheet.getPhysicalNumberOfRows() != sheet.getLastRowNum() + 1) {
//			msg.put("msg", "excel文件里有空行！");
//			return null;
//		}
		if (sheet.getLastRowNum() > 1000) {
			msg.put("msg", "excel文件最多1000行！");
			return null;
		}
		return xwb;
	}
	
	
	public static XSSFWorkbook checkUploadExcel(InputStream input,Map<String,Object> msg,int number) {
		XSSFWorkbook xwb = null;
		try {
			xwb = new XSSFWorkbook(input);
		} catch (IOException e) {
			logger.info("excel生成对象失败！");
			msg.put("msg", "请导入07+版本EXCEL文件！");
			return null;
		} 
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet   
		if (sheet.getLastRowNum() > number) {
			msg.put("msg", "excel文件最多"+number+"行！");
			return null;
		}
		
		return xwb;
	}
	
	/**
	 * sym 2016-04-18
	 * @param input
	 * @param msg
	 * @param number
	 * @param minRowNum
	 * @return
	 */
	public static XSSFWorkbook checkUploadExcel(InputStream input,Map<String,Object> msg,int number,int minRowNum) {
		XSSFWorkbook xwb = null;
		try {
			xwb = new XSSFWorkbook(input);
		} catch (IOException e) {
			logger.info("excel生成对象失败！");
			msg.put("msg", "请导入07+版本EXCEL文件！");
			return null;
		} 
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet   
		if (sheet.getLastRowNum() > number) {
			msg.put("msg", "excel文件最多"+number+"行！");
			return null;
		}
		if (sheet.getLastRowNum() < minRowNum) {
			msg.put("msg", "excel文件不能为空！");
			return null;
		}
		return xwb;
	}
	/**
	 * 检查上传最大行数为2000
	 * @param input
	 * @param msg
	 * @return
	 */
	public static XSSFWorkbook checkUploadExcel2000(InputStream input,Map<String,Object> msg) {
		XSSFWorkbook xwb = null;
		try {
			xwb = new XSSFWorkbook(input);
		} catch (IOException e) {
			logger.info("excel生成对象失败！");
			msg.put("msg", "请导入07+版本EXCEL文件！");
			return null;
		} 
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet   
		if (sheet.getLastRowNum() > 2000) {
			msg.put("msg", "excel文件最多2000行！");
			return null;
		}
		return xwb;
	}
	
	
	/**
	 * 检查上传最大行数为200
	 * @param input
	 * @param msg
	 * @return
	 */
	public static XSSFWorkbook checkUploadExcel200(InputStream input,Map<String,Object> msg) {
		XSSFWorkbook xwb = null;
		try {
			xwb = new XSSFWorkbook(input);
		} catch (IOException e) {
			logger.info("excel生成对象失败！");
			msg.put("msg", "请导入07+版本EXCEL文件！");
			return null;
		} 
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet   
		if (sheet.getLastRowNum() > 200) {
			msg.put("msg", "excel文件最多200行！");
			return null;
		}
		return xwb;
	}
	
	//付款通道黑名单导入excel文件
		public static XSSFWorkbook checkPayChanBlackUploadExcel(InputStream input,Map<String,Object> msg) {
			XSSFWorkbook xwb = null;
			try {
				xwb = new XSSFWorkbook(input);
			} catch (IOException e) {
				logger.info("excel生成对象失败！");
				msg.put("msg", "请导入07+版本EXCEL文件！");
				return null;
			} 
			XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet   
			if (sheet.getLastRowNum() > 500) {
				msg.put("msg", "本次导入数据多于500条，请拆分后分别导入。");
				return null;
			}
			return xwb;
		}
		
		//D+1商户批量变更额度导入excel文件
		public static XSSFWorkbook checkDOneMecMagExcel(InputStream input,Map<String,Object> msg) {
			XSSFWorkbook xwb = null;
			try {
				xwb = new XSSFWorkbook(input);
			} catch (IOException e) {
				logger.info("excel生成对象失败！");
				msg.put("msg", "请导入07+版本EXCEL文件！");
				return null;
			} 
			XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet   
			if (sheet.getLastRowNum() > 5000) {
				msg.put("msg", "本次导入数据多于5000条，请拆分后分别导入！");
				return null;
			}
			return xwb;
		}
		
		//银行流水导入excel文件
		public static XSSFWorkbook checkBankStmtCheckExcel(InputStream input,Map<String,Object> msg) {
			XSSFWorkbook xwb = null;
			try {
				xwb = new XSSFWorkbook(input);
			} catch (IOException e) {
				logger.info("excel生成对象失败！");
				msg.put("msg", "请导入07+版本EXCEL文件！");
				return null;
			} 
			XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet   
			if (sheet.getLastRowNum() > 100000) {
				msg.put("msg", "导入流水过多！");
				return null;
			}
			return xwb;
		}
	
	/**
	 * @author wangl
	 * @todo 检查维护通开关批量操作
	 * @date 2015年11月20日 11：19：00
	 */
	public static XSSFWorkbook checkUploadExcelForMtcSw(InputStream input,Map<String,Object> msg) {
		XSSFWorkbook xwb = null;
		try {
			xwb = new XSSFWorkbook(input);
		} catch (IOException e) {
			logger.info("excel生成对象失败！");
			msg.put("msg", "请导入07+版本EXCEL文件！");
			return null;
		} 
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet   
		if (sheet.getLastRowNum() > 10000) {
			msg.put("msg", "excel文件最多10000行！");
			return null;
		}
		if(sheet.getLastRowNum() < 1) {
			msg.put("msg", "数据不存在，请核实！");
			return null;
		}
		return xwb;
	}
	/**
	 * 
	 * @param xwb
	 * @param fields
	 * @param columnName
	 * @param sizeLimit
	 * @param msg
	 * @return
	 */
	
	public static List<Map<String,Object>> readExcel(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false"); 
		logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
		        if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
					msg.put("msg", "excel文件里第"+(i+1)+"行有空列！");
					return null;
				}
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell == null ) {
						msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
						return null;
					}
					// 获取单元格内容，
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						String string = StringUtils.trim(cell.getStringCellValue());
						if (string.length() > sizeLimit[j]) {
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
							return null;
						}
						if(string.trim()==""||"".equals(string.trim())){
							break;
						}
						map.put(columnName[j], string);
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						String string = (val!=null)?String.valueOf(val):"";
						if(string.trim()==""||"".equals(string.trim())){
							break;
						}
						if (string.length() > sizeLimit[j]) {
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
							return null;
						}
						map.put(columnName[j], StringUtils.trim(string));
					}else{
						String string = cell.getStringCellValue();
						if(string.trim()==""||"".equals(string.trim())){
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
							return null;
						}
						msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是文本型！");
						return null;
					}
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					list.add(map);
				}	
			}
		}
		logger.info("！！！------遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {   
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		return list;
	}
	
	public static List<Map<String,Object>> readExcelCheckMnoRe(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg,int rowNum){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false"); 
		logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		Set<String>  mnoset  =new HashSet<String>();
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
		        if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
					msg.put("msg", "excel文件里第"+(i+1)+"行有空列！");
					return null;
				}
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell == null ) {
						msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
						return null;
					}
					// 获取单元格内容，
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						String string = cell.getStringCellValue();
						if (string.length() > sizeLimit[j]) {
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
							return null;
						}
						if(string.trim()==""||"".equals(string.trim())){
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
							return null;
						}
						map.put(columnName[j], string.trim());
						if(j==rowNum-1){
							if(mnoset.contains(string.trim())){
								msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列商编重复！");
								return null;
							}else{
								mnoset.add(string.trim());
							}
						}
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						String string = (val!=null)?String.valueOf(val):"";
						if(string.trim()==""||"".equals(string.trim())){
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
							return null;
						}
						if (string.length() > sizeLimit[j]) {
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
							return null;
						}
						map.put(columnName[j], string.trim());
						if(j==rowNum-1){
							if(mnoset.contains(string.trim())){
								msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列商编重复！");
								return null;
							}else{
								mnoset.add(string.trim());
							}
						}
					}else{
						String string = cell.getStringCellValue();
						if(string.trim()==""||"".equals(string.trim())){
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
							return null;
						}
						msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是文本型！");
						return null;
					}
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					list.add(map);
				}	
			}
		}
		logger.info("！！！------遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {   
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		return list;
	}
	
	
	public static List<Map<String,Object>> readExcelForTzero(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false");
		logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
				if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
					msg.put("msg", "excel文件里第"+(i+1)+"行有空列！");
					return null;
				}
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell == null ) {
						msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
						return null;
					}
					// 获取单元格内容，
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						String string = cell.getStringCellValue();
						if (string.length() > sizeLimit[j]) {
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
							return null;
						}
						if(StringUtils.isNullOrEmpty(string.trim()) || StringUtils.isNullOrEmpty(string.trim())){
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
							return null;
						}
						if(j==1){
							//合法性校验
							//String regEx="^[+]?(([1-9]\\d*[.]?)|(0.))(\\d{0,2})?$";
							String regEx="^\\d*[1-9]\\d*$";
							Pattern p = Pattern.compile(regEx);
							Matcher m = p.matcher(string);
							if(!m.find()){
								msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列应为大于0的整数！");
								return null;
							}
						}
						map.put(columnName[j], string.trim());
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						String string = (val!=null)?String.valueOf(val):"";
						if(StringUtils.isNullOrEmpty(string.trim()) || StringUtils.isNullOrEmpty(string.trim())){
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
							return null;
						}
						if (string.length() > sizeLimit[j]) {
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
							return null;
						}
						if(j==1){
							//合法性校验
							String regEx="^\\d*[1-9]\\d*$";
							Pattern p = Pattern.compile(regEx);
							Matcher m = p.matcher(string);
							if(!m.find()){
								msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列应为大于0的整数！");
								return null;
							}
						}
						map.put(columnName[j], string.trim());
					}else{
						String string = cell.getStringCellValue();
						if(StringUtils.isNullOrEmpty(string.trim()) || StringUtils.isNullOrEmpty(string.trim())){
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
							return null;
						}
						msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是文本型！");
						return null;
					}
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					list.add(map);
				}
			}
		}
		logger.info("！！！------遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		return list;
	}
	
	/** 
	 * @author zhou_jn
	 * @param  xwb
	 * @param  fields
	 * @param  columnName
	 * @param  sizeLimit
	 * @param  msg
	 * @param  
	 * @return List<Map<String,Object>>
	 * @data   2016-01-28
	 */
	@SuppressWarnings("unused")
	public static List<Map<String,Object>> readBankStmtCheckExcel(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false"); 
		logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
//				if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
//					msg.put("msg", "excel文件里第"+(i+1)+"行有空列！");
//					return null;
//				}
				map.put("rowNum", row.getRowNum()+1);
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if(j!=5){
						if (cell == null) {
							msg.put("msg", "第" + (i+1) + "行第" + (j+1) + "列流水有误，请检查！");
							return null;
						}
						// 获取单元格内容，
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							String string = cell.getStringCellValue();
							map.put(columnName[j], string.trim());
						}else if(j==4){
							try {
								DecimalFormat df = new DecimalFormat("0.00");
								Double val = cell.getNumericCellValue();
								String amt = null;
								if (val == null) {
									amt = "";
								} else {
									amt = df.format(cell.getNumericCellValue());
								}
								map.put(columnName[j], amt.trim());
							} catch (Exception e) {
								msg.put("msg", "第" + (i + 1) + "行第" + (j + 1) + "列流水有误，请检查！");
							}
						}else{
							String string = cell.getStringCellValue();
							if(StringUtils.isNullOrEmpty(string.trim()) || StringUtils.isNullOrEmpty(string.trim())){
								msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列流水有误，请检查！");
								return null;
							}else{
								msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列流水有误，请检查！");
								return null;
							}
						}
					}else{
						if (cell == null) {
							map.put(columnName[j], "");
							continue;
						}
						String string = cell.getStringCellValue();
						map.put(columnName[j], string.trim());
						
					}
					
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					list.add(map);
				}	
			}
		}
		logger.info("！！！------遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {   
			msg.put("msg", "请导入银行流水");
			return null;
		}
		msg.put("success", "true");
		return list;
	} 
	
	/** 
	 * Description: 付款通道黑名单专用
	 * @author zhou_jn
	 * @param  @param xwb
	 * @param  @param fields
	 * @param  @param columnName
	 * @param  @param sizeLimit
	 * @param  @param msg
	 * @param  @return
	 * @return List<Map<String,Object>>
	 * @throws 
	 */
	public static List<Map<String,Object>> readPayChanBlackExcel(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false"); 
		logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
//				if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
//					msg.put("msg", "excel文件里第"+(i+1)+"行有空列！");
//					return null;
//				}
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell == null) {
						msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
						return null;
					}
					// 获取单元格内容，
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						String string = cell.getStringCellValue();
						map.put(columnName[j], string.trim());
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						String string = (val!=null)?String.valueOf(val):"";
						map.put(columnName[j], string.trim());
					}else{
						String string = cell.getStringCellValue();
						if(StringUtils.isNullOrEmpty(string.trim()) || StringUtils.isNullOrEmpty(string.trim())){
							map.put(columnName[j], string.trim());
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是文本型！");
							return null;
						}
					}
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					list.add(map);
				}	
			}
		}
		logger.info("！！！------遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {   
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		return list;
	} 
	
	/** 
	 * Description: 批量退票专用
	 * @author fu_bao@suixingpay.com
	 * @param  @param xwb
	 * @param  @param fields
	 * @param  @param columnName
	 * @param  @param sizeLimit
	 * @param  @param msg
	 * @param  @return
	 * @return List<Map<String,Object>>
	 * @throws 
	 */
	public static List<Map<String,Object>> readExcelForRefund(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false");
		logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
				if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
					msg.put("msg", "excel文件里第"+(i+1)+"行有空列！");
					return null;
				}
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell == null || "".equals(cell)||XSSFCell.CELL_TYPE_BLANK == cell.getCellType()) {
						msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
						return null;
					}
					// 获取单元格内容，
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						String string = cell.getStringCellValue();
						if (string.trim().length() > sizeLimit[j]) {
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
							return null;
						}
						if(string.trim()==""||"".equals(string.trim())){
							break;
						}
						map.put(columnName[j], string.trim());
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						if(j==3 || j==1){
							double val=cell.getNumericCellValue();
							int bnk = (int)val;
							String string = bnk+"";
							if(string.trim()==""||"".equals(string.trim())){
								break;
							}
							if (string.length() > sizeLimit[j]) {
								msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
								return null;
							}
							map.put(columnName[j], string.trim());
						}else{
							Double val=cell.getNumericCellValue();
							String string = (val!=null)?String.valueOf(val):"";
							if(string.trim()==""||"".equals(string.trim())){
								break;
							}
							BigDecimal db = new BigDecimal(val+"");
							String v = db.toPlainString();
							Pattern pattern = Pattern.compile("^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,2})?$"); 
							Matcher isNum = pattern.matcher(v);
							if( !isNum.matches() ){
								msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
								return null;
							   }
							if("0.0".equals(string)){
								msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数为0 ！");
								return null;
							}
							if (v.length() > sizeLimit[j]) {
								msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
								return null;
							}
							map.put(columnName[j], v.trim());
						}
					}else{
						String string = cell.getStringCellValue();
						if(string.trim()==""||"".equals(string.trim())){
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
							return null;
						}
						msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是文本型！");
						return null;
					}
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					list.add(map);
				}
			}
		}
		logger.info("！！！------遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		return list;
	}
	
	public static Map<String,List<Map<String,Object>>> readExcelByPts(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
		Map<String,List<Map<String,Object>>> mapReturn=new HashMap<String,List<Map<String,Object>>>();
		List<Map<String,Object>> listRight = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> listError = new ArrayList<Map<String,Object>>();
		msg.put("success", "false"); 
		logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
				String errMsg="";
//		        if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
//					msg.put("msg", "有空列！");
//					return null;
//				}
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					
					if (cell == null ) {
						if(j==2||j==5||j==6){
							continue;
						}
						errMsg+="第"+(j+1)+"列是空值！";
					}else{
						// 获取单元格内容，
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							String string = cell.getStringCellValue();
							if(string!=null){
								string=string.trim();
							}else{
								string="";
							}
							//合法性校验
							String regEx="[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]"; 
							Pattern p = Pattern.compile(regEx); 
							Matcher m = p.matcher(string);
							if(m.find()){
								errMsg+="第"+(j+1)+"列不能包含特殊字符！";
							}
							if(StringUtils.isNullOrEmpty(string.trim())&&(j!=2&&j!=5&&j!=6)){
								errMsg+="第"+(j+1)+"列为空！";
							}
							
							if (string.length() > sizeLimit[j]) {
								errMsg+="第"+(j+1)+"列字数超出范围！";
							}
							if(j==3||j==5||j==7){
								if(string.length()>2){
									errMsg+="第"+(j+1)+"列必须长度不大于2位！";
								}
							}
							if(j==3 ||j==4 ||j==7||j==8||j==13||j==10||j==11||j==12){
								if(!isNumeric(string)){
									errMsg+="第"+(j+1)+"列必须为数字且不能有空格！";
								}
							}
							if(j==5||j==6){
								if(!StringUtils.isNullOrEmpty(string)&&!isNumeric(string)){
									errMsg+="第"+(j+1)+"列有值则必须为数字且不能有空格！";
								}
							}
							
							//1.标识长度与标识取值位数一致
							if(j==13){
								XSSFCell cell12 = row.getCell(12);
								if(null==cell12){
									errMsg+="第13列是空值！";
								}else{
									String str12=cell12.getStringCellValue();
									if(!str12.equals(string.length()+"")){
										errMsg+="标识长度与标识取值位数不一致!";
									}
								}
							}
							//2.机构代码必须为8位数字
							if(j==1){
								if(string.length()!=8|| !isNumeric(string)){
									errMsg+="机构代码必须为8位数字!";
								}
							}
							//3.读取磁道数字只能为1、2、3三个值
							if(j==14 || j==10){
								if(!"1".equals(string) && !"2".equals(string)  && !"3".equals(string)){
									errMsg+="读取磁道数字只能为1、2、3三个值！";
								}
							}
							//4.主账号长度大于标识长度
							if(j==9){
								XSSFCell cell7 = row.getCell(7);
								if(null==cell7){
									errMsg+="第8列是空值！";
								}else{
									String str7=cell7.getStringCellValue();
									if(!str7.equals(string.length()+"")){
										errMsg+="主账号长度大于长度！";
									}
								}
							}
							
							
//							if(string.trim()==""||"".equals(string.trim())){
//								break;
//							}
							map.put(columnName[j], string.trim());
						}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
							Double val=cell.getNumericCellValue();
							String string = (val!=null)?String.valueOf(val):"";
							if(string.trim()==""||"".equals(string.trim())){
								break;
							}
							if (string.length() > sizeLimit[j]) {
								errMsg+="第"+(j+1)+"列字数超出范围！";
							}
							map.put(columnName[j], string.trim());
						}else{
							String string = cell.getStringCellValue();
							if(string.trim()==""||"".equals(string.trim())){
								errMsg+="第"+(j+1)+"列是空值！";
							}
							errMsg+="第"+(j+1)+"列单元格类型不是文本型！";
						}
					}
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					if(!StringUtils.isNullOrEmpty(errMsg)){
						map.put("errMsg", errMsg);
						listError.add(map);
					}else{
						listRight.add(map);
					}
					
				}	
			}
		}
		logger.info("！！！------遍历成功，正确格式的数据有"+listRight.size()+"条数据！");
		logger.info("！！！------遍历成功，错误格式的数据有"+listError.size()+"条数据！");
		if (listRight.size() == 0 && listError.size() == 0) {   
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		mapReturn.put("rightList", listRight);
		mapReturn.put("errorList", listError);
		return mapReturn;
	}
	
	//检查是否是空行，不是空行的话检查当前行是否有空列
	public static boolean isBlankRow(XSSFRow row){
        if(row == null) return true;
        boolean result = true;
        for(int i = row.getFirstCellNum(); i < row.getLastCellNum(); i++){
        	XSSFCell cell = row.getCell(i, XSSFRow.RETURN_BLANK_AS_NULL);
            String value = "";
            if(cell != null){
                switch (cell.getCellType()) {
                case Cell.CELL_TYPE_STRING:
                    value = cell.getStringCellValue();
                    break;
                case Cell.CELL_TYPE_NUMERIC:
                    value = String.valueOf((int) cell.getNumericCellValue());
                    break;
                case Cell.CELL_TYPE_BOOLEAN:
                    value = String.valueOf(cell.getBooleanCellValue());
                    break;
                case Cell.CELL_TYPE_FORMULA:
                    value = String.valueOf(cell.getCellFormula());
                    break;
                //case Cell.CELL_TYPE_BLANK:
                //    break;
                default:
                    break;
                }
                 
                if(!value.trim().equals("")){
                    result = false;
                    break;
                }
            }
        }
         
        return result;
    }
	public static boolean isNumeric(String str)
    {
          Pattern pattern = Pattern.compile("[0-9]*");
          Matcher isNum = pattern.matcher(str);
          if( !isNum.matches() )
          {
                return false;
          }
          return true;
    }
	
	public static List<Map<String,Object>> readExcelAllowBlank(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false"); 
		logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
		        if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
					/*msg.put("msg", "excel文件里第"+(i+1)+"行有空列！");
					return null;*/
				}
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell == null ) {
						/*msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
						return null;*/
						continue;
					}
					// 获取单元格内容，
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						String string = cell.getStringCellValue();
						if (string.length() > sizeLimit[j]) {
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！最多可输入"+sizeLimit[j] + "个。");
							return null;
						}
						if(string.trim()==""||"".equals(string.trim())){
							continue;
						}
						map.put(columnName[j], string.trim());
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						String string = (val!=null)?String.valueOf(val):"";
						if(string.trim()==""||"".equals(string.trim())){
							continue;
						}
						if (string.length() > sizeLimit[j]) {
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！最多可输入"+sizeLimit[j] + "个。");
							return null;
						}
						map.put(columnName[j], string.trim());
					}else if(XSSFCell.CELL_TYPE_BLANK == cell.getCellType()&& j==6){
						continue;
					}else{
						String string = cell.getStringCellValue();
						if(string.trim()==""||"".equals(string.trim())){
							/*msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
							return null;*/
						}
						msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是文本型！");
						return null;
					}
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					list.add(map);
				}	
			}
		}
		logger.info("！！！------遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {   
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		return list;
	}
	
	public static List<Map<String,Object>> readExcelForWeChatReward(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false"); 
		logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
		        if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
					/*msg.put("msg", "excel文件里第"+(i+1)+"行有空列！");
					return null;*/
				}
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell == null ) {
						/*msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
						return null;*/
						continue;
					}
					if(XSSFCell.CELL_TYPE_NUMERIC != cell.getCellType() && j==1){
						msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列不为数字！");
						return null;
					}
					// 获取单元格内容，
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						String string = cell.getStringCellValue();
						if (string.length() > sizeLimit[j]) {
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！最多可输入"+sizeLimit[j] + "个字符。");
							return null;
						}
						if(string.trim()==""||"".equals(string.trim())){
							continue;
						}
						map.put(columnName[j], string.trim());
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						String string = (val!=null)?String.valueOf(val):"";
						if(string.trim()==""||"".equals(string.trim())){
							continue;
						}
						BigDecimal db = new BigDecimal(val+"");
						String v = db.toPlainString();
						Pattern pattern = Pattern.compile("^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,2})?$"); 
						Matcher isNum = pattern.matcher(v);
						if( !isNum.matches() ){
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
							return null;
						   }
						if (string.length() > sizeLimit[j]) {
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！最多可输入"+sizeLimit[j] + "个字符。");
							return null;
						}
						map.put(columnName[j], string.trim());
					}else if(XSSFCell.CELL_TYPE_BLANK == cell.getCellType()&& j==6){
						continue;
					}else{
						String string = cell.getStringCellValue();
						if(string.trim()==""||"".equals(string.trim())){
							/*msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
							return null;*/
						}
						msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是文本型！");
						return null;
					}
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					list.add(map);
				}	
			}
		}
		logger.info("！！！------遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {   
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		return list;
	}
	
	
	/**
	 * @author wangl
	 * @todo 维护通批量开关读取excel
	 * @date 2015-11-20 11:47:20
	 */
	public static List<Map<String,Object>> readExcelForMtcSw(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false"); 
		logger.info("文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			if(null ==row){
				msg.put("msg", "excel文件里第"+(i+1)+"行是空行！");
				return null;
			}
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
				//遍历当前行的每列
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell == null ) {
						msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
						return null;
					}
					// 获取单元格内容，
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						String string = cell.getStringCellValue().trim();
						if (string.length() > sizeLimit[j]) {
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
							return null;
						}
						if(StringUtils.isNullOrEmpty(string)){
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
							return null;
						}
						map.put(columnName[j], string.trim());
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						String string = (val!=null)?String.valueOf(val):"";
							if (string.length() > sizeLimit[j]) {
								msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
								return null;
							}
							if(StringUtils.isNullOrEmpty(string)){
								msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
								return null;
							}
					
						
						map.put(columnName[j], string.trim());
					}else{
						String string = cell.getStringCellValue();
						if(StringUtils.isNullOrEmpty(string)){
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
							return null;
						}
						msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是文本型！");
						return null;
					}
				}
				if(map!=null &&!map.isEmpty()){
					list.add(map);
				}	
			}
		}
		logger.info("遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {   
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		return list;
	}
	
	/**
	 * @todo 处理单元内容格式   暂时没有使用
	 */
/*	private static String parseExcel(Cell cell) {
		String result = new String();
		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_NUMERIC:// 数字类型
			if (HSSFDateUtil.isCellDateFormatted(cell)) {// 处理日期格式、时间格式
				SimpleDateFormat sdf = null;
				if (cell.getCellStyle().getDataFormat() == HSSFDataFormat.getBuiltinFormat("h:mm")) {
					sdf = new SimpleDateFormat("HH:mm");
				} else {// 日期
					sdf = new SimpleDateFormat("yyyy-MM-dd");
				}
				Date date = cell.getDateCellValue();
				result = sdf.format(date);
			} else if (cell.getCellStyle().getDataFormat() == 58) {
				// 处理自定义日期格式：m月d日(通过判断单元格的格式id解决，id的值是58)
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				double value = cell.getNumericCellValue();
				Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(value);
				result = sdf.format(date);
			} else {
				double value = cell.getNumericCellValue();
				CellStyle style = cell.getCellStyle();
				DecimalFormat format = new DecimalFormat();
				String temp = style.getDataFormatString();
				// 单元格设置成常规
				if (temp.equals("General")) {
					format.applyPattern("#");
				}
				result = format.format(value).replace(",", "");
				
				Double val=cell.getNumericCellValue();
				result = (val!=null)?String.valueOf(val):"";
			}
			break;
		case HSSFCell.CELL_TYPE_STRING:// String类型
			result = cell.getRichStringCellValue().toString();
			break;
		case HSSFCell.CELL_TYPE_BLANK:
			result = "";
		default:
			result = "";
			break;
		}
		return result;
	}*/
	
	/** 
	 * Description: 付款操作批量导入付款通道
	 * @author zhou_jn
	 * @param  xwb
	 * @param  fields
	 * @param  columnName
	 * @param  sizeLimit
	 * @param  msg
	 * @return List<Map<String,Object>>
	 * @throws 
	 */
	public static List<Map<String,Object>> importChgChanExcel(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false"); 
		logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
				map.put("rowNum", row.getRowNum()+1);
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell == null || "".equals(cell)) {
						msg.put("msg", "第"+(i+1)+"行缺少必填项,导入失败！");
						return null;
					}
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						String string = cell.getStringCellValue();
						map.put(columnName[j], string.trim());
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						String string = (val!=null)?String.valueOf(val):"";
						map.put(columnName[j], string.trim());
					}else{
						String string = cell.getStringCellValue();
						if(string.trim()==""||"".equals(string.trim())){
							msg.put("msg", "第"+(i+1)+"行缺少必填项,导入失败");
							return null;
						}
						msg.put("msg", "第"+(i+1)+"行数据格式不正确！");
						return null;
					}						
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					list.add(map);
				}	
			}
		}
		logger.info("！！！------遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {   
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		return list;
	}
	
	/** 
	 * Description: 自动即时T+1结算批量导入
	 * @author zhou_jn 2016-02-23
	 * @throws 
	 */
	public static List<Map<String,Object>> readAutoImmeT1SesExcel(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false"); 
		logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
				map.put("rowNum", row.getRowNum()+1);
				cell = row.getCell(0);
				if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
					String string = cell.getStringCellValue();
					map.put(columnName[0], string.trim());
				}else{
					msg.put("msg", "第"+(i+1)+"行数据格式不正确！");
					return null;
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					list.add(map);
				}	
			}
		}
		logger.info("！！！------遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {   
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		return list;
	}
		public static List<Map<String,Object>> readExcelApplyAudit(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg,String type){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false"); 
		logger.info("文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		int size = 1;
		if(Contant.zftApplyStatus.reject.toString().equals(type)){
			size = 2;
		}
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
				if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
					msg.put("msg", "excel文件里第"+(i+1)+"行有空列！");
					return null;
				}
				for (int j = 0; j < size; j++) {
					cell = row.getCell(j);
					if (cell == null ) {
						msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
						return null;
					}
					// 获取单元格内容，
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						String string = cell.getStringCellValue();
						if (string.length() > sizeLimit[j]) {
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
							return null;
						}
						if(Contant.zftApplyStatus.reject.toString().equals(type) && j==1){
							if(string.trim()==""||"".equals(string.trim())){
								msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
								return null;
							}
						}
						map.put(columnName[j], string.trim());
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						String string = (val!=null)?String.valueOf(val):"";
						if(Contant.zftApplyStatus.reject.toString().equals(type) && j==1){
							if(string.trim()==""||"".equals(string.trim())){
								msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
								return null;
							}
						}
						if (string.length() > sizeLimit[j]) {
							msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
							return null;
						}
						map.put(columnName[j], string.trim());
					}else{
						String string = cell.getStringCellValue();
						if(Contant.zftApplyStatus.reject.toString().equals(type) && j==1){
							if(string.trim()==""||"".equals(string.trim())){
								msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
								return null;
							}
						}
						msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是文本型！");
						return null;
					}
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					list.add(map);
				}	
			}
		}
		logger.info("遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {   
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		return list;
	}
	
	
	public static List<Map<String,Object>> readExcelForBnkInfo(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,List<Map<String,Object>> infos,
			Map<String,Object> msg,List<BnkRetPo> errors,List<Map<String,Object>> list){
		msg.put("success", "false"); 
		logger.info("#批量导入操作银行行别信息#文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
				Map<String, Object> info = null;
			    /*if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
			    	msg.put("msg", "excel文件里第"+(i+1)+"行有空列！");
					return null;
				}*/
			    String code = "";
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					info = new HashMap<String, Object>();
					if (cell == null ) {
						info.put("cdeCd", code);
						info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！");
						errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！"));
						break;
					}
					// 获取单元格内容
					String string = "";
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						string = StringUtils.trim(cell.getStringCellValue());
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						java.text.DecimalFormat myformat=new java.text.DecimalFormat("0");
						string = (val!=null)?myformat.format(val):"";
					}else{
						string = StringUtils.trim(cell.getStringCellValue());
					}
					if(j==0){
						code = string.trim();
					}
					if(string.trim()==""||"".equals(string.trim())){
						info.put("cdeCd", code);
						info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！");
						errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！"));
						break;
					}
					if (string.length() > sizeLimit[j]) {
						info.put("cdeCd", code);
						info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！");
						errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！"));
						break;
					}
					if(j==0){
						if (string.length() != sizeLimit[j]) {
							info.put("cdeCd", code);
							info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！");
							errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！"));
							break;
						}
						if(!isNumeric(string)){
							info.put("cdeCd", code);
							info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！");
							errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！"));
							break;
						}
					}
					if(j==3){
						if(!"有效".equals(string) && !"失效".equals(string)){
							info.put("cdeCd", code);
							info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列银行状态不存在！");
							errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列银行状态不存在！"));
							break;
						}
					}
					map.put(columnName[j], string.trim());	
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()&&info.isEmpty()){
					list.add(map);
				}	
				if(info!=null&&info.size()>0&&!info.isEmpty()){
					infos.add(info);
				}
			}
		}
		logger.info("#批量导入操作银行行别信息#遍历成功，有"+list.size()+"条数据！");
		msg.put("success", "true");
		return list;
	}
	
	public static List<Map<String,Object>> readExcelForBnkInfoUpdate(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,List<Map<String,Object>> infos,
			Map<String,Object> msg,List<BnkRetPo> errors,List<Map<String,Object>> list){
		msg.put("success", "false"); 
		logger.info("#批量导入操作银行行别信息#文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
				Map<String, Object> info = null;
			    /*if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
			    	msg.put("msg", "excel文件里第"+(i+1)+"行有空列！");
					return null;
				}*/
			    String code = "";
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					info = new HashMap<String, Object>();
					if (cell == null ) {
						info.put("cdeCd", code);
						info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！");
						errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！"));
						break;
					}
					// 获取单元格内容
					String string = "";
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						string = StringUtils.trim(cell.getStringCellValue());
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						string = (val!=null)?String.valueOf(val.intValue()):"";
					}else{
						string = StringUtils.trim(cell.getStringCellValue());
					}
					if(j==0){
						code = string.trim();
					}
					if(string.trim()==""||"".equals(string.trim())){
						info.put("cdeCd", code);
						info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！");
						errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！"));
						break;
					}
					if (string.length() > sizeLimit[j]) {
						info.put("cdeCd", code);
						info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！");
						errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！"));
						break;
					}
					if(j==0 || j==1){
						if (string.length() != sizeLimit[j]) {
							info.put("cdeCd", code);
							info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！");
							errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！"));
							break;
						}
						if(!isNumeric(string)){
							info.put("cdeCd", code);
							info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！");
							errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！"));
							break;
						}
					}
					if(j==4){
						if(!"有效".equals(string) && !"失效".equals(string)){
							info.put("cdeCd", code);
							info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列银行状态不存在！");
							errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列银行状态不存在！"));
							break;
						}
					}
					map.put(columnName[j], string.trim());	
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()&&info.isEmpty()){
					list.add(map);
				}	
				if(info!=null&&info.size()>0&&!info.isEmpty()){
					infos.add(info);
				}
			}
		}
		logger.info("#批量导入操作银行行别信息#遍历成功，有"+list.size()+"条数据！");
		msg.put("success", "true");
		return list;
	}
	
	public static List<Map<String,Object>> readExcelForBnkLinkInfo(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,List<Map<String,Object>> infos,
			Map<String,Object> msg,List<BnkRetPo> errors,List<Map<String,Object>> list){
		msg.put("success", "false"); 
		logger.info("#批量导入操作联行行号信息#文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
				Map<String, Object> info = null;
			    /*if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
			    	msg.put("msg", "excel文件里第"+(i+1)+"行有空列！");
					return null;
				}*/
			    String code = "";
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					info = new HashMap<String, Object>();
					if (cell == null ) {
						info.put("cdeCd", code);
						info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！");
						errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！"));
						break;
					}
					// 获取单元格内容
					String string = "";
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						string = StringUtils.trim(cell.getStringCellValue());
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						string = (val!=null)?String.valueOf(val):"";
					}else{
						string = StringUtils.trim(cell.getStringCellValue());
					}
					if(j==0){
						code = string.trim();
					}
					if(string.trim()==""||"".equals(string.trim())){
						info.put("cdeCd", code);
						info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！");
						errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！"));
						break;
					}
					if (string.length() > sizeLimit[j]) {
						info.put("cdeCd", code);
						info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！");
						errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！"));
						break;
					}
					if(j==0){
						if (string.length() != sizeLimit[j]) {
							info.put("cdeCd", code);
							info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！");
							errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！"));
							break;
						}
						if(!isNumeric(string)){
							info.put("cdeCd", code);
							info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！");
							errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！"));
							break;
						}
					}
					if(j==5){
						if(!"有效".equals(string) && !"失效".equals(string)){
							info.put("cdeCd", code);
							info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列银行状态不存在！");
							errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列银行状态不存在！"));
							break;
						}
					}
					map.put(columnName[j], string.trim());	
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()&&info.isEmpty()){
					list.add(map);
				}	
				if(info!=null&&info.size()>0&&!info.isEmpty()){
					infos.add(info);
				}
			}
		}
		logger.info("#批量导入操作联行行号信息#遍历成功，有"+list.size()+"条数据！");
		msg.put("success", "true");
		return list;
	}
	
	public static List<Map<String,Object>> readExcelForBnkLinkInfoUpdate(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,List<Map<String,Object>> infos,
			Map<String,Object> msg,List<BnkRetPo> errors,List<Map<String,Object>> list){
		msg.put("success", "false"); 
		logger.info("#批量导入操作联行行号信息#文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
				Map<String, Object> info = null;
			    /*if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
			    	msg.put("msg", "excel文件里第"+(i+1)+"行有空列！");
					return null;
				}*/
			    String code = "";
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					info = new HashMap<String, Object>();
					if (cell == null ) {
						info.put("cdeCd", code);
						info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！");
						errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！"));
						break;
					}
					// 获取单元格内容
					String string = "";
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						string = StringUtils.trim(cell.getStringCellValue());
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						string = (val!=null)?String.valueOf(val):"";
					}else{
						string = StringUtils.trim(cell.getStringCellValue());
					}
					if(j==0){
						code = string.trim();
					}
					if(string.trim()==""||"".equals(string.trim())){
						info.put("cdeCd", code);
						info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！");
						errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列缺少必填项！"));
						break;
					}
					if (string.length() > sizeLimit[j]) {
						info.put("cdeCd", code);
						info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！");
						errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！"));
						break;
					}
					if(j==0 || j==1){
						if (string.length() != sizeLimit[j]) {
							info.put("cdeCd", code);
							info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！");
							errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！"));
							break;
						}
						if(!isNumeric(string)){
							info.put("cdeCd", code);
							info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！");
							errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列格式错误！"));
							break;
						}
					}
					if(j==6){
						if(!"有效".equals(string) && !"失效".equals(string)){
							info.put("cdeCd", code);
							info.put("failReason", "excel文件里第"+(i+1)+"行第"+(j+1)+"列银行状态不存在！");
							errors.add(new BnkRetPo(code,"excel文件里第"+(i+1)+"行第"+(j+1)+"列银行状态不存在！"));
							break;
						}
					}
					map.put(columnName[j], string.trim());	
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()&&info.isEmpty()){
					list.add(map);
				}	
				if(info!=null&&info.size()>0&&!info.isEmpty()){
					infos.add(info);
				}
			}
		}
		logger.info("#批量导入操作联行行号信息#遍历成功，有"+list.size()+"条数据！");
		msg.put("success", "true");
		return list;
	}
	
	
/**
* @Title: readExcelForPromot 
* @author:qincong
* @Description:解决商户编号太长被当成科学计数法问题
* @param @param xwb
* @param @param fields
* @param @param columnName
* @param @param sizeLimit
* @param @param msg
* @param @return    设定文件 
* @return List<Map<String,Object>>    返回类型 
* @throws
 */
public static List<Map<String,Object>> readExcelForPromot(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	msg.put("success", "false"); 
	logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
	XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
	XSSFRow row = null;
	XSSFCell cell = null;
	Map<String, Object> map = null;
	//循环输出表格中的内容
	for (int i = 0; i <= sheet.getLastRowNum(); i++) {
		row = sheet.getRow(i);
		//防止excel文件有空行
		if(isBlankRow(row))
			continue;
		//获得表头内容，并检查 
		if (i == 0) {              
			for (int j = 0; j < sizeLimit.length; j++) {
				cell = row.getCell(j);
				if (cell != null) {
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						if (!cell.getStringCellValue().equals(fields[j])) {
							msg.put("msg", "excel文件表头信息不符！");
							return null;
						}
					}else{
						msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
						return null;
					}
				}else {
					msg.put("msg", "excel文件表头信息缺少！");
					return null;
				}
			}
		}else {
			map = new HashMap<String, Object>();
	       /* if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
				msg.put("msg", "excel文件里第"+(i+1)+"行有空列！");
				return null;
			}*/
			for (int j = 0; j < sizeLimit.length; j++) {
				cell = row.getCell(j);
				if (cell == null ) {
					msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
					return null;
				}
				// 获取单元格内容，
				if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
					String string = cell.getStringCellValue();
					if (string.length() > sizeLimit[j]) {
						msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
						return null;
					}
					if(string.trim()==""||"".equals(string.trim())){
						break;
					}
					map.put(columnName[j], string.trim());
				}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
					 DecimalFormat df = new DecimalFormat("#");//转换成整型
					String string = (df.format(cell.getNumericCellValue())!=null)?df.format(cell.getNumericCellValue()):"";
					if(string.trim()==""||"".equals(string.trim())){
						break;
					}
					if (string.length() > sizeLimit[j]) {
						msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
						return null;
					}
					map.put(columnName[j], string.trim());
				}else{
					String string = cell.getStringCellValue();
					if(string.trim()==""||"".equals(string.trim())){
						msg.put("msg", "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
						return null;
					}
					msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是文本型！");
					return null;
				}
			}
			if(map!=null&&map.size()>0&&!map.isEmpty()){
				list.add(map);
			}	
		}
	}
	logger.info("！！！------遍历成功，有"+list.size()+"条数据！");
	if (list.size() == 0) {   
		msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
		return null;
	}
	msg.put("success", "true");
	return list;
}

	/**
	 * Description: 批量导入修改代理商商户上限
	 * @param xwb
	 * @param fields
	 * @param columnName
	 * @param sizeLimit
	 * @param msg
	 * @return
	 */
	public static List<Map<String,Object>> importPosMdMecLimitExcel(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false"); 
		logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row)){
				msg.put("msg", "文件存在空行！");
				return null;
			}
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
				map.put("rowNum", row.getRowNum()+1);
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell == null || "".equals(cell)) {
						msg.put("msg", "第"+(i+1)+"行缺少必填项,导入失败！");
						return null;
					}
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						String string = cell.getStringCellValue();
						if(string.trim().length() > sizeLimit[j]){
							msg.put("msg", "第"+(i+1)+"行:"+string.trim()+"字段长度超出限制");
							return null;
						}
						if(string.trim().trim()==""||"".equals(string.trim())){
							msg.put("msg", "第"+(i+1)+"行："+string.trim()+"缺少必填项,导入失败");
							return null;
						}
						map.put(columnName[j], string.trim());
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						String string = (val!=null)?String.valueOf(val):"";
						map.put(columnName[j], string.trim());
					}else{
						String string = cell.getStringCellValue();
						if(string.trim()==""||"".equals(string.trim())){
							msg.put("msg", "第"+(i+1)+"行缺少必填项,导入失败");
							return null;
						}
						msg.put("msg", "第"+(i+1)+"行数据格式不正确！");
						return null;
					}						
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					list.add(map);
				}	
			}
		}
		logger.info("！！！------遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {   
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		return list;
	}
	
	/** 
	 * Description: 批量导入修改D+1商户免费额度
	 * @author zhou_jn
	 * @param  xwb
	 * @param  fields
	 * @param  columnName
	 * @param  sizeLimit
	 * @param  msg
	 * @return List<Map<String,Object>>
	 * @throws 
	 */
	public static List<Map<String,Object>> importDOneMecInfoUpdExcel(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false"); 
		logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				continue;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								msg.put("msg", "excel文件表头信息不符！");
								return null;
							}
						}else{
							msg.put("msg", "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
							return null;
						}
					}else {
						msg.put("msg", "excel文件表头信息缺少！");
						return null;
					}
				}
			}else {
				map = new HashMap<String, Object>();
				map.put("rowNum", row.getRowNum()+1);
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell == null || "".equals(cell)) {
						msg.put("msg", "第"+(i+1)+"行缺少必填项,导入失败！");
						return null;
					}
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						String string = cell.getStringCellValue();
						if(string.trim().length() > sizeLimit[j]){
							msg.put("msg", "第"+(i+1)+"行:"+string.trim()+"字段长度超出限制");
							return null;
						}
						if(string.trim().trim()==""||"".equals(string.trim())){
							msg.put("msg", "第"+(i+1)+"行："+string.trim()+"缺少必填项,导入失败");
							return null;
						}
						map.put(columnName[j], string.trim());
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						String string = (val!=null)?String.valueOf(val):"";
						map.put(columnName[j], string.trim());
					}else{
						String string = cell.getStringCellValue();
						if(string.trim()==""||"".equals(string.trim())){
							msg.put("msg", "第"+(i+1)+"行缺少必填项,导入失败");
							return null;
						}
						msg.put("msg", "第"+(i+1)+"行数据格式不正确！");
						return null;
					}						
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					list.add(map);
				}	
			}
		}
		logger.info("！！！------遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {   
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		return list;
	}
	
	
	public static List<Map<String,Object>> readExcelForUpdateMecInfoExcel(XSSFWorkbook xwb,String[] fields,String[] columnName, int[] sizeLimit,Map<String,Object> msg){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		msg.put("success", "false"); 
		logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
		XSSFSheet sheet = xwb.getSheetAt(0);// 获得该工作区的第一个sheet 
		XSSFRow row = null;
		XSSFCell cell = null;
		Map<String, Object> map = null;
		
		StringBuffer sb = new StringBuffer();
		
		//循环输出表格中的内容
		for (int i = 0; i <= sheet.getLastRowNum(); i++) {
			row = sheet.getRow(i);
			//防止excel文件有空行
			if(isBlankRow(row))
				break;
			//获得表头内容，并检查 
			if (i == 0) {              
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell != null) {
						if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
							if (!cell.getStringCellValue().equals(fields[j])) {
								sb.append("excel文件表头信息不符！");
							}
						}else{
							sb.append( "第"+(i+1)+"行第"+(j+1)+"列单元格类型不是字符型！");
						}
					}else {
						sb.append( "excel文件表头信息缺少！");
					}
				}
			}else {
				map = new HashMap<String, Object>();
		        if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
		        	sb.append( "excel文件里第"+(i+1)+"行有空列！");
				}
		        String date = null;
				for (int j = 0; j < sizeLimit.length; j++) {
					cell = row.getCell(j);
					if (cell == null ) {
						sb.append( "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
						break;
					}
					// 获取单元格内容，
					if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
						String string = StringUtils.trim(cell.getStringCellValue());
						if (string.equals("NOCHANGE")){
							map.put(columnName[j], string);
							continue;
						}
						if((j == 5 || j == 6) && string.length() != sizeLimit[j]) {
							sb.append( "excel文件里第"+(i+1)+"行第"+(j+1)+"列日期格式长度不对！");
						}
						if((j == 5 || j == 6) && !isValidDate(string)) {
							sb.append( "excel文件里第"+(i+1)+"行第"+(j+1)+"列日期不是一个有效日期！");
						}
						if(j == 13 && (string.length() != sizeLimit[j] || !isNum(string))) {
							sb.append( "excel文件里第"+(i+1)+"行第"+(j+1)+"列值不为纯数字或长度不够！");
						}
						if(j == 5) {
							date = string;
						}
						if(j == 6 && !compareDate(date, string)) {
							sb.append( "excel文件里第"+(i+1)+"行第"+(j+1)+"列值小于开始日期！");
						}
						if (string.length() > sizeLimit[j]) {
							sb.append( "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
						}
						if(string.trim()==""||"".equals(string.trim())){
							break;
						}
						map.put(columnName[j], string);
					}else if(XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()){
						Double val=cell.getNumericCellValue();
						String string = (val!=null)?String.valueOf(val):"";
						if(string.trim()==""||"".equals(string.trim())){
							break;
						}
						if((j == 5 || j == 6) && string.length() != sizeLimit[j]) {
							sb.append( "excel文件里第"+(i+1)+"行第"+(j+1)+"列日期格式长度不对！");
						}
						if((j == 5 || j == 6) && !isValidDate(string)) {
							sb.append( "excel文件里第"+(i+1)+"行第"+(j+1)+"列日期不是一个有效日期！");
						}
						if(j == 13 && string.length() != sizeLimit[j] && !isNum(string)) {
							sb.append( "excel文件里第"+(i+1)+"行第"+(j+1)+"列值不为纯数字或长度不够！");
						}
						if (string.length() > sizeLimit[j]) {
							sb.append( "excel文件里第"+(i+1)+"行第"+(j+1)+"列字数超出范围！");
						}
						map.put(columnName[j], StringUtils.trim(string));
					}else{
						String string = cell.getStringCellValue();
						if(string.trim()==""||"".equals(string.trim())){
							sb.append( "excel文件里第"+(i+1)+"行第"+(j+1)+"列是空值！");
						}else{
							sb.append( "excel文件里第"+(i+1)+"行第"+(j+1)+"列单元格类型不是文本型！");
						}
					}
				}
				if(map!=null&&map.size()>0&&!map.isEmpty()){
					list.add(map);
				}
			}
		}
		
		if(!StringUtils.isNullOrEmpty(sb.toString())) {
			logger.info("excel存在错误数据");
			msg.put("msg", sb.toString());
			return null;
		}
		
		logger.info("！！！------遍历成功，有"+list.size()+"条数据！");
		if (list.size() == 0) {   
			msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
			return null;
		}
		msg.put("success", "true");
		return list;
	}
	
	public static boolean isValidDate(String str) {
		 boolean convertSuccess=true;
		 // 指定日期格式为四位年/两位月份/两位日期，注意yyyy/MM/dd区分大小写；
		 SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		 try {
		 // 设置lenient为false. 否则SimpleDateFormat会比较宽松地验证日期，比如2007/02/29会被接受，并转换成2007/03/01
			 format.setLenient(false);
			 format.parse(str);
		 } catch (Exception e) {
		     // e.printStackTrace();
			 // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
		     convertSuccess=false;
		 } 
		 return convertSuccess;
	}
	
	public static boolean isNum(String str){
        Pattern pattern = Pattern.compile("^-?[0-9]+");
        if(pattern.matcher(str).matches()){
            //数字
            return true;
        } else {
            //非数字
            return false;
        }
    }
	
	public static boolean compareDate(String date1, String date2) {
        DateFormat df = new SimpleDateFormat("yyyyMMdd");
        try {
            Date dt1 = df.parse(date1);
            Date dt2 = df.parse(date2);
            if (dt1.getTime() < dt2.getTime()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return false;
    }

	public static void readExcelForTSesBinUseful(XSSFWorkbook xwb, String[] fields, String[] columnName,
			int[] sizeLimit, List<Map<String, Object>> reList, Map<String, Object> map, List<BnkRetPo> errors,
			List<Map<String, Object>> dataMaps) {
		// TODO Auto-generated method stub
		
	}

	

}
