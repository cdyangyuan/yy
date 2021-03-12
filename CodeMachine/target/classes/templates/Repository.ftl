package com.yineng.wjs.product.manage.backend.repository.mysql.${business_model};

import com.yineng.wjs.product.manage.backend.repository.base.BaseRepository;
import com.yineng.wjs.product.manage.backend.entitys.mysql.${table_name};
import org.springframework.data.jpa.repository.Query;
import java.util.List;

/**
 * @Description ${table_annotation} Repository
 * @author ${author}
 * @date ${date}
 */
public interface ${table_name}Repository extends BaseRepository<${table_name}, String> {

    /**
    * 根据ID获取${table_annotation}数据
    * @author ${author}
    * @date ${date}
    * @param id
    * @return ${table_name}
    */
    @Query("SELECT f FROM ${table_name} f WHERE f.id =?1")
    ${table_name} findOne(String id);

    /**
    * 根据ID集合查询${table_annotation}
    * @author ${author}
    * @date ${date}
    * @param ids id集合
    * @return List<${table_name}>
    */
    List<${table_name}> findByIdIn(List<String> ids);
}
