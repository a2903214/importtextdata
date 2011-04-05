package com.jy.recimport.model;

public class ImportInfo {
    private String filePath = "";
    
    private String fileEncoding = "GBK";
    
    private String scale = "0.1217948";

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

    public void setScale(String scale) {
        this.scale = scale;
    }

    public String getScale() {
        return scale;
    }
    
}
