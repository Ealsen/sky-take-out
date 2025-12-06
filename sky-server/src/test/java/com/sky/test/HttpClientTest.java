package com.sky.test;

import com.alibaba.fastjson.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;

// @SpringBootTest
public class HttpClientTest {

    /**
     * 测试HttpClient 发送GET请求
     */
    @Test
    public void testDOGet() throws Exception {
        // 创建Httpclient对象
        CloseableHttpClient httpClient = HttpClients.createDefault();

        // 创建请求对象
        HttpGet httpGet = new HttpGet("http://localhost:8080/user/shop/status");

        // 发生请求
        CloseableHttpResponse response = httpClient.execute(httpGet);

        // 获取响应状态码
        int statusCode = response.getStatusLine().getStatusCode();
        System.out.println("获取响应状态码: " + statusCode);

        // 数据读取
        HttpEntity entity = response.getEntity();
        String body = EntityUtils.toString(entity);
        System.out.println("数据读取: " + body);

        // 释放资源
        response.close();
        httpClient.close();
    }

    /**
     * 测试HttpClient 发送POST请求
     */
    @Test
    public void testDoPost() throws Exception {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost("http://localhost:8080/admin/employee/login");
        // 设置请求参数
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("username", "admin");
        jsonObject.put("password", "123456");
        StringEntity entity = new StringEntity(jsonObject.toString(), "utf-8");
        entity.setContentType("application/json");
        httpPost.setEntity(entity);
        // 发送请求
        CloseableHttpResponse response = httpClient.execute(httpPost);
        int statusCode = response.getStatusLine().getStatusCode();
        System.out.println("获取响应状态码: " + statusCode);
        HttpEntity entity1 = response.getEntity();
        String body = EntityUtils.toString(entity1);
        System.out.println("数据读取: " + body);
        response.close();
        httpClient.close();
    }
}
