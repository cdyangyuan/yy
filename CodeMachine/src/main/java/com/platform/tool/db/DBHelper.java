package com.platform.tool.db;

import com.google.common.collect.Lists;
import com.platform.model.ColumnClass;
import com.platform.model.TableClass;
import com.platform.tool.util.CharacterConvertUtil;
import org.apache.commons.lang3.StringUtils;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * @Description 数据库连接类
 * @author yangYuan
 */
public class DBHelper {

//    private static final String URL = "jdbc:mysql://10.6.0.124:3306/YNK12?characterEncoding=utf8";
//    private static final String USER = "root";
//    private static final String PASSWORD = "Yn@k12k12";
//    private static final String DRIVER = "com.mysql.jdbc.Driver";

    private static final String URL = "jdbc:mysql://rm-uf6g008t91l7lt21s4o.mysql.rds.aliyuncs.com:3306/wjs_cloud_test1?useUnicode=true&characterEncoding=utf-8";
    private static final String USER = "wjs_test";
    private static final String PASSWORD = "YN@wjs@2020";
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final Integer TABLE_TYPE = 2;//表类型特点：1.首字母模块命名（YN_KCGL_INFO） 2.英文单词命名（YN_COURSE_INFO）

    public Connection getMySQLConnection() throws Exception {
        Class.forName(DRIVER);
        Properties props =new Properties();
        props.setProperty("user", USER);
        props.setProperty("password", PASSWORD);
        props.setProperty("remarks", "true"); //设置可以获取remarks信息
        props.setProperty("useInformationSchema", "true");//设置可以获取tables remarks信息
        return DriverManager.getConnection(URL, props);
    }

    public Connection getORACLEConnection() throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String url = null;//"jdbc:oracle:thin:@"+host+":"+port+":"+database;
        Properties props =new Properties();
        props.setProperty("user", USER);
        props.setProperty("password", PASSWORD);
        props.setProperty("remarks", "true"); //设置可以获取remarks信息
        return DriverManager.getConnection(url, props);
    }

    public List<TableClass> getTables(String tableName) throws Exception {
        Connection connection = new DBHelper().getMySQLConnection();
        DatabaseMetaData databaseMetaData = connection.getMetaData();
        if (null == tableName || "".contains(tableName)) {
            tableName = "%";
        }
        ResultSet rs = databaseMetaData.getTables(connection.getCatalog(), "%", tableName, new String[]{"TABLE"});
        CharacterConvertUtil characterConvertUtil = new CharacterConvertUtil();
        List<TableClass> tableClassList = Lists.newArrayList();
        while (rs.next()) {
            TableClass tableClass = new TableClass();
            tableClass.setTableName(rs.getString("TABLE_NAME"));
            tableClass.setTableComment(rs.getString("REMARKS"));
            String resultName = characterConvertUtil.replaceUnderLineAndUpperCase(tableClass.getTableName().toLowerCase());
            tableClass.setChangeTableName(resultName);
            String[] result = tableClass.getTableName().split("_");
            if (result.length > 2){
                if (TABLE_TYPE.equals(Integer.valueOf("1"))){
                    String resultStart = resultName.substring(0,(result[0].toString().length() + result[1].toString().length()));
                    tableClass.setChangeTableName(resultStart.toUpperCase() + resultName.replace(resultStart,""));
                } else {
                    String resultStart = resultName.substring(0,(result[0].toString().length() + result[1].toString().length()));
                    String modelStr = result[1].toString();
                    tableClass.setChangeTableName(result[0].toString().toUpperCase() + modelStr.substring(0,1).toUpperCase() + modelStr.substring(1).toLowerCase() + resultName.replace(resultStart,""));
                }

            }
            String var = String.valueOf(Character.toLowerCase(tableClass.getChangeTableName().charAt(0))) +
                    tableClass.getChangeTableName().substring(1);
            tableClass.setVarName(var);
            tableClassList.add(tableClass);
        }
        return tableClassList;
    }

    public List<ColumnClass> getColumns(TableClass tableClass) throws Exception {
        Connection connection = new DBHelper().getMySQLConnection();
        DatabaseMetaData databaseMetaData = connection.getMetaData();
        ResultSet resultSet = databaseMetaData.getColumns(connection.getCatalog(), "%", tableClass.getTableName(), "%");
        List<ColumnClass> columnClassList = new ArrayList<ColumnClass>();
        CharacterConvertUtil characterConvertUtil = new CharacterConvertUtil();
        while (resultSet.next()) {
            //id、is_del字段略过
            if ("id".equals(resultSet.getString("COLUMN_NAME").toLowerCase())) continue;
//            if ("is_del".equals(resultSet.getString("COLUMN_NAME").toLowerCase())) continue;
            ColumnClass columnClass = new ColumnClass();
            //获取字段名称
            columnClass.setColumnName(resultSet.getString("COLUMN_NAME"));
            //获取字段类型
            columnClass.setColumnType(resultSet.getString("TYPE_NAME"));
            //获取字段长度
            columnClass.setColumnSize(resultSet.getString("COLUMN_SIZE"));
            //转换字段名称，如 sys_name 变成 SysName
            columnClass.setChangeColumnName(characterConvertUtil.replaceUnderLineAndUpperCase(resultSet.getString("COLUMN_NAME").toLowerCase()));
            String lowerStr = columnClass.getColumnName().toLowerCase();
            String columnName = resultSet.getString("COLUMN_NAME");
            String[] array = columnName.split("_");
            if (StringUtils.isNotBlank(columnName) && array.length > 2){
                String modelStr = array[1].toString();
                if (lowerStr.startsWith("yn_") && lowerStr.endsWith("_id") && lowerStr.indexOf("yn_xtgl_user_info_id") == -1 && lowerStr.indexOf("yn_user_info_id") == -1){
                    if (TABLE_TYPE.equals(Integer.valueOf("1"))){
                        String resultStart = columnClass.getChangeColumnName().substring(0,(array[0].toString().length() + array[1].toString().length()));
                        columnClass.setEntityName(resultStart.toLowerCase() + columnClass.getChangeColumnName().replace(resultStart,""));
                    } else {
                        String resultStart = columnClass.getChangeColumnName().substring(0,(array[0].toString().length() + array[1].toString().length()));
                        columnClass.setEntityName(array[0].toString().toLowerCase() + modelStr.substring(0,1).toUpperCase() + modelStr.substring(1).toLowerCase() + columnClass.getChangeColumnName().replace(resultStart,""));
                        columnClass.setChangeColumnName(array[0].toString().toUpperCase() + modelStr.substring(0,1).toUpperCase() + modelStr.substring(1).toLowerCase() + columnClass.getChangeColumnName().replace(resultStart,""));
                    }
                } else if (lowerStr.indexOf("yn_xtgl_user_info_id") > -1 || lowerStr.indexOf("yn_user_info_id") > -1){
                    columnClass.setChangeColumnName(lowerStr.indexOf("yn_xtgl_user_info_id") > -1?"ynxtglUserInfo":"ynUserInfo");
                }
            }
            //字段在数据库的注释
            columnClass.setColumnComment(resultSet.getString("REMARKS"));
            columnClassList.add(columnClass);
        }
        return columnClassList;
    }

}
