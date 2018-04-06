package com.web.utils;

import java.io.Serializable;

public class BaseResult<T> implements Serializable {
    private T data;
    private Boolean success;
    private String errorMessage;
    private Integer code;

    public BaseResult(T data, Boolean success, String errorMessage, Integer code) {
        this.data = data;
        this.success = success;
        this.errorMessage = errorMessage;
        this.code = code;
    }

    public BaseResult(T data, Boolean success) {
        this.data = data;
        this.success = success;
    }

    public BaseResult(Boolean success, String errorMessage, Integer code) {
        this.success = success;
        this.errorMessage = errorMessage;
        this.code = code;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
