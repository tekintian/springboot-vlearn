package cn.tekin.demohelloworldquick.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

//这个类的所有方法返回的数据直接放回给浏览器
/*@ResponseBody
@Controller*/
@RestController
public class HelloController {
    @RequestMapping("/")
    public String hello() {
        return "Hello wrold";
    }
}
