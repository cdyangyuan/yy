/**
* @Project: ${project_name}
* @Package com.yineng.k12.modules.${name_small}.service.impl
* @author ${author}
* @date ${date}
* @Copyright: ${year} www.yineng.com.cn Inc. All rights reserved.
* @version V1.0
*/
package com.yineng.k12.modules.${name_small}.service.impl;

import com.google.common.collect.Lists;
import com.yineng.k12.common.base.service.BaseServiceImpl;
import com.yineng.k12.common.constant.CommonExceptionCodeEnum;
import com.yineng.k12.common.exception.K12Exception;
import com.yineng.k12.config.page.CustomPageImpl;
import com.yineng.k12.domain.${table_name};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import javax.persistence.criteria.Predicate;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 * @Description ${table_annotation}接口实现
 * @author ${author}
 * @date ${date}
 */
@Service
@Transactional
public class ${table_name}ServiceImpl extends BaseServiceImpl<${table_name}, ${table_name}DTO> implements ${table_name}Service {

    @Autowired
    private ${table_name}Repository ${var_name}Repository;

    /**
     * 根据查询条件分页获取${table_annotation}
     * @param ${var_name}DTO  查询条件
     * @param pageable 分页
     * @return ${table_annotation}分页数据
     * @author ${author}
     * @date ${date}
     * @throws K12Exception 查询出错
     */
    @Override
    public Page<${table_name}DTO> find${table_name}ByConditions(${table_name}DTO ${var_name}DTO, Pageable pageable) throws K12Exception {
        Page<${table_name}> page = this.${var_name}Repository.findAll(new Specification<${table_name}>() {
            @Override
            public Predicate toPredicate(Root<${table_name}> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> predicateList = Lists.newArrayList();
                //TODO 添加查询条件
                criteriaQuery.where(predicateList.toArray(new Predicate[0]));
                return null;
            }
        }, pageable);
        // 返回值
        List<${table_name}DTO> ${var_name}DTOList = Lists.newArrayList();
        // 循环实体转DTO
        page.getContent().forEach(${var_name} -> {
            ${table_name}DTO dto = new ${table_name}DTO();
            BeanUtils.copyProperties(${var_name}, dto);
            ${var_name}DTOList.add(dto);
        });
        // 返回分页数据
        return new CustomPageImpl<>(${var_name}DTOList, pageable, page.getTotalElements());
    }

    /**
     * 根据id查询${table_annotation}
     * @param ids ${table_annotation}主键
     * @return ${table_annotation}DTO集合
     * @author ${author}
     * @date ${date}
     * @throws K12Exception 查询出错
     */
    @Override
    public List<${table_name}DTO> find${table_name}ByIds(List<String> ids) throws K12Exception {
        // 根据id查询
        List<${table_name}> ${var_name}List = this.${var_name}Repository.findByIdIn(ids);
        // 返回值
        List<${table_name}DTO> ${var_name}DTOList = Lists.newArrayList();
        // 循环实体转DTO
        ${var_name}List.forEach(${var_name} -> {
            ${table_name}DTO ${var_name}DTO = new ${table_name}DTO();
            BeanUtils.copyProperties(${var_name}, ${var_name}DTO);
            ${var_name}DTOList.add(${var_name}DTO);
        });
        // 返回
        return ${var_name}DTOList;
    }

    /**
     * 保存${table_annotation}
     * @param ${var_name}DTO ${table_annotation}DTO
     * @return 操作信息
     * @author ${author}
     * @date ${date}
     * @throws K12Exception 保存出错
     */
    @Override
    public void saveOrUpdate${table_name}(${table_name}DTO ${var_name}DTO) throws K12Exception {
        ${table_name} ${var_name} = new ${table_name}();
        //TODO 有业务判断写这里
        if (1 == 1) {
            throw K12Exception.wrap(CommonExceptionCodeEnum.SYSTEM_EXCEPTION);
        } else if (2 == 2) {
            throw K12Exception.wrap(CommonExceptionCodeEnum.SYSTEM_ILLEGAL_ARGUMENT);
        }
        // 设置属性值
        BeanUtils.copyProperties(${var_name}DTO, ${var_name});
        // 保存
        this.${var_name}Repository.save(${var_name});
    }

    /**
     * 根据主键删除${table_annotation}
     * @param ids ${table_annotation}主键
     * @return 操作信息
     * @author ${author}
     * @date ${date}
     * @throws K12Exception 删除出错
     */
    @Override
    public void delete${table_name}ByIds(List<String> ids) throws K12Exception {
        // 查询
        List<${table_name}> ${var_name}List = ${var_name}Repository.findByIdIn(ids);
        // 可以删除的
        List<${table_name}> canDeleteList = Lists.newArrayList();
        ${var_name}List.forEach(${var_name} -> {
            //TODO 有业务判断写这里
            if (1 == 1) {
                throw K12Exception.wrap(CommonExceptionCodeEnum.SYSTEM_EXCEPTION);
            } else if (2 == 2) {
                throw K12Exception.wrap(CommonExceptionCodeEnum.SYSTEM_ILLEGAL_ARGUMENT);
            }
            canDeleteList.add(${var_name});
        });
        // 删除
        this.${var_name}Repository.deleteAll(canDeleteList);
    }

}