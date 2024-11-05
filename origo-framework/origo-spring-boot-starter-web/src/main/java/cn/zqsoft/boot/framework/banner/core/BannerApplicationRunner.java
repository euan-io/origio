package cn.zqsoft.boot.framework.banner.core;

import cn.hutool.core.thread.ThreadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.util.ClassUtils;

import java.util.concurrent.TimeUnit;

/**
 * 项目启动成功后，提供文档相关的地址
 *
 * @author 芋道源码
 */
@Slf4j
public class BannerApplicationRunner implements ApplicationRunner {

    @Override
    public void run(ApplicationArguments args) {
        ThreadUtil.execute(() -> {
            ThreadUtil.sleep(1, TimeUnit.SECONDS); // 延迟 1 秒，保证输出到结尾
            log.info("\n----------------------------------------------------------\n\t" +
                            "项目启动成功！\n\t" +
                            "接口文档: \t{} \n\t" +
                            "开发文档: \t{} \n\t" +

                            "----------------------------------------------------------",
                    "https://doc.deveuan.top/api-doc/",
                    "https://doc.deveuan.top");

            // 数据报表
            if (isNotPresent("cn.zqsoft.boot.module.report.framework.security.config.SecurityConfiguration")) {
                System.out.println("[报表模块 origo-module-report - 已禁用][参考 https://doc.deveuan.top/report/ 开启]");
            }
            // 工作流
            if (isNotPresent("cn.zqsoft.boot.module.bpm.framework.flowable.config.BpmFlowableConfiguration")) {
                System.out.println("[工作流模块 origo-module-bpm - 已禁用][参考 https://doc.deveuan.top/bpm/ 开启]");
            }
            // 商城系统
            if (isNotPresent("cn.zqsoft.boot.module.trade.framework.web.config.TradeWebConfiguration")) {
                System.out.println("[商城系统 origo-module-mall - 已禁用][参考 https://doc.deveuan.top/mall/build/ 开启]");
            }
            // ERP 系统
            if (isNotPresent("cn.zqsoft.boot.module.erp.framework.web.config.ErpWebConfiguration")) {
                System.out.println("[ERP 系统 origo-module-erp - 已禁用][参考 https://doc.deveuan.top/erp/build/ 开启]");
            }
            // CRM 系统
            if (isNotPresent("cn.zqsoft.boot.module.crm.framework.web.config.CrmWebConfiguration")) {
                System.out.println("[CRM 系统 origo-module-crm - 已禁用][参考 https://doc.deveuan.top/crm/build/ 开启]");
            }
            // 微信公众号
            if (isNotPresent("cn.zqsoft.boot.module.mp.framework.mp.config.MpConfiguration")) {
                System.out.println("[微信公众号 origo-module-mp - 已禁用][参考 https://doc.deveuan.top/mp/build/ 开启]");
            }
            // 支付平台
            if (isNotPresent("cn.zqsoft.boot.module.pay.framework.pay.config.PayConfiguration")) {
                System.out.println("[支付系统 origo-module-pay - 已禁用][参考 https://doc.deveuan.top/pay/build/ 开启]");
            }
            // AI 大模型
            if (isNotPresent("cn.zqsoft.boot.module.ai.framework.web.config.AiWebConfiguration")) {
                System.out.println("[AI 大模型 origo-module-ai - 已禁用][参考 https://doc.deveuan.top/ai/build/ 开启]");
            }
            // IOT 物联网
            if (isNotPresent("cn.zqsoft.boot.module.iot.framework.web.config.IotWebConfiguration")) {
                System.out.println("[IOT 物联网 origo-module-iot - 已禁用][参考 https://doc.deveuan.top/iot/build/ 开启]");
            }
        });
    }

    private static boolean isNotPresent(String className) {
        return !ClassUtils.isPresent(className, ClassUtils.getDefaultClassLoader());
    }

}
