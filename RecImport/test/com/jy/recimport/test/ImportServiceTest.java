package com.jy.recimport.test;

import junit.framework.Assert;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.jy.recimport.model.ConnInfo;
import com.jy.recimport.model.ImportInfo;
import com.jy.recimport.service.ImportService;
import com.jy.recimport.service.ServiceFactory;
import com.jy.recimport.util.BaseException;

public class ImportServiceTest {
    private ImportService importService = null;
    private ImportInfo importInfo = null;

    @Before
    public void setUp() throws Exception {
        importInfo = new ImportInfo();
        importInfo.setFilePath("./file/recode.txt");
        importInfo.setFileEncoding("GBK");
        importService = ServiceFactory.createService(ImportService.class, new ConnInfo());
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void testImportData() {
        try {
            importService.importData(importInfo);
        } catch (BaseException e) {
            Assert.fail(e.getMessage());
            
        }
    }

}
