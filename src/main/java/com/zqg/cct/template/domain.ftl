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
	 * ${tableCarray.comments}
	 */
	public ${tableCarray.dataType} ${tableCarray.columnNameX};
	</#list>
	
	public ${classNameD}() {
		super();
	}
	
	<#list tableCarrays as tableCarray>
	/**
	 * get ${tableCarray.comments}
	 */
	public ${tableCarray.dataType} get${tableCarray.columnNameD}() {
		return ${tableCarray.columnNameX};
	}
	/**
	 * set ${tableCarray.comments}
	 */
	public void set${tableCarray.columnNameD}(${tableCarray.dataType} ${tableCarray.columnNameX}) {
		this.${tableCarray.columnNameX} = ${tableCarray.columnNameX};
	} 
	</#list>
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.SHORT_PREFIX_STYLE);
	}
}
