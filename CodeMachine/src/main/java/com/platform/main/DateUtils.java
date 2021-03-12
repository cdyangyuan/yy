package com.platform.main;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @ClassName DateUtil
 * @Description 日期工具类
 * @author yangYuan
 * @Date 2018-3-9
 */
public class DateUtils {

    private static String patternDate = "yyyy-MM-dd";
    private static String patternDateTime = "yyyy-MM-dd HH:mm:ss";
    private static String patternYear = "yyyy";

	public static String formatDateTime(Date date) {
		SimpleDateFormat sdf= new SimpleDateFormat(patternDateTime);
		return sdf.format(date);
	}

    public static String formatDate(Date date) {
        SimpleDateFormat sdf= new SimpleDateFormat(patternDate);
        return sdf.format(date);
    }

	public static String formatYear(Date date) {
		SimpleDateFormat sdf= new SimpleDateFormat(patternYear);
		return sdf.format(date);
	}

}
