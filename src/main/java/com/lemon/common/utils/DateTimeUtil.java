/**
 * Description:时间格式转换工具类
 */
package com.lemon.common.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

public class DateTimeUtil {
    public class TimeFormater {
        public final static String yyyyMMdd = "yyyy-MM-dd";
        public static final String YYYYMMDD = "yyyyMMdd";
        public static final String HHmmss = "HHmmss";        
        public static final String yyyyMMddhhmmss = "yyyy-MM-dd HH:mm:ss";
        public static final String yyyyMMddhhmmss2 = "yyyyMMddHHmmss";
        public static final String yyyyMMddhhmmssSSS = "yyyyMMddHHmmssSSS";
        public static final String YEAR = "yyyy";
        public static final String MONTH = "MM";
        public static final String DAY = "dd";
        public static final String HOUR = "HH";
        public static final String MINUTE = "mm";
        public static final String SECOND = "ss";
        public static final String ENDATE="EEE MMM dd HH:mm:ss zzz yyyy";
        public static final String YYYYMM = "yyyyMM";
    }



    public static long getTime() {
        return System.currentTimeMillis();
    }

    public static Timestamp getTimestamp(){
    	return new Timestamp(System.currentTimeMillis());
    }
    
    public static java.sql.Date getDate(){
    	return new java.sql.Date(System.currentTimeMillis());
    }    
    
