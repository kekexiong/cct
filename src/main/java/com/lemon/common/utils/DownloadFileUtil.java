package com.lemon.common.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

public class DownloadFileUtil {
	public static final DownloadFileUtil instance = new DownloadFileUtil();
	
	private DownloadFileUtil(){
		
	}
	
	public static DownloadFileUtil getInstance(){
		return instance;
	}
	
	
	/**
	 * 文件下载
	 * @param file
	 * @param response
	 */
	public void downLoad(File file,HttpServletResponse response) throws IOException{
		String fileName = file.getName();
		if(null != file){
			  OutputStream out =null;
			  InputStream in = null;
			try {
				byte[] b = fileName.getBytes("GBK"); 
				fileName = new String(b,"8859_1");
				in=new  BufferedInputStream( new  FileInputStream(file));
				byte [] buffer  =   new   byte [in.available()];
				in.read(buffer);
				response.reset();   
				response.setHeader("content-disposition","attachment; filename="+fileName);   
				out = new BufferedOutputStream(response.getOutputStream());
	            out.write(buffer);
	            
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				if(null !=null){
					in.close();
				} 
				if(null != out){
					out.close();
				}
			}
		}
	}
	/**
	 * 文件下载
	 * @param file
	 * @param response
	 */
	public void downLoad(File file,String fileName ,HttpServletResponse response) throws IOException{
		if(null != file){
			  OutputStream out =null;
			  InputStream in = null;
			try {
				byte[] b = fileName.getBytes("GBK"); 
				fileName = new String(b,"8859_1");
				in=new  BufferedInputStream( new  FileInputStream(file));
				byte [] buffer  =   new   byte [in.available()];
				in.read(buffer);
				response.reset();
				response.setHeader("content-disposition","attachment; filename="+fileName);   
				out = new BufferedOutputStream(response.getOutputStream());
	            out.write(buffer);
	            
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				if(null !=null){
					in.close();
				}
				if(null != out){
					out.close();
				}
			}
		}
	}
	/**
	 * use for blob 
	 * @param buffer
	 * @param fileName
	 * @param response
	 */
	
	public void downLoad(byte[] buffer,String fileName,HttpServletResponse response) throws IOException{
		if(null != buffer){
			BufferedOutputStream out =null;
			try {
				fileName = fileName==null?"":fileName;
				byte[] b = fileName.getBytes("GBK"); 
				fileName = new String(b,"8859_1");
				response.reset();   
				out = new BufferedOutputStream(response.getOutputStream());
				response.setHeader("content-disposition","attachment; filename="+fileName);   
	            out.write(buffer);
	            out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				if(null != out){
					out.close();
				}			
			}
		}
	}
	
	/**
	 * 下载excel文件,并且服务器上不生成文件
	 * xingxin
	 * 2014-07-18
	 * @param HSSFWorkbook wb
	 * @param fileName
	 * @param response
	 */
	
	public void downLoadExcel(HSSFWorkbook wb,String fileName,HttpServletResponse response) throws IOException{		
		if(wb != null){
			BufferedOutputStream out =null;
			try {
				fileName = fileName==null?"":fileName;
				byte[] b = fileName.getBytes("GBK"); 
				fileName = new String(b,"8859_1");
				response.reset();
				response.setContentType("application/x-msdownload");
				response.setHeader("Content-disposition","attachment;filename="+fileName);
				response.setCharacterEncoding("utf-8");
				out = new BufferedOutputStream(response.getOutputStream());
				wb.write(out);
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				if(null != out){
					out.close();
				}			
			}
		}
	}
	
	/**
	 * 下载excel文件,并且服务器上不生成文件
	 * xingxin
	 * 2014-07-18
	 * @param HSSFWorkbook wb
	 * @param fileName
	 * @param response
	 */
	
	public void downLoadExcel(Workbook wb,String fileName,HttpServletResponse response) throws IOException{		
		if(wb != null){
			BufferedOutputStream out =null;
			try {
				fileName = fileName==null?"":fileName;
				byte[] b = fileName.getBytes("GBK"); 
				fileName = new String(b,"8859_1");
				response.reset();
				response.setContentType("application/x-msdownload");
				response.setHeader("Content-disposition","attachment;filename="+fileName);
				response.setCharacterEncoding("utf-8");
				out = new BufferedOutputStream(response.getOutputStream());
				wb.write(out);		
				out.flush();
				out.close();			
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				if(null != out){
					out.close();
				}
				if(wb instanceof SXSSFWorkbook){
					((SXSSFWorkbook) wb).dispose();
				}
			}
		}
	}
}
