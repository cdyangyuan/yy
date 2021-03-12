/**
* @Project: ${project_name}
* @Package com.yineng.k12.modules.${name_small}.service
* @author ${author}
* @date ${date}
* @Copyright: ${year} www.yineng.com.cn Inc. All rights reserved.
* @version V1.0
*/
package com.yineng.k12.modules.${name_small}.service;

import com.yineng.k12.common.exception.K12Exception;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.util.List;

/**
 * @Description ${table_annotation} 接口
 * @author ${author}
 * @date ${date}
 */
public interface ${table_name}Service {

    /**
     * 根据查询条件分页获取${table_annotation}
     * @param ${var_name}DTO  查询条件
     * @param pageable 分页
     * @return ${table_annotation}分页数据
     * @author ${author}
     * @date ${date}
     * @throws K12Exception 查询出错
     */
    public Page<${table_name}DTO> find${table_name}ByConditions(${table_name}DTO ${var_name}DTO, Pageable pageable) throws K12Exception;

    /**
     * 根据id查询${table_annotation}
     * @param ids ${table_annotation}主键
     * @return ${table_annotation}DTO集合
     * @author ${author}
     * @date ${date}
     * @throws K12Exception 查询出错
     */
    public List<${table_name}DTO> find${table_name}ByIds(List<String> ids) throws K12Exception;

    /**
     * 保存${table_annotation}
     * @param ${var_name}DTO ${table_annotation}DTO
     * @return 操作信息
     * @throws K12Exception 保存出错
     */
    public void saveOrUpdate${table_name}(${table_name}DTO ${var_name}DTO) throws K12Exception;

    /**
     * 根据主键删除${table_annotation}
     * @param ids ${table_annotation}主键
     * @return 操作信息
     * @author ${author}
     * @date ${date}
     * @throws K12Exception 删除出错
     */
    public void delete${table_name}ByIds(List<String> ids) throws K12Exception;

}
