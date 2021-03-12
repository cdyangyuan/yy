package com.yineng.wjs.cloud.entitys.mysql;

<#--import com.yineng.wjs.cloud.utils.annotation.Comment;-->
import com.yineng.wjs.product.manage.backend.entitys.base.${extends_entity};
import javax.persistence.*;
import java.util.Date;
import lombok.Getter;
import lombok.Setter;

/**
* @Description ${table_annotation} 实体
* @author ${author}
* @date ${date}
*/
@Getter
@Setter
@Entity
@Table(name="${table_name_small}")
<#--@Comment("${table_annotation}")-->
public class ${table_name} extends ${extends_entity} {

<#if model_column?exists>
    <#list model_column as model>
    <#if (model.columnType = 'int' || model.columnType = 'INT')>
    /**
    * ${model.columnComment}
    */
    @Column(name = "${model.columnName}")
    <#--@Comment("${model.columnComment}")-->
    private Integer ${model.changeColumnName?uncap_first};

    </#if>
    <#if (model.columnType = 'TINYINT' || model.columnType = 'tinyint')>
    /**
    * ${model.columnComment}
    */
    @Column(name = "${model.columnName}")
    <#--@Comment("${model.columnComment}")-->
    private <#if model.columnSize != '3'>Boolean</#if><#if model.columnSize = '3'>Byte</#if> ${model.changeColumnName?uncap_first};

    </#if>
    <#if (model.columnType = 'BIT' || model.columnType = 'bit')>
    /**
    * ${model.columnComment}
    */
    @Column(name = "${model.columnName}")
    <#--@Comment("${model.columnComment}")-->
    private Boolean ${model.changeColumnName?uncap_first};

    </#if>
    <#if ((model.columnType = 'varchar' || model.columnType = 'text' || model.columnType = 'VARCHAR' || model.columnType = 'TEXT')
      && model.columnName != 'CREATE_USER_ID' && model.columnName != 'MODIFY_USER_ID' && model.columnName?index_of("YN_XTGL_USER_INFO_ID") == -1 && model.columnName?index_of("_ID")==-1)  || model.columnName?index_of("_IDS")!=-1>
    /**
    * ${model.columnComment}
    */
    @Column(name = "${model.columnName}")
    <#--@Comment("${model.columnComment}")-->
    private String ${model.changeColumnName?uncap_first};

    </#if>
    <#if (model.columnType = 'timestamp' || model.columnType = 'datetime' || model.columnType = 'DATETIME' || model.columnType = 'DATE' || model.columnType = 'date')>
    /**
    * ${model.columnComment}
    */
    @Column(name = "${model.columnName}")
    <#--@Comment("${model.columnComment}")-->
    private Date ${model.changeColumnName?uncap_first};

    </#if>
    <#if (model.columnType = 'double' || model.columnType = 'DOUBLE')>
    /**
    * ${model.columnComment}
    */
    @Column(name = "${model.columnName}")
    <#--@Comment("${model.columnComment}")-->
    private Double ${model.changeColumnName?uncap_first};

    </#if>
    <#if ((model.columnName?index_of("_ID")!=-1 || model.columnName?index_of("_id")!=-1) && model.columnName != 'CREATE_USER_ID' && model.columnName != 'MODIFY_USER_ID' && model.columnName?index_of("YN_XTGL_USER_INFO_ID") == -1  && model.columnName?index_of("YN_USER_INFO_ID") == -1 && model.columnName?index_of("YN_")>-1)>
    /**
    * ${model.columnComment}
    */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "${model.columnName}")
    <#--@Comment("${model.columnComment}")-->
    private ${model.changeColumnName?cap_first} ${model.entityName};

    </#if>
    <#if (model.columnName?index_of("YN_XTGL_USER_INFO_ID") != -1 || model.columnName?index_of("YN_USER_INFO_ID") != -1 || model.columnName = 'CREATE_USER_ID' || model.columnName = 'MODIFY_USER_ID')>
    /**
    * ${model.columnComment}
    */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "${model.columnName}")
    <#--@Comment("${model.columnComment}")-->
    private ${user_table} ${model.changeColumnName?uncap_first};

    </#if>
    </#list>
</#if>
}
