package cn.zqsoft.boot.module.pay.framework.web.config;

import cn.zqsoft.boot.framework.swagger.config.OrigoSwaggerAutoConfiguration;
import org.springdoc.core.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * pay 模块的 web 组件的 Configuration
 *
 * @author Euan
 */
@Configuration(proxyBeanMethods = false)
public class PayWebConfiguration {

    /**
     * pay 模块的 API 分组
     */
    @Bean
    public GroupedOpenApi payGroupedOpenApi() {
        return OrigoSwaggerAutoConfiguration.buildGroupedOpenApi("pay");
    }

}
