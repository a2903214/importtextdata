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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import com.jy.recimport.model.ImportInfo;
import com.jy.recimport.model.RecodeData;
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

class ImportFileReader {
    private RowCallback rowCallback;
    private FieldCallback fieldCallback;
    private ImportInfo importInfo;
    private Reader reader;
    private final static int START_STATUS = 1;
    private final static int KEYWORD_STATUS = 2;
    private final static int FIELD_DATA_STATUS = 3;

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
                        status = KEYWORD_STATUS;
                    } else {
                        throw new BaseException("文件起始位置出现非法结构");
                    }
                    break;
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
                    } else if (!fieldCallback.isValidField(currentKeyword)) {
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

public class ImportService extends BaseService {
    public final static String ROW_KEYWORD = "REC";

    public final static String FIELD_PUBDATE_KEYWORD = "出版日期";
    public final static String FIELD_EDITION_KEYWORD = "版次";
    public final static String FIELD_PAGENAME_KEYWORD = "版面名称";
    public final static String FIELD_PAGEPDF_KEYWORD = "版面PDF";
    public final static String FIELD_PAGEIMAGE_KEYWORD = "版面图";
    public final static String FIELD_PAGESIZE_KEYWORD = "版面尺寸";
    public final static String FIELD_PAGEHEAD_KEYWORD = "引题";
    public final static String FIELD_PAGETITLE_KEYWORD = "标题";
    public final static String FIELD_SUBTITLE_KEYWORD = "副题";
    public final static String FIELD_FOREWORD_KEYWORD = "引言";
    public final static String FIELD_AUTHOR_KEYWORD = "作者";
    public final static String FIELD_POSITION_KEYWORD = "坐标";
    public final static String FIELD_FIGURE_KEYWORD = "插图";
    public final static String FIELD_ILLUS_KEYWORD = "插图说明";
    public final static String FIELD_TEXT_KEYWORD = "正文";

    public static final Set<String> FIELD_NAME_SET = new HashSet<String>();

    static {
        FIELD_NAME_SET.add(FIELD_PUBDATE_KEYWORD);
        FIELD_NAME_SET.add(FIELD_EDITION_KEYWORD);
        FIELD_NAME_SET.add(FIELD_PAGENAME_KEYWORD);
        FIELD_NAME_SET.add(FIELD_PAGEPDF_KEYWORD);
        FIELD_NAME_SET.add(FIELD_PAGEIMAGE_KEYWORD);
        FIELD_NAME_SET.add(FIELD_PAGESIZE_KEYWORD);
        FIELD_NAME_SET.add(FIELD_PAGEHEAD_KEYWORD);
        FIELD_NAME_SET.add(FIELD_PAGETITLE_KEYWORD);
        FIELD_NAME_SET.add(FIELD_SUBTITLE_KEYWORD);
        FIELD_NAME_SET.add(FIELD_AUTHOR_KEYWORD);
        FIELD_NAME_SET.add(FIELD_POSITION_KEYWORD);
        FIELD_NAME_SET.add(FIELD_FIGURE_KEYWORD);
        FIELD_NAME_SET.add(FIELD_ILLUS_KEYWORD);
        FIELD_NAME_SET.add(FIELD_TEXT_KEYWORD);
        FIELD_NAME_SET.add(FIELD_FOREWORD_KEYWORD);
    }

    public void importData(ImportInfo importInfo) throws BaseException {
        final RecodeData recodeData = new RecodeData();
        final KeyInfo lastKeyInfo = new KeyInfo();
        try {
            ImportFileReader importFileReader = new ImportFileReader(importInfo);
            super.begin();
            importFileReader.setRowCallback(new RowCallback() {

                @Override
                public void processRow() throws BaseException {
                    processRecode(recodeData, lastKeyInfo);
                }

                @Override
                public boolean isRowKeyword(String name) {
                    return name.equalsIgnoreCase(ROW_KEYWORD);
                }
            });

            importFileReader.setFieldCallback(new FieldCallback() {

                @Override
                public void processField(String name, String value) {
                    if ((FIELD_PUBDATE_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setPubdate(value.substring(0, 7));
                    } else if ((FIELD_EDITION_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setEdition(value);
                    } else if ((FIELD_PAGENAME_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setPagename(value);
                    } else if ((FIELD_PAGEPDF_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setPagepdf(value);
                    } else if ((FIELD_PAGEIMAGE_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setPageimage(value);
                    } else if ((FIELD_PAGESIZE_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setPagesize(value);
                    } else if ((FIELD_PAGEHEAD_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setPagehead(value);
                    } else if ((FIELD_PAGETITLE_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setPagetitle(value);
                    } else if ((FIELD_SUBTITLE_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setSubtitle(value);
                    } else if ((FIELD_AUTHOR_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setAuthor(value);
                    } else if ((FIELD_POSITION_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setPosition(value);
                    } else if ((FIELD_FIGURE_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setFigure(value);
                    } else if ((FIELD_ILLUS_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setIllus(value);
                    } else if ((FIELD_TEXT_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setText(value);
                    } else if ((FIELD_FOREWORD_KEYWORD.equalsIgnoreCase(name))) {
                        recodeData.setForeword(value);
                    }
                }

                @Override
                public boolean isValidField(String name) {
                    return FIELD_NAME_SET.contains(name);
                }

                @Override
                public int getFieldCount() {
                    return FIELD_NAME_SET.size();
                }

            });

            importFileReader.traverse();
            super.commit();
        } catch (BaseException ex) {
            super.rollback();
        }
    }

    class KeyInfo {
        public int releaseId = 0;
        public boolean isNewRelease = true;
        public boolean isNewPaper = true;
        public String releaseData = "";
        public String pageFullName = "";
    }
    
    private KeyInfo processRecode(final RecodeData recodeData, KeyInfo lastKeyInfo) throws BaseException {
        final KeyInfo keyInfo = new KeyInfo();
        
        queryReleaseId(recodeData, keyInfo);

        if (keyInfo.isNewRelease) {
            keyInfo.releaseId = this.insertNewGP(recodeData);
            keyInfo.isNewPaper = true;
        }else{
            
        }
        
        return keyInfo ;

    }
    
    private void queryPaperId(final RecodeData recodeData, final KeyInfo keyInfo) throws BaseException{
        String releaseIdSql = "select paper_id from gp_paper where paper_release_id = ? and paper_name_cn = ?";
        super.executeSQL(releaseIdSql, new DBQueryProcess() {
            @Override
            public Object resultProcess(ResultSet result) throws SQLException {
                if (result.next()) {
                    keyInfo.releaseId = result.getInt(0);
                } else {
                    keyInfo.isNewRelease = true;
                }
                return keyInfo;
            }

            @Override
            public void addParameters(java.sql.PreparedStatement ps) throws SQLException {
                int i=1;                
                ps.setString(i++, recodeData.getPubdate());
                ps.setString(i++, recodeData.getPageFullname());
            }
        });
    }

    private void queryReleaseId(final RecodeData recodeData, final KeyInfo keyInfo)
            throws BaseException {
        String releaseIdSql = "select release_id from gp_release where release_time = ?";
        super.executeSQL(releaseIdSql, new DBQueryProcess() {
            @Override
            public Object resultProcess(ResultSet result) throws SQLException {
                if (result.next()) {
                    keyInfo.releaseId = result.getInt(0);
                } else {
                    keyInfo.isNewRelease = true;
                }
                return keyInfo;
            }

            @Override
            public void addParameters(java.sql.PreparedStatement ps) throws SQLException {
                ps.setString(1, recodeData.getPubdate());
            }
        });
    }

    private int insertNewGP(final RecodeData recodeData) throws BaseException {
        String insertSQL = "insert into gp_release( "
                + "release_name, release_time, release_pubtime, release_opentime, "
                + "release_doing, release_total, release_ent_id, release_pagecount, "
                + "release_to1, release_whodo, release_whatindex) values ("
                + "'第x期', ?, ?, ?, 0, '第x期', 107, 0, null, '-', 0 )";
        super.executeSQL(insertSQL, new DBQueryProcess() {

            @Override
            public Object resultProcess(ResultSet result) throws SQLException {
                return null;
            }

            @Override
            public void addParameters(java.sql.PreparedStatement ps) throws SQLException {
                int i = 1;
                ps.setString(i++, recodeData.getPubdate());
                ps.setString(i++, recodeData.getPubdate());
                ps.setString(i++, recodeData.getPubdate());
            }
        });
        
        final KeyInfo keyInfo = new KeyInfo();
        this.queryReleaseId(recodeData, keyInfo);
        if( keyInfo.isNewRelease ){
            throw new BaseException("插入期次信息失败！");
        }
        return keyInfo.releaseId;
    }
}
