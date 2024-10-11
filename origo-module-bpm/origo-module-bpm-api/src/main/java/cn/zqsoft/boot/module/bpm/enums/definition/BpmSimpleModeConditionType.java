package cn.zqsoft.boot.module.bpm.enums.definition;

import cn.hutool.core.util.ArrayUtil;
import cn.zqsoft.boot.framework.common.core.IntArrayValuable;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;

/**
 * 仿钉钉的流程器设计器条件节点的条件类型
 *
 * @author jason
 */
@Getter
@AllArgsConstructor
public enum BpmSimpleModeConditionType implements IntArrayValuable {

    EXPRESSION(1, "条件表达式"),
    RULE(2, "条件规则");

    public static final int[] ARRAYS = Arrays.stream(values()).mapToInt(BpmSimpleModeConditionType::getType).toArray();

    private final Integer type;

    private final String name;

    public static BpmSimpleModeConditionType valueOf(Integer type) {
        return ArrayUtil.firstMatch(nodeType -> nodeType.getType().equals(type), values());
    }

    @Override
    public int[] array() {
        return ARRAYS;
    }
}
