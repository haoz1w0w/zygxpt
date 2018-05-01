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

        return "/main";
    }
    @RequestMapping("/allSource")
    public String allSource(){

        return "/allSource";
    }
    @RequestMapping("/fenxiang")
    public String fenxiang(){


        return "/main/fenxiang";
    }
    @RequestMapping("/mySource")
    public String mySource(){


        return "/mySource";
    }

}
