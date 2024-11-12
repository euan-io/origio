package cn.zqsoft.boot.module.iot.service.device;

import cn.zqsoft.boot.framework.common.pojo.PageResult;
import cn.zqsoft.boot.module.iot.controller.admin.device.vo.IotDevicePageReqVO;
import cn.zqsoft.boot.module.iot.controller.admin.device.vo.IotDeviceSaveReqVO;
import cn.zqsoft.boot.module.iot.controller.admin.device.vo.IotDeviceStatusUpdateReqVO;
import cn.zqsoft.boot.module.iot.dal.dataobject.device.IotDeviceDO;

import javax.validation.Valid;

/**
 * IoT 设备 Service 接口
 *
 * @author Euan
 */
public interface IotDeviceService {

    /**
     * 创建设备
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createDevice(@Valid IotDeviceSaveReqVO createReqVO);

    /**
     * 更新设备
     *
     * @param updateReqVO 更新信息
     */
    void updateDevice(@Valid IotDeviceSaveReqVO updateReqVO);

    /**
     * 删除设备
     *
     * @param id 编号
     */
    void deleteDevice(Long id);

    /**
     * 获得设备
     *
     * @param id 编号
     * @return IoT 设备
     */
    IotDeviceDO getDevice(Long id);

    /**
     * 获得设备分页
     *
     * @param pageReqVO 分页查询
     * @return IoT 设备分页
     */
    PageResult<IotDeviceDO> getDevicePage(IotDevicePageReqVO pageReqVO);

    /**
     * 更新设备状态
     *
     * @param updateReqVO 更新信息
     */
    void updateDeviceStatus(IotDeviceStatusUpdateReqVO updateReqVO);

    /**
     * 获得设备数量
     *
     * @param productId 产品编号
     * @return 设备数量
     */
    Long getDeviceCountByProductId(Long productId);
}
