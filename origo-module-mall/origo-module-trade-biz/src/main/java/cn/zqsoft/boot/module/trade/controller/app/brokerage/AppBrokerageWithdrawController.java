package cn.zqsoft.boot.module.trade.controller.app.brokerage;

import cn.zqsoft.boot.framework.common.pojo.CommonResult;
import cn.zqsoft.boot.framework.common.pojo.PageResult;
import cn.zqsoft.boot.module.trade.controller.app.brokerage.vo.withdraw.AppBrokerageWithdrawCreateReqVO;
import cn.zqsoft.boot.module.trade.controller.app.brokerage.vo.withdraw.AppBrokerageWithdrawPageReqVO;
import cn.zqsoft.boot.module.trade.controller.app.brokerage.vo.withdraw.AppBrokerageWithdrawRespVO;
import cn.zqsoft.boot.module.trade.convert.brokerage.BrokerageWithdrawConvert;
import cn.zqsoft.boot.module.trade.dal.dataobject.brokerage.BrokerageWithdrawDO;
import cn.zqsoft.boot.module.trade.service.brokerage.BrokerageWithdrawService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

import static cn.zqsoft.boot.framework.common.pojo.CommonResult.success;
import static cn.zqsoft.boot.framework.web.core.util.WebFrameworkUtils.getLoginUserId;

@Tag(name = "用户 APP - 分销提现")
@RestController
@RequestMapping("/trade/brokerage-withdraw")
@Validated
@Slf4j
public class AppBrokerageWithdrawController {

    @Resource
    private BrokerageWithdrawService brokerageWithdrawService;

    @GetMapping("/page")
    @Operation(summary = "获得分销提现分页")
    public CommonResult<PageResult<AppBrokerageWithdrawRespVO>> getBrokerageWithdrawPage(AppBrokerageWithdrawPageReqVO pageReqVO) {
        PageResult<BrokerageWithdrawDO> pageResult = brokerageWithdrawService.getBrokerageWithdrawPage(
                BrokerageWithdrawConvert.INSTANCE.convert(pageReqVO, getLoginUserId()));
        return success(BrokerageWithdrawConvert.INSTANCE.convertPage03(pageResult));
    }

    @PostMapping("/create")
    @Operation(summary = "创建分销提现")
    public CommonResult<Long> createBrokerageWithdraw(@RequestBody @Valid AppBrokerageWithdrawCreateReqVO createReqVO) {
        return success(brokerageWithdrawService.createBrokerageWithdraw(getLoginUserId(), createReqVO));
    }

}
