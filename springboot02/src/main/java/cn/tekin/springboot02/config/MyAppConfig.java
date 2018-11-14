package cn.tekin.springboot02.config;

import cn.tekin.springboot02.service.HelloService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


/**
 * 配置类
 *
 * @author Tekin
 */
@Configuration
public class MyAppConfig {
    @Bean
    public HelloService helloService01(){
        System.out.println("配置类给容器中添加组件");
        return new HelloService();
    }
}
