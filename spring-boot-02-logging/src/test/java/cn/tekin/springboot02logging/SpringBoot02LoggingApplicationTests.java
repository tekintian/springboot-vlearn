package cn.tekin.springboot02logging;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringBoot02LoggingApplicationTests {
    Logger logger=  LoggerFactory.getLogger(getClass());

    @Test
    public void contextLoads() {

        //日志级别
        //由第到高，可以调整日志shuchu8的级别
        logger.trace("这个是trace日志");
        logger.debug("这个是debug日志");
//        SpringBoot默认速出的日志级别是 info 及以上级别
        logger.info("这个是info日志");
        logger.warn("这个是warn日志");
        logger.error("这个是error日志");
    }


}
