package ${controllerPackage};
import java.util.*;
import ${domainPackage}.${classNameD};
import ${servicePackage}.${classNameD}Service;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @description  ${businessName}控制层
 * @author ${classAuthor}
 * @date   ${classTime}
 * @review ${reviewAuthor}/${reviewDate}
 */
@Controller
@RequestMapping("/${dbUser}/${classNameD}")
public class ${classNameD}Controller extends BaseController {

	@Autowired
	private ${classNameD}Service ${classNameX}Service;
	static final Logger LOGGER = LoggerFactory.getLogger(${classNameD}Controller.class);
	
	<#list tableCarrays as tableCarray>
	<#if (tableCarray.queryRule??) && tableCarray.queryRule == "05">
	/**
	 * @description: 获取付款类型字段
	 * @return map
	 * @author ${classAuthor}
	 * @data ${classTime}
	 */
	@RequestMapping(value ="/get${tableCarray.columnNameD}", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> get${tableCarray.columnNameD}(){
		String tcd = "${classNameD}Controller.getCustomStore";
		String opNm = "${businessName}-获取付款类型字段";
		LOGGER.info(tcd, "", opNm + "--begin");
		List<Map<String, Object>> payTypeNames = null;
		try {
            payTypeNames = tSesAutoPayCheckService.get${tableCarray.columnNameD}();
            LOGGER.info(tcd, "", opNm + "--获取参数成功！");
        } catch (Exception e) {
            LOGGER.error(tcd, "", opNm + "--End,异常:", e);
        }
        LOGGER.info(tcd, "", opNm + "--end");
        return payTypeNames;
	}
	</#if>
	</#list>
	
	<#if isQuery == "true">
	/**
	 * @description: 信息查询
	 * @param session
	 * @param start
	 * @param limit
	 * @param paramVo
	 * @return map
	 * @author ${classAuthor}
	 * @data ${classTime}
	 */
	@RequestMapping(value ="/${classNameD}query", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryCondition(HttpSession session,
			@RequestParam(value = "start", defaultValue = ConstantsBase.START) int start,
			@RequestParam(value = "limit", defaultValue = ConstantsBase.LIMIT) int limit,
			@ModelAttribute ${classNameD} ${classNameX}) {
		String tcd = "${classNameD}Controller.queryCondition";
		String opNm = "${businessName}-查询";
			try {
				LOGGER.info(tcd, "", opNm + "--begin");
				Map<String, Object> map = setParams(start, limit);
				map.put("${classNameX}", ${classNameX});
				session.setAttribute("queryMecTOneAcRateParam", map);
				List<Map<String, Object>> list = ${classNameX}Service.findByCondition(map);
				int count = ${classNameX}Service.findByConditionCount(map);
				LOGGER.info(tcd, "", opNm + "--end");
				return setResult(list, count);
			} catch (Exception e) {
				LOGGER.error(tcd, "", opNm + "--End,异常:", e);
				return setFailure("查询失败");
			}
	}
	</#if>
	<#if isQuery == "true">
	/**
	 * 根据主键取得详细
	 * @param session
	 * @param paramVo
	 * @return
	 */
	@RequestMapping(value = "/${classNameD}getDetail", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getByKey(HttpSession session, @ModelAttribute ${classNameD} paramVo) {
		String tcd = "${classNameD}Controller.queryCondition";
		String opNm = "${businessName}-详细";
			try {
				LOGGER.info(tcd, "", opNm + "--begin");
				${classNameD} detail= ${classNameX}Service.getByKey(paramVo);
				LOGGER.info(tcd, "", opNm + "--end");
				Map<String, Object> map = new HashMap<>();
				map.put("data", detail);
				return map;
			} catch (Exception e) {
				LOGGER.error(tcd, "", opNm + "--End,异常:", e);
				return super.setFailure("查询失败");
			}
	}
	</#if>
	
	<#if isAdd == "true">
	/**
	 * 保存
	 * @param paramVo
	 * @return
	 */
	@RequestMapping(value = "/${classNameD}save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> save( @ModelAttribute ${classNameD} ${classNameX}) {
		String tcd = "${classNameD}Controller.save";
		String opNm = "${businessName}-保存";
		try{
			String uuid = CreateUUID.GetRandomUUID();
			${classNameX}.setUuid(uuid);
			String loginName = SysUtils.getLoginName();
	        String nowDate = DateTimeUtil.formatDateByFormat(new Date(), TimeFormater.YYYYMMDD);
	        String nowTime = DateTimeUtil.formatDateByFormat(new Date(), TimeFormater.HHmmss);
	        ${classNameX}.setOpId(loginName);
	        ${classNameX}.setOpDt(nowDate);
	        ${classNameX}.setOpTm(nowTime);
	        ${classNameX}.setUuid(uuid);
	        ${classNameX}.setCtDt(nowDate);
	        ${classNameX}.setCtId(loginName);
	        ${classNameX}.setCtTm(nowTime);
			LOGGER.info(tcd, "", opNm + "--begin");
			int num = ${classNameX}Service.insert(${classNameX});
			if(num>0){
				return super.setSuccess("保存成功!");
			}
			LOGGER.info(tcd, "", opNm + "--end");
			return super.setFailure("保存成功0条!");
			
		}catch(Exception e){
			LOGGER.error(tcd, "", opNm + "--End,异常:", e);
			return super.setFailure("保存失败!");
		}
	}
	</#if>
	
	<#if isUpdate=="true">
	/**
	 * 更新
	 * @param paramVo
	 * @return
	 */
	@RequestMapping(value = "/${classNameD}update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> udpate( @ModelAttribute ${classNameD} paramVo) {
		String tcd = "${classNameD}Controller.save";
		String opNm = "${businessName}-更新";
		try{
			String loginName = SysUtils.getLoginName();
	        String nowDate = DateTimeUtil.formatDateByFormat(new Date(), TimeFormater.YYYYMMDD);
	        String nowTime = DateTimeUtil.formatDateByFormat(new Date(), TimeFormater.HHmmss);
	        paramVo.setOpDt(nowDate);
	        paramVo.setOpId(loginName);
	        paramVo.setOpTm(nowTime);
			LOGGER.info(tcd, "", opNm + "--begin");
			int num = ${classNameX}Service.update(paramVo);
			if(num>0){
				return super.setSuccess("更新成功!");
			}
			LOGGER.info(tcd, "", opNm + "--end");
			return super.setFailure("更新成功0条!");
			
		}catch(Exception e){
			LOGGER.error(tcd, "", opNm + "--End,异常:", e);
			return super.setFailure("更新失败!");
		}
	}
</#if>
	
<#if isDetele=="true">
/**
	 * 根据主键删除
	 * @param session
	 * @param paramVo
	 * @return
	 */
	@RequestMapping(value = "/${classNameD}deleteByUuid", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteByUuid(HttpSession session, @RequestParam(value = "uuids") String uuids) {
		String tcd = "${classNameD}Controller.deleteByUuid";
		String opNm = "${businessName}-删除";
		if(uuids==null|| "".equals(uuids)){
			return super.setFailure("错误：付款单号参数为空");
		}
		// 参数map
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("uuids", uuids.split(","));//付款单号数组
		try{
			LOGGER.info(tcd, "", opNm + "--begin");
			int num = ${classNameX}Service.delete(paramsMap);
			if(num>0){
				return super.setSuccess("删除成功!");
			}
			LOGGER.info(tcd, "", opNm + "--end");
			return super.setFailure("删除成功0条!");
			
		}catch(Exception e){
			LOGGER.error(tcd, "", opNm + "--End,异常:", e);
			return super.setFailure("删除失败!");
		}
	}
	</#if>
	<#if isImport == "01" >
	/**
     * @description:主页面导入功能
     * @param session
     * @param response
     * @return:void
     * @author:${classAuthor}
     * @date:
     */
	@RequestMapping(value = "${classNameD}importExcel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ${classNameD}importExcel (HttpSession session, HttpServletRequest request){
		String tcd = "${classNameD}Controller-${classNameD}importExcel";
        String opNm = "${businessName}-导入";
        logger.info(LogUtils.genLogs(LogType.BAP, tcd, opNm, "==开始"));
        Map<String, Object> rsMap = null;
        try {
            Principal pr = SysUtils.getSessionStoreRange();
            String loginId = pr.getLoginName();
            rsMap = ${classNameX}Service.batchOperate(request);
            if (rsMap.get("errors") != null) {
                List<BnkRetPo> errlist = (List<BnkRetPo>) rsMap.get("errors");
                session.setAttribute("errlist", errlist);
            }
            return rsMap;
        } catch (Exception e) {
            logger.error("#bap#${businessName}信息管理-批量添加${businessName}异常原因是：", e);
            rsMap = new HashMap<String, Object>();
            rsMap.put("success", false);
            rsMap.put("msgInfo", "系统异常！");
            return rsMap;
        }
	}
	
	/**
     * @description:导出错误信息
     * @param session
     * @param response
     * @return:void
     * @author:${classAuthor}
     * @date:2017年4月26日
     */
	@RequestMapping(value = "${classNameD}getFailExport", method = RequestMethod.GET)
    @ResponseBody
	public void getBnkBinFailExport(HttpSession session, HttpServletResponse response) {
		try{
			//从session中获取错误信息list
			List<BnkRetPo> erroList = (List<BnkRetPo>) session.getAttribute("errlist");
	        List<Map<String, Object>> inList = null;
	        if(erroList.size()>0){
	        	inList = new ArrayList<Map<String, Object>>();
	        	for (int i = 0; i < erroList.size(); i++) {
	                Map<String, Object> map = new HashMap<String, Object>();
	                BnkRetPo po = erroList.get(i);
	                String bnkCd = po.getBnkCd();
	                String failReason = po.getFailReason();
	                map.put("bnkCd", bnkCd);
	                map.put("failReason", failReason);
	                inList.add(map);
	            }
	        	File file = ${classNameX}Service.exportExcelFail(inList, SysUtils.getLoginName());
	            DownloadFileUtil.getInstance().downLoad(file, response);
	        }
		} catch (Exception e){
			logger.error("验证失败结果导出异常，", e);
		}
	}
	</#if>
	<#if isExport == "01" >
	/**
     * @description:主页面导出功能
     * @param session
     * @param response
     * @return:void
     * @author:${classAuthor}
     * @date:2017年4月24日
     */
	@RequestMapping(value = "/${classNameD}Export", method = RequestMethod.GET)
    public void export(HttpSession session, HttpServletResponse response) {
        String tcd = "${classNameD}Controller-export";
        String opNm = "${businessName}信息管理-导出";
        Map<String, Object> paraMap = (Map<String, Object>) session.getAttribute("queryMecTOneAcRateParam");
        HSSFWorkbook hSSFWorkbook;
        String fileName = null;
        try {
            hSSFWorkbook = ${classNameX}Service.export(paraMap);
            fileName = "${businessName}表信息" + System.currentTimeMillis() + ".xls";
            DownloadFileUtil.getInstance().downLoadExcel(hSSFWorkbook, fileName, response);
        } catch (Exception e) {
            logger.error(BapLogUtil.genLogs(tcd, opNm + "异常：" + e.getMessage()));
        }
        logger.info(BapLogUtil.genLogs(tcd, opNm + "end,fileName=" + fileName));
    }
	</#if>
	
}