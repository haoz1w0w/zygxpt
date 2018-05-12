package com.web.service.impl;

import com.web.dao.FileMapper;
import com.web.dao.FolederMapper;
import com.web.dao.TagMapper;
import com.web.po.File;
import com.web.po.Foleder;
import com.web.po.Tag;
import com.web.service.FileService;
import com.web.utils.ServiceResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class FileServiceImpl implements FileService {
    @Autowired
    private FileMapper fileMapper;

    @Autowired
    private FolederMapper folederMapper;

    @Autowired
    private TagMapper tagMapper;

    @Override
    public ServiceResult<Boolean> createFile(File file) {
        ServiceResult serviceResult = new ServiceResult();

        try {
            int flag = fileMapper.insertSelective(file);
            if (flag == 0) {
                serviceResult.setSuccess(false);
                serviceResult.setError("20001", "数据库插入失败");
                return serviceResult;
            }
            serviceResult.setSuccess(true);
            serviceResult.setMessage("插入成功");
            return serviceResult;
        } catch (Exception e) {
            serviceResult.setSuccess(false);
            serviceResult.setError("20001", "数据库插入失败");
            return serviceResult;
        }
    }

    @Override
    public ServiceResult<Boolean> createFolder(Foleder foleder) {
        ServiceResult serviceResult = new ServiceResult();
        folederMapper.insertSelective(foleder);
        serviceResult.setSuccess(true);
        return serviceResult;
    }

    @Override
    public File selectFileById(Long fileId) {
        File file = fileMapper.selectByPrimaryKey(fileId);
        return file;
    }

    @Override
    public List<File> selectFileByList() {
        List<File> files = fileMapper.selectFileByList();
        return files;
    }

    @Override
    public Foleder selectFolderById(Long folderId) {
        Foleder foleder = folederMapper.selectByPrimaryKey(folderId);
        return foleder;
    }

    @Override
    public Foleder selectFolderByName(String folderName) {
        return folederMapper.selectFolederByName(folderName);
    }

    @Override
    public File selectFileByName(String name) {
        return fileMapper.selectFileByName(name);
    }

    @Override
    public List<File> selectFilesByFolderId(Long folderId) {
        return fileMapper.selectFilesByFolrderId(folderId);
    }

    @Override
    public void updateFoleder(Foleder foleder) {
        folederMapper.updateByPrimaryKey(foleder);
    }

    @Override
    public List<Foleder> slectFolderByUserId(Long userId) {
        return folederMapper.findFolederListByUserId(userId);
    }

    @Override
    public List<Foleder> selectAllFoleder() {
        return folederMapper.findFolederAll();
    }

    @Override
    public List<File> findSubjectFiles(Long tagId) {
        return fileMapper.findFilesByTag(tagId);
    }

    @Override
    public List<Tag> findAllTag() {
        return tagMapper.findTagList();
    }

    @Override
    public void delFile(Long fileId) {
        fileMapper.deleteByPrimaryKey(fileId);
    }

    @Override
    public List<File> findFileByFileName(String file_name) {
        return fileMapper.findFilesByFileName(file_name);
    }
}
