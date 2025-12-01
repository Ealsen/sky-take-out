package com.sky.test;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.*;

import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

// @SpringBootTest
public class SpringDataRedisTest {

    @Autowired
    private RedisTemplate redisTemplate;

    private void cleanCache(String pattern) {
        Set keys = redisTemplate.keys(pattern);
        redisTemplate.delete(keys);
    }

    @Test
    public void testCleanCache001() {
        cleanCache("dish_*");
    }

    @Test
    public void testRedisTemplate() {
        System.out.println(redisTemplate);
        ValueOperations valueOperations = redisTemplate.opsForValue();
        HashOperations hashOperations = redisTemplate.opsForHash();
        ListOperations listOperations = redisTemplate.opsForList();
        SetOperations setOperations = redisTemplate.opsForSet();
        ZSetOperations zSetOperations = redisTemplate.opsForZSet();
    }

    /**
     * 测试Redis字符串操作
     */
    @Test
    public void testRedisString() {
        // set get setex setnx
        redisTemplate.opsForValue().set("city", "荆州");
        String city = (String) redisTemplate.opsForValue().get("city");
        System.out.println(city);
        redisTemplate.opsForValue().set("code", "123", 3, TimeUnit.MINUTES);
        String code = (String) redisTemplate.opsForValue().get("code");
        System.out.println(code);
        redisTemplate.opsForValue().setIfAbsent("lock", "1");
        redisTemplate.opsForValue().setIfAbsent("lock", "2");
    }

    /**
     * 测试Redis哈希表操作
     */
    @Test
    public void testRedisHash() {
        // hset hget hdel hkeys hvals
        HashOperations hashOperations = redisTemplate.opsForHash();
        hashOperations.put("100", "name", "张三");
        hashOperations.put("100", "age", "20");
        hashOperations.put("100", "sex", "男");
        String name = (String) hashOperations.get("100", "name");
        System.out.println(name);
        Set keys = hashOperations.keys("100");
        System.out.println(keys);
        List values = hashOperations.values("100");
        System.out.println(values);
        hashOperations.delete("100", "age");
        Set deletedKeys = hashOperations.keys("100");
        System.out.println(deletedKeys);
    }

    /**
     * 测试Redis列表操作
     */
    @Test
    public void testRedisList() {
        // lpush lpop lrange lrem
        ListOperations listOperations = redisTemplate.opsForList();
        listOperations.leftPushAll("list", "1", "2", "3");
        listOperations.leftPush("list", "4");
        List list = listOperations.range("list", 0, -1);
        System.out.println(list);
        listOperations.rightPop("list");
        Long size = listOperations.size("list");
        System.out.println(size);
    }

    /**
     * 测试Redis集合操作
     */
    @Test
    public void testRedisSet() {
        // sadd smembers sismember srem union scard sinter ...
        SetOperations setOperations = redisTemplate.opsForSet();
        setOperations.add("set", "1", "2", "3");
        setOperations.add("set", "4");
        Set set = setOperations.members("set");
        System.out.println(set);
        setOperations.remove("set", "1");
        Set deletedSet = setOperations.members("set");
        System.out.println(deletedSet);
        setOperations.isMember("set", "2");
        System.out.println(setOperations.isMember("set", "2"));
    }
}
