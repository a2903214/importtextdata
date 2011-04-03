package com.jy.recimport.action;

import com.jy.recimport.model.ConnInfo;
import com.jy.recimport.util.BaseException;

public interface ConnAction extends BaseAction{
    
    void connectDB(ConnInfo connInfo) throws BaseException;
    
    void disconnectDB() throws BaseException;
    
}
