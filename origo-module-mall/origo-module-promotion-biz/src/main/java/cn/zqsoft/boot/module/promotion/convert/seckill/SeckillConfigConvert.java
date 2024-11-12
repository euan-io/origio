package cn.zqsoft.boot.module.promotion.convert.seckill;

import cn.zqsoft.boot.framework.common.pojo.PageResult;
import cn.zqsoft.boot.module.promotion.controller.admin.seckill.vo.config.SeckillConfigCreateReqVO;
import cn.zqsoft.boot.module.promotion.controller.admin.seckill.vo.config.SeckillConfigRespVO;
import cn.zqsoft.boot.module.promotion.controller.admin.seckill.vo.config.SeckillConfigSimpleRespVO;
import cn.zqsoft.boot.module.promotion.controller.admin.seckill.vo.config.SeckillConfigUpdateReqVO;
import cn.zqsoft.boot.module.promotion.controller.app.seckill.vo.config.AppSeckillConfigRespVO;
import cn.zqsoft.boot.module.promotion.dal.dataobject.seckill.SeckillConfigDO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 秒杀时段 Convert
 *
 * @author Euan
 */
@Mapper
public interface SeckillConfigConvert {

    SeckillConfigConvert INSTANCE = Mappers.getMapper(SeckillConfigConvert.class);

    SeckillConfigDO convert(SeckillConfigCreateReqVO bean);

    SeckillConfigDO convert(SeckillConfigUpdateReqVO bean);

    SeckillConfigRespVO convert(SeckillConfigDO bean);

    List<SeckillConfigRespVO> convertList(List<SeckillConfigDO> list);

    List<SeckillConfigSimpleRespVO> convertList1(List<SeckillConfigDO> list);

    PageResult<SeckillConfigRespVO> convertPage(PageResult<SeckillConfigDO> page);

    List<AppSeckillConfigRespVO> convertList2(List<SeckillConfigDO> list);

    AppSeckillConfigRespVO convert1(SeckillConfigDO filteredConfig);
}
