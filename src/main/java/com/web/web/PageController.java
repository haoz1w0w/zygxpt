package com.web.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by caoxudong on 2018/4/6.
 *
 * @author caoxudong
 */
@Controller
public class PageController {


    @RequestMapping("/main")
    public String toBaiDuYunMain(){

        return "/main/shouye";
    }
    @RequestMapping("/allSource")
    public String allSource(){

        return "/main/allsource";
    }
    @RequestMapping("/fenxiang")
    public String fenxiang(){


        return "/main/fenxiang";
    }

}
