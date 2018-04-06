package com.web.dao;

import com.web.po.ResourceShare;

public interface ResourceShareMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ResourceShare record);

    int insertSelective(ResourceShare record);

    ResourceShare selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ResourceShare record);

    int updateByPrimaryKey(ResourceShare record);
}