package cn.zqsoft.boot.module.pay.controller.app.order;

import cn.zqsoft.boot.framework.common.pojo.CommonResult;
import cn.zqsoft.boot.framework.common.util.object.BeanUtils;
import cn.zqsoft.boot.framework.pay.core.enums.channel.PayChannelEnum;
import cn.zqsoft.boot.module.pay.controller.admin.order.vo.PayOrderRespVO;
import cn.zqsoft.boot.module.pay.controller.admin.order.vo.PayOrderSubmitRespVO;
import cn.zqsoft.boot.module.pay.controller.app.order.vo.AppPayOrderSubmitReqVO;
import cn.zqsoft.boot.module.pay.controller.app.order.vo.AppPayOrderSubmitRespVO;
import cn.zqsoft.boot.module.pay.convert.order.PayOrderConvert;
import cn.zqsoft.boot.module.pay.dal.dataobject.order.PayOrderDO;
import cn.zqsoft.boot.module.pay.enums.order.PayOrderStatusEnum;
import cn.zqsoft.boot.module.pay.framework.pay.core.WalletPayClient;
import cn.zqsoft.boot.module.pay.service.order.PayOrderService;
import com.google.common.collect.Maps;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;
import java.util.Objects;

import static cn.zqsoft.boot.framework.common.pojo.CommonResult.success;
import static cn.zqsoft.boot.framework.common.util.servlet.ServletUtils.getClientIP;
import static cn.zqsoft.boot.framework.web.core.util.WebFrameworkUtils.getLoginUserId;
import static cn.zqsoft.boot.framework.web.core.util.WebFrameworkUtils.getLoginUserType;

@Tag(name = "用户 APP - 支付订单")
@RestController
@RequestMapping("/pay/order")
@Validated
@Slf4j
public class AppPayOrderController {

    @Resource
    private PayOrderService payOrderService;

    @GetMapping("/get")
    @Operation(summary = "获得支付订单")
    @Parameters({
            @Parameter(name = "id", description = "编号", required = true, example = "1024"),
            @Parameter(name = "sync", description = "是否同步", example = "true")
    })
    public CommonResult<PayOrderRespVO> getOrder(@RequestParam("id") Long id,
                                                 @RequestParam(value = "sync", required = false) Boolean sync) {
        PayOrderDO order = payOrderService.getOrder(id);
        // sync 仅在等待支付
        if (Boolean.TRUE.equals(sync) && PayOrderStatusEnum.isWaiting(order.getStatus())) {
            payOrderService.syncOrderQuietly(order.getId());
            // 重新查询，因为同步后，可能会有变化
            order = payOrderService.getOrder(id);
        }
        return success(BeanUtils.toBean(order, PayOrderRespVO.class));
    }

    @PostMapping("/submit")
    @Operation(summary = "提交支付订单")
    public CommonResult<AppPayOrderSubmitRespVO> submitPayOrder(@RequestBody AppPayOrderSubmitReqVO reqVO) {
        // 1. 钱包支付事，需要额外传 user_id 和 user_type
        if (Objects.equals(reqVO.getChannelCode(), PayChannelEnum.WALLET.getCode())) {
            Map<String, String> channelExtras = reqVO.getChannelExtras() == null ?
                    Maps.newHashMapWithExpectedSize(2) : reqVO.getChannelExtras();
            channelExtras.put(WalletPayClient.USER_ID_KEY, String.valueOf(getLoginUserId()));
            channelExtras.put(WalletPayClient.USER_TYPE_KEY, String.valueOf(getLoginUserType()));
            reqVO.setChannelExtras(channelExtras);
        }

        // 2. 提交支付
        PayOrderSubmitRespVO respVO = payOrderService.submitOrder(reqVO, getClientIP());
        return success(PayOrderConvert.INSTANCE.convert3(respVO));
    }

}