package cn.tekin.web.config;

import cn.tekin.web.filter.MyFilter;
import cn.tekin.web.listener.MyListener;
import cn.tekin.web.servlet.MyServlet;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Arrays;

@Configuration
public class MyServerConfig {
    //注册三大组件

    /**
     * Servlet 注册
     * @return
     */
    @Bean
    public ServletRegistrationBean myservlet(){
        ServletRegistrationBean registrationBean = new ServletRegistrationBean(new MyServlet(),"/myservlet");
        return registrationBean;
    }

    /**
     * Myfilter 注册
     * @return
     */
    @Bean
    public FilterRegistrationBean myfilter(){
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        registrationBean.setFilter(new MyFilter());
        registrationBean.setUrlPatterns(Arrays.asList("/hello","/myservlet"));
        return registrationBean;
    }

    /**
     * Listener 注册
     * @return
     */
    @Bean
    public ServletListenerRegistrationBean mylistener(){
        ServletListenerRegistrationBean<MyListener> registrationBean = new ServletListenerRegistrationBean<>(new MyListener());
        return registrationBean;
    }

    /**
     * 配置嵌入式的Servlet 容器
     * @return
     */
    @Bean
    public EmbeddedServletContainerCustomizer embeddedServletContainerCustomizer(){
        return new EmbeddedServletContainerCustomizer() {
            @Override
            public void customize(ConfigurableEmbeddedServletContainer container) {
                //自定义容器端口
                container.setPort(8083);
            }
        };
    }

}
