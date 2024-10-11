package cn.zqsoft.boot.module.report.convert.goview;

import cn.zqsoft.boot.framework.common.pojo.PageResult;
import cn.zqsoft.boot.module.report.controller.admin.goview.vo.project.GoViewProjectCreateReqVO;
import cn.zqsoft.boot.module.report.controller.admin.goview.vo.project.GoViewProjectRespVO;
import cn.zqsoft.boot.module.report.controller.admin.goview.vo.project.GoViewProjectUpdateReqVO;
import cn.zqsoft.boot.module.report.dal.dataobject.goview.GoViewProjectDO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface GoViewProjectConvert {

    GoViewProjectConvert INSTANCE = Mappers.getMapper(GoViewProjectConvert.class);

    GoViewProjectDO convert(GoViewProjectCreateReqVO bean);

    GoViewProjectDO convert(GoViewProjectUpdateReqVO bean);

    GoViewProjectRespVO convert(GoViewProjectDO bean);

    PageResult<GoViewProjectRespVO> convertPage(PageResult<GoViewProjectDO> page);

}
