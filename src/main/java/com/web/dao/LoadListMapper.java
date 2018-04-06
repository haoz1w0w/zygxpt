package com.web.dao;

import com.web.po.LoadList;

public interface LoadListMapper {
    int insert(LoadList record);

    int insertSelective(LoadList record);
}