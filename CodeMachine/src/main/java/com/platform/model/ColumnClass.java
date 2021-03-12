package com.platform.model;

/**
 * @author yineng
 */
public class ColumnClass {

    /** 数据库字段名称 **/
    private String columnName;
    /** 数据库字段类型 **/
    private String columnType;
    /** 数据库字段首字母小写且去掉下划线字符串 **/
    private String changeColumnName;
    /** 数据库字段注释 **/
    private String columnComment;
    /** 数据库字段长度 **/
    private String columnSize;

    /**
     * 实体命名（特殊处理）
     */
    private String entityName;

    public String getColumnComment() {
        return columnComment;
    }

    public void setColumnComment(String columnComment) {
        this.columnComment = columnComment;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getColumnType() {
        return columnType;
    }

    public void setColumnType(String columnType) {
        this.columnType = columnType;
    }

    public String getChangeColumnName() {
        return changeColumnName;
    }

    public void setChangeColumnName(String changeColumnName) {
        this.changeColumnName = changeColumnName;
    }

    public String getColumnSize() {
        return columnSize;
    }

    public void setColumnSize(String columnSize) {
        this.columnSize = columnSize;
    }

    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    @Override
    public String toString() {
        return "ColumnClass{" +
                "columnName='" + columnName + '\'' +
                ", columnType='" + columnType + '\'' +
                ", changeColumnName='" + changeColumnName + '\'' +
                ", columnComment='" + columnComment + '\'' +
                ", columnSize='" + columnSize + '\'' +
                ", entityName='" + entityName + '\'' +
                '}';
    }
}
