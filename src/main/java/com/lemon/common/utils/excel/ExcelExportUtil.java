/**
 * Description： EXCEL导出工具类
 * author: xingxin
 * 使用步骤：
 *	//1.根据excelId获取excel模版(exceltemplate文件夹下放置excel模版文件,在excel_config/xmlmodel/excel-template.xml配置)
 *		ExcelTemplateType excelTemplate = ExcelXmlModelFactory.getInstance().getExcelInfo("PAY_FILE_BY_PAGE");
 *	//2.创建excel工具对象
 *		ExcelExportUtil excelExport = new ExcelExportUtil(excelTemplate);
 *	//3.根据模版创建HSSFWorkbook对象
 *		excelExport.createWorkBookByTemplate();
 *	//4.写数据(配置的excelColId名和map里的key对应)
 *		List<Map<String,Object>> items = ...;
 *		excelExport.writeQueryResult(items);
 *	//5.生成excel文件
 *		excelExport.genExcel(filePath + fileName);
 */
package com.lemon.common.utils.excel;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.lemon.common.utils.DateTimeUtil;
import com.lemon.common.utils.FileUtil;
import com.lemon.common.utils.excel.constant.ExcelConstant;
import com.lemon.common.utils.excel.dto.ExcelColType;
import com.lemon.common.utils.excel.dto.ExcelTemplateType;
import com.lemon.common.utils.excel.factory.ExcelXmlModelFactory;
import com.lemon.common.utils.excel.helper.ExcelHelper;

public class ExcelExportUtil {

	private static final String EXCEL_DATE_FORMAT = "yyyy-MM-dd";

	private ExcelTemplateType excelTemplate;

	private InputStream inputStream = null;
	
	protected OutputStream outputStream;

	private HSSFWorkbook wb = null;

	private String excelName = "";

	private HSSFSheet templateSheet = null;//模版sheet
	
	private int currentSheetIndex = 0;//当前sheet索引
	
	private int currentSheetRow = 0;//当前sheet数据行索引
	
	private int maxDataNum = 60000;//每个sheet页最大数据行数
	
	/**
	 * 构造方法：根据模版excelId创建一个excel导出对象
	 * @author xingx
	 * @Date: 2014年7月10日
	 * @param ExcelTemplateType excelTemplate
	 */
	public ExcelExportUtil(String excelId) {
		// 获取excel模版
		ExcelTemplateType excelTemplate = ExcelXmlModelFactory.getInstance().getExcelInfo(excelId);
		this.excelTemplate = excelTemplate;
	}

	/**
	 * 构造方法：根据模版对象ExcelTemplateType创建一个excel导出对象
	 * @author xingx
	 * @param ExcelTemplateType excelTemplate
	 */
	public ExcelExportUtil(ExcelTemplateType excelTemplate) {
		this.excelTemplate = excelTemplate;
	}

	/**
	 * 第一步：根据模版创建HSSFWorkbook对象
	 * @author xingx
	 * @date: 2014年7月8日 下午1:54:58
	 * @return void
	 * @throws Exception
	 */
	public void createWorkBookByTemplate() throws Exception {
		// 写数据开始行索引
		currentSheetRow = excelTemplate.getExcelHead().getHeadRowIndex();
		// excel文件名称
		if (excelTemplate.getExcelName() != null) {
			//excelName = new String(excelTemplate.getExcelName().getBytes("ISO-8859-1"),"UTF-8");
			excelName = excelTemplate.getExcelName();
		}
		// excel模版文件路径
		String exelFileName = excelTemplate.getExcelFileName();
		if (exelFileName != null && !"".equals(exelFileName)) {
			exelFileName = ExcelConstant.EXCEL_TEMPLATE_PATH + exelFileName;
			inputStream = FileUtil.getFileStream(exelFileName);
		}
		if (inputStream != null) {// 按照excel模版文件创建Workbook对象
			this.wb = new HSSFWorkbook(inputStream);
			this.templateSheet = this.wb.getSheetAt(0);
		} else {// 不存在excel模版文件情况，完全按照模版配置处理
			this.wb = new HSSFWorkbook();
			this.templateSheet = this.wb.createSheet(excelName);// 创建一个Excel的Sheet
			// 根据配置的excelColWidth设置列宽
			this.initColumnWidth(this.templateSheet);
			// 根据配置写标题行(可选步骤,不存在excel模版文件时用此方法)
			this.createTitleRow(this.templateSheet);
		}
		this.wb.cloneSheet(0);//复制sheet
		this.wb.setSheetName(1, this.templateSheet.getSheetName() + "(1)" );
		this.currentSheetIndex = 1;
	}

