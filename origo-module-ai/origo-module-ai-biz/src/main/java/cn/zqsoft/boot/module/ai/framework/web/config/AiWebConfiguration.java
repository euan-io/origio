package cn.zqsoft.boot.module.ai.framework.web.config;

import cn.zqsoft.boot.framework.swagger.config.OrigoSwaggerAutoConfiguration;
import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * ai 模块的 web 组件的 Configuration
 *
 * @author 芋道源码
 */
@Configuration(proxyBeanMethods = false)
public class AiWebConfiguration {

    /**
     * ai 模块的 API 分组
     */
    @Bean
    public GroupedOpenApi aiGroupedOpenApi() {
        return OrigoSwaggerAutoConfiguration.buildGroupedOpenApi("ai");
    }

}
