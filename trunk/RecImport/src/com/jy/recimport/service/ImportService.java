package com.jy.recimport.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;

import com.jy.recimport.model.ConnInfo;
import com.jy.recimport.model.ImportInfo;
import com.jy.recimport.model.RecodeData;
import com.jy.recimport.util.BaseException;

class KeyInfo {
    public long releaseId = 0;
    public long pageId = 0;
    public long docId = 0;
    public boolean isNewRelease = true;
    public boolean isNewPaper = true;
    public String releaseData = "";
    public String pageFullName = "";

    void copyFrom(KeyInfo keyInfo) {
        this.releaseId = keyInfo.releaseId;
        this.pageId = keyInfo.pageId;
        this.docId = keyInfo.docId;
        this.isNewRelease = keyInfo.isNewRelease;
        this.isNewPaper = keyInfo.isNewPaper;
        this.releaseData = keyInfo.releaseData;
        this.pageFullName = keyInfo.pageFullName;
    }
}

public class ImportService extends BaseService {
    
    public ImportService(ConnInfo connInfo) throws BaseException {
        super(connInfo);
    }

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
                        recodeData.setPubdate(value.substring(0, 8));
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
                        StringTokenizer st = new StringTokenizer(value, ",/");
                        String str = null;
                        for (int i = 0; st.hasMoreTokens(); i++) {
                            str = st.nextToken();
                            int number = Integer.parseInt(str);
                            switch (i) {
                            case 0:
                                recodeData.getPaperArea().setLeft(number);
                                break;
                            case 1:
                                recodeData.getPaperArea().setBottom(number);
                                break;
                            case 2:
                                recodeData.getPaperArea().setRight(number);
                                break;
                            case 5:
                                recodeData.getPaperArea().setTop(number);
                                break;
                            }
                        }
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
            throw ex;
        }
    }

    private void processRecode(final RecodeData recodeData, KeyInfo lastKeyInfo)
            throws BaseException {
        KeyInfo keyInfo = new KeyInfo();
        keyInfo.releaseData = recodeData.getPubdate();
        keyInfo.pageFullName = recodeData.getPageFullname();
        if (!recodeData.getPubdate().equalsIgnoreCase(lastKeyInfo.releaseData)) {
            queryReleaseId(recodeData, keyInfo);
        } else {
            keyInfo.releaseId = lastKeyInfo.releaseId;
            keyInfo.isNewRelease = false;
        }

        if (keyInfo.isNewRelease) {
            this.insertNewRelease(recodeData, keyInfo);
            keyInfo.isNewPaper = true;
        } else {
            if (!recodeData.getPageFullname().equalsIgnoreCase(lastKeyInfo.pageFullName)) {
                this.queryPaperId(recodeData, keyInfo);
            } else {
                keyInfo.isNewPaper = false;
                keyInfo.pageId = lastKeyInfo.pageId;
            }
        }

        if (keyInfo.isNewPaper) {
            this.insertNewPaper(recodeData, keyInfo);
        }

        this.insertNewNews(recodeData, keyInfo);

        this.updatePaperText(recodeData, keyInfo);

        lastKeyInfo.copyFrom(keyInfo);
    }

    private void updatePaperText(final RecodeData recodeData, final KeyInfo keyInfo)
            throws BaseException {
        String updateSQL = "update gp_paper set paper_text = concat( paper_text, ? ) where paper_id = ?";
        super.executeSQL(updateSQL, new DBUpdateNoKeyProcessAdapter() {
            @Override
            public void addParameters(PreparedStatement ps) throws SQLException {
                int i = 1;
                String position = recodeData.getPaperArea().getLeft() + ","
                        + recodeData.getPaperArea().getTop() + ","
                        + recodeData.getPaperArea().getRight() + ","
                        + recodeData.getPaperArea().getBottom();
                ps.setString(i++, "<area shape='rect' href='javascript:shownews(doc_id);' alt='"
                        + recodeData.getPagetitle() + "' title='" + recodeData.getPagetitle()
                        + "' onmouseover=MouseOverMap(" + position + "," + keyInfo.docId
                        + ") onmouseout=MouseOutMap() coords='" + position + "'>");
                ps.setLong(i++, keyInfo.pageId);
            }
        });
    }

    private void insertNewNews(final RecodeData recodeData, final KeyInfo keyInfo)
            throws BaseException {
        String insertSQL = "insert into gp_doc( doc_title_sub, doc_title, doc_title_addon, "
                + "doc_title_pos, doc_body, doc_body_show,"
                + " doc_author_id, doc_edit_time, doc_page_id, doc_paper_id, "
                + "doc_page_name_cn, doc_block_id, doc_release_id, doc_image_comment, "
                + "doc_navi_sign, doc_have_pic, doc_img_option, doc_filename, "
                + "doc_download, doc_filesize, doc_page_index, doc_time_mark, "
                + "doc_body_text, doc_title_text, doc_source, doc_img_list, "
                + "doc_checkflower, doc_property, doc_title_manual, "
                + "doc_is_have_pic, doc_subject_id, doc_ent_id, doc_remark_times, "
                + "doc_all_text, doc_audio_ok, doc_author, doc_keywords, doc_foreword ) values ("
                + "?, ?, ?, 0, ?, null, 87, '2011-3-16 12:36', null, ?, null, -1, "
                + "?, null, 0, ?, 10, null, null, 0, 0, null, null, null, null, ?, "
                + "0, null, null, 0, 0, 107, null, ?, 0, ?, '', ?)";
        super.executeSQL(insertSQL, new String[] { "doc_id" }, new DBUpdateProcessAdapter() {
            @Override
            public void addParameters(PreparedStatement ps) throws SQLException {
                int i = 1;
                ps.setString(i++, recodeData.getPagehead());
                ps.setString(i++, recodeData.getPagetitle());
                ps.setString(i++, recodeData.getSubtitle());
                ps.setString(i++, recodeData.getText());
                ps.setLong(i++, keyInfo.pageId);
                ps.setLong(i++, keyInfo.releaseId);
                ps.setString(i++, recodeData.getFigure());
                ps.setString(i++, recodeData.getFigure());
                ps.setString(i++, recodeData.getPagetitle() + "<br>" + recodeData.getText());
                ps.setString(i++, recodeData.getAuthor());
                ps.setString(i++, recodeData.getForeword());
            }

            @Override
            public void processGeneratedKeys(ResultSet result) throws SQLException {
                if (result.next()) {
                    keyInfo.docId = result.getLong(1);
                } else {
                    throw new SQLException("获取插入新闻ID失败！");
                }
            }
        });
    }

    private void queryPaperId(final RecodeData recodeData, final KeyInfo keyInfo)
            throws BaseException {
        String releaseIdSql = "select paper_id from gp_paper where paper_release_id = ? and paper_name_cn = ?";
        super.executeSQL(releaseIdSql, new DBQueryProcessAdapter() {
            @Override
            public void resultProcess(ResultSet result) throws SQLException {
                if (result.next()) {
                    keyInfo.pageId = result.getLong(1);
                    keyInfo.isNewPaper = false;
                } else {
                    keyInfo.isNewPaper = true;
                }
            }

            @Override
            public void addParameters(java.sql.PreparedStatement ps) throws SQLException {
                int i = 1;
                ps.setLong(i++, keyInfo.releaseId);
                ps.setString(i++, recodeData.getPageFullname());
            }
        });
    }

    private void insertNewPaper(final RecodeData recodeData, final KeyInfo keyInfo)
            throws BaseException {
        String insertSQL = "insert into gp_paper( "
                + "paper_release_id, paper_page_id, paper_url, paper_time, "
                + "paper_author_id, paper_text, paper_filesize, paper_ent_id, "
                + "paper_name_cn, paper_editor, paper_pdf, paper_timestamp) values ("
                + "?, 0, ?, null, 87, '', null, 107, ?, null, ?, '' )";
        super.executeSQL(insertSQL, new String[] { "paper_id" }, new DBUpdateProcessAdapter() {
            @Override
            public void addParameters(java.sql.PreparedStatement ps) throws SQLException {
                int i = 1;
                ps.setLong(i++, keyInfo.releaseId);
                ps.setString(i++, "/newspic/_paper/107/manual" + recodeData.getPageimage());
                ps.setString(i++, recodeData.getPageFullname());
                ps.setString(i++, "/newspic/_pdf/107/" + recodeData.getPagepdf());
            }

            @Override
            public void processGeneratedKeys(ResultSet result) throws SQLException {
                if (result.next()) {
                    keyInfo.pageId = result.getLong(1);
                } else {
                    throw new SQLException("获取插入版次ID失败！");
                }
            }
        });
    }

    private void queryReleaseId(final RecodeData recodeData, final KeyInfo keyInfo)
            throws BaseException {
        String releaseIdSql = "select release_id from gp_release where release_time = ?";
        super.executeSQL(releaseIdSql, new DBQueryProcessAdapter() {
            @Override
            public void resultProcess(ResultSet result) throws SQLException {
                if (result.next()) {
                    keyInfo.releaseId = result.getLong(1);
                    keyInfo.isNewRelease = false;
                } else {
                    keyInfo.isNewRelease = true;
                }
            }

            @Override
            public void addParameters(java.sql.PreparedStatement ps) throws SQLException {
                ps.setString(1, recodeData.getPubdate());
            }
        });
    }

    private void insertNewRelease(final RecodeData recodeData, final KeyInfo keyInfo)
            throws BaseException {
        String insertSQL = "insert into gp_release( "
                + "release_name, release_time, release_pubtime, release_opentime, "
                + "release_doing, release_total, release_ent_id, release_pagecount, "
                + "release_to1, release_whodo, release_whatindex) values ("
                + "'第X期', ?, ?, ?, 0, '总第X期', 107, 0, null, '-', 0 )";
        super.executeSQL(insertSQL, new String[] { "release_id" }, new DBUpdateProcessAdapter() {
            @Override
            public void addParameters(java.sql.PreparedStatement ps) throws SQLException {
                int i = 1;
                ps.setString(i++, recodeData.getPubdate());
                ps.setString(i++, recodeData.getPubdate());
                ps.setString(i++, recodeData.getPubdate());
            }

            @Override
            public void processGeneratedKeys(ResultSet result) throws SQLException {
                if (result.next()) {
                    keyInfo.releaseId = result.getLong(1);
                } else {
                    throw new SQLException("插入期次信息失败！");
                }
            }
        });
    }
}
