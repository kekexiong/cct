/**
 *Description EXCEL文件解析器
 */

package com.lemon.common.utils.excel.helper;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;

import com.lemon.common.utils.DateTimeUtil;

public class ExcelHelper{

	public static List<String[]> getRows(HSSFSheet sheet, int start, int end) throws Exception {
		List<String[]> resultList = new ArrayList<String[]>();
		try {
			if(end<=0){
				end = sheet.getPhysicalNumberOfRows();
			}
			
			short colsNum  = (short)10;
			short startCol = (short)0;
			
			for(int i = start ; i < end ; i++){
				HSSFRow hssfRow = sheet.getRow(i);
				colsNum = hssfRow.getLastCellNum();
				String[] tmpArr = new String[colsNum];
				for(short j = startCol ; j < colsNum ;j++){
					@SuppressWarnings("deprecation")
					HSSFCell hssfCell = hssfRow.getCell(j);
					Object value = getCellValue(hssfCell, i, j);
					tmpArr[j] = value.toString();
				}
				resultList.add(tmpArr);
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return resultList;
	}

	@SuppressWarnings("deprecation")
	public static String[] getRow(HSSFSheet sheet, int rowNum) throws Exception {
		String[] row = new String[]{""};
		try {
			int rowCount = sheet.getPhysicalNumberOfRows();
			if(rowNum<rowCount){
				HSSFRow hssfRow = sheet.getRow(rowNum);
				short colsNum = hssfRow.getLastCellNum();
				row = new String[colsNum];
				for(short j = 0 ; j < colsNum ;j++){
					HSSFCell hssfCell = hssfRow.getCell(j);
					Object value = getCellValue(hssfCell, colsNum, j);
					row[j] = value.toString();
				}
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return row;
	}	
	
	@SuppressWarnings({ "unused", "static-access" })
	public static Object getCellValue(HSSFCell hssfCell, int rowIndex, short colIndex) throws Exception {
		Object value = null;
		try {
			if (hssfCell == null || hssfCell.getCellType() == HSSFCell.CELL_TYPE_BLANK) {
				value = "";
			}else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_STRING) {
				value = hssfCell.getStringCellValue();
			}else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
				value = hssfCell.getBooleanCellValue();
			}else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_FORMULA) {
				value = hssfCell.getCellFormula();
			}else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
				value = hssfCell.getNumericCellValue();
				if(HSSFDateUtil.isCellDateFormatted(hssfCell)){
	                Date _date = hssfCell.getDateCellValue();
	                if(_date != null){
	    				value = DateTimeUtil.format(_date, DateTimeUtil.TimeFormater.yyyyMMdd);
	                }
	            }else{
	            	value = hssfCell.getNumericCellValue();
	            	if(value!=null){
	            		DecimalFormat format = new DecimalFormat("0.####"); 
	            		value = format.format(value);
	            	}else{
	            		value = 0;
	            	}
	            }
			}
		} catch (Exception e) {
			throw new Exception("happened row:" + (rowIndex + 1) + ",col:" + (colIndex + 1) + e.getMessage(), e);
		}
		return value;
	}
	
	public static int countCols(HSSFSheet sheet) {
		return sheet.getRow(0).getLastCellNum();
	}

	public static int countRows(HSSFSheet sheet) {
		int rowsNum = sheet.getPhysicalNumberOfRows();
		return rowsNum;
	}
	

    @SuppressWarnings("deprecation")
	public static void writeCell(HSSFSheet sheet, int rowIndex, short colIndex, String val) throws Exception {
    	HSSFCell cell = sheet.getRow(rowIndex).getCell(colIndex);
        writeCell(cell, val);
    }
    
    public static void writeCell(HSSFCell cell, String val) throws Exception {
    	if (val == null)
			return;
		if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
			cell.setCellValue(val);
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
			if (HSSFDateUtil.isCellDateFormatted(cell)) {
				cell.setCellValue(DateTimeUtil.parseDate(val));
			} else {
				cell.setCellValue((val==null||val.equalsIgnoreCase(""))?0.0:Double.parseDouble(val));
			}
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN) {
			cell.setCellValue((java.lang.Boolean.getBoolean(val)));
		}else{
			cell.setCellValue(val);
		}
	}
	
}
