package com.zqg.cct.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.zqg.cct.domain.TableDomain;
import com.zqg.cct.domain.TableItem;
import com.zqg.cct.service.TableService;
import com.zqg.cct.util.StrUtil;

@Controller
@RequestMapping("/code")
public class CodeController {

	/**
	 * 使用说明  使用前请修改 表名：TABLE_NAME  和  工程路劲：PROJECT_PATH
	 * 
	 * 注意：  SES  BAP 的表 需要用不同的数据源  需要手动修改（bap_sit ses_sit）
	 */
	
	@Resource
	private TableService tableService;
	// 表名
	private final String TABLE_NAME="T_BAP_STOCK_FUND_BASE_DATA";
	// 工程路径 ios 电脑
	private final String PROJECT_PATH="/Users/zhaoqiugen/git/cct"; 
	// 工程路径 windows 电脑
	//private final String PROJECT_PATH="D:/workspaceCCT/cct";

	/**
	 * 首页
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView couponRule(Model model) {
		return new ModelAndView("/jsp/code2.jsp");
	}

	/**
	 * 查询表结构
	 * 
	 * @param 参数
	 * @return
	 */
	@RequestMapping(value = "/queryTable", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String couponRule() {
		TableDomain param = new TableDomain();
		param.setTableName(TABLE_NAME);
		return JSON.toJSONString(tableService.getTableItem(param));
	}

	/**
	 * 查询表结构
	 * 
	 * @param 参数
	 * @return
	 */
	@RequestMapping(value = "/innt", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String innt() {
		TableDomain param = new TableDomain();
		param.setTableName(TABLE_NAME);
		param.setClassAuthor("zhao_qg");
		param.setBusinessName("代码自动生成");
		param.setClassPackage("com.lemon.ses");
		param.setClassNameD(StrUtil.upperFirst(param.getTableName()));
		return JSON.toJSONString(param);
	}
	/**
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param serviceName
	 * @param classPackage
	 * @param className
	 * @param tableName
	 * @param tableComments
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/saveTable", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String saveTable(@RequestParam(value = "page", required = false, defaultValue = "1") int pageNo,
			@RequestParam(value = "rows", required = false, defaultValue = "10") int pageSize,
			@RequestParam(value = "serviceName", required = false, defaultValue = "") String serviceName,
			@RequestParam(value = "classPackage", required = false, defaultValue = "") String classPackage,
			@RequestParam(value = "className", required = false, defaultValue = "") String className,
			@RequestParam(value = "tableName", required = false, defaultValue = "") String tableName,
			@RequestParam(value = "tableComments", required = false, defaultValue = "") String tableComments,
			@RequestParam(value = "dbUser", required = false, defaultValue = "") String dbUser,
			@RequestParam(value = "classAuthor", required = false, defaultValue = "") String classAuthor,
			@RequestParam(value = "isQuery", required = false, defaultValue = "") String isQuery,
			@RequestParam(value = "isAdd", required = false, defaultValue = "") String isAdd,
			@RequestParam(value = "isDetele", required = false, defaultValue = "") String isDetele,
			@RequestParam(value = "isUpdate", required = false, defaultValue = "") String isUpdate,
			@RequestParam(value = "isExport", required = false, defaultValue = "") String isExport,
			@RequestParam(value = "isImport", required = false, defaultValue = "") String isImport,
			@RequestParam(value = "isOperation", required = false, defaultValue = "") String isOperation,
			HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		// List<TableItem> list = (List<TableItem>)
		// request.getParameter("list");
		String listString = request.getParameter("list");
		List<TableItem> list = JSON.parseArray(listString, TableItem.class);
		List<TableItem> newList = new ArrayList<TableItem>();
		for (int i = 0; i < list.size(); i++) {
			TableItem item = list.get(i);
			newList.add(item);
			String queryRule = item.getQueryRule();
			if (!"".equals(queryRule) && ("04".equals(queryRule) || "05".equals(queryRule))) {
				item.setIsAddColumnName("3");
				TableItem item1 = new TableItem();
				item1.setComments(item.getComments());
				item1.setColumnName(item.getColumnName() + "_NAME");
				item1.setDataType("VARCHAR2");
				item1.setIsAddColumnName("1");
				item1.setQueryShow("01");
				newList.add(item1);
			} else {
				if("√".equals(item.getQueryType())){
					item.setQueryType("01");
				}else{
					item.setQueryType("02");
				}
				if("√".equals(item.getQueryExport())){
					item.setQueryExport("01");
				}else{
					item.setQueryExport("02");
				}
				
				if("√".equals(item.getQueryShow())){
					item.setQueryShow("01");
				}else{
					item.setQueryShow("02");
				}
				
				if("√".equals(item.getQueryView())){
					item.setQueryView("01");
				}else{
					item.setQueryView("02");
				}
				
				if("√".equals(item.getQueryAdd())){
					item.setQueryAdd("01");
				}else{
					item.setQueryAdd("02");
				}
				item.setIsAddColumnName("0");
			}
		}
		TableDomain table = new TableDomain();
		table.setTableName(tableName);
		table.setUrlPackage(classPackage.substring(classPackage.lastIndexOf(".")+1, classPackage.length()));
		table.setDomainPackage(classPackage+".domain");
		table.setMapperPackage(classPackage+".mapper");
		table.setServicePackage(classPackage+".service");
		table.setControllerPackage(classPackage+".controller");
		table.setJspPackage("webapp.jsp");
		table.setMapperXmlPackage("resources.mapper");
		table.setExcelXmlPackage("resources.excel_config.excel_model");
		table.setDbUser(dbUser);
		table.setBasePath(PROJECT_PATH); // 工程路径
		table.setClassAuthor(classAuthor);
		table.setBusinessName(serviceName);
		table.setClassTime(StrUtil.stringDateTime(new Date()));
		table.setReviewAuthor(classAuthor);
		table.setReviewDate(StrUtil.stringDate(new Date()));
		table.setIsUpdate(isUpdate);
		table.setIsAdd(isAdd);
		table.setIsDetele(isDetele);
		table.setIsQuery(isQuery);
		table.setIsExport(isExport);
		table.setIsImport(isImport);
		table.setIsOperation(isOperation);
		tableService.process(newList, table);
		return JSON.toJSONString(tableService.getTableItem(null));
	}
}
