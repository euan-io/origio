package cn.zqsoft.boot.framework.common.config;

import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

/**
 *  自动配置类
 *
 * @author Euan
 */
@AutoConfiguration
@ComponentScan(basePackages = {"cn.zqsoft.boot.module"})
public class OrigoConfiguration {

}
