package com.web.dao;

import com.web.po.UserInfo;

import java.util.List;

public interface UserInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);

    UserInfo selectUserInfoByAccount(String account);

    List<UserInfo> findTeacherList();
}