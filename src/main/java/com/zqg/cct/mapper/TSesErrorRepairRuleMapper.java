package com.zqg.cct.mapper;
import java.util.*;
import java.util.Map;
import com.zqg.cct.domain.TSesErrorRepairRule;
import com.zqg.cct.mapper.TSesErrorRepairRuleMapper;

/**
 * @title  TSesErrorRepairRuleMapper
 * @author zhao_qg
 * @date   20170511 19:39:48
 */
public interface TSesErrorRepairRuleMapper {
	
	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20170511 19:39:48
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map);
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20170511 19:39:48
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map);
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20170511 19:39:48
	 * @param uuid
	 * @return
	 */
	public TSesErrorRepairRule getByKey(TSesErrorRepairRule paramVo); 
	
	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20170511 19:39:48
	 * @param tSesErrorLog
	 * @return
	 */
	public int update(TSesErrorRepairRule tSesErrorRepairRule);
	
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date   20170511 19:39:48
	 * @param tSesErrorLog
	 * @return
	 */	public int insert(TSesErrorRepairRule tSesErrorRepairRule);
	 
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20170511 19:39:48
	 * @param uuid
	 * @return
	 */
	public int delete(Map<String,Object> map);
}