package com.jy.recimport.model;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class ImportInfo {
    private String filePath = "";

    private String fileEncoding = "GBK";

    private String scale = "0.1217948";

    private String suitableSize = "380";

    private String realSize = "3120";

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

    public String getSuitableSize() {
        return suitableSize;
    }

    public void setSuitableSize(String suitableSize) {
        this.suitableSize = suitableSize;
        this.changeScale();
    }

    public void changeScale() {
        this.setScale(new BigDecimal(suitableSize).divide(new BigDecimal(realSize), 7, RoundingMode.HALF_UP).toString());
    }

    public String getRealSize() {
        return realSize;
    }

    public void setRealSize(String realSize) {
        this.realSize = realSize;
        this.changeScale();
    }

}
