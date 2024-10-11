package cn.zqsoft.boot.module.ai.controller.admin.knowledge;

import cn.zqsoft.boot.framework.common.pojo.CommonResult;
import cn.zqsoft.boot.framework.common.pojo.PageResult;
import cn.zqsoft.boot.framework.common.util.object.BeanUtils;
import cn.zqsoft.boot.module.ai.controller.admin.knowledge.vo.document.AiKnowledgeDocumentPageReqVO;
import cn.zqsoft.boot.module.ai.controller.admin.knowledge.vo.document.AiKnowledgeDocumentRespVO;
import cn.zqsoft.boot.module.ai.controller.admin.knowledge.vo.document.AiKnowledgeDocumentUpdateReqVO;
import cn.zqsoft.boot.module.ai.controller.admin.knowledge.vo.knowledge.AiKnowledgeDocumentCreateReqVO;
import cn.zqsoft.boot.module.ai.dal.dataobject.knowledge.AiKnowledgeDocumentDO;
import cn.zqsoft.boot.module.ai.service.knowledge.AiKnowledgeDocumentService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import static cn.zqsoft.boot.framework.common.pojo.CommonResult.success;

@Tag(name = "管理后台 - AI 知识库文档")
@RestController
@RequestMapping("/ai/knowledge/document")
@Validated
public class AiKnowledgeDocumentController {

    @Resource
    private AiKnowledgeDocumentService documentService;

    @PostMapping("/create")
    @Operation(summary = "新建文档")
    public CommonResult<Long> createKnowledgeDocument(@Valid AiKnowledgeDocumentCreateReqVO reqVO) {
        Long knowledgeDocumentId = documentService.createKnowledgeDocument(reqVO);
        return success(knowledgeDocumentId);
    }

    @GetMapping("/page")
    @Operation(summary = "获取文档分页")
    public CommonResult<PageResult<AiKnowledgeDocumentRespVO>> getKnowledgeDocumentPage(@Valid AiKnowledgeDocumentPageReqVO pageReqVO) {
        PageResult<AiKnowledgeDocumentDO> pageResult = documentService.getKnowledgeDocumentPage(pageReqVO);
        return success(BeanUtils.toBean(pageResult, AiKnowledgeDocumentRespVO.class));
    }

    @PutMapping("/update")
    @Operation(summary = "更新文档")
    public CommonResult<Boolean> updateKnowledgeDocument(@Valid @RequestBody AiKnowledgeDocumentUpdateReqVO reqVO) {
        documentService.updateKnowledgeDocument(reqVO);
        return success(true);
    }

}
