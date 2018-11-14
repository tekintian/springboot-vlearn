# SpringBoot视频  学习笔记



### 自动配置类

EnableAutoConfiguration

spring-boot-autoconfigure\1.5.12.RELEASE\spring-boot-autoconfigure-1.5.12.RELEASE.jar!\META-INF\maven\org.springframework.boot\spring-boot-autoconfigure





### 使用 Spring Initializer快速创建项目



\src\main\resources

- static 静态文件
- templates 模板文件 （SpringBoot默认使用嵌入式tomcat , 默认不支持jsp页面）； 可以使用模板引擎 freemark,thymeleaf
- application.properties 配置文件



## 二 ， 配置文件

SpringBoot使用一个全局配置文件，配置文件名是固定的

- application.properties

- application.yml


YAML ( YAML Ain't Markup Language)

**以数据为中心**



k:v 字面直接写

字符默认不用加上单引号或者双引号

“” 双引号不会转义字符串里面的字符

'' 单引号会转义字符



对象，map （属性和值）（键值对）

​	对象还是以 k:v的方式

~~~yaml
friends:
    lastName: tian
    age: 20
~~~

函内写法

~~~yaml
friends:{lastname: tian,age:20}
~~~





数组（list,set）

用 -  值表示数组中的一个元素

~~~yaml
pets:
 - cat
 - dog
 - pig
~~~

函内写法

~~~yaml
pets:[cat,dog,pig]
~~~

## 配置文件

application.yml



PropertiesSources

~~~java
@PropertySource(value = "classpath:person.properties")
~~~

配置占位符

1.随机数

${random.int[1024,65535]}

默认值

${person.hello:**默认值**}



## 5. profile

默认使用 application.properties



激活指定profile 

spring.profile.active=dev



命令行

--spring.profiles.active=dev

虚拟机参数

-Dspring.profiles.active=dev



配置文件加载位置，优先级[全部配置文件都会加载， 高优先级的会覆盖低优先级的配置，优先级最低 4 classpath:/  ]

1. file:./config/
2. file:./
3. classpath:/config/
4. classpath:/



互补配置

spring.config.location=



外部配置的加载顺序

![1541314374786](C:\Users\Tekin\AppData\Roaming\Typora\typora-user-images\1541314374786.png)

优先加载 带 profile

由jar包外到jar包内



命令行  --配置项=值   多个用空格分开



所有支持的配置加载来源

https://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#boot-features-external-config



@Conditional  派生注解



怎么知道哪些自动配置类生效

在配置文件中增加  debug=true   就会在控制台输出匹配的自动配置





~~~text
条件匹配报告
============================
CONDITIONS EVALUATION REPORT
============================

启用的
Positive matches:
-----------------



未启用的
Negative matches:
-----------------



~~~



## 日志

日志门面  SLF4J,

日志实现  LogBack



如何使用日志记录

```java
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HelloWorld {
  public static void main(String[] args) {
    Logger logger = LoggerFactory.getLogger(HelloWorld.class);
    logger.info("Hello World");
  }
}
```



**统一日志**



springboot 能自动适配所有日志，在引入其他框架的时候，需要吧引入的框架原来的日志框架排除掉



在配置文件 application.properties 中配置日志级别

```yaml
# 调整日志输出级别
logging.level.cn.tekin=trace
```



logback.xml   直接被日志框架加载



**logback-spring.xml  可以指定某段日志只在指定的环境生效  ,可以使用springBoot的高级特性  springProfile**



静态资源映射    "/**" 访问当前项目的任何资源

~~~xml
"classpath:/META-INFO/resources",
"calsspath:/resources/",
"calsspath:/static/",
"classpath:/public/",
"/"  当前项目的根路径
~~~



application.properties   

值为数组的，直接用逗号分隔即可

#定义静态资源文件夹

spring.resources.static-lacations=classpath:/images,classpath:/upload



## 模板引擎

SpringBoot推荐的 Thymeleaf  [语法更简单，功能更强大]

引入 Thymeleaf



th:text 

th:任意HTML属性 来替换原生属性











