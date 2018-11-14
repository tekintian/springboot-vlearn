package cn.tekin.springbootstartdiy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.http.converter.StringHttpMessageConverter;

import java.nio.charset.Charset;

@SpringBootApplication
public class SpringBootStartDiyApplication {
    @Bean
    public StringHttpMessageConverter stringHttpMessageConverter(){
        return new StringHttpMessageConverter(Charset.forName("gb2312"));
    }
    public static void main(String[] args) {
        SpringApplication.run(SpringBootStartDiyApplication.class, args);
    }
}