    public static Date StringToDate(String format, String date) throws
            ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat(format);
        return formatter.parse(date);
    }

    public static String DateToString(String format, Date date) throws
            ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat(format);
        return formatter.format(date);
    }

    public static Date parseFormatDate(String strDate) throws ParseException {
        return StringToDate(TimeFormater.yyyyMMdd, strDate);
    }   
    /**
     * 取得指定月份的第一天
     *
     * @param strdate String
     * @return String
     */
    public String getMonthBegin(String strdate) throws ParseException {
        java.util.Date date = parseFormatDate(strdate);
        return formatDateByFormat(date, "yyyy-MM") + "-01";
    }

    /**
     * 取得指定月份的最后一天
     *
     * @param strdate String
     * @return String
     */
    public String getMonthEnd(String strdate) throws ParseException {
        java.util.Date date = parseFormatDate(getMonthBegin(strdate));
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, 1);
        calendar.add(Calendar.DAY_OF_YEAR, -1);
        return formatDate(calendar.getTime());
    }

    /**
     * 常用的格式化日期
     *
     * @param date Date
     * @return String
     */
    public String formatDate(java.util.Date date) {
        return formatDateByFormat(date, "yyyy-MM-dd");
    }

    /**
     * 以指定的格式来格式化日期
     *
     * @param date Date
     * @param format String
     * @return String
     */
    public static String formatDateByFormat(java.util.Date date, String format) {
        String result = "";
        if (date != null) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat(format);
                result = sdf.format(date);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }


    public static java.util.Date parseDate(String dateStr, String format) {
        java.util.Date date = null;
        try {
            java.text.DateFormat df = new java.text.SimpleDateFormat(format);
            String dt = dateStr.replaceAll("-", "/");
            if ((!dt.equals(""))) {
                dt += format.substring(dt.length()).replaceAll("[YyMmDdHhSs]", "0");
            }
            date = (java.util.Date) df.parse(dt);
        } catch (Exception e) {
        	System.out.println(e.toString());
        }
        return date;
    }

    public static java.util.Date parseDate(String dateStr) {
        return parseDate(dateStr, "yyyy/MM/dd");
    }

    public static java.util.Date parseDate(java.sql.Date date) {
        return date;
    }

    public static java.sql.Date parseSqlDate(java.util.Date date) {
        if (date != null) {
            return new java.sql.Date(date.getTime());
        } else {
            return null;
        }
    }

    public static Timestamp parseSqlTimeDate(java.util.Date date) {
        if (date != null) {
            return new java.sql.Timestamp(date.getTime());
        } else {
            return null;
        }
    }
    
    public static java.sql.Date parseSqlDate(String dateStr, String format) {
        java.util.Date date = parseDate(dateStr, format);
        return parseSqlDate(date);
    }
    
    public static java.sql.Date parseSqlDateEEE(String dateStr, String format) throws ParseException {
    	SimpleDateFormat sdf = new SimpleDateFormat(format,Locale.ENGLISH);
    	Date date =sdf.parse(dateStr);
        return parseSqlDate(date);
    }
    
    public static java.sql.Timestamp parseSqlTimeDateEEE(String dateStr, String format) throws ParseException {
    	SimpleDateFormat sdf = new SimpleDateFormat(format,Locale.ENGLISH);
    	Date date =sdf.parse(dateStr);
        return parseSqlTimeDate(date);
    }
    
    /**
     * 必须是英文格式 
     * @param dateStr
     * @param format
     * @return
     * @throws ParseException
     */
    public static String  parseSqlDateEEEFormat(String dateStr, String format) throws ParseException {
    	SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy",Locale.ENGLISH);
    	Date date =sdf.parse(dateStr);
        return format(date,format);
    }
    public static java.sql.Date parseSqlDate(String dateStr) {
        return parseSqlDate(dateStr, "yyyy/MM/dd");
    }


    public static java.sql.Timestamp parseTimestamp(String dateStr,
            String format) {
        java.util.Date date = parseDate(dateStr, format);
        if (date != null) {
            long t = date.getTime();
            return new java.sql.Timestamp(t);
        } else {
            return null;
        }
    }

    public static java.sql.Timestamp parseTimestamp(String dateStr) {
        return parseTimestamp(dateStr, "yyyy/MM/dd HH:mm:ss");
    }

    /**
     * 格式化输出日期
     *
     * @param date
     * 日期
     * @param format
     * 格式
     * @return 返回字符型日期
     */
    public static String format(java.util.Date date, String format) {
        String result = "";
        try {
            if (date != null) {
                java.text.DateFormat df = new java.text.SimpleDateFormat(format);
                result = df.format(date);
            }
        } catch (Exception e) {
        	throw new RuntimeException(e);
        }
        return result;
    }

    public static String format(java.util.Date date) {
        return format(date, "yyyy/MM/dd");
    }

    /**
     * 返回年份
     *
     * @param date
     * 日期
     * @return 返回年份
     */
    public static int getYear(java.util.Date date) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTime(date);
        return c.get(java.util.Calendar.YEAR);
    }

    /**
     * 返回月份
     *
     * @param date
     * 日期
     * @return 返回月份
     */
    public static int getMonth(java.util.Date date) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTime(date);
        return c.get(java.util.Calendar.MONTH) + 1;
    }

    /**
     * 返回日份
     *
     * @param date
     * 日期
     * @return 返回日份
     */
    public static int getDay(java.util.Date date) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTime(date);
        return c.get(java.util.Calendar.DAY_OF_MONTH);
    }

    /**
     * 返回小时
     *
     * @param date
     * 日期
     * @return 返回小时
     */
    public static int getHour(java.util.Date date) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTime(date);
        return c.get(java.util.Calendar.HOUR_OF_DAY);
    }

    /**
     * 返回分钟
     *
     * @param date
     * 日期
     * @return 返回分钟
     */
    public static int getMinute(java.util.Date date) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTime(date);
        return c.get(java.util.Calendar.MINUTE);
    }

    /**
     * 返回秒钟
     *
     * @param date
     * 日期
     * @return 返回秒钟
     */
    public static int getSecond(java.util.Date date) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTime(date);
        return c.get(java.util.Calendar.SECOND);
    }

    /**
     * 返回毫秒
     *
     * @param date
     * 日期
     * @return 返回毫秒
     */
    public static long getMillis(java.util.Date date) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTime(date);
        return c.getTimeInMillis();
    }

    /**
     * 返回字符型日期
     *
     * @param date
     * 日期
     * @return 返回字符型日期
     */
    public static String getDate(java.util.Date date) {
        return format(date, "yyyy/MM/dd");
    }

    /**
     * 返回字符型时间
     *
     * @param date
     * 日期
     * @return 返回字符型时间
     */
    public static String getTime(java.util.Date date) {
        return format(date, "HH:mm:ss");
    }

    /**
     * 返回字符型日期时间
     *
     * @param date
     * 日期
     * @return 返回字符型日期时间
     */
    public static String getDateTime(java.util.Date date) {
        return format(date, "yyyy/MM/dd HH:mm:ss");
    }
    
    /**
	 *得到某日期时间段内所有年月 
	 *@param Date startDate,Date endDate
	 *@return List
	 *@throws ParseException
	 */
    public static List<String> getMonthList(Date startDate,Date endDate) throws ParseException {  
    	Set<String> set = new HashSet<String>();
        List<String> monthList = new ArrayList<String>();
        SimpleDateFormat sdf = new SimpleDateFormat(TimeFormater.YYYYMM);
        
		List<Date> dateList = getDateList(startDate,endDate);
		for(Date date:dateList)  
		{  
	    	String month= sdf.format(date);
	    	if (set.add(month)){
	        	monthList.add(month);
	     	}
	     }
		return monthList;    
    } 
    public static List getDateList(Date startDate,Date endDate) throws ParseException{  
		List<Date> dateList=new ArrayList<Date>();
		GregorianCalendar gc1 = new GregorianCalendar();
		GregorianCalendar gc2 = new GregorianCalendar();  
		gc1.setTime(startDate);  
		gc2.setTime(endDate);  
		while(!gc1.after(gc2)){  
			dateList.add(gc1.getTime());
			gc1.add(Calendar.DAY_OF_YEAR,1);               
		} 
		return dateList;  
    }
    
    /**
     * 日期相加
     *
     * @param date
     * 日期
     * @param day
     * 天数
     * @return 返回相加后的日期
     */
    public static java.util.Date addDate(java.util.Date date, int day) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTimeInMillis(getMillis(date) + ((long) day) * 24 * 3600 * 1000);
        return c.getTime();
    }

    /**
     * 日期相减
     *
     * @param date
     * 日期
     * @param date1
     * 日期
     * @return 返回相减后的日期
     */
    public static int diffDate(java.util.Date date, java.util.Date date1) {
        return (int) ((getMillis(date) - getMillis(date1)) / (24 * 3600 * 1000));
    }
    
    /**
     * 日期相减
     *
     * @param date
     * 日期
     * @param day
     * 天数
     * @return 返回相减后的日期
     */
    public static java.util.Date diffDate2(java.util.Date date, int day) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTimeInMillis(getMillis(date) - ((long) day) * 24 * 3600 * 1000);
        return c.getTime();
    }
    
    /**
     * 
    * @Title: formatStrDate
    * @Description: 转换数据列表里的日期字符串字段格式(如：20140715转换成2014-07-15)
    * @return: void
    * @param dataMapList
    * @param keys
    * @author: xingxin
    * @date: 2014年7月15日 下午9:01:44
     */
    public static void formatStrDate(List<Map<String,Object>> dataMapList,String...keys){
    	if(keys==null||keys.length<=0){
    		return;
    	}
    	for(int i=0;i<dataMapList.size();i++){
    		Map<String,Object> dataMap = dataMapList.get(i);
    		formatStrDate(dataMap,keys);
    	}
    }
    
    public static void formatStrDate(Map<String,Object> dataMap,String...keys){
    	if(dataMap==null||keys==null||keys.length<=0){
    		return;
    	}
		for(int k=0;k<keys.length;k++){
			String key = keys[k];
			if(dataMap.containsKey(key)){
				Object objDate = dataMap.get(key);
				if(objDate instanceof String){
					String strDate = (String)objDate;
					strDate = formatStrDate(strDate);
					dataMap.put(key, strDate);
				}
			}
		}
    }
    
    public static String formatStrDate(String strDate){
    	if(strDate!=null&&strDate.length()==8){
			strDate = strDate.substring(0,4)+"-"+strDate.substring(4,6)+"-"+strDate.substring(6);
		}
    	return strDate;
    }
    /**
     * 
    * @Title: formatStrTime
    * @Description: 转换数据列表里的时间字符串字段格式(如：210322转换成21:03:22)
    * @return: void
    * @param dataMapList
    * @param keys
    * @author: xingxin
    * @date: 2014年7月15日 下午9:04:52
     */
    public static void formatStrTime(List<Map<String,Object>> dataMapList,String...keys){
    	if(keys==null||keys.length<=0){
    		return;
    	}
    	for(int i=0;i<dataMapList.size();i++){
    		Map<String,Object> dataMap = dataMapList.get(i);
    		formatStrTime(dataMap,keys);
    	}
    }
    
    public static void formatStrTime(Map<String,Object> dataMap,String...keys){
    	if(dataMap==null||keys==null||keys.length<=0){
    		return;
    	}
		for(int k=0;k<keys.length;k++){
			String key = keys[k];
			if(dataMap.containsKey(key)){
				Object objTime = dataMap.get(key);
				if(objTime instanceof String){
					String strTime = (String)objTime;
					strTime = formatStrTime(strTime);
					dataMap.put(key, strTime);
				}
			}
		}
    }
    
    public static String formatStrTime(String strTime){
    	if(strTime!=null&&strTime.length()==6){
    		strTime = strTime.substring(0,2)+":"+strTime.substring(2,4)+":"+strTime.substring(4);
		}
    	return strTime;
    }
    /**
     * 
    * @Title: formatStrDateTime
    * @Description: 转换数据列表里的时间字符串字段格式(如：20140715210322转换成2014-07-15 21:03:22)
    * @return: void
    * @param dataMapList
    * @param keys
    * @author: xingxin
    * @date: 2014年7月15日 下午9:04:09
     */
    public static void formatStrDateTime(List<Map<String,Object>> dataMapList,String...keys){
    	if(keys==null||keys.length<=0){
    		return;
    	}
    	for(int i=0;i<dataMapList.size();i++){
    		Map<String,Object> dataMap = dataMapList.get(i);
    		formatStrDateTime(dataMap,keys);
    	}
    }
    
    public static void formatStrDateTime(Map<String,Object> dataMap,String...keys){
    	if(dataMap==null||keys==null||keys.length<=0){
    		return;
    	}
		for(int k=0;k<keys.length;k++){
			String key = keys[k];
			if(dataMap.containsKey(key)){
				Object objDateTime = dataMap.get(key);
				if(objDateTime instanceof String){
					String strDateTime = (String)objDateTime;
					strDateTime = formatStrDateTime(strDateTime);
					dataMap.put(key, strDateTime);
				}
			}
		}
    }
    
    public static String formatStrDateTime(String strDateTime){
    	if(strDateTime!=null&&strDateTime.length()==14){
    		strDateTime = strDateTime.substring(0,4)+"-"+strDateTime.substring(4,6)+"-"+strDateTime.substring(6,8)
    				+ " " + strDateTime.substring(8,10)+":"+strDateTime.substring(10,12)+":"+strDateTime.substring(12);
		}
    	return strDateTime;
    }
    
    public static String getStrTime(){
    	SimpleDateFormat sdf = new SimpleDateFormat(TimeFormater.yyyyMMddhhmmssSSS);
    	String strTime = sdf.format(new Date());
    	return strTime;
    }
    
    public static void main(String[] args) {
    	try {
    		//String str = null;
    		Object obj = null;
    		System.out.println((String)obj);
    		System.out.println(DateTimeUtil.parseSqlDateEEEFormat("Thu Jan 01 10:30:54 CST 1970","HH:mm:ss"));
    		System.out.println(formatStrDate("19881007"));
    		System.out.println(formatStrTime("230934"));
    		System.out.println(formatStrDateTime("19881007230934"));
    		System.out.println(getStrTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
    }
}

