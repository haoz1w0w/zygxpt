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
    public ServiceResult<Boolean> createFile(String fileName, String fileUrl, Long folderId, Long userId, Integer tagId) {
        ServiceResult serviceResult = new ServiceResult();
        File file = new File();
        file.setFile_name(fileName);
        file.setFile_url(fileUrl);
        file.setFolder_id(folderId);
        file.setIs_del(1);
        file.setGmt_create(new Date());
        file.setGmt_modify(new Date());
        file.setUser_id(userId);
        file.setFile_tag(tagId);
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
    public ServiceResult<Boolean> createFolder(String folderName, Long fatherId, Long userId) {
        ServiceResult serviceResult = new ServiceResult();
        Foleder foleder = new Foleder();
        foleder.setGmt_create(new Date());
        foleder.setIs_del(1);
        foleder.setFolder_name(folderName);
        foleder.setFather_folder(fatherId);
        foleder.setUser_id(userId);
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
