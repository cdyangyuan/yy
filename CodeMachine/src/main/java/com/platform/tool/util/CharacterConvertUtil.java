package com.platform.tool.util;

import com.sun.xml.internal.ws.util.StringUtils;

/**
 * 判断是否是关联ID及字段去下划线首字母大写处理
 * @author yangYuan
 */
public class CharacterConvertUtil {

    public String replaceUnderLineAndUpperCase(String str) {
        if (str.equals("CREATE_USER_ID") || str.equals("create_user_id")){
            return "createUser";
        }
        if (str.equals("MODIFY_USER_ID") || str.equals("modify_user_id")){
            return "modifyUser";
        }
        Boolean isKey = isKeyId(str);
        if (isKey){
            str = str.substring(0,str.length() - 4);
        }
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        int count = sb.indexOf("_");
        while (count != 0) {
            int num = sb.indexOf("_", count);
            count = num + 1;
            if (num != -1) {
                if(isKey && count == str.length()){

                } else {
                    char ss = sb.charAt(count);
                    char ia = (char) (ss - 32);
                    sb.replace(count, count + 1, ia + "");
                }
            }
        }
        String result = sb.toString().replaceAll("_", "");
        if (str.length() > 9 && (str.substring(str.length()-3).equals("_ID") || str.substring(str.length()-3).equals("_id"))){
            String resultStart = result.substring(0,6);
            return resultStart.toUpperCase() + result.substring(0,result.length() - 2).replace(resultStart,"");
        }
        return StringUtils.capitalize(result);
    }

    private Boolean isKeyId(String str){
        Boolean isKey = false;
        if (str.length() > 4){
            String lastStr = str.substring(str.length() - 4);
            return (lastStr.equals("UUID") || lastStr.equals("uuId") || lastStr.equals("uuid"));
        }
        return isKey;
    }

}
