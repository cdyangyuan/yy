package com.platform.main;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.platform.model.ColumnClass;
import com.platform.model.TableClass;
import com.platform.tool.db.DBHelper;
import com.platform.tool.util.FreeMarkerTemplateUtils;
import freemarker.template.Template;
import java.io.*;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 生成代码文件配置类
 * @author yineng
 */
public class CodeGenerate {

    private static final String AUTHOR = "yangYuan";
    private static final String USER_TABLE = "YNUserInfo";
    private static final String YEAR = DateUtils.formatYear(new Date());
    private static final String PROJECT_NAME = "yn.wjs";
    private static final String CURRENT_DATE = DateUtils.formatDate(new Date());
    private static final String PACKAGE_NAME = "com.yineng.wjs";
    private static final String DISK_PATH = "D:\\codeMachineTest\\";
    private static final String BUSINESS_MODEL = "xxgl";

    private static void generateFile(List<ColumnClass> columnClassList, TableClass tableClass, String suffix, String templateName) throws Exception {
        String path = DISK_PATH + tableClass.getChangeTableName() + suffix;
        File mapperFile = new File(path);
        Map<String, Object> dataMap = Maps.newHashMap();
        if (null != columnClassList && columnClassList.size() > 0) {
            dataMap.put("extends_entity","BaseId");
            columnClassList.stream().filter(column -> column.getColumnName().toUpperCase().equals("IS_DEL")).forEach(column -> dataMap.put("extends_entity","BaseEntity"));
            columnClassList = columnClassList.stream().filter(column -> !column.getColumnName().toUpperCase().equals("IS_DEL")).collect(Collectors.toList());
            dataMap.put("model_column", columnClassList);
        }
        generateFileByTemplate(templateName, mapperFile, dataMap, tableClass);
    }

    private static void generateFileByTemplate(final String templateName, File file, Map<String, Object> dataMap, TableClass tableClass) throws Exception {
        Template template = FreeMarkerTemplateUtils.getTemplate(templateName);
        FileOutputStream fos = new FileOutputStream(file);
        dataMap.put("table_name_small", tableClass.getTableName());
        dataMap.put("name_small", BUSINESS_MODEL + tableClass.getTableName().toLowerCase().replaceAll("_",""));
        dataMap.put("table_name", tableClass.getChangeTableName());
        dataMap.put("var_name", tableClass.getVarName());
        dataMap.put("author", AUTHOR);
        dataMap.put("user_table", USER_TABLE);
        dataMap.put("project_name", PROJECT_NAME);
        dataMap.put("year", YEAR);
        dataMap.put("date", CURRENT_DATE);
        dataMap.put("package_name", PACKAGE_NAME);
        dataMap.put("business_model", BUSINESS_MODEL);
        dataMap.put("table_annotation", tableClass.getTableComment());
        Writer out = new BufferedWriter(new OutputStreamWriter(fos, "utf-8"), 10240);
        template.process(dataMap, out);
    }

    public static void main(String[] args) throws Exception {
        //b8e78689444b40809f0e865e6c0bc1fb
//        String tableName = "YN_XTGL_WEBSITE_TEMPLATES,YN_XTGL_COLUMN,YN_XTGL_COLUMN_MENU,YN_XTGL_COLUMN_PERSONAL,YN_XTGL_COLUMN_ROLE," +
//                "YN_XTGL_COLUMN_ROLE_MENU,YN_XTGL_COLUMN_SCHEME,YN_XTGL_INIT_COLUMN,YN_XTGL_INIT_MENU,YN_XTGL_INIT_PERSONAL,YN_XTGL_TEMPLATES_PICTURE";
        String tableName = "YN_BASE_CODE," +
                "YN_BASE_PROJECTOR," +
                "YN_BASE_MANUFACTURER," +
                "YN_BASE_AGENT," +
                "YN_BASE_WAREHOUSE," +
                "YN_MANUFACTURE_PLAN," +
                "YN_INTELLIGENT_PLATFORM," +
                "YN_SYSTEM_MENU," +
                "YN_SYSTEM_AUTH," +
                "YN_SYSTEM_ROLE," +
                "YN_USER_INFO," +
                "YN_USER_ACCOUNT," +
                "YN_USER_ROLE_MID";
        for (String table : tableName.split(",")) {
            DBHelper dbHelper = new DBHelper();
            List<TableClass> tableClassList = dbHelper.getTables(table);
            List<ColumnClass> columnClassList = Lists.newArrayList();
            for (TableClass tableClass: tableClassList) {
                columnClassList = dbHelper.getColumns(tableClass);
                String suffix = "DTO.java";
                String templateName = "DTO.ftl";
//            generateFile(columnClassList, tableClass,suffix,templateName);
//                suffix = ".java";
//                templateName = "Model.ftl";
//                generateFile(columnClassList, tableClass,suffix,templateName);
//            suffix = "Service.java";
//            templateName = "Service.ftl";
//            generateFile(columnClassList, tableClass,suffix,templateName);
//            suffix = "ServiceImpl.java";
//            templateName = "ServiceImpl.ftl";
//            generateFile(columnClassList, tableClass,suffix,templateName);
            suffix = "Repository.java";
            templateName = "Repository.ftl";
            generateFile(columnClassList, tableClass,suffix,templateName);
//            suffix = "Controller.java";
//            templateName = ".controller-h.ftl";
//            generateFile(columnClassList, tableClass,suffix,templateName);
//            suffix = "Controller.java";
//            templateName = "Controller.ftl";
//            generateFile(columnClassList, tableClass,suffix,templateName);
//            suffix = ".html";
//            templateName = ".ftl";
//            generateFile(columnClassList, tableClass,suffix,templateName);
//            suffix = "Detail.controller.js";
//            templateName = "Detail.controller.ftl";
//            generateFile(columnClassList, tableClass,suffix,templateName);
//            suffix = "Detail.html";
//            templateName = "Detail.ftl";
//            generateFile(columnClassList, tableClass,suffix,templateName);
//            suffix = "AddOrUpdate.controller.js";
//            templateName = "AddOrUpdate.controller.ftl";
//            generateFile(columnClassList, tableClass,suffix,templateName);
//            suffix = "AddOrUpdate.html";
//            templateName = "AddOrUpdate.ftl";
//            generateFile(columnClassList, tableClass,suffix,templateName);

            }
        }

    }

}