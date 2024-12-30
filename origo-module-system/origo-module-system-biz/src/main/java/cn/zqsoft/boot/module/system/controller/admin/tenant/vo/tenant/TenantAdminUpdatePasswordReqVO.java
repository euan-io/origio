package cn.zqsoft.boot.module.system.controller.admin.tenant.vo.tenant;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * 租户管理员修改密码 Request VO
 *
 * @author hhg
 */
@Schema(description = "管理后台 - 租户管理员修改密码 Request VO")
@Data
public class TenantAdminUpdatePasswordReqVO {

    @Schema(description = "租户编号", requiredMode = Schema.RequiredMode.REQUIRED, example = "1024")
    @NotNull(message = "租户编号不能为空")
    private Long id;

    @Schema(description = "密码", requiredMode = Schema.RequiredMode.REQUIRED, example = "123456")
    @NotEmpty(message = "密码不能为空")
    @Length(min = 4, max = 16, message = "密码长度为 4-16 位")
    private String password;


}
