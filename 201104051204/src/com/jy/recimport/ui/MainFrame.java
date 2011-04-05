package com.jy.recimport.ui;

import java.awt.BorderLayout;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.UIManager;
import javax.swing.border.EmptyBorder;

import com.jy.recimport.action.ConnAction;
import com.jy.recimport.action.ImportAction;
import com.jy.recimport.db.ConnectionPool;
import com.jy.recimport.model.ConnInfo;
import com.jy.recimport.model.ImportInfo;
import com.jy.recimport.service.ImportService;
import com.jy.recimport.service.ServiceFactory;
import com.jy.recimport.util.BaseException;

public class MainFrame extends JFrame implements ConnAction, ImportAction {
    private ConnPanel connPanel;
    private ImportPanel importPanel;
    private ImportService importService;

    public MainFrame() {

        setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
        addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                if (JOptionPane.OK_OPTION == JOptionPane
                        .showConfirmDialog(MainFrame.this, "确定退出应用程序！", "警告",
                                           JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE)) {
                    MainFrame.this.safeExit();
                }
            }
        });
        setTitle("数据导入程序");
        getContentPane().setLayout(new BorderLayout());

        JPanel panel = new JPanel();
        panel.setBorder(new EmptyBorder(10, 10, 10, 10));
        getContentPane().add(panel, BorderLayout.CENTER);
        panel.setLayout(new BorderLayout(0, 0));
        connPanel = new ConnPanel();
        panel.add(connPanel, BorderLayout.CENTER);
        connPanel.setConnAction(this);
        connPanel.setConnectEnabled(true);
        importPanel = new ImportPanel();
        importPanel.setEnabled(false);
        importPanel.setImportAction(this);
        panel.add(importPanel, BorderLayout.SOUTH);

    }

    public void paint(Graphics g) {
        Graphics2D g2d = (Graphics2D) g;
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_OFF);
        super.paint(g);
    }

    private void safeExit() {
        ConnectionPool.freeAllConnPool();
        System.exit(0);
    }

    /**
	 * 
	 */
    private static final long serialVersionUID = 6078189396163696118L;

    public static void main(String[] args) {

        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Throwable tr) {
            tr.printStackTrace();
        }
        MainFrame mainFrame = new MainFrame();
        mainFrame.pack();
        mainFrame.setSize(500, 390);
        mainFrame.setResizable(false);
        mainFrame.setLocationRelativeTo(null);
        mainFrame.setVisible(true);
    }

    @Override
    public void connectDB(ConnInfo connInfo) throws BaseException {
        importService = ServiceFactory.createService(ImportService.class, connInfo);
        importPanel.setEnabled(true);
        connPanel.setConnectEnabled(false);

    }

    @Override
    public void disconnectDB() throws BaseException {
        importService.disconnDB();
        importPanel.setEnabled(false);
        connPanel.setConnectEnabled(true);
    }

    @Override
    public void importData(ImportInfo importInfo) throws BaseException {
        this.importService.importData(importInfo);

    }

    @Override
    public void processMessage(int messageType, String message, Throwable tr) {
        JOptionPane.showMessageDialog(this, message, "", messageType);
        if( tr != null ){
            tr.printStackTrace();
        }

    }

}
