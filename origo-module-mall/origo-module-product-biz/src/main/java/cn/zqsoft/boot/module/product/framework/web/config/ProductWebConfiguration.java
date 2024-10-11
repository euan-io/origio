package cn.zqsoft.boot.module.product.framework.web.config;

import cn.zqsoft.boot.framework.swagger.config.OrigoSwaggerAutoConfiguration;
import org.springdoc.core.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * product 模块的 web 组件的 Configuration
 *
 * @author 芋道源码
 */
@Configuration(proxyBeanMethods = false)
public class ProductWebConfiguration {

    /**
     * product 模块的 API 分组
     */
    @Bean
    public GroupedOpenApi productGroupedOpenApi() {
        return OrigoSwaggerAutoConfiguration.buildGroupedOpenApi("product");
    }

}
