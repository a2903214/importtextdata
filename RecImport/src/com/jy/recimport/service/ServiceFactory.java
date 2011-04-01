package com.jy.recimport.service;

import java.lang.reflect.Constructor;

import com.jy.recimport.model.ConnInfo;
import com.jy.recimport.util.BaseException;

public class ServiceFactory {

    <T extends BaseService> T createService(Class<T> clazz, ConnInfo connInfo) throws BaseException {
        T instance = null;
        try {
            Constructor<T> constructor = clazz.getConstructor(ConnInfo.class);
            instance = constructor.newInstance(connInfo);
        } catch (Throwable tr) {
            throw new BaseException("创建" + clazz.getSimpleName() + "类型服务对象失败！", tr);
        }
        return instance;
    }
}
