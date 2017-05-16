
/**
 *Description 文件操作工具类
 */
package com.lemon.common.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.lemon.common.utils.log.BapLogUtil;

public class FileUtil {
	static final Logger logger = LoggerFactory
			.getLogger(FileUtil.class);
    private FileUtil() {
    }

    public static void rename(String oldFileName, String newFileName) {
        File newFile = new File(newFileName);
        File oldFile = new File(oldFileName);
        if(!newFile.getName().equals(oldFile.getName())){
            newFile.delete();
            oldFile.renameTo(newFile);
            oldFile.delete();
        }
    }

    public static String getPathSeparator() {
        return File.separator;
    }

    public static boolean isExist(String pathName) {
        File file = new File(pathName);
        return file.exists();
    }

    public static String[] getFileNamesInDir(String dirPath) {
        File file = new File(dirPath);
        String[] fileNames = file.list();
        return fileNames;
    }

    public static URL getFileURL(String filename) {
        return FileUtil.class.getClassLoader().getResource(filename);
    }

    public static InputStream getFileStream(String filename) {
        return FileUtil.class.getClassLoader().getResourceAsStream(filename);
    }
    
    public static InputStream getFileStreamByPath(String path) throws FileNotFoundException {
        return new FileInputStream(path);
    }    

    public static void copyFile(String srcFilePath, String destFilePath) throws
            IOException {
        FileUtils.copyFile(new File(srcFilePath), new File(destFilePath));
    }
    
    public static void copyFile(File srcFile, String destFilePath) throws
	    IOException {
    	FileUtils.copyFile(srcFile, new File(destFilePath));
	}
    
    public static String readFileToStr(URI uri) throws IOException{
    	return FileUtils.readFileToString(new File(uri));
    }

    public static String readFileToStr(String filePath, String encoding) throws
            IOException {
        return FileUtils.readFileToString(new File(filePath), encoding);
    }

    public static List readLineByName(String srcFileName, String encoding) throws
            IOException {
        return FileUtils.readLines(new File(getClassFolderPath() + srcFileName),
                                   encoding);
    }

    public static List readLineByPath(String srcFilePath, String encoding) throws
            IOException {
        return FileUtils.readLines(new File(srcFilePath), encoding);
    }

    public static void deleteFile(String filePath) {
        File file = new File(filePath);
        if (file.exists())
            file.delete();
    }

    public static void deleteDir(String dirPath) throws IOException {
        FileUtils.deleteDirectory(new File(dirPath));
    }

    public static void writeFile(String filePath, String content,
                                 String encoding) throws IOException {
        FileUtils.writeStringToFile(new File(filePath), content, encoding);
    }

    public static void writeFile(List filePath, List content, String encoding) throws
            IOException {
        for (int i = 0; i < content.size(); i++) {
            FileUtils.writeStringToFile(new File((String) filePath.get(i)),
                                        (String) content.get(i), encoding);
        }
    }

    public static String getClassFolderPath() {
        ClassLoader classLoader = FileUtil.class.getClassLoader();
        String path = getClassLoadPath(classLoader).getPath();
        logger.info(BapLogUtil.genLogs("getClassFolderPath", "----path info=")+path);
        //path = path.substring(1);
        path = path.replace("%20", " ");
        logger.info(BapLogUtil.genLogs("getClassFolderPath", "----path replace=")+path);
        return path;
    }

    public static String getWebFolderPath() {
        ClassLoader classLoader = FileUtil.class.getClassLoader();
        String path = getClassLoadPath(classLoader).getPath();
        path = path.substring(0, path.indexOf("WEB-INF"));
        //path = path.substring(1);
        path = path.replace("%20", " ");
        return path;
    }

    public static String getClassFolderFilePath(String fileName) {
        ClassLoader classLoader = FileUtil.class.getClassLoader();
        String path = getClassLoadPath(classLoader).getPath();
        //path = path.substring(1);
        path = path.replace("%20", " ");
        return path + fileName;
    }

	private static URL getClassLoadPath(ClassLoader classLoader) {
		if(classLoader.getResource("/")!=null){
			return classLoader.getResource("/");
		}else{
			return classLoader.getResource("");
		}
		
	}
    public static String getFileCharset(String fileName){
    	InputStream ios = null;;
		try {
			ios = new FileInputStream(fileName);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}  
		return getFileCharset(ios);
    }

