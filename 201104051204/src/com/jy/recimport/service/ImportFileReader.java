package com.jy.recimport.service;

import java.io.BufferedInputStream;
import java.io.CharArrayWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;

import com.jy.recimport.model.ImportInfo;
import com.jy.recimport.util.BaseException;

interface RowCallback {
    void processRow() throws BaseException;

    boolean isRowKeyword(String name);
}

interface FieldCallback {

    void processField(String name, String value);

    boolean isValidField(String name);

    int getFieldCount();

}

public class ImportFileReader {
    private RowCallback rowCallback;
    private FieldCallback fieldCallback;
    private ImportInfo importInfo;
    private Reader reader;
    private final static int START_STATUS = 1;
    private final static int KEYWORD_STATUS = 2;
    private final static int FIELD_DATA_STATUS = 3;
    private static final int ROW_KEYWORD_STATUS = 4;
    private static final int FIELD_KEYWORD_STATUS = 5;

    private CharArrayWriter keywordDataWriter = new CharArrayWriter(50);
    private CharArrayWriter fieldDataWriter = new CharArrayWriter(500);

    private boolean firstRow = true;
    private String currentKeyword = null;
    private String lastFieldName = null;
    private boolean firstField = true;
    private int fieldCount = 0;

    public ImportFileReader(ImportInfo importInfo) throws BaseException {
        this.importInfo = importInfo;

        try {
            InputStream is = new BufferedInputStream(new FileInputStream(
                    this.importInfo.getFilePath()), 8000);
            this.reader = new InputStreamReader(is, this.importInfo.getFileEncoding());
        } catch (FileNotFoundException e) {
            throw new BaseException("导入文件不存在", e);
        } catch (UnsupportedEncodingException e) {
            throw new BaseException("对导入文件编码失败", e);
        }
    }

    public void traverse() throws BaseException {
        int curChar = 0;
        int status = START_STATUS;

        try {
            while ((curChar = this.reader.read()) > 0) {
                switch (status) {
                case START_STATUS:
                    if (curChar == '<') {
                        status = ROW_KEYWORD_STATUS;
                    } else {
                        throw new BaseException("文件起始位置出现非法结构");
                    }
                    break;
                case ROW_KEYWORD_STATUS:
                case FIELD_KEYWORD_STATUS:
                case KEYWORD_STATUS: {
                    do {
                        keywordDataWriter.write(curChar);
                        curChar = this.reader.read();
                    } while (curChar != '>');
                    currentKeyword = keywordDataWriter.toString();
                    keywordDataWriter.reset();
                    if (rowCallback.isRowKeyword(currentKeyword)) {
                        this.processRow();
                        while ((curChar = this.reader.read()) != '<') {
                            if (curChar != '\r' && curChar != '\n') {
                                throw new BaseException("列起始标示符不正确");
                            }
                        }
                        status = FIELD_KEYWORD_STATUS;
                    } else if (ROW_KEYWORD_STATUS == status) {
                        throw new BaseException("文件格式不正确");
                    } else if (!fieldCallback.isValidField(currentKeyword)) {
                        if (FIELD_KEYWORD_STATUS == status) {
                            throw new BaseException("文件格式不正确");
                        }
                        fieldDataWriter.write('<');
                        fieldDataWriter.write(currentKeyword);
                        fieldDataWriter.write('>');
                        keywordDataWriter.reset();
                        status = FIELD_DATA_STATUS;
                    } else {
                        this.processField();
                        curChar = this.reader.read();
                        if (curChar != '=') {
                            throw new BaseException("字段数据格式不正确");
                        }
                        status = FIELD_DATA_STATUS;
                    }
                    break;
                }
                case FIELD_DATA_STATUS:
                    do {
                        fieldDataWriter.write(curChar);
                        curChar = this.reader.read();
                    } while (curChar > 0 && curChar != '<');
                    if (curChar == '<') {
                        status = KEYWORD_STATUS;
                    }
                    break;
                }
            }
            this.processRow();
        } catch (IOException e) {
            throw new BaseException("文件访问失败！", e);
        }

    }

    void processField() {
        if (!firstField) {
            char[] tempData = fieldDataWriter.toCharArray();
            fieldCallback.processField(lastFieldName, new String(tempData, 0, tempData.length - 2));
            fieldDataWriter.reset();
        }
        firstField = false;
        lastFieldName = currentKeyword;
        fieldCount++;
    }

    void processRow() throws BaseException {
        if (!firstRow) {
            char[] tempData = fieldDataWriter.toCharArray();
            fieldCallback.processField(lastFieldName, new String(tempData, 0, tempData.length - 2));
            fieldDataWriter.reset();
            rowCallback.processRow();
            firstField = true;
            fieldCount = 0;
        }
        firstRow = false;
    }

    public void close() {
        if (this.reader != null) {
            try {
                this.reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void setFieldCallback(FieldCallback fieldCallback) {
        this.fieldCallback = fieldCallback;
    }

    public FieldCallback getFieldCallback() {
        return fieldCallback;
    }

    public void setRowCallback(RowCallback rowCallback) {
        this.rowCallback = rowCallback;
    }

    public RowCallback getRowCallback() {
        return rowCallback;
    }
}
