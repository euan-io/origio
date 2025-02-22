package cn.zqsoft.boot.module.system.dal.mysql.user;

import cn.zqsoft.boot.framework.common.pojo.PageResult;
import cn.zqsoft.boot.framework.mybatis.core.mapper.BaseMapperX;
import cn.zqsoft.boot.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.zqsoft.boot.framework.mybatis.core.query.MPJLambdaWrapperX;
import cn.zqsoft.boot.module.system.controller.admin.user.vo.user.UserPageReqVO;
import cn.zqsoft.boot.module.system.dal.dataobject.permission.RoleDO;
import cn.zqsoft.boot.module.system.dal.dataobject.permission.UserRoleDO;
import cn.zqsoft.boot.module.system.dal.dataobject.user.AdminUserDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Collection;
import java.util.List;

@Mapper
public interface AdminUserMapper extends BaseMapperX<AdminUserDO> {

    default AdminUserDO selectByUsername(String username) {
        return selectOne(AdminUserDO::getUsername, username);
    }

    default AdminUserDO selectByEmail(String email) {
        return selectOne(AdminUserDO::getEmail, email);
    }

    default AdminUserDO selectByMobile(String mobile) {
        return selectOne(AdminUserDO::getMobile, mobile);
    }

    default PageResult<AdminUserDO> selectPage(UserPageReqVO reqVO, Collection<Long> deptIds) {
        return selectPage(reqVO, new LambdaQueryWrapperX<AdminUserDO>()
                .likeIfPresent(AdminUserDO::getUsername, reqVO.getUsername())
                .likeIfPresent(AdminUserDO::getMobile, reqVO.getMobile())
                .eqIfPresent(AdminUserDO::getStatus, reqVO.getStatus())
                .betweenIfPresent(AdminUserDO::getCreateTime, reqVO.getCreateTime())
                .inIfPresent(AdminUserDO::getDeptId, deptIds)
                .orderByDesc(AdminUserDO::getId));
    }

    default List<AdminUserDO> selectListByNickname(String nickname) {
        return selectList(new LambdaQueryWrapperX<AdminUserDO>().like(AdminUserDO::getNickname, nickname));
    }

    default List<AdminUserDO> selectListByStatus(Integer status) {
        return selectList(AdminUserDO::getStatus, status);
    }

    default List<AdminUserDO> selectListByDeptIds(Collection<Long> deptIds) {
        return selectList(AdminUserDO::getDeptId, deptIds);
    }

    default List<AdminUserDO> selectByTenantIdAndRoleCode(Long tenantId, String code) {
        MPJLambdaWrapperX<AdminUserDO> wrapperX = new MPJLambdaWrapperX<>();
        wrapperX.selectAll(AdminUserDO.class)
                .eq(AdminUserDO::getTenantId, tenantId)
                .eq(AdminUserDO::getStatus, 1)
                .eq(RoleDO::getCode, code)
                .leftJoin(UserRoleDO.class,UserRoleDO::getUserId, AdminUserDO::getId)
                .leftJoin(RoleDO.class,RoleDO::getId, UserRoleDO::getRoleId);
        return selectJoinList(AdminUserDO.class, wrapperX);
    }
}
