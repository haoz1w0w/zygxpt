package com.web.po;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2018/4/28 0028.
 */
public class FilesDTO implements Serializable {
    private Long id;
    private String fileName;
    private Date gmtCreate;
    private Integer isFile;
    private String url;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Integer getIsFile() {
        return isFile;
    }

    public void setIsFile(Integer isFile) {
        this.isFile = isFile;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
