package cn.tekin.springbootwebwar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/index")
    public String index(Model model){
        model.addAttribute("msg","你好");
        return "index";
    }
}
