package cn.zqsoft.boot.module.bpm.framework.flowable.core.candidate.strategy;

import cn.zqsoft.boot.framework.common.util.string.StrUtils;
import cn.zqsoft.boot.module.bpm.framework.flowable.core.candidate.BpmTaskCandidateStrategy;
import cn.zqsoft.boot.module.bpm.framework.flowable.core.enums.BpmTaskCandidateStrategyEnum;
import cn.zqsoft.boot.module.system.api.dept.DeptApi;
import cn.zqsoft.boot.module.system.api.user.AdminUserApi;
import cn.zqsoft.boot.module.system.api.user.dto.AdminUserRespDTO;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Set;

import static cn.zqsoft.boot.framework.common.util.collection.CollectionUtils.convertSet;

/**
 * 部门的成员 {@link BpmTaskCandidateStrategy} 实现类
 *
 * @author kyle
 */
@Component
public class BpmTaskCandidateDeptMemberStrategy extends BpmTaskCandidateAbstractStrategy {

    private final DeptApi deptApi;

    public BpmTaskCandidateDeptMemberStrategy(AdminUserApi adminUserApi, DeptApi deptApi) {
        super(adminUserApi);
        this.deptApi = deptApi;
    }

    @Override
    public BpmTaskCandidateStrategyEnum getStrategy() {
        return BpmTaskCandidateStrategyEnum.DEPT_MEMBER;
    }

    @Override
    public void validateParam(String param) {
        Set<Long> deptIds = StrUtils.splitToLongSet(param);
        deptApi.validateDeptList(deptIds);
    }

    @Override
    public Set<Long> calculateUsers(String param) {
        Set<Long> deptIds = StrUtils.splitToLongSet(param);
        List<AdminUserRespDTO> users = adminUserApi.getUserListByDeptIds(deptIds);
        return convertSet(users, AdminUserRespDTO::getId);
    }

}