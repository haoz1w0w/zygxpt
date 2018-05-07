package com.web.web;

import com.web.dao.ResourceShareMapper;
import com.web.po.*;
import com.web.service.FileService;
import com.web.utils.*;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.omg.CORBA.INTERNAL;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("file")
public class FileController {
    @Resource
    FileService fileService;
    @Resource
    TxCloudUtil txCloudUtil;
    @Autowired
    ResourceShareMapper resourceShareMapper;
    private final static String url = "https://test-1256150574.cos.ap-beijing.myqcloud.com/";

    @RequestMapping("fileList")
    @ResponseBody
    public Object fileList(HttpServletRequest request, Long folederId) {
//        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");
        List<FilesDTO> list = new ArrayList<>();
        if (folederId == null) {
            List<Foleder> foleders = fileService.selectAllFoleder();
            for (Foleder foleder : foleders) {
                if (!StringUtil.isEmpty(foleder.getFolder_password())) {
                    continue;
                }
                FilesDTO filesDTO = new FilesDTO();
                filesDTO.setId(foleder.getId());
                filesDTO.setFileName(foleder.getFolder_name());
                filesDTO.setGmtCreate(foleder.getGmt_create());
                filesDTO.setIsFile(1);
                list.add(filesDTO);
            }
        } else {
            List<com.web.po.File> files = fileService.selectFilesByFolderId(folederId);
            for (com.web.po.File file : files) {
                FilesDTO filesDTO = new FilesDTO();
                filesDTO.setId(file.getId());
                filesDTO.setFileName(file.getFile_name());
                filesDTO.setGmtCreate(file.getGmt_create());
                filesDTO.setIsFile(2);
                filesDTO.setUrl(file.getFile_url());
                list.add(filesDTO);
            }
        }
        LayUiResponse layUiResponse = new LayUiResponse();
        layUiResponse.setCode(0);
        layUiResponse.setData(list);
        layUiResponse.setCount(list.size());
        layUiResponse.setMsg(" ");
        layUiResponse.setFolederId(5l);
        return layUiResponse;
    }

    @RequestMapping("findMyfile")
    @ResponseBody
    public Object findMyFile(HttpServletRequest request) {
        Long userId = (Long) request.getSession().getAttribute("userId");
        List<FilesDTO> list = new ArrayList<>();
        List<Foleder> foleders = fileService.slectFolderByUserId(userId);
        for (Foleder foleder : foleders) {
            FilesDTO filesDTO = new FilesDTO();
            filesDTO.setId(foleder.getId());
            filesDTO.setFileName(foleder.getFolder_name());
            filesDTO.setGmtCreate(foleder.getGmt_create());
            filesDTO.setIsFile(1);
            list.add(filesDTO);
        }
        LayUiResponse layUiResponse = new LayUiResponse();
        layUiResponse.setCode(0);
        layUiResponse.setData(list);
        layUiResponse.setCount(list.size());
        layUiResponse.setMsg(" ");
        layUiResponse.setFolederId(5l);
        return layUiResponse;
    }

    @RequestMapping("findUserFile")
    @ResponseBody
    public Object findUserFile(HttpServletRequest request, Long userId) {
//        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");
        List<FilesDTO> list = new ArrayList<>();
        List<Foleder> foleders = fileService.slectFolderByUserId(userId);
        for (Foleder foleder : foleders) {
            FilesDTO filesDTO = new FilesDTO();
            filesDTO.setId(foleder.getId());
            filesDTO.setFileName(foleder.getFolder_name());
            filesDTO.setGmtCreate(foleder.getGmt_create());
            filesDTO.setIsFile(1);
            filesDTO.setPassword(foleder.getFolder_password());
            list.add(filesDTO);
        }
        LayUiResponse layUiResponse = new LayUiResponse();
        layUiResponse.setCode(0);
        layUiResponse.setData(list);
        layUiResponse.setCount(list.size());
        layUiResponse.setMsg(" ");
        layUiResponse.setFolederId(5l);
        return layUiResponse;
    }

    @RequestMapping("findSubjectFiles")
    @ResponseBody
    public Object findSubjectFiles(HttpServletRequest request, Long tagId) {
//        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");
        List<FilesDTO> list = new ArrayList<>();
        List<com.web.po.File> files = fileService.findSubjectFiles(tagId);
        for (com.web.po.File file : files) {
            FilesDTO filesDTO = new FilesDTO();
            filesDTO.setId(file.getId());
            filesDTO.setFileName(file.getFile_name());
            filesDTO.setGmtCreate(file.getGmt_create());
            filesDTO.setIsFile(2);
            list.add(filesDTO);
        }
        LayUiResponse layUiResponse = new LayUiResponse();
        layUiResponse.setCode(0);
        layUiResponse.setData(list);
        layUiResponse.setCount(list.size());
        layUiResponse.setMsg(" ");
        return layUiResponse;
    }

