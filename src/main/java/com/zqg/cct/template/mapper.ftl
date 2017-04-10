package ${mapperPackage};
import java.util.*;
import java.util.Map;
import ${domainPackage}.${classNameD};
import ${mapperPackage}.${classNameD}Mapper;

/**
 * @title  ${classNameD}Mapper
 * @author ${classAuthor}
 * @date   ${classTime}
 */
public interface ${classNameD}Mapper {
	<#if isQuery == "true">
	/**
	 * 根据条件查询
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param map
	 * @return
	 */
	public List<${classNameD}> findByCondition(Map<String,Object> map);
	</#if>
	<#if isQuery == "true">
	/**
	 * 根据条件查询总数
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map);
	</#if>
	<#if isQuery == "true">
	/**
	 * 根据主键查询详细
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param uuid
	 * @return
	 */
	public ${classNameD} getByKey(${classNameD} paramVo); 
	</#if>
	
	<#if isUpdate=="true">
	/**
	 * 更新
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param tSesErrorLog
	 * @return
	 */
	public int update(${classNameD} ${classNameX});
	</#if>
	
	<#if isAdd == "true">
	/**
	 * 插入
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param tSesErrorLog
	 * @return
	 */	public int insert(${classNameD} ${classNameX});
	 </#if>
	 
	 <#if isDetele=="true">
	/**
	 * 根据主键删除
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param uuid
	 * @return
	 */
	public int delete(Map<String,Object> map);
	</#if>
}