package cn.zqsoft.boot.module.promotion.enums.coupon;

import cn.zqsoft.boot.framework.common.core.IntArrayValuable;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;
import java.util.Objects;

/**
 * 优惠劵领取方式
 *
 * @author Euan
 */
@AllArgsConstructor
@Getter
public enum CouponTakeTypeEnum implements IntArrayValuable {

    USER(1, "直接领取"), // 用户可在首页、每日领劵直接领取
    ADMIN(2, "指定发放"), // 后台指定会员赠送优惠劵
    REGISTER(3, "新人券"), // 注册时自动领取
    ;

    public static final int[] ARRAYS = Arrays.stream(values()).mapToInt(CouponTakeTypeEnum::getType).toArray();

    /**
     * 值
     */
    private final Integer type;
    /**
     * 名字
     */
    private final String name;

    @Override
    public int[] array() {
        return ARRAYS;
    }

    public static boolean isUser(Integer type) {
        return Objects.equals(USER.getType(), type);
    }

}
