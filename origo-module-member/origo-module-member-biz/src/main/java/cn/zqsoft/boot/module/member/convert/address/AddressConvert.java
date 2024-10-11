package cn.zqsoft.boot.module.member.convert.address;

import cn.zqsoft.boot.framework.ip.core.utils.AreaUtils;
import cn.zqsoft.boot.module.member.api.address.dto.MemberAddressRespDTO;
import cn.zqsoft.boot.module.member.controller.admin.address.vo.AddressRespVO;
import cn.zqsoft.boot.module.member.controller.app.address.vo.AppAddressCreateReqVO;
import cn.zqsoft.boot.module.member.controller.app.address.vo.AppAddressRespVO;
import cn.zqsoft.boot.module.member.controller.app.address.vo.AppAddressUpdateReqVO;
import cn.zqsoft.boot.module.member.dal.dataobject.address.MemberAddressDO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 用户收件地址 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface AddressConvert {

    AddressConvert INSTANCE = Mappers.getMapper(AddressConvert.class);

    MemberAddressDO convert(AppAddressCreateReqVO bean);

    MemberAddressDO convert(AppAddressUpdateReqVO bean);

    @Mapping(source = "areaId", target = "areaName",  qualifiedByName = "convertAreaIdToAreaName")
    AppAddressRespVO convert(MemberAddressDO bean);

    List<AppAddressRespVO> convertList(List<MemberAddressDO> list);

    MemberAddressRespDTO convert02(MemberAddressDO bean);

    @Named("convertAreaIdToAreaName")
    default String convertAreaIdToAreaName(Integer areaId) {
        return AreaUtils.format(areaId);
    }

    List<AddressRespVO> convertList2(List<MemberAddressDO> list);

}
