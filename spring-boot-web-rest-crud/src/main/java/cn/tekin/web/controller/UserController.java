package cn.tekin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @PostMapping("/login")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password,
                        Map<String,Object> map, HttpSession session){
        if (!StringUtils.isEmpty("username") && "123456".equals(password)) {
            session.setAttribute("loginUser",username);
            return "redirect:/main.html";
        }
        map.put("msg","用户名或者密码错误");
       return "login";
    }
}
