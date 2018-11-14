package cn.tekin.web.component;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

/**
 * 可以在连接上写道国际化区域信息
 */
public class MyLocaleResolver implements LocaleResolver {

    @Override
    public Locale resolveLocale(HttpServletRequest request) {
        String lang = request.getParameter("lang");
        //获取默认语言信息
        Locale locale = Locale.getDefault();
        //如果url中指定了语言信息则使用指定的语言
        if (!StringUtils.isEmpty(lang)){
           String[] split = lang.split("_");
           locale = new Locale(split[0], split[1]);
        }
        return locale;
    }

    @Override
    public void setLocale(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Locale locale) {

    }
}
