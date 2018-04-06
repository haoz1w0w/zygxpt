package com.web.po;

import java.util.Date;

public class Foleder {
    private Long id;

    private String folder_name;

    private Long father_folder;

    private Integer is_del;

    private Date gmt_create;

    private Date gmt_modify;

    private Long user_id;
    private String folder_password;

    public String getFolder_password() {
        return folder_password;
    }

    public void setFolder_password(String folder_password) {
        this.folder_password = folder_password;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFolder_name() {
        return folder_name;
    }

    public void setFolder_name(String folder_name) {
        this.folder_name = folder_name == null ? null : folder_name.trim();
    }

    public Long getFather_folder() {
        return father_folder;
    }

    public void setFather_folder(Long father_folder) {
        this.father_folder = father_folder;
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
}