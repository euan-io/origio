package cn.zqsoft.boot.module.ai.service.knowledge;

import cn.zqsoft.boot.framework.common.pojo.PageResult;
import cn.zqsoft.boot.module.ai.controller.admin.knowledge.vo.segment.AiKnowledgeSegmentPageReqVO;
import cn.zqsoft.boot.module.ai.controller.admin.knowledge.vo.segment.AiKnowledgeSegmentSearchReqVO;
import cn.zqsoft.boot.module.ai.controller.admin.knowledge.vo.segment.AiKnowledgeSegmentUpdateReqVO;
import cn.zqsoft.boot.module.ai.controller.admin.knowledge.vo.segment.AiKnowledgeSegmentUpdateStatusReqVO;
import cn.zqsoft.boot.module.ai.dal.dataobject.knowledge.AiKnowledgeSegmentDO;

import java.util.List;

/**
 * AI 知识库段落 Service 接口
 *
 * @author xiaoxin
 */
public interface AiKnowledgeSegmentService {

    /**
     * 获取段落分页
     *
     * @param pageReqVO 分页查询
     * @return 文档分页
     */
    PageResult<AiKnowledgeSegmentDO> getKnowledgeSegmentPage(AiKnowledgeSegmentPageReqVO pageReqVO);

    /**
     * 更新段落的内容
     *
     * @param reqVO 更新内容
     */
    void updateKnowledgeSegment(AiKnowledgeSegmentUpdateReqVO reqVO);

    /**
     * 更新段落的状态
     *
     * @param reqVO 更新内容
     */
    void updateKnowledgeSegmentStatus(AiKnowledgeSegmentUpdateStatusReqVO reqVO);

    /**
     * 召回段落
     *
     * @param reqVO 召回请求信息
     * @return 召回的段落
     */
    List<AiKnowledgeSegmentDO> similaritySearch(AiKnowledgeSegmentSearchReqVO reqVO);

}
