package cn.zqsoft.boot.module.trade.controller.app.brokerage.vo.withdraw;

import cn.zqsoft.boot.framework.common.pojo.PageParam;
import cn.zqsoft.boot.framework.common.validation.InEnum;
import cn.zqsoft.boot.module.trade.enums.brokerage.BrokerageWithdrawStatusEnum;
import cn.zqsoft.boot.module.trade.enums.brokerage.BrokerageWithdrawTypeEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Schema(description = "应用 App - 分销提现分页 Request VO")
@Data
public class AppBrokerageWithdrawPageReqVO extends PageParam {

    @Schema(description = "类型", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    @InEnum(value = BrokerageWithdrawTypeEnum.class, message = "类型必须是 {value}")
    private Integer type;

    @Schema(description = "状态", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    @InEnum(value = BrokerageWithdrawStatusEnum.class, message = "状态必须是 {value}")
    private Integer status;

}
