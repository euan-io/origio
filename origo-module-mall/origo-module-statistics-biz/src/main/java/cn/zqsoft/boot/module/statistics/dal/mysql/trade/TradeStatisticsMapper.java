package cn.zqsoft.boot.module.statistics.dal.mysql.trade;

import cn.zqsoft.boot.framework.mybatis.core.mapper.BaseMapperX;
import cn.zqsoft.boot.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.zqsoft.boot.module.statistics.controller.admin.trade.vo.TradeTrendSummaryRespVO;
import cn.zqsoft.boot.module.statistics.dal.dataobject.trade.TradeStatisticsDO;
import cn.zqsoft.boot.module.statistics.service.trade.bo.TradeSummaryRespBO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 交易统计 Mapper
 *
 * @author owen
 */
@Mapper
public interface TradeStatisticsMapper extends BaseMapperX<TradeStatisticsDO> {

    TradeSummaryRespBO selectOrderCreateCountSumAndOrderPayPriceSumByTimeBetween(@Param("beginTime") LocalDateTime beginTime,
                                                                                 @Param("endTime") LocalDateTime endTime);

    TradeTrendSummaryRespVO selectVoByTimeBetween(@Param("beginTime") LocalDateTime beginTime,
                                                  @Param("endTime") LocalDateTime endTime);

    default List<TradeStatisticsDO> selectListByTimeBetween(LocalDateTime beginTime, LocalDateTime endTime) {
        return selectList(new LambdaQueryWrapperX<TradeStatisticsDO>()
                .between(TradeStatisticsDO::getTime, beginTime, endTime));
    }

    Integer selectExpensePriceByTimeBetween(@Param("beginTime") LocalDateTime beginTime,
                                            @Param("endTime") LocalDateTime endTime);

    default TradeStatisticsDO selectByTimeBetween(LocalDateTime beginTime, LocalDateTime endTime) {
        return selectOne(new LambdaQueryWrapperX<TradeStatisticsDO>()
                .between(TradeStatisticsDO::getTime, beginTime, endTime));
    }

}
