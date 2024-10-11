package cn.zqsoft.boot.module.pay.controller.app.wallet;

import cn.zqsoft.boot.framework.common.enums.UserTypeEnum;
import cn.zqsoft.boot.framework.common.pojo.CommonResult;
import cn.zqsoft.boot.module.pay.controller.app.wallet.vo.wallet.AppPayWalletRespVO;
import cn.zqsoft.boot.module.pay.convert.wallet.PayWalletConvert;
import cn.zqsoft.boot.module.pay.dal.dataobject.wallet.PayWalletDO;
import cn.zqsoft.boot.module.pay.service.wallet.PayWalletService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

import static cn.zqsoft.boot.framework.common.pojo.CommonResult.success;
import static cn.zqsoft.boot.framework.security.core.util.SecurityFrameworkUtils.getLoginUserId;

/**
 * @author jason
 */
@Tag(name = "用户 APP - 钱包")
@RestController
@RequestMapping("/pay/wallet")
@Validated
@Slf4j
public class AppPayWalletController {

    @Resource
    private PayWalletService payWalletService;

    @GetMapping("/get")
    @Operation(summary = "获取钱包")
    public CommonResult<AppPayWalletRespVO> getPayWallet() {
        PayWalletDO wallet = payWalletService.getOrCreateWallet(getLoginUserId(), UserTypeEnum.MEMBER.getValue());
        return success(PayWalletConvert.INSTANCE.convert(wallet));
    }

}
