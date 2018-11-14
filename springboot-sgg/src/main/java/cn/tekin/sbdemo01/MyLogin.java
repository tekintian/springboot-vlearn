package cn.tekin.sbdemo01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyLogin {

    @ResponseBody
    @RequestMapping("/")
    public String login(){
        System.out.println("HELLO world");
        return "login";
    }
}
