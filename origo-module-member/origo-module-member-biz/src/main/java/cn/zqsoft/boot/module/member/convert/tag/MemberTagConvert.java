package cn.zqsoft.boot.module.member.convert.tag;

import cn.zqsoft.boot.framework.common.pojo.PageResult;
import cn.zqsoft.boot.module.member.controller.admin.tag.vo.MemberTagCreateReqVO;
import cn.zqsoft.boot.module.member.controller.admin.tag.vo.MemberTagRespVO;
import cn.zqsoft.boot.module.member.controller.admin.tag.vo.MemberTagUpdateReqVO;
import cn.zqsoft.boot.module.member.dal.dataobject.tag.MemberTagDO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 会员标签 Convert
 *
 * @author Euan
 */
@Mapper
public interface MemberTagConvert {

    MemberTagConvert INSTANCE = Mappers.getMapper(MemberTagConvert.class);

    MemberTagDO convert(MemberTagCreateReqVO bean);

    MemberTagDO convert(MemberTagUpdateReqVO bean);

    MemberTagRespVO convert(MemberTagDO bean);

    List<MemberTagRespVO> convertList(List<MemberTagDO> list);

    PageResult<MemberTagRespVO> convertPage(PageResult<MemberTagDO> page);

}
