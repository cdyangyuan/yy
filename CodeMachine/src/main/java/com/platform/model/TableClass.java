package com.platform.model;

/**
 * @author yineng
 */
public class TableClass {

    /**
     * 表名
     */
    private String tableName;

    /**
     * 表注释
     */
    private String tableComment;

    private String changeTableName;

    /**
     * 变量名
     */
    private String varName;

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getTableComment() {
        return tableComment;
    }

    public void setTableComment(String tableComment) {
        this.tableComment = tableComment;
    }

    public String getChangeTableName() {
        return changeTableName;
    }

    public void setChangeTableName(String changeTableName) {
        this.changeTableName = changeTableName;
    }

    public String getVarName() {
        return varName;
    }

    public void setVarName(String varName) {
        this.varName = varName;
    }

}
