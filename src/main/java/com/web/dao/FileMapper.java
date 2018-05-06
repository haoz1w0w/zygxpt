package com.web.dao;

import com.web.po.File;
import com.web.po.Foleder;

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

    List<File> findFilesByTag(Long tagId);

    List<File> findFilesByFileName(String fileName);


}