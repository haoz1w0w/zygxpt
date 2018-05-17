package com.web.dao;

import com.web.po.LoadList;

import java.util.List;

public interface LoadListMapper {
    int insert(LoadList record);

    int insertSelective(LoadList record);

    List<LoadList> findLoadListByType(Integer type,Long userId);
}