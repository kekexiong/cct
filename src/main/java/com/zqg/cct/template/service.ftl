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
	 * 根据条件查询
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param map
	 * @return
	 */
	public List<${classNameD}> findByCondition(Map<String,Object> map) {
		return  ${classNameX}Mapper.findByCondition(map);
	}
	
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
	
	/**
	 * 根据主键查询详细
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param uuid
	 * @return
	 */
	public ${classNameD} getByKey(String uuid) {
		return  ${classNameX}Mapper.getByKey(uuid);
	}
	
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
	
	/**
	 * 根据主键删除
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param uuid
	 * @return
	 */
	public int delete(String uuid) {
		return  ${classNameX}Mapper.delete(uuid);
	}
	
}