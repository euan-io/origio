package cn.zqsoft.boot.module.ai.controller.admin.knowledge.vo.knowledge;

import cn.zqsoft.boot.framework.common.pojo.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Schema(description = "管理后台 - AI 知识库的分页 Request VO")
@Data
public class AiKnowledgePageReqVO extends PageParam {

    @Schema(description = "知识库名称", example = "Java 开发手册")
    private String name;

}
