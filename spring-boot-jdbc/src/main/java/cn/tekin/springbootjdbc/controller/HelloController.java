package cn.tekin.springbootjdbc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class HelloController {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @ResponseBody
    @RequestMapping("/")
    public List<Map<String,Object>> hello(){

        List<Map<String,Object>> list=jdbcTemplate.queryForList("select e.*,d.departmentName from employee e," +
                "department d where e.d_id=d.id");

        return list;
    }
}
