package cn.tekin.web.config;

import cn.tekin.web.component.LoginHandlerInterceptor;
import cn.tekin.web.component.MyLocaleResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 配置类
 */

@Configuration
public class MyMvcConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addViewControllers(ViewControllerRegistry registry){
        //浏览器发送 /tekin 请求 直接指向到 success模板
        registry.addViewController("/tekin").setViewName("success");
    }

    /**
     * 返回一个WebMvcConfigurerAdapter
     * 使用 @Bean注解将 注解注册到容器中
     */
    @Bean
    public WebMvcConfigurerAdapter webMvcConfigurerAdapter(){

        WebMvcConfigurerAdapter adapter=new WebMvcConfigurerAdapter(){
//采用内部内的方式实现  ctrl+o
            @Override
            public void addViewControllers(ViewControllerRegistry registry) {
                registry.addViewController("/").setViewName("login");
                registry.addViewController("/index.html").setViewName("login");
                registry.addViewController("/main.html").setViewName("dashboard");
            }

            /**
             * 注册拦截器
             * 静态资源 springboot已经做了映射
             * @param registry
             */
            @Override
            public void addInterceptors(InterceptorRegistry registry) {
                registry.addInterceptor(new LoginHandlerInterceptor()).addPathPatterns("/**").excludePathPatterns
                        ("/index.html","/","/user/login");
            }
        };
        return adapter;
    }

    @Bean
    public LocaleResolver localeResolver(){
        return new MyLocaleResolver();
    }
}
