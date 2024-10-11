package cn.zqsoft.boot.module.erp.controller.admin.stock.vo.out;

import cn.zqsoft.boot.framework.common.pojo.PageParam;
import cn.zqsoft.boot.framework.common.validation.InEnum;
import cn.zqsoft.boot.module.erp.enums.ErpAuditStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

import static cn.zqsoft.boot.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

@Schema(description = "管理后台 - ERP 其它出库单分页 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class ErpStockOutPageReqVO extends PageParam {

    @Schema(description = "出库单号", example = "S123")
    private String no;

    @Schema(description = "客户编号", example = "3113")
    private Long customerId;

    @Schema(description = "出库时间")
    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    private LocalDateTime[] outTime;

    @Schema(description = "状态", example = "10")
    @InEnum(ErpAuditStatus.class)
    private Integer status;

    @Schema(description = "备注", example = "随便")
    private String remark;

    @Schema(description = "创建者")
    private String creator;

    @Schema(description = "产品编号", example = "1")
    private Long productId;

    @Schema(description = "仓库编号", example = "1")
    private Long warehouseId;

}