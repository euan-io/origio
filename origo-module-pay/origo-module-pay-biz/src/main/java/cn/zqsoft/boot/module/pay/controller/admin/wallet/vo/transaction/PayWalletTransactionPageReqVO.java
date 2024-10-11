package cn.zqsoft.boot.module.pay.controller.admin.wallet.vo.transaction;

import cn.zqsoft.boot.framework.common.enums.UserTypeEnum;
import cn.zqsoft.boot.framework.common.pojo.PageParam;
import cn.zqsoft.boot.framework.common.validation.InEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Schema(description = "管理后台 - 钱包流水分页 Request VO")
@Data
public class PayWalletTransactionPageReqVO extends PageParam  {

    @Schema(description = "钱包编号", example = "888")
    private Long walletId;

    @Schema(description = "用户编号", example = "1024")
    private Long userId;

    @Schema(description = "用户类型", example = "1")
    @InEnum(UserTypeEnum.class)
    private Integer userType;

}
