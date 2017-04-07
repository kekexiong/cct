package ${domainPackage};
<#list domainImportPackageList as importPackage>
import ${importPackage};
</#list>
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

/**
 * @description  ${classNameD}domain
 * @author ${classAuthor}
 * @date   ${classTime}
 * @review ${reviewAuthor}/${reviewDate}
 */
public class ${classNameD} {
	<#list tableCarrays as tableCarray>
	/**
	 * <#if tableCarray.comments??>${tableCarray.comments}</#if>
	 */
	<#if (tableCarray.queryType)?? && tableCarray.queryType == "01" && tableCarray.queryRule == "02">
		public ${tableCarray.dataType} ${tableCarray.columnNameX}beginDt;
		public ${tableCarray.dataType} ${tableCarray.columnNameX}endDt;
		public ${tableCarray.dataType} ${tableCarray.columnNameX};
		<#else>
		public ${tableCarray.dataType} ${tableCarray.columnNameX};
	</#if>
	
	</#list>
	
	public ${classNameD}() {
		super();
	}
	
	<#list tableCarrays as tableCarray>
	/**
	 * get <#if tableCarray.comments??>${tableCarray.comments}</#if>
	 */
	<#if (tableCarray.queryType)?? && tableCarray.queryType == "01" && tableCarray.queryRule == "02">
		public ${tableCarray.dataType} get${tableCarray.columnNameD}beginDt() {
			return ${tableCarray.columnNameX}beginDt;
		}
		public ${tableCarray.dataType} get${tableCarray.columnNameD}endDt() {
			return ${tableCarray.columnNameX}endDt;
		}
		public ${tableCarray.dataType} get${tableCarray.columnNameD}() {
			return ${tableCarray.columnNameX};
		}
	<#else>
		public ${tableCarray.dataType} get${tableCarray.columnNameD}() {
			return ${tableCarray.columnNameX};
		}
	</#if>
	
	/**
	 * set <#if tableCarray.comments??>${tableCarray.comments}</#if>
	 */
	<#if (tableCarray.queryType)?? && tableCarray.queryType == "01" && tableCarray.queryRule == "02">
		public void set${tableCarray.columnNameD}(${tableCarray.dataType} ${tableCarray.columnNameX}) {
			this.${tableCarray.columnNameX} = ${tableCarray.columnNameX};
		}
		public void set${tableCarray.columnNameD}beginDt(${tableCarray.dataType} ${tableCarray.columnNameX}beginDt) {
			this.${tableCarray.columnNameX}beginDt = ${tableCarray.columnNameX}beginDt;
		}
		public void set${tableCarray.columnNameD}endDt(${tableCarray.dataType} ${tableCarray.columnNameX}endDt) {
			this.${tableCarray.columnNameX}endDt = ${tableCarray.columnNameX}endDt;
		}
	<#else>
		public void set${tableCarray.columnNameD}(${tableCarray.dataType} ${tableCarray.columnNameX}) {
			this.${tableCarray.columnNameX} = ${tableCarray.columnNameX};
		}
	</#if>
	 
	</#list>
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.SHORT_PREFIX_STYLE);
	}
}
