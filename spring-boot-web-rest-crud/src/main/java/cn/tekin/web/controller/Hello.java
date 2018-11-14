package cn.tekin.web.controller;

import cn.tekin.web.exception.UserNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.Map;

@Controller
public class Hello {

    @ResponseBody
    @RequestMapping("/hello")
    public String hello(){
        return "hello world";
    }

    @RequestMapping("/success")
    public String succes(Map<String, Object> map){

        map.put("hello","<h1>欢迎访问</h1>");
        map.put("users", Arrays.asList("张三","李四","王五"));
        return "success";
    }

    @ResponseBody
    @RequestMapping("/diyetest")
    public String diyException(@RequestParam("user") String user){
        if (user.equals("aaa")){
            throw new UserNotFoundException();
        }else{
            return "your are welcome! -- UserNotFoundException Test";
        }
    }
}
