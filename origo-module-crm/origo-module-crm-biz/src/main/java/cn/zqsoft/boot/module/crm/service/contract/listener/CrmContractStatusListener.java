package cn.zqsoft.boot.module.crm.service.contract.listener;

import cn.zqsoft.boot.module.bpm.event.BpmProcessInstanceStatusEvent;
import cn.zqsoft.boot.module.bpm.event.BpmProcessInstanceStatusEventListener;
import cn.zqsoft.boot.module.crm.service.contract.CrmContractService;
import cn.zqsoft.boot.module.crm.service.contract.CrmContractServiceImpl;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 合同审批的结果的监听器实现类
 *
 * @author HUIHUI
 */
@Component
public class CrmContractStatusListener extends BpmProcessInstanceStatusEventListener {

    @Resource
    private CrmContractService contractService;

    @Override
    public String getProcessDefinitionKey() {
        return CrmContractServiceImpl.BPM_PROCESS_DEFINITION_KEY;
    }

    @Override
    protected void onEvent(BpmProcessInstanceStatusEvent event) {
        contractService.updateContractAuditStatus(Long.parseLong(event.getBusinessKey()), event.getStatus());
    }

}