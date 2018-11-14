package cn.tekin.springboot02;

import cn.tekin.springboot02.bean.Person;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * 单元测试
 */

@RunWith(SpringRunner.class)
@SpringBootTest
public class Springboot02ApplicationTests {

    @Autowired
    Person person;

    @Autowired
    ApplicationContext ioc;

    @Test
    public void contextLoads() {
        System.out.println(person.getLastName());
        System.out.println(person.toString());
    }

    @Test
    public void testHelloService() {
       boolean b=ioc.containsBean("helloService01");
        System.out.println(b);
    }
}
