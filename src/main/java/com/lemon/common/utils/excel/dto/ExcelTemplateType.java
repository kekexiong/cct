//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.0-b26-ea3 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.lemon.common.utils.excel.dto;

import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for ExcelTemplateType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ExcelTemplateType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="excelId" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="excelName" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="excelFileName" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="excelHead" type="{}ExcelHeadType"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
//@XmlAccessorType(AccessType.FIELD)
@XmlType(name = "ExcelTemplateType", propOrder = {
    "excelId",
    "excelName",
    "excelFileName",
    "excelHead"
})
public class ExcelTemplateType {

    protected String excelId;
    protected String excelName;
    protected String excelFileName;
    protected ExcelHeadType excelHead;

    /**
     * Gets the value of the excelId property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getExcelId() {
        return excelId;
    }

    /**
     * Sets the value of the excelId property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setExcelId(String value) {
        this.excelId = value;
    }

    /**
     * Gets the value of the excelName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getExcelName() {
        return excelName;
    }

    /**
     * Sets the value of the excelName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setExcelName(String value) {
        this.excelName = value;
    }

    /**
     * Gets the value of the excelFileName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getExcelFileName() {
        return excelFileName;
    }

    /**
     * Sets the value of the excelFileName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setExcelFileName(String value) {
        this.excelFileName = value;
    }

    /**
     * Gets the value of the excelHead property.
     * 
     * @return
     *     possible object is
     *     {@link ExcelHeadType }
     *     
     */
    public ExcelHeadType getExcelHead() {
        return excelHead;
    }

    /**
     * Sets the value of the excelHead property.
     * 
     * @param value
     *     allowed object is
     *     {@link ExcelHeadType }
     *     
     */
    public void setExcelHead(ExcelHeadType value) {
        this.excelHead = value;
    }

}