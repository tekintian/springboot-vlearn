package cn.tekin.springbootstartdiy.demo;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Tekin
 */
@RestController
public class RecursiveCall {

    @RequestMapping("/lcount")
    public Map<String,String> message(@RequestParam(name="str", required = true) String str, @RequestParam(value="l",
            required =  true) String l) {
        Map<String,String> data = new HashMap<>();
        if (str == null || str.equals("")) {
            data.put("msg","统计字符不能为空！");
            data.put("status","0");
        }else{
            data.put("msg",str);
            data.put("status","1");
            data.put("count", String.valueOf(new RecursiveCall().countA(str,l)));
        }

        return data;
    }

    public int countA(String input, String str){
        if (input == null || input.equals("")) {
            return 0;
        }
        int count=0;
        if(input.substring(0,1).equals(str)){
            count = 1;
        }
        System.out.println("input.substring(1) === "+input.substring(1));
        return count + countA(input.substring(1),str);
    }
}
