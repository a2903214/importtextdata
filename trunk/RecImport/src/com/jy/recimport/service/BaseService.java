package com.jy.recimport.service;

import com.jy.recimport.db.ConnectionPool;
import com.jy.recimport.db.TxnConnection;
import com.jy.recimport.model.ConnInfo;
import com.jy.recimport.util.BaseException;

public abstract class BaseService {
    private ConnInfo connInfo;

    public ConnInfo getConnInfo() {
        return connInfo;
    }

    public void connectDB(ConnInfo connInfo) throws BaseException {

        if (connInfo != null) {
            this.connInfo = connInfo;
            ConnectionPool.testConnect(connInfo);
        }
    }
    
    public void disconnDB() throws BaseException{
        ConnectionPool.freeConnPool(this.connInfo);
    }

    protected TxnConnection getConnection() throws BaseException {
        return ConnectionPool.getConnection(connInfo);
    }
}
