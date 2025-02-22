package cn.zqsoft.boot.framework.common.exception;

import cn.zqsoft.boot.framework.common.exception.enums.GlobalErrorCodeConstants;
import cn.zqsoft.boot.framework.common.exception.enums.ServiceErrorCodeRange;
import lombok.Data;

/**
 * 错误码对象
 *
 * 全局错误码，占用 [0, 999], 参见 {@link GlobalErrorCodeConstants}
 * 业务异常错误码，占用 [1 000 000 000, +∞)，参见 {@link ServiceErrorCodeRange}
 * 错误码设计成对象的原因，为未来的 i18 国际化做准备
 *
 * @author Euan
 */
@Data
public class ErrorCode {

    /**
     * 错误码
     */
    private final Integer code;
    /**
     * 错误提示
     */
    private final String msg;

    public ErrorCode(Integer code, String message) {
        this.code = code;
        this.msg = message;
    }

}
