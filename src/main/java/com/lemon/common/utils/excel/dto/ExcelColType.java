//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.0-b26-ea3 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.lemon.common.utils.excel.dto;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlType;



/**
 * <p>Java class for ExcelColType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ExcelColType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;attribute name="displayFormat" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="excelColId" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="excelColIndex" type="{http://www.w3.org/2001/XMLSchema}int" />
 *       &lt;attribute name="excelColName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="excelColWidth" type="{http://www.w3.org/2001/XMLSchema}int" />
 *       &lt;attribute name="wrap" type="{http://www.w3.org/2001/XMLSchema}boolean" />
 *       &lt;attribute name="imp" type="{http://www.w3.org/2001/XMLSchema}boolean" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ExcelColType")
public class ExcelColType {

    @XmlAttribute
    protected String displayFormat;
    @XmlAttribute
    protected String excelColId;
    @XmlAttribute
    protected Integer excelColIndex;
    @XmlAttribute
    protected String excelColName;
    @XmlAttribute
    protected Integer excelColWidth;
    @XmlAttribute
    protected Boolean wrap;
    
    @XmlAttribute
    protected Boolean  imp;

    public Boolean isImp() {
		return imp;
	}

	public void setImp(Boolean imp) {
		this.imp = imp;
	}

	/**
     * Gets the value of the displayFormat property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDisplayFormat() {
        return displayFormat;
    }

    /**
     * Sets the value of the displayFormat property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDisplayFormat(String value) {
        this.displayFormat = value;
    }

    /**
     * Gets the value of the excelColId property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getExcelColId() {
        return excelColId;
    }

    /**
     * Sets the value of the excelColId property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setExcelColId(String value) {
        this.excelColId = value;
    }

    /**
     * Gets the value of the excelColIndex property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getExcelColIndex() {
        return excelColIndex;
    }

    /**
     * Sets the value of the excelColIndex property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setExcelColIndex(Integer value) {
        this.excelColIndex = value;
    }

    /**
     * Gets the value of the excelColName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getExcelColName() {
        return excelColName;
    }

    /**
     * Sets the value of the excelColName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setExcelColName(String value) {
        this.excelColName = value;
    }

    /**
     * Gets the value of the excelColWidth property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getExcelColWidth() {
        return excelColWidth;
    }

    /**
     * Sets the value of the excelColWidth property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setExcelColWidth(Integer value) {
        this.excelColWidth = value;
    }

    /**
     * Gets the value of the wrap property.
     * 
     * @return
     *     possible object is
     *     {@link Boolean }
     *     
     */
    public Boolean isWrap() {
        return wrap;
    }

    /**
     * Sets the value of the wrap property.
     * 
     * @param value
     *     allowed object is
     *     {@link Boolean }
     *     
     */
    public void setWrap(Boolean value) {
        this.wrap = value;
    }

}