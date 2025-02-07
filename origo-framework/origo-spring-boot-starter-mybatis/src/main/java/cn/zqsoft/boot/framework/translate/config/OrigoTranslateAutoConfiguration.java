package cn.zqsoft.boot.framework.translate.config;

import cn.zqsoft.boot.framework.translate.core.TranslateUtils;
import com.fhs.trans.service.impl.TransService;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.context.annotation.Bean;

/**
 * @author Euan
 */
@AutoConfiguration
public class OrigoTranslateAutoConfiguration {

    @Bean
    @SuppressWarnings({"InstantiationOfUtilityClass"})
    public TranslateUtils translateUtils(TransService transService) {
        TranslateUtils.init(transService);
        return new TranslateUtils();
    }

}
