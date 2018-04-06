package com.web.po;

import java.util.Date;
import java.util.List;

public class FileDto {
    private Long id;

    private String file_name;

    private String file_url;

    private Integer file_tag;

    private Long folder_id;

    private Integer is_del;

    private Date gmt_create;

    private Date gmt_modify;

    private Long user_id;
    private Boolean isFolder;
    private String folder_name;

    private Long father_folder;
    private List<File> sonFiles;

    public List<File> getSonFiles() {
        return sonFiles;
    }

    public void setSonFiles(List<File> sonFiles) {
        this.sonFiles = sonFiles;
    }

    public Long getFather_folder() {
        return father_folder;
    }

    public void setFather_folder(Long father_folder) {
        this.father_folder = father_folder;
    }

    public String getFolder_name() {
        return folder_name;
    }

    public void setFolder_name(String folder_name) {
        this.folder_name = folder_name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFile_name() {
        return file_name;
    }

    public void setFile_name(String file_name) {
        this.file_name = file_name;
    }

    public String getFile_url() {
        return file_url;
    }

    public void setFile_url(String file_url) {
        this.file_url = file_url;
    }

    public Integer getFile_tag() {
        return file_tag;
    }

    public void setFile_tag(Integer file_tag) {
        this.file_tag = file_tag;
    }

    public Long getFolder_id() {
        return folder_id;
    }

    public void setFolder_id(Long folder_id) {
        this.folder_id = folder_id;
    }

    public Integer getIs_del() {
        return is_del;
    }

    public void setIs_del(Integer is_del) {
        this.is_del = is_del;
    }

    public Date getGmt_create() {
        return gmt_create;
    }

    public void setGmt_create(Date gmt_create) {
        this.gmt_create = gmt_create;
    }

    public Date getGmt_modify() {
        return gmt_modify;
    }

    public void setGmt_modify(Date gmt_modify) {
        this.gmt_modify = gmt_modify;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Boolean getFolder() {
        return isFolder;
    }

    public void setFolder(Boolean folder) {
        isFolder = folder;
    }
}