	/**
	 * 根据配置写标题行(可选步骤,不存在excel模版文件时用此方法) xingx 2014-07-08
	 */
	private void createTitleRow(HSSFSheet sheet) throws Exception {
		int headIndex = excelTemplate.getExcelHead().getHeadRowIndex();
		List<ExcelColType> excelColList = excelTemplate.getExcelHead()
				.getExcelColList();
		if (headIndex > 0) {
			int titilRowIndex = headIndex - 1;
			for (int i = 0; i < excelColList.size(); i++) {
				ExcelColType excelCol = (ExcelColType) excelColList.get(i);
				Integer colIndex = excelCol.getExcelColIndex();
				if (colIndex >= 0) {
					HSSFCell cell = null;
					HSSFRow row = sheet.getRow(titilRowIndex);
					if (row == null) {
						row = sheet.createRow(titilRowIndex);
					}
					cell = row.getCell(colIndex);
					if (cell == null) {
						cell = row.createCell(colIndex);
						cell.setCellValue(excelCol.getExcelColName());
					}
				}
			}
		}
	}

	/**
	 * 第二步：把查出的数据List<Map<String,Object>> 写到wb的Sheet页里
	 * @author xingx
	 * @param List <Map<String,Object>> queryResult
	 * @return void
	 * @throws Exception
	 */
	public void writeQueryResult(List<Map<String, Object>> queryResult)throws Exception {
		HSSFSheet sheet = this.getCurrentSheet();
		writeQueryResult(sheet, queryResult);
	}

	private void writeQueryResult(HSSFSheet sheet, List<Map<String, Object>> queryResult) throws Exception {
		Map<Integer, HSSFCell> excelColMap = getCellTemplateMap(this.templateSheet, excelTemplate.getExcelHead().getHeadRowIndex(), excelTemplate);	
		List<ExcelColType> excelColList = this.excelTemplate.getExcelHead().getExcelColList();
		int headIndex = excelTemplate.getExcelHead().getHeadRowIndex();
		HSSFSheet tmpSheet = sheet;
		for (int i = 0; i < queryResult.size(); i++) {
			if((currentSheetRow - headIndex + 1) > this.maxDataNum){//若大于最大记录数，则重新生成sheet
				this.currentSheetIndex++;			
				this.currentSheetRow = headIndex;
				tmpSheet = this.wb.cloneSheet(0);
				this.wb.setSheetName(this.currentSheetIndex, this.templateSheet.getSheetName()+"("+this.currentSheetIndex+")");
			}
			this.insertRowByTemplate(tmpSheet, this.currentSheetRow, excelColMap);
			for (int j = 0; j < excelColList.size(); j++) {
				ExcelColType excelCol = excelColList.get(j);
				String attrValue = getExcelAttrStr(excelCol, getExcelAttrValue(excelCol, i, queryResult));
				ExcelHelper.writeCell(tmpSheet, this.currentSheetRow, excelCol.getExcelColIndex().shortValue(), attrValue);
			}
			this.currentSheetRow++;
			if(this.currentSheetIndex>100){
				//throw new RuntimeException("导出excel超过了"+this.currentSheetIndex+"sheet页");
				break;
			}
		}
	}
	
	/**
	 * 第三步：生成excel文件
	 * @author xingx
	 * @param String fileName
	 * @return File
	 * @throws Exception
	 */
	public File genExcel(String fileName) throws Exception {
		File file = new File(fileName);
		this.genExcel(file);
		return file;
	}

	public void genExcel(File file) throws Exception {
		try {
			outputStream = new FileOutputStream(file);
			this.wb.removeSheetAt(0);
			this.wb.write(outputStream);
		} catch (Exception e) {
			throw e;
		} finally {
			if (inputStream != null) {
				inputStream.close();
				inputStream = null;
			}
			if (outputStream != null) {
				outputStream.close();
				outputStream = null;
			}
		}
	}
	
