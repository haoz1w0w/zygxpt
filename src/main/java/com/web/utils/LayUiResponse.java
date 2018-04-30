package com.web.utils;

import java.io.Serializable;
import java.util.List;

public class LayUiResponse<T> implements Serializable {
    private Integer code;
    private String msg;
    private Integer count;
    private List<T> data;
    private Long folederId;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public Long getFolederId() {
        return folederId;
    }

    public void setFolederId(Long folederId) {
        this.folederId = folederId;
    }
}
