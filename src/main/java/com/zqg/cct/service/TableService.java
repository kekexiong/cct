package com.zqg.cct.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zqg.cct.domain.TableDomain;
import com.zqg.cct.domain.TableItem;
import com.zqg.cct.mapper.TableMapper;
import com.zqg.cct.util.FileWriterFactory;
import com.zqg.cct.util.StrUtil;
import com.zqg.cct.util.TableUtil;

@Service
public class TableService {
	@Autowired
	private TableMapper TableMapper;

	public List<TableItem> getTableItem(TableDomain param) {
		List<TableItem> itemList = TableMapper.getTableItem(param);
		return itemList;
	}

	public void process(List<TableItem> list, TableDomain table) {
		table.setClassNameD(StrUtil.upperFirst(table.getTableName()));
		table.setClassNameX(StrUtil.lowerFirst(table.getTableName()));
		table.setDomainImportPackageList(new ArrayList<String>());
		for (TableItem item : list) {
			item.setColumnNameD(StrUtil.upperFirst(item.getColumnName()));
			item.setColumnNameX(StrUtil.lowerFirst(item.getColumnName()));
			swtichType(item, table);
		}
		table.setTableCarrays(list);
		try {
			TableUtil.getTables(table, list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		FileWriterFactory.dataSourceOut("domain.ftl", table, table.getClassNameD() + ".java", FileWriterFactory.DOMAIN);
	    FileWriterFactory.dataSourceOut("mapper.ftl", table, table.getClassNameD() + "Mapper.java",FileWriterFactory.MAPPER);
		FileWriterFactory.dataSourceOut("mapperXml.ftl", table, table.getClassNameD() + "Mapper.xml",FileWriterFactory.MAPPER_XML);
		FileWriterFactory.dataSourceOut("service.ftl", table, table.getClassNameD() + "Service.java",	FileWriterFactory.SERVICE);
		FileWriterFactory.dataSourceOut("controller.ftl", table, table.getClassNameD() + "Controller.java",	FileWriterFactory.CONTROLLER);

		FileWriterFactory.dataSourceOut("bapJsp.ftl", table, table.getClassNameD() + ".jsp", FileWriterFactory.JSP);
		
	};
	
	private String swtichType(TableItem item, TableDomain table){
		String bigDecimalImprot="java.math.BigDecimal";
		if("VARCHAR2".equals(item.getDataType())){
			item.setDataType("String");
		}
		if("CHAR".equals(item.getDataType())){
			item.setDataType("String");
		}
		if("NUMBER".equals(item.getDataType()) && "2".equals(item.getDataScale())){
			item.setDataType("BigDecimal");
			existImprot(table.getDomainImportPackageList(), bigDecimalImprot);
		}
		if("NUMBER".equals(item.getDataType()) && StringUtils.isBlank(item.getDataPrecision())){
			item.setDataType("Int");
		}
		return item.getDataType();
	}

	/**
	 * 判断是否存在引对象
	 * @param improtList
	 * @param bigDecimalImprot
	 */
	private void existImprot(List<String> improtList, String bigDecimalImprot) {
		boolean exist = false;
		if(improtList==null){
			improtList= new ArrayList<String>();
			improtList.add(bigDecimalImprot);
		}else{
			for(String aa: improtList){
				if(bigDecimalImprot.equals(aa)){
					exist=true;
				}
			}
			if(!exist){
				improtList.add(bigDecimalImprot);
			}
		}
	}
}