	/**
	 * 在模版基础之上追加标题列
	 * @author xingx
	 * @param List
	 */
	public void appendHeadCols(List<ExcelColType> appendColList) throws Exception {
		appendModel(this.wb, this.templateSheet, 0, appendColList);
		initColumnWidth(this.templateSheet, appendColList);
	}

	/**
	 * 在某行复制对应列的格式和值
	 * 
	 * @author xingx
	 */
	public void appendModel(HSSFWorkbook wb, HSSFSheet sheet, int rowIndex,
			List<ExcelColType> excelColList) throws Exception {
		HSSFRow xssfRow = sheet.getRow(rowIndex);
		if (xssfRow == null) {
			xssfRow = sheet.createRow(rowIndex);// 创建一行
		}
		if (excelColList.size() > 0) {
			for (int i = 0; i < excelColList.size(); i++) {
				ExcelColType excelCol = (ExcelColType) excelColList.get(i);
				String colValue = String.valueOf(excelCol.getExcelColName());
				if (excelCol.getExcelColIndex() >= 0) {
					HSSFCell cell = xssfRow.createCell(excelCol
							.getExcelColIndex());
					cell.setCellType(HSSFCell.CELL_TYPE_STRING);
					sheet.setColumnWidth(0, 4000);
					if (colValue != null && !"".equals(colValue)
							&& colValue != "null") {
						if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
							cell.setCellValue(colValue);
						} else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
							if (HSSFDateUtil.isCellDateFormatted(cell)) {
								cell.setCellValue(DateTimeUtil
										.parseDate(colValue));
							} else {
								cell.setCellValue(Double.parseDouble(colValue));
							}
						}
					}
				}
			}
		}
	}

	/**
	 * 设置列宽,根据配置的excelColWidth
	 * 
	 * @author xingx
	 */
	public void initColumnWidth() {
		initColumnWidth(this.getCurrentSheet(), excelTemplate.getExcelHead().getExcelColList());
	}

	public void initColumnWidth(HSSFSheet sheet) {
		initColumnWidth(sheet, excelTemplate.getExcelHead().getExcelColList());
	}

	public void initColumnWidth(HSSFSheet sheet, List<ExcelColType> excelColTypes) {
		for (ExcelColType excelCol : excelColTypes) {
			Integer colWidth = excelCol.getExcelColWidth();
			if (colWidth != null && colWidth > 0 && colWidth < 255 * 256) {
				sheet.setColumnWidth(excelCol.getExcelColIndex(), colWidth);
			}
		}
	}

	/**
	 * 得到模版的数据行(如第二行a)每列的样式 xingx 2014-07-08
	 */
	private Map<Integer, HSSFCell> getCellTemplateMap(HSSFSheet sheet,
			int headIndex, ExcelTemplateType excelTemplate) throws Exception {
		Map<Integer, HSSFCell> cellTemplateMap = new HashMap<Integer, HSSFCell>();
		List<ExcelColType> excelColList = excelTemplate.getExcelHead()
				.getExcelColList();

		for (int i = 0; i < excelColList.size(); i++) {
			ExcelColType excelCol = (ExcelColType) excelColList.get(i);
			Integer colIndex = excelCol.getExcelColIndex();
			if (colIndex >= 0) {
				HSSFCell cell = null;
				Integer headrowIndex = excelTemplate.getExcelHead()
						.getHeadRowIndex();
				HSSFRow row = sheet.getRow(headrowIndex);
				if (row == null) {
					row = sheet.createRow(headrowIndex);
				}
				cell = row.getCell(colIndex);
				if (cell == null) {
					cell = row.createCell(colIndex);
				}
				cellTemplateMap.put(colIndex, cell);
			}
		}
		return cellTemplateMap;
	}

	/**
	 * 复制模版的数据行和样式 xingx 2014-07-08
	 */
	/*private void insertRowsByTemplate(HSSFSheet sheet, int startRowIndex, int insertRowNum, Map<Integer, HSSFCell> cellTemplateMap) throws Exception {
		for (int i = 0; i < insertRowNum; i++) {
			int rowIndex = startRowIndex + i;
			insertRowByTemplate(sheet,rowIndex,cellTemplateMap);
		}
	}*/

	/**
	 * 复制模版的数据行和样式 xingx 2014-08-19
	 */
	private void insertRowByTemplate(HSSFSheet sheet, int rowIndex, Map<Integer, HSSFCell> cellTemplateMap) throws Exception {
		HSSFRow hssfRow = sheet.createRow(rowIndex);
		Iterator<Integer> it = cellTemplateMap.keySet().iterator();
		while (it.hasNext()) {
			Integer colIndex = it.next();
			HSSFCell cell = hssfRow.createCell(colIndex);
			HSSFCell cellTemplate = cellTemplateMap.get(colIndex);
			if (cellTemplate != null) {
				cell.setCellStyle(cellTemplate.getCellStyle());
				cell.setCellType(cellTemplate.getCellType());
			}
		}
	}
	
	/**
	 * 根据配置文件里的excelColId取出在List<Map<String,Object>>里的值 xingx
	 */
	private Object getExcelAttrValue(ExcelColType excelCol, int rowNo,
			List<Map<String, Object>> queryResult) throws Exception {
		return queryResult.get(rowNo).get(excelCol.getExcelColId());
	}

	/**
	 * 把某列的object值转成String类型 xingx
	 */
	private String getExcelAttrStr(ExcelColType excelCol, Object attrValue)
			throws Exception {
		if (attrValue == null)
			return "";

		String value = null;
		if (attrValue instanceof Timestamp
				|| attrValue instanceof java.util.Date) {
			if (excelCol.getDisplayFormat() != null) {
				value = DateTimeUtil.format((Date) attrValue,
						excelCol.getDisplayFormat());
			} else {
				value = DateTimeUtil
						.format((Date) attrValue, EXCEL_DATE_FORMAT);
			}
		} else if (attrValue instanceof Boolean) {
			boolean is = ((Boolean) attrValue).booleanValue();
			value = is ? "是" : "否";
		} else {
			value = attrValue.toString();
		}
		return value;
	}
	
	public void appendModel(HSSFWorkbook wb, HSSFSheet sheet, int rowIndex)
			throws Exception {
		List<ExcelColType> excelColList = excelTemplate.getExcelHead()
				.getExcelColList();
		HSSFRow xssfRow = sheet.createRow(rowIndex); // 创建一行
		if (excelColList.size() > 0) {
			for (int i = 0; i < excelColList.size(); i++) {
				ExcelColType excelCol = (ExcelColType) excelColList.get(i);
				String colValue = String.valueOf(excelCol.getExcelColName());
				// System.out.println("Excel Col Value===>"+colValue);
				if (excelCol.getExcelColIndex() >= 0) {
					HSSFCell cell = xssfRow.createCell(excelCol
							.getExcelColIndex());
					HSSFCellStyle style = wb.createCellStyle();
					style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
					HSSFFont font = wb.createFont();
					font.setFontName("宋体");
					font.setColor(HSSFFont.COLOR_NORMAL);
					style.setFont(font);
					font.setFontHeightInPoints((short) 12);
					style.setBorderTop(HSSFCellStyle.BORDER_THIN);
					style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
					style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
					style.setBorderRight(HSSFCellStyle.BORDER_THIN);
					cell.setCellType(HSSFCell.CELL_TYPE_STRING);
					// cell.setCellStyle(style);
					cell.setCellType(1);
					sheet.setColumnWidth(0, 4000);
					if (colValue != null && !"".equals(colValue)
							&& colValue != "null") {
						if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
							cell.setCellValue(colValue);
						} else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
							if (HSSFDateUtil.isCellDateFormatted(cell)) {
								cell.setCellValue(DateTimeUtil
										.parseDate(colValue));
							} else {
								cell.setCellValue(Double.parseDouble(colValue));
							}
						}
					}
				}
			}
		}
	}
	
	public String getExcelName() {
		return excelName;
	}

	/**
	* 获取当前待处理的sheet
	* @author: xingxin
	* @date: 2014年8月19日 下午7:57:42
	*/
	private HSSFSheet getCurrentSheet(){
		return this.wb.getSheetAt(currentSheetIndex);
	}

	/**
	* @Title: getHSSFWorkbook
	* @Description: 获取生成的HSSFWorkbook对象
	* @return: HSSFWorkbook
	* @author: xingxin
	* @date: 2014年8月19日 下午7:58:55
	*/
	public HSSFWorkbook getHSSFWorkbook() {
		this.wb.removeSheetAt(0);
		return this.wb;
	}
}
