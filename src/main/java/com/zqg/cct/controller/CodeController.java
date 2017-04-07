package com.zqg.cct.controller;

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

	@Resource
	private TableService tableService;

	/**
	 * ��ҳ
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView couponRule(Model model) {
		model.addAttribute("record", tableService.getTableItem(null));
		return new ModelAndView("/jsp/code2.jsp");
	}

	/**
	 * ��ҳ
	 * 
	 * @param ȡ������
	 * @return
	 */
	@RequestMapping(value = "/queryTable", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String couponRule() {
		return JSON.toJSONString(tableService.getTableItem(null));
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
	public String saveTable(
			@RequestParam(value = "page", required = false, defaultValue = "1") int pageNo,
			@RequestParam(value = "rows", required = false, defaultValue = "10") int pageSize,
			@RequestParam(value = "serviceName", required = false,  defaultValue = "") String serviceName,
			@RequestParam(value = "classPackage", required = false,  defaultValue = "") String classPackage,
			@RequestParam(value = "className", required = false,  defaultValue = "") String className,
			@RequestParam(value = "tableName", required = false,  defaultValue = "") String tableName,
			@RequestParam(value = "tableComments", required = false,  defaultValue = "") String tableComments,
			@RequestParam(value = "dbUser", required = false,  defaultValue = "") String dbUser,
			@RequestParam(value = "classAuthor", required = false,  defaultValue = "") String classAuthor,
			@RequestParam(value = "isQuery", required = false,  defaultValue = "") String isQuery,
			@RequestParam(value = "isAdd", required = false,  defaultValue = "") String isAdd,
			@RequestParam(value = "isDetele", required = false,  defaultValue = "") String isDetele,
			@RequestParam(value = "isUpdate", required = false,  defaultValue = "") String isUpdate,
			HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//List<TableItem> list = (List<TableItem>) request.getParameter("list");
		String listString =request.getParameter("list");
		List<TableItem> list=JSON.parseArray(listString, TableItem.class);
		TableDomain table = new TableDomain();
		table.setTableName(tableName);
		table.setDomainPackage("com.zqg.cct.domain");
		table.setMapperPackage("com.zqg.cct.mapper");
		table.setServicePackage("com.zqg.cct.service");
		table.setControllerPackage("com.zqg.cct.controller");
		table.setJspPackage("com.zqg.cct.controller");
		table.setMapperXmlPackage("mapper");
		table.setDbUser(dbUser);
		table.setBasePath("D:/workspaceZD/cct");
		table.setClassAuthor(classAuthor);
		table.setBusinessName(serviceName);
		table.setClassTime(StrUtil.stringDateTime(new Date()));
		table.setReviewAuthor(classAuthor);
		table.setReviewDate(StrUtil.stringDate(new Date()));
		table.setIsUpdate(isUpdate);
		table.setIsAdd(isAdd);
		table.setIsDetele(isDetele);
		table.setIsQuery(isQuery);
		tableService.process(list, table);
		return JSON.toJSONString(tableService.getTableItem(null));
	}
	
	
	
}
