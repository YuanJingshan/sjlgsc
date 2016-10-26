架构说明

1 框架
服务器：springmvc + mybatis + mysql + tomcat
前端：jsp+jquery

2 校验
前端+服务器
前端：js
服务器：hibernate
validate:hibernate validate
msg file：validatemessages_zh_CN.properties
msg rule：模块名+字段+校验内容+msg
jar:validation-api-1.0.0.GA.jar,jboss-logging-3.1.0.CR2.jar,hibernate-validator-4.3.2.Final.jar

3 缓存
ehcache
jar:ehcache-core-2.6.8.jar,slf4j-api-1.7.12.jar

4 data管理池
dbcp
commons-dbcp2-2.1.1.jar
commons-pool2-2.4.2.jar

5 Message、Url统一管理
Message。java
PageUrl.java


6 全局异常处理
自定义异常
实现springmvc自定全局异常处理器
spring配置异常处理器
错误页面
业务抛出异常

7 过滤器
定义过滤器类实现HandlerInterceptor
配置过滤器
