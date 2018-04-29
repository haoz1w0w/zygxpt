package com.web.service.impl;

import com.web.dao.UserInfoMapper;
import com.web.po.UserInfo;
import com.web.service.UserService;
import com.web.utils.MD5Util;
import com.web.utils.ServiceResult;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserInfoMapper userInfoMapper;

    @Override
    public ServiceResult<Boolean> registerUserInfo(UserInfo userInfo) {
        ServiceResult<Boolean> serviceResult = new ServiceResult<>();

        try {
            int flag = userInfoMapper.insertSelective(userInfo);
            if (flag == 1) {
                serviceResult.setResult(true);
                serviceResult.setSuccess(true);
                return serviceResult;
            }
        } catch (Exception e) {
            serviceResult.setResult(false);
            serviceResult.setSuccess(false);
            return serviceResult;
        }
        serviceResult.setResult(false);
        serviceResult.setSuccess(false);
        return serviceResult;
    }

    @Override
    public ServiceResult<String> CheckUserInfo(String account, String password) throws Exception {
        ServiceResult<String> stringServiceResult = new ServiceResult<>();

        UserInfo userInfo = userInfoMapper.selectUserInfoByAccount(account);
        if (userInfo == null) {
            stringServiceResult.setSuccess(false);
            stringServiceResult.setResult("账号不存在");
            return stringServiceResult;
        }
        if (!userInfo.getPassword().equals(MD5Util.md5Encode(password))) {
            stringServiceResult.setSuccess(false);
            stringServiceResult.setResult("账号密码不匹配");
            return stringServiceResult;
        }
        stringServiceResult.setSuccess(true);
        stringServiceResult.setResult("登录成功");
        return stringServiceResult;
    }

    @Override
    public ServiceResult<Boolean> updateUserInfo(UserInfo userInfo) {
        UserInfo userInfo1 = userInfoMapper.selectByPrimaryKey(userInfo.getId());
        if (userInfo1 == null) {

        }
        BeanUtils.copyProperties(userInfo, userInfo1);
        Integer flag = userInfoMapper.updateByPrimaryKey(userInfo1);
        if (flag == 0) {
            return null;
        }
        return null;
    }

    @Override
    public ServiceResult<UserInfo> selectUserInfo(Long id) {
        ServiceResult<UserInfo> serviceResult = new ServiceResult<>();
        UserInfo userInfo = userInfoMapper.selectByPrimaryKey(id);
        if (userInfo == null) {
            serviceResult.setResult(new UserInfo());
            serviceResult.setSuccess(false);
            return serviceResult;
        }
        serviceResult.setResult(userInfo);
        serviceResult.setSuccess(true);
        return serviceResult;
    }

    @Override
    public UserInfo selectUserInfoByAccount(String account) {
        return userInfoMapper.selectUserInfoByAccount(account);
    }

    @Override
    public List<UserInfo> findTeacherList() {
        return userInfoMapper.findTeacherList();
    }
}
