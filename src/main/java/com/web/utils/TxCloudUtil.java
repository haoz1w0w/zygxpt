package com.web.utils;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.GetObjectRequest;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.region.Region;
import org.springframework.stereotype.Component;

import java.io.File;

@Component
public class TxCloudUtil {
    private static String bucketName = "test-1256150574";

    public COSClient createCloud() {
        COSCredentials cred = new BasicCOSCredentials("AKID7A2khaoqGyYyDgrwoW3UnxwnSwUviXij", "2wSs395pPtC0hFcARfv54sffZIrGuSNC");
        ClientConfig clientConfig = new ClientConfig(new Region("ap-beijing"));
        COSClient cosclient = new COSClient(cred, clientConfig);
        return cosclient;
    }

    public void updload(String fileName, File file) {
        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, fileName, file);
        TxCloudUtil txCloudUtil = new TxCloudUtil();
        COSClient cosClient = txCloudUtil.createCloud();
        PutObjectResult putObjectResult=cosClient.putObject(putObjectRequest);
        cosClient.shutdown();
    }

}

