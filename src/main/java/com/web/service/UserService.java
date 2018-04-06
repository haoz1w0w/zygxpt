package com.web.service;

import com.web.po.UserInfo;
import com.web.utils.ServiceResult;

public interface UserService {
    public ServiceResult<Boolean> registerUserInfo(UserInfo userInfo);

    public ServiceResult<String> CheckUserInfo(String account, String password) throws Exception;

    public ServiceResult<Boolean> updateUserInfo(UserInfo userInfo);

    public ServiceResult<UserInfo> selectUserInfo(Long id);

    public UserInfo selectUserInfoByAccount(String account);

}
