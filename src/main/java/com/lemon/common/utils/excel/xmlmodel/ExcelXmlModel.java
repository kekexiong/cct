/**
 *Description XML抽象Model
 */
package com.lemon.common.utils.excel.xmlmodel;

import com.lemon.common.utils.excel.constant.ExcelConstant;
import com.lemon.common.utils.excel.dto.ExcelTemplateList;


public class ExcelXmlModel extends AbstractXmlModel{

	
	public ExcelXmlModel(String excelFileName) throws Exception{
        super(ExcelConstant.EXCEL_DTO_PACKAGE_NAME, excelFileName);

    }

    public ExcelTemplateList getExcelInfoList(){
        return (ExcelTemplateList)this.getRootModel();
    }
}
