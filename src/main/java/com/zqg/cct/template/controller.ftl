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
				List<${classNameD}> list = ${classNameX}Service.findByCondition(map);
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
	@RequestMapping(value = "/${classNameD}getDetail/{uuid}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getByKey(HttpSession session, @ModelAttribute ${classNameD} paramVo) {
		String tcd = "${classNameD}Controller.queryCondition";
		String opNm = "${businessName}-详细";
			try {
				LOGGER.info(tcd, "", opNm + "--begin");
				${classNameD} detail= ${classNameX}Service.getByKey(paramVo.getUuid());
				LOGGER.info(tcd, "", opNm + "--end");
				return setResult(detail, 0);
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
	@RequestMapping(value = "/${classNameD}udpate", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> udpate( @ModelAttribute ${classNameD} paramVo) {
		String tcd = "${classNameD}Controller.save";
		String opNm = "${businessName}-更新";
		try{
			LOGGER.info(tcd, "", opNm + "--begin");
			${classNameX}Service.insert(paramVo);
			int num = ${classNameX}Service.insert(paramVo);
			if(num>0){
				return super.setFailure("更新成功!");
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
				return super.setFailure("删除成功!");
			}
			LOGGER.info(tcd, "", opNm + "--end");
			return super.setFailure("删除成功0条!");
			
		}catch(Exception e){
			LOGGER.error(tcd, "", opNm + "--End,异常:", e);
			return super.setFailure("删除失败!");
		}
	}
	</#if>
	
}