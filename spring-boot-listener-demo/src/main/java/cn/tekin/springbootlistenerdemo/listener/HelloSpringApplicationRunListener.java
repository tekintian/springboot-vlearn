package cn.tekin.springbootlistenerdemo.listener;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.SpringApplicationRunListener;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;

import java.util.Map;

public class HelloSpringApplicationRunListener implements SpringApplicationRunListener {

    //有参构造器
    public HelloSpringApplicationRunListener(SpringApplication application, String[] args){

    }

    @Override
    public void starting() {
        System.out.println("SpringApplicationRunListener starting");
    }

    @Override
    public void environmentPrepared(ConfigurableEnvironment environment) {
        System.out.println("SpringApplicationRunListener 环境OK ");

        System.out.println("==================getSystemProperties===================");
       for (Map.Entry<String,Object> m:environment.getSystemProperties().entrySet()){
           System.out.println(m.getKey()+" = "+ m.getValue());
       }
        System.out.println("==================getSystemEnvironment===================");
       for (Map.Entry<String,Object> kv:environment.getSystemEnvironment().entrySet()){
           System.out.println(kv.getKey() + " = " + kv.getValue());
       }

        System.out.println("网站目录："+environment.getSystemProperties().get("user.dir"));
        System.out.println("操作系统名称："+environment.getSystemProperties().get("os.name"));
        System.out.println("当前登录用户名："+environment.getSystemProperties().get("user.name"));
        System.out.println("JAVA版本："+environment.getSystemProperties().get("java.specification.version"));

    }

    @Override
    public void contextPrepared(ConfigurableApplicationContext context) {
        System.out.println("准备就绪");
    }

    @Override
    public void contextLoaded(ConfigurableApplicationContext context) {
        System.out.println("context"+ context);
    }

    @Override
    public void finished(ConfigurableApplicationContext context, Throwable exception) {
        System.out.println("完成");

    }
}
