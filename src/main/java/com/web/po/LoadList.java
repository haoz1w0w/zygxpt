package com.web.po;

import java.util.Date;

public class LoadList {
    private Long id;

    private String file_name;

    private Date gmt_download;

    private Integer is_del;

    private Long user_id;

    private Integer type;

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
        this.file_name = file_name == null ? null : file_name.trim();
    }

    public Date getGmt_download() {
        return gmt_download;
    }

    public void setGmt_download(Date gmt_download) {
        this.gmt_download = gmt_download;
    }

    public Integer getIs_del() {
        return is_del;
    }

    public void setIs_del(Integer is_del) {
        this.is_del = is_del;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}