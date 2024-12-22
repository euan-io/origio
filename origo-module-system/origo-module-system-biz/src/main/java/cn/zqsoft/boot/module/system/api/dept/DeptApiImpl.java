package cn.zqsoft.boot.module.system.api.dept;

import cn.zqsoft.boot.framework.common.enums.CommonStatusEnum;
import cn.zqsoft.boot.framework.common.util.collection.CollectionUtils;
import cn.zqsoft.boot.framework.common.util.object.BeanUtils;
import cn.zqsoft.boot.module.system.api.dept.dto.DeptRespDTO;
import cn.zqsoft.boot.module.system.controller.admin.dept.vo.dept.DeptListReqVO;
import cn.zqsoft.boot.module.system.dal.dataobject.dept.DeptDO;
import cn.zqsoft.boot.module.system.service.dept.DeptService;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

/**
 * 部门 API 实现类
 *
 * @author Euan
 */
@Service
public class DeptApiImpl implements DeptApi {

    @Resource
    private DeptService deptService;

    @Override
    public DeptRespDTO getDept(Long id) {
        DeptDO dept = deptService.getDept(id);
        return BeanUtils.toBean(dept, DeptRespDTO.class);
    }

    @Override
    public List<DeptRespDTO> getDeptList(Collection<Long> ids) {
        List<DeptDO> depts = deptService.getDeptList(ids);
        return BeanUtils.toBean(depts, DeptRespDTO.class);
    }

    @Override
    public void validateDeptList(Collection<Long> ids) {
        deptService.validateDeptList(ids);
    }

    @Override
    public List<DeptRespDTO> getChildDeptList(Long id) {
        List<DeptDO> childDeptList = deptService.getChildDeptList(id);
        return BeanUtils.toBean(childDeptList, DeptRespDTO.class);
    }

    @Override
    public <K> Map<K, DeptRespDTO> getDeptMapInfo(Function<DeptRespDTO, K> keyFunc) {
        DeptListReqVO deptListReqVO = new DeptListReqVO();
        deptListReqVO.setStatus(CommonStatusEnum.ENABLE.getStatus());
        List<DeptDO> deptList = deptService.getDeptList(deptListReqVO);
        List<DeptRespDTO> respDTOList = BeanUtils.toBean(deptList, DeptRespDTO.class);
        return CollectionUtils.convertMap(respDTOList, keyFunc);
    }

}
