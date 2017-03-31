package com.zqg.cct.service;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zqg.cct.domain.TSesErrorLog;
import com.zqg.cct.mapper.TSesErrorLogMapper;


/**
 * @title  TSesErrorLogService
 * @author zhao_qg
 * @date   20170331 15:40:42
 */
 @Service
public class TSesErrorLogService {
	@Autowired
	private TSesErrorLogMapper tSesErrorLogMapper;

	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20170331 15:40:42
	 * @param map
	 * @return
	 */
	public List<TSesErrorLog> findByCondition(Map<String,Object> map) {
		return  tSesErrorLogMapper.findByCondition(map);
	}
	
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20170331 15:40:42
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map) {
		return  tSesErrorLogMapper.findByConditionCount(map);
	}
	
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20170331 15:40:42
	 * @param uuid
	 * @return
	 */
	public TSesErrorLog getByKey(String uuid) {
		return  tSesErrorLogMapper.getByKey(uuid);
	}
	
	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20170331 15:40:42
	 * @param tSesErrorLog
	 * @return
	 */
	public int update(TSesErrorLog tSesErrorLog) {
		return  tSesErrorLogMapper.update(tSesErrorLog);
	}
	
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date   20170331 15:40:42
	 * @param tSesErrorLog
	 * @return
	 */
	public int insert(TSesErrorLog tSesErrorLog) {
		return  tSesErrorLogMapper.insert(tSesErrorLog);
	}
	
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20170331 15:40:42
	 * @param uuid
	 * @return
	 */
	public int delete(String uuid) {
		return  tSesErrorLogMapper.delete(uuid);
	}
	
}