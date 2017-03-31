package com.zqg.cct.controller;
import java.util.*;
import com.zqg.cct.domain.TSesErrorLog;
import com.zqg.cct.service.TSesErrorLogService;
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
 * @description  TN付款规则控制层
 * @author zhao_qg
 * @date   20170331 15:40:42
 * @review zhao_qg/2017-03-31
 */
@Controller
@RequestMapping("/code")
public class TSesErrorLogController extends BaseController {

	@Autowired
	private TSesErrorLogService tSesErrorLogService;
	static final Logger LOGGER = LoggerFactory.getLogger(TSesErrorLogController.class);
	
	/**
	 * @description: 信息查询
	 * @param session
	 * @param start
	 * @param limit
	 * @param paramVo
	 * @return map
	 * @author zhao_qg
	 * @data 20170331 15:40:42
	 */
	@RequestMapping(value ="/index", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryCondition(HttpSession session,
			@RequestParam(value = "start", defaultValue = "20") int start,
			@RequestParam(value = "limit", defaultValue = "0") int limit,
			@ModelAttribute TSesErrorLog paramVo) {
		String tcd = "TSesErrorLogController.queryCondition";
		String opNm = "商户D+1结算费率-查询";
			try {
				LOGGER.info(tcd, "", opNm + "--begin");
				Map<String, Object> map = setParams(start, limit);
				map.put("paramVo", paramVo);
				session.setAttribute("queryMecTOneAcRateParam", map);
				List<TSesErrorLog> list = tSesErrorLogService.findByCondition(map);
				int count = tSesErrorLogService.findByConditionCount(map);
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
	public Map<String, Object> getByKey(HttpSession session, @ModelAttribute TSesErrorLog paramVo) {
		String tcd = "TSesErrorLogController.queryCondition";
		String opNm = "商户D+1结算费率-详细";
			try {
				LOGGER.info(tcd, "", opNm + "--begin");
				TSesErrorLog detail= tSesErrorLogService.getByKey(paramVo.getUuid());
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
	public Map<String, Object> save( @ModelAttribute TSesErrorLog paramVo) {
		String tcd = "TSesErrorLogController.save";
		String opNm = "商户D+1结算费率-保存";
		try{
			LOGGER.info(tcd, "", opNm + "--begin");
			tSesErrorLogService.insert(paramVo);
			int num = tSesErrorLogService.insert(paramVo);
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
	
	
/**
	 * 根据主键删除
	 * @param session
	 * @param paramVo
	 * @return
	 */
	@RequestMapping(value = "/deleteByUuid", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteByUuid(HttpSession session, @ModelAttribute TSesErrorLog paramVo) {
		String tcd = "TSesErrorLogController.deleteByUuid";
		String opNm = "商户D+1结算费率-删除";
		try{
			LOGGER.info(tcd, "", opNm + "--begin");
			tSesErrorLogService.insert(paramVo);
			int num = tSesErrorLogService.delete(paramVo.getUuid());
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