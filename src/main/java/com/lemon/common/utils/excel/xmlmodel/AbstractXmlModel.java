/**
 *Description XML工具类
 */

package com.lemon.common.utils.excel.xmlmodel;

import java.io.InputStream;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import com.lemon.common.utils.FileUtil;

public abstract class AbstractXmlModel {
    private Object rootModel;
    private String packageName;
    protected JAXBContext jaxbContext;

    public AbstractXmlModel(String packageName) throws Exception{
        this.packageName = packageName;
        jaxbContext = JAXBContext.newInstance(this.packageName);
    }

    public AbstractXmlModel(String packageName, String modelFileName) throws Exception{
        this(packageName);
        loadModel(modelFileName);
    }

    public void loadModel(String modelFileName) throws Exception{
      Unmarshaller unmarsh;
      InputStream in = null;
	try {
		in = FileUtil.getFileStream(modelFileName);
		unmarsh = jaxbContext.createUnmarshaller();
		this.rootModel = unmarsh.unmarshal(FileUtil.getFileStream(modelFileName));
	} catch (JAXBException e) {
		
		throw e;
	}finally{
		if(null != in){
			in.close();
		}
	}
      
    }

    @SuppressWarnings("unchecked")
	protected Object getRootModel(){
        return ((JAXBElement)this.rootModel).getValue();
    }
}
