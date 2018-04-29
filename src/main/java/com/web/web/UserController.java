package com.web.web;

import com.web.dao.UserInfoMapper;
import com.web.po.UserInfo;
import com.web.service.UserService;
import com.web.utils.BaseResult;
import com.web.utils.MD5Util;
import com.web.utils.ServiceResult;
import com.web.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("/register")
    @ResponseBody
    public Object register(String account, String password, String passwordtwo) {
        if (!password.equals(passwordtwo)) {
            return null;
        }
        try {
            UserInfo userInfo = new UserInfo();
            userInfo.setPassword(password);
            userInfo.setAccount(account);
            userInfo.setPassword(MD5Util.md5Encode(userInfo.getPassword()));
            ServiceResult<Boolean> serviceResult = userService.registerUserInfo(userInfo);
            if (serviceResult.getResult() != null && serviceResult.getResult()) {
                //注册成功
                return new BaseResult<String>("注册成功", true);
            }
            return new BaseResult<String>("注册失败", false);
        } catch (Exception e) {
            return new BaseResult<String>("注册失败", false);
        }
    }

    @RequestMapping("/login")
    public Object login(@RequestParam(required = true) String account, @RequestParam(required = true) String password, HttpServletRequest httpServletRequest) {
        if (StringUtil.isEmpty(account) || StringUtil.isEmpty(password)) {
            return new BaseResult<String>("账号或密码不能为空", false);
        }
        try {
            ServiceResult serviceResult = userService.CheckUserInfo(account, password);
            if (serviceResult.getSuccess()) {
                UserInfo userInfo = userService.selectUserInfoByAccount(account);
                httpServletRequest.getSession().setAttribute("userInfo", userInfo);
                return "/main/baiduyunmain";
            }
            return new BaseResult(serviceResult.getResult(), serviceResult.getSuccess());
        } catch (Exception e) {
            return new BaseResult("登录失败", false);
        }

    }

    //修改个人信息
    @RequestMapping("/editUserInfo")
    @ResponseBody
    public Object editUserInfo(@RequestBody UserInfo userInfo) {
        if (userInfo == null) {
            return new BaseResult(false, "参数不正确", 10001);
        }

        return null;

    }

    //修改个人信息
    @RequestMapping("/editPassword")
    @ResponseBody
    public Object editPassword(@RequestParam(required = true) String oldPassword, @RequestParam(required = true) String newPassword, HttpServletRequest request) {
        if (StringUtil.isEmpty(oldPassword) || StringUtil.isEmpty(newPassword)) {
            return new BaseResult(false, "参数不正确", 10001);
        }
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");
        try {
            if (!userInfo.getPassword().equals(MD5Util.md5Encode(oldPassword))) {
                return new BaseResult(false, "旧密码不正确", 10002);
            }
            ServiceResult<UserInfo> serviceResult = userService.selectUserInfo(userInfo.getId());
            if (!serviceResult.getSuccess()) {
                return new BaseResult(false, "密码更新失败", 10003);
            }
            return new BaseResult("更新成功", true);
        } catch (Exception e) {
            return new BaseResult(false, "密码更新失败", 10003);
        }
    }

    @RequestMapping("findTeacherList")
    @ResponseBody
    public Object findTeacherList() {
        List<UserInfo> teacherList = userService.findTeacherList();
        if (CollectionUtils.isEmpty(teacherList)) {
            teacherList = new ArrayList<>();
        }
        return teacherList;
    }
}
