package com.zqg.cct.mapper;
import java.util.*;
import java.util.Map;
import com.zqg.cct.domain.TSesBankBkMsg;
import com.zqg.cct.mapper.TSesBankBkMsgMapper;

/**
 * @title  TSesBankBkMsgMapper
 * @author zhao_qg
 * @date   20170516 17:12:18
 */
public interface TSesBankBkMsgMapper {
	
	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20170516 17:12:18
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map);
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20170516 17:12:18
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map);
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20170516 17:12:18
	 * @param uuid
	 * @return
	 */
	public TSesBankBkMsg getByKey(TSesBankBkMsg paramVo); 
	
	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20170516 17:12:18
	 * @param tSesErrorLog
	 * @return
	 */
	public int update(TSesBankBkMsg tSesBankBkMsg);
	
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date   20170516 17:12:18
	 * @param tSesErrorLog
	 * @return
	 */	public int insert(TSesBankBkMsg tSesBankBkMsg);
	 
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20170516 17:12:18
	 * @param uuid
	 * @return
	 */
	public int delete(Map<String,Object> map);
}