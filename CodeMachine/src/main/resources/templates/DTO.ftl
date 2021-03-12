package com.yineng.wjs.web.rest.${name_small}.dto;

import com.yineng.wjs.comm.annotation.Comment;
import com.yineng.wjs.comm.base.bean.BaseDTO;
import lombok.Getter;
import lombok.Setter;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @Description ${table_annotation} DTO
 * @author ${author}
 * @date ${date}
 */
@Getter
@Setter
public class ${table_name}DTO extends BaseDTO {

<#if model_column?exists>
    <#list model_column as model>
        <#if (model.columnType = 'int' || model.columnType = 'INT')>
        /**
        * ${model.columnComment}
        */
        @Comment("${model.columnComment}")
        private Integer ${model.changeColumnName?uncap_first};

        </#if>
        <#if (model.columnType = 'TINYINT' || model.columnType = 'tinyint')>
        /**
        * ${model.columnComment}
        */
        @Comment("${model.columnComment}")
        private <#if model.columnSize != '3'>Boolean</#if><#if model.columnSize = '3'>Byte</#if> ${model.changeColumnName?uncap_first};

        </#if>
        <#if (model.columnType = 'BIT' || model.columnType = 'bit')>
        /**
        * ${model.columnComment}
        */
        @Comment("${model.columnComment}")
        private Boolean ${model.changeColumnName?uncap_first};

        </#if>
        <#if ((model.columnType = 'varchar' || model.columnType = 'text' || model.columnType = 'VARCHAR' || model.columnType = 'TEXT')
        && model.columnName != 'CREATE_USER_ID' && model.columnName != 'MODIFY_USER_ID' && model.columnName?index_of("YN_XTGL_USER_INFO_ID") == -1 && model.columnName?index_of("_ID")==-1)  || model.columnName?index_of("_IDS")!=-1>
        /**
        * ${model.columnComment}
        */
        @Comment("${model.columnComment}")
        private String ${model.changeColumnName?uncap_first};

        </#if>
        <#if (model.columnType = 'timestamp' || model.columnType = 'datetime' || model.columnType = 'DATETIME' || model.columnType = 'DATE' || model.columnType = 'date')>
        /**
        * ${model.columnComment}
        */
        @Comment("${model.columnComment}")
        @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
        @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
        private Date ${model.changeColumnName?uncap_first};

        </#if>
        <#if (model.columnType = 'double' || model.columnType = 'DOUBLE')>
        /**
        * ${model.columnComment}
        */
        @Comment("${model.columnComment}")
        private Double ${model.changeColumnName?uncap_first};

        </#if>
        <#if ((model.columnName?index_of("_ID")!=-1 || model.columnName?index_of("_id")!=-1) && model.columnName != 'CREATE_USER_ID' && model.columnName != 'MODIFY_USER_ID' && model.columnName?index_of("YN_XTGL_USER_INFO_ID") == -1 && model.columnName?index_of("_IDS")==-1)>
        /**
        * ${model.columnComment}
        */
        @Comment("${model.columnComment}")
        private String ${model.entityName}Id;

        </#if>
        <#if (model.columnName?index_of("YN_XTGL_USER_INFO_ID") != -1 || model.columnName = 'CREATE_USER_ID' || model.columnName = 'MODIFY_USER_ID')>
        /**
        * ${model.columnComment}
        */
        @Comment("${model.columnComment}")
        private String ${model.changeColumnName?uncap_first}Name;

        </#if>
    </#list>
</#if>
}
