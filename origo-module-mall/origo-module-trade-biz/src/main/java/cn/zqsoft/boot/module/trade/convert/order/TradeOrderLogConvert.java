package cn.zqsoft.boot.module.trade.convert.order;

import cn.zqsoft.boot.module.trade.dal.dataobject.order.TradeOrderLogDO;
import cn.zqsoft.boot.module.trade.service.order.bo.TradeOrderLogCreateReqBO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface TradeOrderLogConvert {

    TradeOrderLogConvert INSTANCE = Mappers.getMapper(TradeOrderLogConvert.class);

    TradeOrderLogDO convert(TradeOrderLogCreateReqBO bean);

}
