package ${servicePackage};
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ${domainPackage}.${classNameD};
import ${mapperPackage}.${classNameD}Mapper;


/**
 * @title  ${classNameD}Service
 * @author ${classAuthor}
 * @date   ${classTime}
 */
 @Service
public class ${classNameD}Service {
	@Autowired
	private ${classNameD}Mapper ${classNameX}Mapper;
	/**
	 * @description: 获取付款类型字段
	 * @return map
	 * @author ${classAuthor}
	 * @data ${classTime}
	 */
	public List<Map<String, Object>> getCustomStore(){
		return  ${classNameX}Mapper.getCustomStore();
	}
	<#if isQuery == "true">
	/**
	 * 根据条件查询
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param map
	 * @return
	 */
	public List<${classNameD}> findByCondition(Map<String,Object> map) {
		return  ${classNameX}Mapper.findByCondition(map);
	}
	</#if>
	<#if isQuery == "true">
	/**
	 * 根据条件查询总数
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map) {
		return  ${classNameX}Mapper.findByConditionCount(map);
	}
	</#if>
	<#if isQuery == "true">
	/**
	 * 根据主键查询详细
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param uuid
	 * @return
	 */
	public ${classNameD} getByKey(${classNameD} paramVo) {
		return  ${classNameX}Mapper.getByKey(paramVo);
	}
	</#if>
	
	<#if isUpdate=="true">
	/**
	 * 更新
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param tSesErrorLog
	 * @return
	 */
	public int update(${classNameD} ${classNameX}) {
		return  ${classNameX}Mapper.update(${classNameX});
	}
	</#if>
	<#if isAdd == "true">
	/**
	 * 插入
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param tSesErrorLog
	 * @return
	 */
	public int insert(${classNameD} ${classNameX}) {
		return  ${classNameX}Mapper.insert(${classNameX});
	}
	</#if>
	<#if isDetele=="true">
	/**
	 * 根据主键删除
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param uuid
	 * @return
	 */
	public int delete(Map<String,Object> map) {
		return  ${classNameX}Mapper.delete(map);
	}
	</#if>
}