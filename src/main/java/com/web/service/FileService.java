package com.web.service;

import com.web.po.File;
import com.web.po.Foleder;
import com.web.po.Tag;
import com.web.utils.ServiceResult;

import java.util.List;

public interface FileService {

    /**
     * 创建文件
     */
    public ServiceResult<Boolean> createFile(String fileName, String fileUrl, Long folderId, Long userId, Integer tagId);

    /**
     * 创建文件夹
     */
    public ServiceResult<Boolean> createFolder(String folderName, Long fatherId, Long userId);

    //根据文件ID查询
    public File selectFileById(Long fileId);

    public List<File> selectFileByList();

    public Foleder selectFolderById(Long folderId);

    public Foleder selectFolderByName(String folderName);

    public File selectFileByName(String name);

    public List<File> selectFilesByFolderId(Long folderId);

    public void updateFoleder(Foleder foleder);

    public List<Foleder> slectFolderByUserId(Long userId);

    public List<Foleder> selectAllFoleder();

    public List<File> findSubjectFiles(Long tagId);

    public List<Tag> findAllTag();
}
