package com.web.dao;

import com.web.po.Foleder;

import java.util.List;

public interface FolederMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Foleder record);

    int insertSelective(Foleder record);

    Foleder selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Foleder record);

    int updateByPrimaryKey(Foleder record);

    Foleder selectFolederByName(String folderName);

    List<Foleder> findFolederListByUserId(Long userId);

    List<Foleder> findFolederAll();

}