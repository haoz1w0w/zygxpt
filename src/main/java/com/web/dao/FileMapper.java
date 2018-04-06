package com.web.dao;

import com.web.po.File;

import java.util.List;

public interface FileMapper {
    int deleteByPrimaryKey(Long id);

    int insert(File record);

    int insertSelective(File record);

    File selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(File record);

    int updateByPrimaryKey(File record);

    List<File> selectFileByList();

    File selectFileByName(String fileName);

    List<File> selectFilesByFolrderId(Long folderId);

}