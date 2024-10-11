package cn.zqsoft.boot.module.pay.convert.transfer;

import cn.zqsoft.boot.framework.common.pojo.PageResult;
import cn.zqsoft.boot.framework.pay.core.client.dto.transfer.PayTransferUnifiedReqDTO;
import cn.zqsoft.boot.module.pay.api.transfer.dto.PayTransferCreateReqDTO;
import cn.zqsoft.boot.module.pay.controller.admin.demo.vo.transfer.PayDemoTransferCreateReqVO;
import cn.zqsoft.boot.module.pay.controller.admin.transfer.vo.PayTransferCreateReqVO;
import cn.zqsoft.boot.module.pay.controller.admin.transfer.vo.PayTransferPageItemRespVO;
import cn.zqsoft.boot.module.pay.controller.admin.transfer.vo.PayTransferRespVO;
import cn.zqsoft.boot.module.pay.dal.dataobject.transfer.PayTransferDO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface PayTransferConvert {

    PayTransferConvert INSTANCE = Mappers.getMapper(PayTransferConvert.class);

    PayTransferDO convert(PayTransferCreateReqDTO dto);

    PayTransferUnifiedReqDTO convert2(PayTransferDO dto);

    PayTransferCreateReqDTO convert(PayTransferCreateReqVO vo);

    PayTransferCreateReqDTO convert(PayDemoTransferCreateReqVO vo);

    PayTransferRespVO  convert(PayTransferDO bean);

    PageResult<PayTransferPageItemRespVO> convertPage(PageResult<PayTransferDO> pageResult);
}
