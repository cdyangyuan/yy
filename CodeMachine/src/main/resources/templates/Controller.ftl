/**
* @Project: ${project_name}
* @Package ${package_name}.model
* @author ${author}
* @date ${date}
* @Copyright: ${year} www.yineng.com.cn Inc. All rights reserved.
* @version V1.0
*/
package ${package_name}.controller;

import com.yineng.api.PlatformException;
import com.yineng.api.common.page.CustomPageableImpl;
import ${package_name}.api.${table_name}Service;
import ${package_name}.vo.${table_name}VO;
import com.yineng.api.platform.security.vo.PlatformSecurityUserVO;
import com.yineng.common.bean.JsonBean;
import com.yineng.lms.api.common.utils.DateUtils;
import com.yineng.lms.api.common.utils.StringUtils;
import com.yineng.platform.controller.user.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

/**
 * @Description ${table_annotation} Controller
 * @author ${author}
 * @date ${date}
 */
@Controller
@RequestMapping("/${var_name}")
public class ${table_name}Controller extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(${table_name}Controller.class);

    @Autowired
    private ${table_name}Service ${var_name}Service;

    /**
     * 根据查询条件、分页查询${table_annotation}
     *
     * @param ${var_name}Vo         查询条件
     * @param pageNumber 页码
     * @param pageSize   每页显示数据
     * @return 分页数据
     */
    @ResponseBody
    @RequestMapping("/find${table_name}ByConditions")
    public JsonBean find${table_name}ByConditions(${table_name}VO ${var_name}Vo, Integer pageNumber, Integer pageSize) {
        JsonBean jsonBean = new JsonBean();
        if (null == pageNumber || null == pageSize) {
            pageNumber = 0;
            pageSize = Integer.MAX_VALUE;
        }
        try {
            jsonBean.setStatus(0);
            jsonBean.setMessage("操作成功！");
            jsonBean.setResult(${var_name}Service.find${table_name}ByConditions(${var_name}Vo, new CustomPageableImpl(pageNumber, pageSize)));
            return jsonBean;
        } catch (PlatformException e) {
            LOGGER.debug(e.getMessage(), e);
            jsonBean.setStatus(1);
            jsonBean.setMessage("操作失败！");
            return jsonBean;
        }
    }

    /**
     * 根据id查询${table_annotation}
     *
     * @param ids ${table_annotation}主键
     * @return ${table_annotation}VO集合
     */
    @ResponseBody
    @RequestMapping("/find${table_name}ByIds")
    public JsonBean find${table_name}ByIds(String[] ids) {
        JsonBean jsonBean = new JsonBean();
        if (null == ids || ids.length == 0) {
            jsonBean.setStatus(1);
            jsonBean.setMessage("参数错误！");
            return jsonBean;
        }
        try {
            jsonBean.setStatus(0);
            jsonBean.setMessage("操作成功！");
            jsonBean.setResult(${var_name}Service.find${table_name}ByIds(Arrays.asList(ids)));
            return jsonBean;
        } catch (PlatformException e) {
            LOGGER.debug(e.getMessage(), e);
            jsonBean.setStatus(1);
            jsonBean.setMessage("操作失败！");
            return jsonBean;
        }
    }

    /**
     * 保存${table_annotation}
     *
     * @param ${var_name}Vo ${table_annotation}VO
     * @return 操作信息
     */
    @ResponseBody
    @RequestMapping("/saveOrUpdate${table_name}")
    public JsonBean saveOrUpdate${table_name}(@RequestBody ${table_name}VO ${var_name}Vo) {
        JsonBean jsonBean = new JsonBean();
        // 获取当前登录用户
        PlatformSecurityUserVO platformSecurityUserVO = (PlatformSecurityUserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        try {
            jsonBean.setStatus(0);
            jsonBean.setMessage("保存成功！");
            jsonBean.setResult(${var_name}Service.saveOrUpdate${table_name}(${var_name}Vo));
            return jsonBean;
        } catch (PlatformException e) {
            LOGGER.debug(e.getMessage(), e);
            jsonBean.setStatus(1);
            jsonBean.setMessage("保存失败！");
            return jsonBean;
        }
    }

    /**
     * 根据主键删除${table_annotation}
     *
     * @param ids ${table_annotation}主键
     * @return 操作信息
     */
    @ResponseBody
    @RequestMapping("/delete${table_name}ByIds")
    public JsonBean delete${table_name}ByIds(String[] ids) {
        JsonBean jsonBean = new JsonBean();
        if (null == ids || ids.length == 0) {
            jsonBean.setStatus(1);
            jsonBean.setMessage("参数错误！");
            return jsonBean;
        }
        try {
            jsonBean.setStatus(0);
            jsonBean.setMessage("删除成功！");
            jsonBean.setResult(${var_name}Service.delete${table_name}ByIds(Arrays.asList(ids)));
            return jsonBean;
        } catch (PlatformException e) {
            LOGGER.debug(e.getMessage(), e);
            jsonBean.setStatus(1);
            jsonBean.setMessage("删除失败！");
            return jsonBean;
        }
    }

}