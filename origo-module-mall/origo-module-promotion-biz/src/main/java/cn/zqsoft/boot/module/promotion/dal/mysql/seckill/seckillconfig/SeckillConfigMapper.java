package cn.zqsoft.boot.module.promotion.dal.mysql.seckill.seckillconfig;

import cn.zqsoft.boot.framework.common.pojo.PageResult;
import cn.zqsoft.boot.framework.mybatis.core.mapper.BaseMapperX;
import cn.zqsoft.boot.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.zqsoft.boot.module.promotion.controller.admin.seckill.vo.config.SeckillConfigPageReqVO;
import cn.zqsoft.boot.module.promotion.dal.dataobject.seckill.SeckillConfigDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SeckillConfigMapper extends BaseMapperX<SeckillConfigDO> {

    default PageResult<SeckillConfigDO> selectPage(SeckillConfigPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<SeckillConfigDO>()
                .likeIfPresent(SeckillConfigDO::getName, reqVO.getName())
                .eqIfPresent(SeckillConfigDO::getStatus, reqVO.getStatus())
                .orderByAsc(SeckillConfigDO::getStartTime));
    }

    default List<SeckillConfigDO> selectListByStatus(Integer status) {
        return selectList(SeckillConfigDO::getStatus, status);
    }

}
