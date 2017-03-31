package com.zqg.cct.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;

import com.zqg.cct.domain.TableDomain;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FileWriterFactory {

	private static Configuration cfg;
	public static final int DOMAIN = 1;
	public static final int JSP = 2;
	public static final int CONTROLLER = 6;
	public static final int SERVICE = 3;
	public static final int MAPPER = 4;
	public static final int MAPPER_XML = 5;
	private static String templateUrl = "com/zqg/cct/template/";
	Configuration configuration = FileWriterFactory.getConfiguration(templateUrl);
	public static Configuration getConfiguration(String url) {
		if (cfg == null) {
			cfg = new Configuration();
			
			url = FileWriterFactory.class.getResource("/").getPath() + url;
			System.out.println(url);
			File file = new File(url);
			try {
				cfg.setDefaultEncoding("UTF-8");
				cfg.setDirectoryForTemplateLoading(file);
				cfg.setObjectWrapper(new DefaultObjectWrapper());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return cfg;
	}

	/**
	 * 
	 * @param cfg
	 *            解析对象
	 * @param templateName
	 *            模板名称
	 * @param root
	 *            数据对象
	 * @param packageName
	 *            包名称
	 * @param fileName
	 *            生成文件名称
	 */
	public static void dataSourceOut(String templateName,TableDomain table, String fileName, int type) {

		Template temp = null;
		try {
			getConfiguration(templateUrl);
			temp = cfg.getTemplate(templateName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		Writer out = null;
		try {
			String packageName = "";
			switch (type) {
			case DOMAIN:
				packageName = table.getDomainPackage();
				break;
			case JSP:
				packageName = table.getJspPackage();
				break;
			case SERVICE:
				packageName = table.getServicePackage();
				break;
			case MAPPER:
				packageName = table.getMapperPackage();
				break;
			case MAPPER_XML:
				packageName = table.getMapperXmlPackage();
				break;
			case CONTROLLER:
				packageName = table.getControllerPackage();
				break;
			}
			packageName = packageName.replace(".", "/");
			//String url = FileWriterFactory.class.getResource("/").getPath() +"/" + packageName + "/" + fileName;
			String url = table.getBasePath()+"/src/main/java/"  + packageName + "/" + fileName;
			if(MAPPER_XML==type){
				url= table.getBasePath()+"/src/main/resources/"  + packageName + "/" + fileName;
			}
			File file = new File(url);
			// 文件存在删除
			if(file.exists()){
				file.delete();//删除文件
			}
			//out = new FileWriter(file);
			  // 编码设置3  
            out= new BufferedWriter(new OutputStreamWriter(  
                    new FileOutputStream(file), "UTF-8"));
			temp.setEncoding("UTF-8");
			temp.process(table, out);
			temp.process(table, new OutputStreamWriter(System.out));
			out.flush();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static void dataSourceOut(Configuration cfg, String templateName,
			Object root, String fileName) {
		Template temp = null;
		try {
			temp = cfg.getTemplate(templateName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		Writer out = null;
		try {
			if (fileName != null && !"".equals(fileName)) {
				String packageName = "";
				packageName = packageName.replace(".", "/");
				String url = "src/" + packageName + "/" + fileName;
				File file = new File(url);
				out = new FileWriter(file);
				temp.process(root, out);
			}
			temp.process(root, new OutputStreamWriter(System.out));
			out.flush();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
