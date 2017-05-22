package com.lemon.common.utils.excel.factory;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.lemon.common.utils.FileUtil;
import com.lemon.common.utils.excel.constant.ExcelConstant;
import com.lemon.common.utils.excel.dto.ExcelColType;
import com.lemon.common.utils.excel.dto.ExcelTemplateType;
import com.lemon.common.utils.excel.xmlmodel.ExcelXmlModel;
import com.lemon.common.utils.log.BapLogUtil;

public class ExcelXmlModelFactory {
	private static ExcelXmlModelFactory instance;
	private Map<String, ExcelTemplateType> excelInfoTable = new HashMap<String, ExcelTemplateType>();

	static final Logger logger = LoggerFactory
			.getLogger(ExcelXmlModelFactory.class);
	
	private ExcelXmlModelFactory() {
	}

	public static ExcelXmlModelFactory getInstance() {
		logger.debug(BapLogUtil.genLogs("ExcelXmlModelFactory", "----getInstance() info"));
		if (null == instance) {
			try {
				String tmplateXmlPath = ExcelConstant.EXCEL_XML_MODEL_FILE_PATH;
				logger.info(BapLogUtil.genLogs("ExcelXmlModelFactory", "----tmplateXmlPath info=")+tmplateXmlPath);
				File file = new File(FileUtil.getClassFolderPath()
						+ tmplateXmlPath);
				logger.info(BapLogUtil.genLogs("ExcelXmlModelFactory", "----tmplateXmlPath="+FileUtil.getClassFolderPath() + tmplateXmlPath));
				String[] files = file.list();
				logger.info(BapLogUtil.genLogs("ExcelXmlModelFactory","----files="+files));
				if (files != null && files.length > 0) {
					String[] modelFileNames = new String[files.length];
					for (int i = 0; i < files.length; i++) {
						logger.info(BapLogUtil.genLogs("ExcelXmlModelFactory", "----modelFileNames"+i+"="+tmplateXmlPath + files[i]));
						modelFileNames[i] = (tmplateXmlPath + files[i]).replaceAll("/", File.separator);
						logger.info(BapLogUtil.genLogs("ExcelXmlModelFactory", "----modelFileNames_new"+i+"="+modelFileNames[i]));
					}
					ExcelXmlModelFactory.createInstance(modelFileNames);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return instance;
	}

	private static ExcelXmlModelFactory createInstance(String... modelFileNames)
			throws Exception {
		// System.out.println("modelFileNames="+modelFileNames);

		if (instance == null) {
			ExcelXmlModelFactory _instance = new ExcelXmlModelFactory();
			for (int k = 0; k < modelFileNames.length; k++) {
				ExcelXmlModel excelXmlModel = new ExcelXmlModel(
						modelFileNames[k]);
				List<ExcelTemplateType> excelInfoList = excelXmlModel
						.getExcelInfoList().getExcelTemplate();
				for (int i = 0; i < excelInfoList.size(); i++) {
					ExcelTemplateType excelInfo = excelInfoList.get(i);
					_instance.excelInfoTable.put(excelInfo.getExcelId(),
							excelInfo);
				}
			}
			instance = _instance;
		}
		return instance;
	}

	/**
	 * 根据excleId获取模版
	 */
	public ExcelTemplateType getExcelInfo(String excelId) {
		return excelInfoTable.get(excelId);
	}

	/**
	 * 增加动态列时用此方法获取模板配置的原始列，解决静态属性excelInfoTable的值被改变的问题
	 */
	/*
	 * public ExcelTemplateType getExcelTemplateType(String excelId) throws
	 * Exception{ ExcelTemplateType excelTemplateType = new ExcelTemplateType();
	 * ExcelXmlModel excelXmlModel = new
	 * ExcelXmlModel(ExcelConstant.EXCEL_XML_MODEL_FILE);
	 * List<ExcelTemplateType> excelInfoList =
	 * excelXmlModel.getExcelInfoList().getExcelTemplate(); for(int i=0;
	 * i<excelInfoList.size(); i++){ ExcelTemplateType excelInfo =
	 * excelInfoList.get(i); if(excelId.equals(excelInfo.getExcelId())){
	 * excelTemplateType = excelInfo; break; } } return excelTemplateType; }
	 */

	public ExcelColType getExcelCol(String excelId, String excelColId) {
		ExcelColType _excelCol = null;
		ExcelTemplateType excelInfo = getExcelInfo(excelId);
		if (excelInfo != null) {
			List<ExcelColType> excelColList = excelInfo.getExcelHead()
					.getExcelColList();
			for (int i = 0; i < excelColList.size(); i++) {
				ExcelColType excelCol = excelColList.get(i);
				if (excelColId.equals(excelCol.getExcelColId())) {
					_excelCol = excelCol;
					break;
				}
			}
		}
		return _excelCol;
	}

	public static void main(String[] args) throws Exception {
		ExcelTemplateType excelInfo = ExcelXmlModelFactory.getInstance()
				.getExcelInfo("PAY_FILE_BY_PAGE");
		System.out.println(excelInfo);
	}
}
