package com.zqg.cct.domain;

public class TableItem {
	private String columnId;
	private String columnName;
	private String isPrimaryKey;
	private String dataType;
	private String comments;// 注释
	private String dataLength;
	private String nullable;
	private String dataPrecision;
	private String dataScale;
	private String columnNameD;// 大写
	private String columnNameX;// 小写
	private String queryRule; // 查询规则
	private String queryType; //查询类型
	private String queryShow;//列表页面展示字段
	private String queryAdd;//添加页面展示字段
	public String getColumnName() {
		return columnName;
	}

	public String getQueryRule() {
		return queryRule;
	}

	public void setQueryRule(String queryRule) {
		this.queryRule = queryRule;
	}

	public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getDataLength() {
		return dataLength;
	}

	public void setDataLength(String dataLength) {
		this.dataLength = dataLength;
	}

	public String getNullable() {
		return nullable;
	}

	public void setNullable(String nullable) {
		this.nullable = nullable;
	}

	public String getDataPrecision() {
		return dataPrecision;
	}

	public void setDataPrecision(String dataPrecision) {
		this.dataPrecision = dataPrecision;
	}

	public String getDataScale() {
		return dataScale;
	}

	public void setDataScale(String dataScale) {
		this.dataScale = dataScale;
	}

	public String getColumnNameD() {
		return columnNameD;
	}

	public void setColumnNameD(String columnNameD) {
		this.columnNameD = columnNameD;
	}

	public String getColumnNameX() {
		return columnNameX;
	}

	public void setColumnNameX(String columnNameX) {
		this.columnNameX = columnNameX;
	}

	public String getColumnId() {
		return columnId;
	}

	public void setColumnId(String columnId) {
		this.columnId = columnId;
	}

	public String getIsPrimaryKey() {
		return isPrimaryKey;
	}

	public void setIsPrimaryKey(String isPrimaryKey) {
		this.isPrimaryKey = isPrimaryKey;
	}

	public String getQueryShow() {
		return queryShow;
	}

	public void setQueryShow(String queryShow) {
		this.queryShow = queryShow;
	}

	public String getQueryAdd() {
		return queryAdd;
	}

	public void setQueryAdd(String queryAdd) {
		this.queryAdd = queryAdd;
	}
}
