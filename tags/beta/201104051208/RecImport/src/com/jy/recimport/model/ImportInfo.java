package com.jy.recimport.model;

public class ImportInfo {
    private String filePath = "./file/recode.txt";
    
    private String fileEncoding = "GBK";

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public void setFileEncoding(String fileEncoding) {
        this.fileEncoding = fileEncoding;
    }

    public String getFileEncoding() {
        return fileEncoding;
    }

}
