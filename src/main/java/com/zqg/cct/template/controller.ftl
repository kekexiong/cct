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
@RequestMapping("/code")
public class ${classNameD}Controller extends BaseController {

	@Autowired
	private ${classNameD}Service ${classNameX}Service;
	static final Logger LOGGER = LoggerFactory.getLogger(${classNameD}Controller.class);
	
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
	@RequestMapping(value ="/index", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryCondition(HttpSession session,
			@RequestParam(value = "start", defaultValue = "20") int start,
			@RequestParam(value = "limit", defaultValue = "0") int limit,
			@ModelAttribute ${classNameD} paramVo) {
		String tcd = "${classNameD}Controller.queryCondition";
		String opNm = "商户D+1结算费率-查询";
			try {
				LOGGER.info(tcd, "", opNm + "--begin");
				Map<String, Object> map = setParams(start, limit);
				map.put("paramVo", paramVo);
				session.setAttribute("queryMecTOneAcRateParam", map);
				List<${classNameD}> list = ${classNameX}Service.findByCondition(map);
				int count = ${classNameX}Service.findByConditionCount(map);
				LOGGER.info(tcd, "", opNm + "--end");
				return setResult(list, count);
			} catch (Exception e) {
				LOGGER.error(tcd, "", opNm + "--End,异常:", e);
				return super.setFailure("查询失败");
			}
	}
	
	/**
	 * 根据主键取得详细
	 * @param session
	 * @param paramVo
	 * @return
	 */
	@RequestMapping(value = "/getDetail/{uuid}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getByKey(HttpSession session, @ModelAttribute ${classNameD} paramVo) {
		String tcd = "${classNameD}Controller.queryCondition";
		String opNm = "商户D+1结算费率-详细";
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
	
	
	/**
	 * 保存
	 * @param paramVo
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> save( @ModelAttribute ${classNameD} paramVo) {
		String tcd = "${classNameD}Controller.save";
		String opNm = "商户D+1结算费率-保存";
		try{
			LOGGER.info(tcd, "", opNm + "--begin");
			${classNameX}Service.insert(paramVo);
			int num = ${classNameX}Service.insert(paramVo);
			if(num>0){
				return super.setFailure("保存成功!");
			}
			LOGGER.info(tcd, "", opNm + "--end");
			return super.setFailure("保存成功0条!");
			
		}catch(Exception e){
			LOGGER.error(tcd, "", opNm + "--End,异常:", e);
			return super.setFailure("保存失败!");
		}
	}
	
	<#if isUpdate=="false">
	/**
	 * 更新
	 * @param paramVo
	 * @return
	 */
	@RequestMapping(value = "/udpate", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> udpate( @ModelAttribute ${classNameD} paramVo) {
		String tcd = "${classNameD}Controller.save";
		String opNm = "商户D+1结算费率-更新";
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
	
/**
	 * 根据主键删除
	 * @param session
	 * @param paramVo
	 * @return
	 */
	@RequestMapping(value = "/deleteByUuid", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteByUuid(HttpSession session, @ModelAttribute ${classNameD} paramVo) {
		String tcd = "${classNameD}Controller.deleteByUuid";
		String opNm = "商户D+1结算费率-删除";
		try{
			LOGGER.info(tcd, "", opNm + "--begin");
			${classNameX}Service.insert(paramVo);
			int num = ${classNameX}Service.delete(paramVo.getUuid());
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
}