    public static String getFileCharset(InputStream ios){
    	String fileCharset = "UTF-8";
		try{   
		  byte[] b=new byte[3];   
		  ios.read(b);   
		  ios.close();   
		  if(!(b[0]==-17&&b[1]==-69&&b[2]==-65)) { 
			  fileCharset = "GBK";   
		  }
		}catch(Exception e){   
		   e.printStackTrace();   
		} 
		return fileCharset;
    }

    public static String[] listFile(String srcPath) {
        File file = new File(srcPath);
        return file.list();
    }
    
    public static List<File> listDirs(String dirPath){
    	File dir = new File(dirPath);
    	return listDirs(dir, null);
    }    
    
    public static List<File> listDirs(File dir, List<File> dirs){
    	if(null == dirs){
    		dirs = new ArrayList<File>();
    	}
    	dirs.add(dir);
    	for(File tmpFile : dir.listFiles()){
    		if(tmpFile.isDirectory()){
    			listDirs(tmpFile, dirs);
    		}
    	}
    	return dirs;
    }

    public static void copyDir(String srcPath, String descPath) throws
            IOException {
        FileUtils.copyDirectory(new File(srcPath), new File(descPath));
    }
    /**
     * 
     * @param inputStream
     * @param fileName
     * @throws Exception
     */
    public static void saveFile(InputStream inputStream, String fileName)throws Exception {
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            bis = new BufferedInputStream(inputStream);
            bos = new BufferedOutputStream(new FileOutputStream(fileName));
            int bytesRead = 0;
            byte[] buffer = new byte[5 * 1024];
            while ((bytesRead = bis.read(buffer)) != -1) {
                bos.write(buffer, 0, bytesRead);//���ļ�д�������
            }
        }finally {
            if (bos != null) {
                try {
                    bos.close();
                }
                catch (IOException e) {
                	e.printStackTrace();
                }
            }
            if (bis != null) {
                try {
                    bis.close();
                }
                catch (IOException e) {
                	e.printStackTrace();
                }
            }
        }
    }    

    public static void makeDir(String path){
        File file = new File(path);
        if(!(file.exists() && file.isDirectory())){
            file.mkdirs();
        }
    }

    /**
     * 
    * @Title: mkdirs
    * @Description: 创建文件路径
    * @return: boolean
    * @param filePath
    * @throws IOException
    * @author: xingxin
    * @date: 2014年11月10日 下午3:30:31
     */
    public static boolean mkdirs(String filePath) throws IOException{
    	boolean bMkdirs = false;
    	File file = new File(filePath);
		if (!file.exists()) {
			bMkdirs = file.mkdirs();
			if(!bMkdirs){
				throw new IOException("创建文件路径失败:"+filePath);
			}
		}
		return bMkdirs;
    }
    

    public static int countWordInFile(String srcFilePath, String word) throws IOException {
        InputStream fin = new FileInputStream(srcFilePath);
        return countWordInFile(fin, word);
    }
    
    public static int countWordInFile(InputStream fin, String word) throws IOException {
        int count = 0;
        byte[] buffer = new byte[5 * 1024];
        byte[] bufferPre = new byte[5 * 1024];
        byte[] wordBytes = word.getBytes();

        boolean flag ;
          int bufferSize = fin.read(buffer);
        int bufferSizePre = fin.read(bufferPre);
        int offset = 0;
        while(bufferSize != -1){
            for(int i=offset; i<bufferSize; i++){
                flag = true;
                for(int j=0; j<wordBytes.length; j++){
                    if((i + j) < bufferSize){
                        if (buffer[i + j] != wordBytes[j]) {
                            flag = false;
                            break;
                        }
                    }else{
                        if (bufferPre[(i + j) % bufferSize] != wordBytes[j]) {
                            flag = false;
                            break;
                        }
                    }
                }
                if(flag) {
                    if(i + wordBytes.length >= bufferSize){
                        offset = (i + wordBytes.length) % bufferSize;
                    }else{
                        offset = 0;
                    }
                    count++;
                    i += (wordBytes.length-1);
                }
            }
            bufferSize = bufferSizePre;
            buffer = bufferPre;
            bufferPre = new byte[5*1024];
            bufferSizePre = fin.read(bufferPre);
        }
        return count;
    }    

    public static List<String> getPropertyFromContent(StringBuffer content, String propertyPre, boolean withPre){
    	List<String> properties = new ArrayList<String>();
    	if(null == content || null == propertyPre){
    		return properties;
    	}
    	byte[] buffer = content.toString().getBytes();
    	byte[] wordBytes = propertyPre.getBytes();
    	boolean flag = false;
    	String property = "";
        for(int i=0; i<buffer.length; i++){
        	if(flag){
        		if((buffer[i] >= 'A' && buffer[i] <= 'Z') || (buffer[i] >= 'a' && buffer[i] <= 'z') ||buffer[i] == '{' || buffer[i] == '}'){
        			property += (char)buffer[i];
        		}else{
        			if(property.trim().length()>0){
        				property = property.replace("{", "");
        				property = property.replace("}", "");
        				properties.add(property);
        			}
        			property = "";
        			flag = false;
        		}
        	}else{
        		int j=0;
	            for(; j<wordBytes.length; j++){
	                if((i + j) < buffer.length){
	                    if (buffer[i + j] != wordBytes[j]) {
	                        break;
	                    }
	                }
	            }
	            if(j == wordBytes.length){
	            	i += (j-1);
	            	flag = true;
	            	if(withPre){
	            		property += propertyPre;
	            	}
	            }
            }
        }
    	return properties;
    }
    
    public static int eliminate(StringBuffer content, String propertyPre, boolean withPre){
    	return 0;
    }

	/** 压缩文件
	 * @param directory
	 * @param zipFile
	 */
	public static void zip(String directory, String zipFile) {
		try {
			zipFile = zipFile.replaceAll("\\\\","/");
			int lastPos = zipFile.lastIndexOf("/");
			String zipDir = zipFile.substring(0,lastPos);
			new File(zipDir).mkdirs();
			ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipFile));
			fileZip(zos, new File(directory));
			zos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @param directory
	 * @param zipFile
	 */
	public static void unZip(String directory, String zipFile) {
		try {
			ZipInputStream zis = new ZipInputStream(
					new FileInputStream(zipFile));
			File f = new File(directory);
			f.mkdirs();
			fileUnZip(zis, f);
			zis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static void directoryZip(ZipOutputStream out, File f, String base)	throws Exception {
		if (f.isDirectory()) {
			File[] fl = f.listFiles();
			out.putNextEntry(new ZipEntry(base + "/"));
			if (base.length() == 0) {
				base = "";
			} else {
				base = base + "/";
			}
			for (int i = 0; i < fl.length; i++) {
				directoryZip(out, fl[i], base + fl[i].getName());
			}
		} else {
			out.putNextEntry(new ZipEntry(base));
			FileInputStream in = new FileInputStream(f);
			byte[] bb = new byte[2048];
			int aa = 0;
			while ((aa = in.read(bb)) != -1) {
				out.write(bb, 0, aa);
			}
			in.close();
		}
	}

	/**
	 * 压缩文件(File对象)
	 * @param zos
	 * @param file
	 * @throws Exception
	 */
	private static void fileZip(ZipOutputStream zos, File file) throws Exception {
		if (file.isFile()) {
			zos.putNextEntry(new ZipEntry(file.getName()));
			FileInputStream fis = new FileInputStream(file);
			byte[] bb = new byte[2048];
			int aa = 0;
			while ((aa = fis.read(bb)) != -1) {
				zos.write(bb, 0, aa);
			}
			fis.close();
		} else {
			directoryZip(zos, file, "");
		}
	}

	/**
	 * 
	 * @param zis
	 * @param file
	 * @throws Exception
	 */
	private static void fileUnZip(ZipInputStream zis, File file) throws Exception {
		ZipEntry zip = zis.getNextEntry();
		if (zip == null)
			return;
		String name = zip.getName();
		File f = new File(file.getAbsolutePath() + "/" + name);
		if (zip.isDirectory()) {
			f.mkdirs();
			fileUnZip(zis, file);
		} else {
			f.createNewFile();
			FileOutputStream fos = new FileOutputStream(f);
			byte b[] = new byte[2048];
			int aa = 0;
			while ((aa = zis.read(b)) != -1) {
				fos.write(b, 0, aa);
			}
			fos.close();
			fileUnZip(zis, file);
		}
	}	
	
	public static void showDir(File dir, String preFix){
		File[] files = dir.listFiles();
		for(File file : files){
			if(file.isDirectory()){
				System.out.println(preFix + file.getName());
				showDir(file, preFix + " ");
			}else{
				System.out.println(preFix + file.getName());
			}
		}
	}
	
    public static String parseStringWithNull(String str){
    	String s="";
    	if(str==null){
    		s="";
    	}else  if(str.trim().length()==0){
    		s="";
    	}else{
    		s=str.trim();
    	}
    	return s;
    }
    
    public static void main(String[] args)throws Exception{	
    	System.out.println(getWebFolderPath());
    }
}
