package com.jy.recimport.model;

public class RecodeData {
    private String pubdate;
    private String edition;
    private String pagename;
    private String pagepdf;
    private String pageimage;
    private String pagesize;
    private String pagehead;
    private String pagetitle;
    private String subtitle;
    private String author;
    private String position;
    private String figure;
    private String illus;
    private String text;
    private String foreword;

    public String getPubdate() {
        return pubdate;
    }

    public void setPubdate(String pubdate) {
        this.pubdate = pubdate;
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }

    public String getPagename() {
        return pagename;
    }

    public void setPagename(String pagename) {
        this.pagename = pagename;
    }
    
    public String getPageFullname(){
        return "第" + this.edition + "期 " + this.pagename;
    }

    public String getPagepdf() {
        return pagepdf;
    }

    public void setPagepdf(String pagepdf) {
        this.pagepdf = pagepdf;
    }

    public String getPageimage() {
        return pageimage;
    }

    public void setPageimage(String pageimage) {
        this.pageimage = pageimage;
    }

    public String getPagesize() {
        return pagesize;
    }

    public void setPagesize(String pagesize) {
        this.pagesize = pagesize;
    }

    public String getPagehead() {
        return pagehead;
    }

    public void setPagehead(String pagehead) {
        this.pagehead = pagehead;
    }

    public String getPagetitle() {
        return pagetitle;
    }

    public void setPagetitle(String pagetitle) {
        this.pagetitle = pagetitle;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getFigure() {
        return figure;
    }

    public void setFigure(String figure) {
        this.figure = figure;
    }

    public String getIllus() {
        return illus;
    }

    public void setIllus(String illus) {
        this.illus = illus;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getForeword() {
        return foreword;
    }

    public void setForeword(String foreword) {
        this.foreword = foreword;
    }

}
