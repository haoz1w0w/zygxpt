package com.web.web;

import com.web.dao.ResourceShareMapper;
import com.web.po.*;
import com.web.service.FileService;
import com.web.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by caoxudong on 2018/4/6.
 *
 * @author caoxudong
 */
@Controller
public class PageController {
    @Resource
    private FileService fileService;

    @Autowired
    private ResourceShareMapper resourceShareMapper;

    @RequestMapping("/main")
    public String toBaiDuYunMain() {

        return "/main";
    }

    @RequestMapping("/allSource")
    public String allSource() {

        return "/allSource";
    }

    @RequestMapping("/fenxiang")
    public ModelAndView fenxiang(Long fileId) {
        ModelAndView modelAndView = new ModelAndView("/fenxiang");
        File file = fileService.selectFileById(fileId);
        modelAndView.addObject("file", file);
        return modelAndView;
    }

    @RequestMapping("/mySource")
    public String mySource() {


        return "/mySource";
    }

    @RequestMapping("/fileShare")
    public ModelAndView fileShare(Long id) {
        ResourceShare resourceShare = resourceShareMapper.selectByPrimaryKey(id);
        ModelAndView modelAndView = new ModelAndView("/fileShare");
        Integer jiami = 0;
        if (!StringUtil.isEmpty(resourceShare.getPassword())) {
            jiami = 1;
        }
        modelAndView.addObject("jiami", jiami);
        modelAndView.addObject("share", resourceShare);
        return modelAndView;
    }

    @RequestMapping("/upload")

    public ModelAndView upload(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("/upload");
        List<Foleder> foleders = fileService.slectFolderByUserId(2l);
        List<FolederDTO> foledersDto = new ArrayList<>();
        for (Foleder foleder : foleders) {
            FolederDTO folederDTO = new FolederDTO();
            folederDTO.setId(foleder.getId());
            folederDTO.setFolderName(foleder.getFolder_name());
            foledersDto.add(folederDTO);
        }
        modelAndView.addObject("foleders", foledersDto);
        List<Tag> allTag = fileService.findAllTag();
        modelAndView.addObject("allTag", allTag);
        modelAndView.addObject("name", "测试");
        return modelAndView;
    }

    @RequestMapping("/tiqumima")
    public String tiqumima() {
        return "/tiqumima";
    }
}
