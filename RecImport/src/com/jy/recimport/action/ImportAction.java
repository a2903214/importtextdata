package com.jy.recimport.action;

import com.jy.recimport.model.ImportInfo;
import com.jy.recimport.util.BaseException;

public interface ImportAction extends BaseAction{
    void importData(ImportInfo importInfo) throws BaseException;
}
