<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${mapperPackage}.${classNameD}Mapper">
	<resultMap id="${classNameX}Map" type="${domainPackage}.${classNameD}" >
	 <#list tableCarrays as tableCarray>
	 <result column="${tableCarray.columnName}" property="${tableCarray.columnNameX}"/>
	</#list>
	</resultMap>
	
	<sql id="whereQueryCondition">
	<where>
		<#list tableCarrays as tableCarray>
			<#if (tableCarray.queryType)?? && tableCarray.queryType == "01" && tableCarray.queryRule != "02">
				<if test="${classNameX}.${tableCarray.columnNameX}!= null and ${classNameX}.${tableCarray.columnNameX}!= ''">
					and ${tableCarray.columnName}=${specific}{${classNameX}.${tableCarray.columnNameX}}
				</if>
			</#if>
			<#if (tableCarray.queryType)?? && tableCarray.queryType == "01" && tableCarray.queryRule == "02">
				<if test="${classNameX}.${tableCarray.columnNameX}beginDt!= null and ${classNameX}.${tableCarray.columnNameX}beginDt!= ''">
					and ${tableCarray.columnName}&gt;=${specific}{${classNameX}.${tableCarray.columnNameX}beginDt}
				</if>
				<if test="${classNameX}.${tableCarray.columnNameX}endDt!= null and ${classNameX}.${tableCarray.columnNameX}endDt!= ''">
					and ${tableCarray.columnName}&lt;=${specific}{${classNameX}.${tableCarray.columnNameX}endDt}
				</if>
			</#if>
		</#list>
		</where>
	</sql>
	
	<#if isQuery == "01">
	<select id="findByCondition" parameterType="java.util.Map" resultType="Map">
		${stringCarrayNames7}
		SELECT
			<#list tableCarrays as tableCarray> 
				<#if (tableCarray.columnName??)>
					<#if (tableCarray.isAddColumnName??) && tableCarray.isAddColumnName == "0">
						t.${tableCarray.columnName} as "${tableCarray.columnNameX}"<#if (tableCarray_has_next)>,</#if>
					</#if>
					<#if (tableCarray.isAddColumnName??) && tableCarray.isAddColumnName == "1">
						'' as "${tableCarray.columnNameX}"<#if (tableCarray_has_next)>,</#if>
					</#if>
				</#if>
			</#list>
			<!-- 请在此关联查询表 -->
		FROM ${dbUser}.${tableName} t
			<include refid="whereQueryCondition"></include>
			${stringCarrayNames8}
	</select>
	</#if>
	<#if isQuery == "01">
	<select id="findByConditionCount" parameterType="java.util.Map" resultType="java.lang.Integer">
		SELECT
			COUNT(*) 
		FROM ${dbUser}.${tableName}
		<include refid="whereQueryCondition"></include>
	</select>
	</#if>
	<#if isAdd == "01">
	<insert id="insert" parameterType="${domainPackage}.${classNameD}">
		INSERT INTO ${dbUser}.${tableName} (
			<#list insertCarrays as tableCarray>
					${tableCarray.columnName}<#if (tableCarray_has_next)>,</#if>
			</#list>
		) VALUES (
			<#list insertCarrays as tableCarray>
					${specific}{${tableCarray.columnNameX},jdbcType=VARCHAR}<#if (tableCarray_has_next)>,</#if>
			</#list>
		)
	</insert>
	</#if>
	<#if isQuery == "01">
	<select id="getByKey" parameterType="${domainPackage}.${classNameD}" resultMap="${classNameX}Map">
		SELECT
			${stringCarrayNames3}
		FROM 
			${dbUser}.${tableName}
		WHERE
			<#list tableCarrays as tableCarray>
  				<#if (tableCarray.isPrimaryKey??) && tableCarray.isPrimaryKey == "√">
  					${tableCarray.columnName}=${specific}{${tableCarray.columnNameX}}
  				</#if>
  			</#list>
	</select>
	</#if>
	<#if isUpdate=="01">
	<update id="update" parameterType="${domainPackage}.${classNameD}">
		UPDATE ${dbUser}.${tableName} 
		SET
			<#list updateCarrays as tableCarray>
					${tableCarray.columnName}=${specific}{${tableCarray.columnNameX}}<#if (tableCarray_has_next)>,</#if>
			</#list>
		WHERE
			<#list tableCarrays as tableCarray>
  				<#if (tableCarray.isPrimaryKey??) && tableCarray.isPrimaryKey == "√">
  					${tableCarray.columnName}=${specific}{${tableCarray.columnNameX}}
  				</#if>
  			</#list>
			
	</update>
	</#if>
	<#if isDetele=="01">
	<delete id="delete" parameterType="java.util.Map">
 		delete from ${dbUser}.${tableName}
 		where 
	 		<#list tableCarrays as tableCarray>
  				<#if (tableCarray.isPrimaryKey??) && tableCarray.isPrimaryKey == "√">
  					${tableCarray.columnName}
  				</#if>
  			</#list>
 		  in 
		<foreach item="item" index="index" collection="uuids" open="(" separator="," close=")">  
  			${specific}{item}
 		</foreach>
	</delete>
	</#if>
	<#list tableCarrays as tableCarray>
	<#if (tableCarray.queryRule??) && tableCarray.queryRule == "05">
	<select id="get${tableCarray.columnNameD}" resultType="Map">
	<!-- 请在此处拼写查询sql 查询字段替代“”-->
		select "" as "${tableCarray.columnNameX}_Code",
			   "" as "${tableCarray.columnNameX}_Name" 
		from T t
	</select>
		
	</#if>
	</#list>
</mapper>
