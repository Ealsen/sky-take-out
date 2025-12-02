# sky-take-out
苍穹外卖

## 项目总结

### 项目基本信息
- **项目名称**: `sky-take-out` (苍穹外卖)
- **项目类型**: 外卖订餐系统
- **项目性质**: 基于Spring Boot的Web应用

### 项目目录结构
根据检索到的代码信息，项目采用Maven多模块结构：

```
sky-take-out/
├── pom.xml                          # 父项目POM文件
├── sky-common/                      # 公共模块
│   ├── pom.xml
│   └── src/main/java/com/sky/utils/ # 工具类(如HttpClientUtil)
├── sky-pojo/                        # 实体类模块
│   ├── pom.xml
│   └── src/main/java/com/sky/
│       ├── entity/                  # 实体类(Dish, Setmeal, Order等)
│       ├── dto/                     # 数据传输对象(OrdersDTO, OrdersSubmitDTO等)
│       └── vo/                      # 视图对象(BusinessDataVO, OrderReportVO等)
└── sky-server/                      # 服务端主模块
    ├── pom.xml
    ├── src/main/java/com/sky/
    │   ├── SkyApplication.java      # 启动类
    │   ├── controller/              # 控制层(admin, user)
    │   ├── service/                 # 业务层接口及实现
    │   ├── mapper/                  # 数据访问层
    │   ├── task/                    # 定时任务(OrderTask)
    │   └── config/                  # 配置类
    └── src/main/resources/
        ├── application.yml          # 主配置文件
        ├── sky_take_out.sql         # 数据库脚本
        └── template/                # 模板文件(如exportData.xlsx)
```


### 技术栈

#### 后端技术栈
- **核心框架**: Spring Boot 2.7.3
- **持久层框架**: MyBatis + MyBatis-Plus
- **数据库连接池**: Druid 1.2.1
- **分页插件**: PageHelper 1.3.0
- **ORM工具**: Lombok 1.18.20
- **JSON处理**: FastJSON 1.2.76
- **工具库**: Apache Commons Lang 2.6
- **API文档**: Knife4j 3.0.2 (Swagger增强)
- **安全框架**: JWT 0.9.1
- **AOP支持**: AspectJ 1.9.4
- **Excel处理**: Apache POI 3.16
- **HTTP客户端**: Apache HttpClient
- **对象存储**: 阿里云OSS 3.10.2

#### 数据库
- **主数据库**: MySQL
- **连接池**: Druid

#### 开发规范与特性
- **日志框架**: SLF4J + Logback
- **自动填充**: 自定义[@AutoFill](file://E:\myDocumentDirections\codeDirections\a-sky-take-out-project\sky-take-out\sky-server\src\main\java\com\sky\annotation\AutoFill.java#L12-L17)注解实现字段自动填充
- **统一响应**: [Result](file://E:\myDocumentDirections\codeDirections\a-sky-take-out-project\sky-take-out\sky-common\src\main\java\com\sky\result\Result.java#L10-L37)统一封装响应格式
- **定时任务**: Spring Scheduled实现订单超时处理等
- **文件上传**: 本地存储策略

### 项目功能模块
1. **员工管理**: 登录、权限控制
2. **菜品管理**: 菜品分类、菜品信息维护
3. **套餐管理**: 套餐组合、套餐状态管理
4. **订单管理**: 订单流程、状态跟踪
5. **数据统计**: 营业额统计、用户统计、订单统计、销量排行
6. **工作台**: 实时经营数据展示
7. **报表导出**: Excel格式运营数据导出

### 项目历程
- 2025.11.20: 项目开始，创建项目骨架，添加基础功能
- 2025.12.02: 项目完成，完成admin和user接口开发

### 项目相关教程
- [黑马程序员Java项目实战《苍穹外卖》，最适合新手的SpringBoot+SSM的企业级Java项目实战](https://www.bilibili.com/video/BV1TP411v7v6/)
- [苍穹外卖 | 面试总结篇](https://blog.csdn.net/chan12345678910/article/details/148069962)