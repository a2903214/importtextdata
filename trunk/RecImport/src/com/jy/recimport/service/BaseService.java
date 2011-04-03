package com.jy.recimport.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public void disconnDB() throws BaseException {
        ConnectionPool.freeConnPool(this.connInfo);
    }

    protected TxnConnection getConnection() throws BaseException {
        return ConnectionPool.getConnection(connInfo);
    }

    protected void begin() throws BaseException {
        TxnConnection conn = this.getConnection();
        if (conn != null) {
            try {
                conn.begin();
            } catch (SQLException e) {
                throw new BaseException("数据库访问失败！", e);
            }
        } else {
            throw new BaseException("获取数据库访问连接失败！");
        }
    }

    protected void commit() throws BaseException {
        TxnConnection conn = this.getConnection();
        if (conn != null) {
            try {
                conn.commit();
            } catch (SQLException e) {
                throw new BaseException("数据库访问失败！", e);
            }
        } else {
            throw new BaseException("获取数据库访问连接失败！");
        }
    }

    protected void rollback() throws BaseException {
        TxnConnection conn = this.getConnection();
        if (conn != null) {
            try {
                conn.rollback();
            } catch (SQLException e) {
                throw new BaseException("数据库访问失败！", e);
            }
        } else {
            throw new BaseException("获取数据库访问连接失败！");
        }
    }

    public interface DBQueryProcess {
        final int INT_TYPE = 0;

        void addParameters(PreparedStatement ps) throws SQLException;

        Object resultProcess(ResultSet result) throws SQLException;
    }

    protected Object executeSQL(String query, DBQueryProcess process) throws BaseException {
        PreparedStatement ps = null;
        ResultSet result = null;
        Object ret = null;
        try {
            TxnConnection conn = this.getConnection();
            this.begin();
            ps = conn.prepareStatement(query);
            if (process != null) {
                process.addParameters(ps);
            }
            ps.execute();
            if (process != null) {
                result = ps.getResultSet();
                ret = process.resultProcess(result);
            }
            this.commit();
        } catch (Throwable e) {
            this.rollback();
        } finally {
            if (result != null) {
                try {
                    result.close();
                } catch (Throwable e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Throwable e) {
                    e.printStackTrace();
                }
            }
        }
        
        return ret;

    }
}
