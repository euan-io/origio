package cn.zqsoft.boot.module.infra.controller.app.config;

import cn.zqsoft.boot.framework.common.pojo.CommonResult;
import cn.zqsoft.boot.module.infra.dal.dataobject.config.ConfigDO;
import cn.zqsoft.boot.module.infra.enums.ErrorCodeConstants;
import cn.zqsoft.boot.module.infra.service.config.ConfigService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

import static cn.zqsoft.boot.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.zqsoft.boot.framework.common.pojo.CommonResult.success;

/**
 * app 配置管理类
 *
 * @author Euan
 * @since 2024/11/11
 */
@Tag(name = "用户 App - 参数配置")
@RestController
@RequestMapping("/infra/config")
@Validated
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class AppConfigController {

    private final ConfigService configService;

    @GetMapping(value = "/get-value-by-key")
    @Operation(summary = "根据参数键名查询参数值", description = "不可见的配置，不允许返回给前端")
    @Parameter(name = "key", description = "参数键", required = true, example = "yunai.biz.username")
    public CommonResult<String> getConfigKey(@RequestParam("key") String key) {
        ConfigDO config = configService.getConfigByKey(key);
        if (config == null) {
            return success(null);
        }
        if (!config.getVisible()) {
            throw exception(ErrorCodeConstants.CONFIG_GET_VALUE_ERROR_IF_VISIBLE);
        }
        return success(config.getValue());
    }

}