    @RequestMapping("getAllTag")
    @ResponseBody
    public Object getAllTag(HttpServletRequest request) {
//        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");
        List<Tag> allTag = fileService.findAllTag();
        return allTag;
    }

    @RequestMapping("uploadFile")
    @ResponseBody
    public Object uploadFile(MultipartFile file, Long folderId, HttpServletRequest request, Integer tagId) {
        Long userId = (Long) request.getSession().getAttribute("userId");
        File file1 = null;
        try {
            file1 = multipartToFile(file);
            txCloudUtil.updload(file.getOriginalFilename(), file1);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //上传之后将链接存入数据库
        if (folderId != null) {
            ServiceResult<Boolean> file2 = fileService.createFile(file.getOriginalFilename(), url + file.getOriginalFilename(), folderId, userId, tagId);
            if (file2.getSuccess()) {
                return new BaseResult(file2.getMessage(), true);
            }
        }
        return new BaseResult(false, "文件上传失败，请重新上传", 20001);
    }
    @RequestMapping("uploadFileByUserId")
    @ResponseBody
    public Object uploadFile(MultipartFile file, Long folderId, HttpServletRequest request, Integer tagId,Long userId) {
        File file1 = null;
        try {
            file1 = multipartToFile(file);
            txCloudUtil.updload(file.getOriginalFilename(), file1);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //上传之后将链接存入数据库
        if (folderId != null) {
            ServiceResult<Boolean> file2 = fileService.createFile(file.getOriginalFilename(), url + file.getOriginalFilename(), folderId, userId, tagId);
            if (file2.getSuccess()) {
                return new BaseResult(file2.getMessage(), true);
            }
        }
        return new BaseResult(false, "文件上传失败，请重新上传", 20001);
    }

    @RequestMapping("mkdirFolder")
    @ResponseBody
    public Object crateNewFolder(String folderName, Long fatherId, HttpServletRequest request) {
        Long userId = (Long) request.getSession().getAttribute("userId");
        fileService.createFolder(folderName, fatherId,userId);
        //创建文件夹
        return new BaseResult("存储成功", true);
    }

    @RequestMapping("saveMyFile")
    @ResponseBody
    public Object saveMyFile(Long fileId, Long folderId, HttpServletRequest rquest) {
        com.web.po.File file = fileService.selectFileById(fileId);
        UserInfo userInfo = (UserInfo) rquest.getSession().getAttribute("userInfo");
        fileService.createFile(file.getFile_name(), file.getFile_url(), folderId, userInfo.getId(), file.getFile_tag());
        return new BaseResult("保存成功", true);
    }

    @RequestMapping("queryFileByCondition")
    @ResponseBody
    public Object queryFileByCondition(String fileName) {
        List<FileDto> newList = new ArrayList<>();
        if (StringUtil.isEmpty(fileName)) {
            List<com.web.po.File> list = fileService.selectFileByList();
            for (com.web.po.File file : list) {
                if (file.getFolder_id() == null) {
                    FileDto fileDto = converByFile(file);
                    newList.add(fileDto);
                } else {
                    Foleder foleder = fileService.selectFolderById(file.getFolder_id());
                    if (null != foleder.getFolder_password()) {
                        FileDto fileDto = converByFile(file);
                        newList.add(fileDto);
                    }
                }
            }
            return new BaseResult(newList, true);
        }
        com.web.po.File file = fileService.selectFileByName(fileName);
        Foleder foleder = fileService.selectFolderByName(fileName);
        if (file != null) {
            FileDto fileDto = converByFile(file);
            newList.add(fileDto);
        }
        if (foleder != null) {
            FileDto fileDto = converByFolder(foleder);
            List<com.web.po.File> files = fileService.selectFilesByFolderId(foleder.getId());
            fileDto.setSonFiles(files);
            newList.add(fileDto);
        }
        return new BaseResult(newList, true);
    }

    @RequestMapping("queryFilesByFolder")
    @ResponseBody
    public Object queryFilesByFolder(Long folderId) {
        List<com.web.po.File> files = fileService.selectFilesByFolderId(folderId);
        List<Foleder> foleders = new ArrayList<>();
        for (com.web.po.File file : files) {
            Foleder foleder = new Foleder();
            foleder.setFolder_name(file.getFile_name());
            foleder.setId(file.getId());
            foleder.setGmt_create(file.getGmt_create());
            foleders.add(foleder);
        }
        LayUiResponse layUiResponse = new LayUiResponse();
        layUiResponse.setCode(0);
        layUiResponse.setData(foleders);
        layUiResponse.setCount(foleders.size());
        layUiResponse.setMsg(" ");
        return layUiResponse;
    }

    @RequestMapping("folderEncryption")
    @ResponseBody
    public Object folderEncryption(Long folderId, String password) {
        Foleder foleder = fileService.selectFolderById(folderId);
        foleder.setFolder_password(password);
        fileService.updateFoleder(foleder);
        return new BaseResult<>("成功", true);
    }

    @RequestMapping("ResourceShare")
    @ResponseBody
    public Object ResourceShare(Long fileId, Integer method, String password, Integer encode) {
        ResourceShare resourceShare = new ResourceShare();
        if (encode == 1) {
            //加密
            if (method == 0) {
                //自动生成
                password = getStringRandom(4);
            }

        }
        resourceShare.setFile_id(fileId);
        resourceShare.setPassword(password);
        resourceShare.setGmt_create(new Date());
        resourceShareMapper.insertSelective(resourceShare);
        String url = "http://localhost:8080/fileShare?id=" + resourceShare.getId();
        ResourceShareDto resourceShareDto = new ResourceShareDto();
        resourceShareDto.setUrl(url);
        resourceShareDto.setEncode(encode);
        resourceShareDto.setPasswod(password);
        return new BaseResult<>(resourceShareDto, true);
    }

    @RequestMapping("delFile")
    @ResponseBody
    public Object delFile(Long fileId) {
        fileService.delFile(fileId);
        return true;
    }

    //生成随机数字和字母,
    public String getStringRandom(int length) {

        String val = "";
        Random random = new Random();
        //length为几位密码
        for (int i = 0; i < length; i++) {
            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
            //输出字母还是数字
            if ("char".equalsIgnoreCase(charOrNum)) {
                //输出是大写字母还是小写字母
                int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;
                val += (char) (random.nextInt(26) + temp);
            } else if ("num".equalsIgnoreCase(charOrNum)) {
                val += String.valueOf(random.nextInt(10));
            }
        }
        return val;
    }

    @RequestMapping("findFileByFileName")
    @ResponseBody
    public Object findFileByFileName(String name) {
        List<FilesDTO> list = new ArrayList<>();
        List<com.web.po.File> files = fileService.findFileByFileName(name);
        for (com.web.po.File file : files) {
            FilesDTO filesDTO = new FilesDTO();
            filesDTO.setId(file.getId());
            filesDTO.setFileName(file.getFile_name());
            filesDTO.setGmtCreate(file.getGmt_create());
            filesDTO.setIsFile(2);
            filesDTO.setUrl(file.getFile_url());
            list.add(filesDTO);
        }

        LayUiResponse layUiResponse = new LayUiResponse();
        layUiResponse.setCode(0);
        layUiResponse.setData(list);
        layUiResponse.setCount(list.size());
        layUiResponse.setMsg(" ");
        layUiResponse.setFolederId(5l);
        return layUiResponse;
    }

    private FileDto converByFile(com.web.po.File file) {
        FileDto fileDto = new FileDto();
        BeanUtils.copyProperties(file, fileDto);
        fileDto.setFolder(false);
        return fileDto;
    }

    //            fileService.selectFileById();
    //    @ResponseBody
    //        //如果folderId为空 则是最外层文件夹
    //        if (folderId == null) {
//        }
//        return null;
//    }
    @RequestMapping("FolderEncrypt")
    @ResponseBody
    public Object FolderEncrypt(String password, Long folderId) {
        if (StringUtil.isEmpty(password) || StringUtil.isEmpty(String.valueOf(folderId))) {
            return new BaseResult("参数异常", false);
        }
        Foleder foleder = fileService.selectFolderById(folderId);
        foleder.setFolder_password(password);
        fileService.updateFoleder(foleder);
        return new BaseResult("设置成功", true);
    }

    private File multipartToFile(MultipartFile multfile) throws IOException {
        CommonsMultipartFile cf = (CommonsMultipartFile) multfile;
        //这个myfile是MultipartFile的
        DiskFileItem fi = (DiskFileItem) cf.getFileItem();
        File file = fi.getStoreLocation();
        //手动创建临时文件
//        if (file.length() > 2048) {
        File tmpFile = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") +
                file.getName());
        multfile.transferTo(tmpFile);
        return tmpFile;
//        }
//        return file;
    }
    //    @RequestMapping("queryMyFile")

    private FileDto converByFolder(Foleder file) {
        FileDto fileDto = new FileDto();
        BeanUtils.copyProperties(file, fileDto);
        fileDto.setFolder(true);
        return fileDto;
    }
}
