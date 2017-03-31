<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${mapperPackage}.${classNameD}Mapper">
	<resultMap id="BaseResultMap" type="${domainPackage}.${classNameD}" >
	 <id column="UUID" property="uuid" jdbcType="VARCHAR" />
	 <#list tableCarrays as tableCarray>
	 <result column="${tableCarray.columnName}" property="${tableCarray.columnNameX}"/>
	</#list>
	</resultMap>
	
	<sql id="whereQueryCondition">
		<#list tableCarrays as tableCarray>
			<if test="${tableCarray.columnNameX}!= null and ${tableCarray.columnNameX}!= ''">
				${tableCarray.columnName}=${specific}{${tableCarray.columnNameX}}
			</if>
		</#list>
	</sql>
	
	<select id="findByCondition" parameterType="java.util.Map" resultMap="BaseResultMap">
		${stringCarrayNames7}
		SELECT
			${stringCarrayNames3}
		FROM ${dbUser}.${tableName}
		WHERE
			<include refid="whereQueryCondition"></include>
		${stringCarrayNames8}
	</select>
	
	<select id="findByConditionCount" parameterType="java.util.Map" resultType="java.lang.Integer">
		SELECT
			COUNT(*) 
		FROM ${dbUser}.${tableName}
		WHERE
		<include refid="whereQueryCondition"></include>
	</select>
	
	<insert id="insert" parameterType="${domainPackage}.${classNameD}">
		INSERT INTO ${dbUser}.${tableName} (
			<#list tableCarrays as tableCarray>
				${tableCarray.columnName},
			</#list>
		) VALUES (
			<#list tableCarrays as tableCarray>
				${specific}{${tableCarray.columnNameX}},
			</#list>
		)
	</insert>
	
	
	<select id="getByKey" parameterType="String" resultMap="BaseResultMap">
		SELECT
			${stringCarrayNames3}
		FROM 
			${dbUser}.${tableName}
		WHERE
			uuid=${specific}{uuid}
	</select>
	
	<update id="update" parameterType="${domainPackage}.${classNameD}">
		UPDATE ${dbUser}.${tableName} 
		SET
			<#list tableCarrays as tableCarray>
				${tableCarray.columnName}=${specific}{${tableCarray.columnNameX}},
			</#list>
		WHERE
			uuid=${specific}{uuid}
	</update>
	
	<delete id="delete" parameterType="String">
		DELETE 
			${dbUser}.${tableName} 
		WHERE
			uuid=${specific}{uuid}
	</delete>
	
</mapper>
