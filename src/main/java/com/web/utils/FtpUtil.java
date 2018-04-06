package com.web.utils;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.stereotype.Component;

import java.io.*;

@Component
public class FtpUtil {
    //                                  ("127.0.0.1", 21, "test", "test", "D:/ftp", "test.txt", innput)
    public boolean uploadFile(String path, String filename, InputStream input) {

        boolean success = false;
        FTPClient ftp = new FTPClient();
        try {
            int reply;
            ftp.connect("127.0.0.1", 21);//连接FTP服务器
            //如果采用默认端口，可以使用ftp.connect(url)的方式直接连接FTP服务器
            ftp.login("haoz1", "123456");//登录
            reply = ftp.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                ftp.disconnect();
                return success;
            }
            ftp.setFileType(FTP.BINARY_FILE_TYPE);
            ftp.changeWorkingDirectory(path);
            ftp.storeFile(filename, input);

            input.close();
            ftp.logout();
            success = true;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (ftp.isConnected()) {
                try {
                    ftp.disconnect();
                } catch (IOException ioe) {
                }
            }
        }
        return success;
    }

    public static void downloadFtpFile(String ftpPath, String localPath,
                                       String fileName) {

        FTPClient ftpClient = new FTPClient();

        try {
            ftpClient.connect("127.0.0.1", 21);//连接FTP服务器
            //如果采用默认端口，可以使用ftp.connect(url)的方式直接连接FTP服务器
            ftpClient.login("haoz1", "123456");//登录            ftpClient.setControlEncoding("UTF-8"); // 中文支持
            ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
            ftpClient.enterLocalPassiveMode();
            ftpClient.changeWorkingDirectory(ftpPath);

            File localFile = new File(localPath + File.separatorChar + fileName);
            OutputStream os = new FileOutputStream(localFile);
            ftpClient.retrieveFile(fileName, os);
            os.close();
            ftpClient.logout();
        } catch (Exception e) {

        }

    }

    public static void main(String[] args) {
        downloadFtpFile("/u=2168427908,4072089613&fm=200&gp=0.jpg","E:\\Program Files","u=2168427908,4072089613&fm=200&gp=0.jpg");
    }


}
