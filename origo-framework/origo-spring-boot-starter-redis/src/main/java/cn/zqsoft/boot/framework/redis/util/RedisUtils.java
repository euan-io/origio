package cn.zqsoft.boot.framework.redis.util;

import com.alibaba.fastjson.JSONObject;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;
import java.util.function.Supplier;

/**
 * redis 工具类
 *
 * @author Euan
 * @since 2024/12/15
 */
@Component
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class RedisUtils {

    private final RedisTemplate<String, Object> redisTemplate;

    /**
     * 通用缓存获取逻辑
     *
     * @param key        缓存键
     * @param type       返回的对象类型
     * @param dbSupplier 数据库查询逻辑 (返回 T 的数据)
     * @param expireTime 缓存过期时间 (单位：秒)
     * @param <T>        泛型实体类型
     * @return 查询结果
     */
    public <T> T getOrLoad(String key, Class<T> type, Supplier<T> dbSupplier, long expireTime) {
        // Step 1: 从缓存中获取数据
        Object cacheValue = redisTemplate.opsForValue().get(key);

        if (cacheValue != null) {
            if ("null".equals(cacheValue)) {
                // 缓存穿透占位符
                return null;
            }
            // 缓存命中
            return JSONObject.parseObject(cacheValue.toString(), type);
        }

        // Step 2: 获取分布式锁
        String lockKey = key + ":lock";
        // 锁有效期：5 秒
        boolean lockAcquired = tryLock(lockKey, 5);

        T result = null;
        try {
            if (lockAcquired) {
                // 双重检查缓存
                cacheValue = redisTemplate.opsForValue().get(key);
                if (cacheValue != null) {
                    if ("null".equals(cacheValue)) {
                        return null;
                    }
                    return JSONObject.parseObject(cacheValue.toString(), type);
                }

                // Step 3: 缓存未命中，从数据库加载数据
                result = dbSupplier.get();
                if (result != null) {
                    // 正常结果，缓存
                    redisTemplate.opsForValue().set(key, JSONObject.toJSONString(result), expireTime, TimeUnit.SECONDS);
                } else {
                    // 空值结果，写入占位符
                    // 缓存空值 10 分钟
                    redisTemplate.opsForValue().set(key, "null", 10, TimeUnit.MINUTES);
                }
            } else {
                // Step 4: 未获取到锁，等待重试
                // 等待 50ms 后重试
                Thread.sleep(50);
                return getOrLoad(key, type, dbSupplier, expireTime);
            }
        } catch (Exception e) {
            throw new RuntimeException("Error retrieving cache for key: " + key, e);
        } finally {
            // Step 5: 释放锁
            if (lockAcquired) {
                releaseLock(lockKey);
            }
        }
        return result;
    }

    /**
     * 获取锁
     */
    private boolean tryLock(String lockKey, long expireSeconds) {
        Boolean result = redisTemplate.opsForValue().setIfAbsent(lockKey, "1", expireSeconds, TimeUnit.SECONDS);
        return Boolean.TRUE.equals(result);
    }

    /**
     * 释放锁
     */
    private void releaseLock(String lockKey) {
        redisTemplate.delete(lockKey);
    }

}
