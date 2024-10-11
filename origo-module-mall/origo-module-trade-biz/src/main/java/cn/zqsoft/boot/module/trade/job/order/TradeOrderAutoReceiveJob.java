package cn.zqsoft.boot.module.trade.job.order;

import cn.zqsoft.boot.framework.quartz.core.handler.JobHandler;
import cn.zqsoft.boot.framework.tenant.core.job.TenantJob;
import cn.zqsoft.boot.module.trade.service.order.TradeOrderUpdateService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 交易订单的自动收货 Job
 *
 * @author 芋道源码
 */
@Component
public class TradeOrderAutoReceiveJob implements JobHandler {

    @Resource
    private TradeOrderUpdateService tradeOrderUpdateService;

    @Override
    @TenantJob
    public String execute(String param) {
        int count = tradeOrderUpdateService.receiveOrderBySystem();
        return String.format("自动收货 %s 个", count);
    }

}
