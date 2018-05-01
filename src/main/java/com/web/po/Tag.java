package com.web.po;

import java.io.Serializable;

public class Tag implements Serializable {
    private Integer id;

    private String tag_name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTag_name() {
        return tag_name;
    }

    public void setTag_name(String tag_name) {
        this.tag_name = tag_name == null ? null : tag_name.trim();
    }
}