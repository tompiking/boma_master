package com.qingke.boma.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {
	
	/**
	 * 将指定的日期按照指定的格式转换为字符串
	 * @param date 指定的日期
	 * @param format 指定的格式
	 * @return
	 */
	public static String getdate(Date date,String format){
		SimpleDateFormat sdf = new SimpleDateFormat();
		return sdf.format(date);
	}
	public static String getSystemTime(){
		return getdate(new Date(), Const.DATE_FORMAT);
	}
}
