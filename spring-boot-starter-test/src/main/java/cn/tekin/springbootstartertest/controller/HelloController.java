package cn.tekin.springbootstartertest.controller;

import cn.tekin.starter.HelloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @Autowired
    HelloService helloService;

    @GetMapping("/")
    public String hello(){
        return  helloService.sayHelloTekin("你好");

    }
}
