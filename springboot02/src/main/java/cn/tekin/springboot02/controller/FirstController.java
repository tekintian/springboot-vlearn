package cn.tekin.springboot02.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FirstController {
    @RequestMapping("/")
    public String first(){
        return "My first controller";
    }
}
