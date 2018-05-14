package com.web.web;

import com.web.dao.UserInfoMapper;
import com.web.po.Foleder;
import com.web.po.UserInfo;
import com.web.service.FileService;
import com.web.service.UserService;
import com.web.utils.BaseResult;
import com.web.utils.MD5Util;
import com.web.utils.ServiceResult;
import com.web.utils.StringUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Resource
    private UserService userService;

    @Resource
    private FileService fileService;

    @RequestMapping("/register")
    @ResponseBody
    public Object register(String account, String password, Integer role) {
        try {
            UserInfo userInfo = new UserInfo();
            userInfo.setPassword(password);
            userInfo.setAccount(account);
            userInfo.setPassword(MD5Util.md5Encode(userInfo.getPassword()));
            userInfo.setRole(role);
            ServiceResult<Boolean> serviceResult = userService.registerUserInfo(userInfo);
            if (serviceResult.getResult() != null && serviceResult.getResult()) {
                //注册成功
                Foleder foleder = new Foleder();
                foleder.setIs_del(1);
                foleder.setFolder_name("默认文件夹");
                foleder.setUser_id(userInfo.getId());
                fileService.createFolder(foleder);
                return new BaseResult<String>("注册成功", true);
            }
            return new BaseResult<String>("注册失败", false);
        } catch (Exception e) {
            return new BaseResult<String>("注册失败", false);
        }
    }

    @RequestMapping("/login")
    @ResponseBody
    public Object login(String account, String password, HttpServletRequest httpServletRequest) {
        if (StringUtil.isEmpty(account) || StringUtil.isEmpty(password)) {
            return new BaseResult<String>("账号或密码不能为空", false);
        }
        try {
            ServiceResult serviceResult = userService.CheckUserInfo(account, password);
            if (serviceResult.getSuccess()) {
                UserInfo userInfo = userService.selectUserInfoByAccount(account);
                httpServletRequest.getSession().setAttribute("userId", userInfo.getId());
                return true;
            }
            return false;
        } catch (Exception e) {
            return new BaseResult("登录失败", false);
        }

    }

    @RequestMapping("/logout")
    public ModelAndView logout(String account, String password, HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().removeAttribute("userId");
        return new ModelAndView("main");
    }

    //修改个人信息
    @RequestMapping("/editUserInfo")
    @ResponseBody
    public Object editUserInfo(@RequestBody UserInfo userInfo) {
        if (userInfo == null) {
            return new BaseResult(false, "参数不正确", 10001);
        }
        userService.updateUserInfo(userInfo);
        return true;

    }

    @RequestMapping("/loginCheck")
    @ResponseBody
    public Object loginCheck(HttpServletRequest request) {
        Long userId = (Long) request.getSession().getAttribute("userId");
        if (userId == null) {
            return false;
        } else {
            return true;
        }
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
