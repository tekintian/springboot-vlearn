package cn.tekin.springbootjdbc.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Configuration
public class DruidConfig {

    /**
     * 将自定义的spring.datasource 配置信息加载到容器
     * @return
     */
    @ConfigurationProperties(prefix = "spring.datasource")
    @Bean
    public DataSource druid(){
        return new DruidDataSource();
    }

    /**
     * 配置 Druid 监控，
     * 1. 配置一个管理后台的servlet
     * 2. 配置一个web监控的 Filter
     * @return
     */
    @Bean
    public ServletRegistrationBean statViewServlet(){
        ServletRegistrationBean bean = new ServletRegistrationBean(new StatViewServlet(),"/druid/*");
        Map<String,String> initParameter = new HashMap<>();
        initParameter.put("loginUsername","admin");
        initParameter.put("loginPassword","admin888");
        initParameter.put("allow","");
        initParameter.put("deny","192.168.1.1");

        bean.setInitParameters(initParameter);
        return bean;
    }

    /**
     * 配置一个web监控的 Filter
     * @return
     */
   @Bean
   public FilterRegistrationBean webStatFilter(){
        FilterRegistrationBean bean = new FilterRegistrationBean();
        bean.setFilter(new WebStatFilter());
        Map<String,String> filters= new HashMap<>();
        //指定排除监控
        filters.put("exclusions","*.css,*.js,/druid/*");
        bean.setInitParameters(filters);
        //Arrays.asList("/") 将数组转换为集合
        bean.setUrlPatterns(Arrays.asList("/"));

        return bean;
    }

}
