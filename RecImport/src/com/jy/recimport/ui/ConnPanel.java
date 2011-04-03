package com.jy.recimport.ui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

import org.jdesktop.beansbinding.AutoBinding;
import org.jdesktop.beansbinding.AutoBinding.UpdateStrategy;
import org.jdesktop.beansbinding.BeanProperty;
import org.jdesktop.beansbinding.Bindings;

import com.jy.recimport.action.ConnAction;
import com.jy.recimport.model.ConnInfo;
import com.jy.recimport.util.BaseException;

public class ConnPanel extends JPanel {

    private ConnAction connAction;

    /**
	 * 
	 */
    private static final long serialVersionUID = 7687820457488857949L;
    private JTextField ipTextField;
    private JTextField portTextField;
    private JTextField dbnameTextField;
    private JTextField usernameTextField;
    private JTextField passwordTextField;

    private ConnInfo connInfo = new ConnInfo();

    private JLabel ipLabel;
    private JLabel portLabel;
    private JLabel dbnameLabel;
    private JLabel usernameLabel;
    private JLabel passwordLabel;

    private JButton connButton;
    private JButton disconnButton;

    /**
     * Create the panel.
     */
    public ConnPanel() {

        this.setLayout(new BorderLayout(0, 0));

        JPanel connPanel = new JPanel();
        connPanel.setBorder(new CompoundBorder(new TitledBorder(new LineBorder(new Color(0, 0, 0)),
                "\u8FDE\u63A5\u9762\u677F", TitledBorder.LEADING, TitledBorder.TOP, null,
                new Color(0, 0, 0)), new EmptyBorder(10, 20, 10, 20)));
        this.add(connPanel, BorderLayout.NORTH);
        connPanel.setLayout(new BorderLayout(0, 0));

        JPanel connInfoPanel = new JPanel();
        connPanel.add(connInfoPanel, BorderLayout.CENTER);
        GridBagLayout gbl_connInfoPanel = new GridBagLayout();
        gbl_connInfoPanel.columnWidths = new int[] { 0, 0, 0 };
        gbl_connInfoPanel.rowHeights = new int[] { 0, 0, 0, 0, 0, 0, 0 };
        gbl_connInfoPanel.columnWeights = new double[] { 0.0, 1.0, Double.MIN_VALUE };
        gbl_connInfoPanel.rowWeights = new double[] { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                Double.MIN_VALUE };
        connInfoPanel.setLayout(gbl_connInfoPanel);

        ipLabel = new JLabel("IP地址：");
        GridBagConstraints gbc_ipLabel = new GridBagConstraints();
        gbc_ipLabel.anchor = GridBagConstraints.EAST;
        gbc_ipLabel.insets = new Insets(0, 0, 5, 5);
        gbc_ipLabel.gridx = 0;
        gbc_ipLabel.gridy = 0;
        connInfoPanel.add(ipLabel, gbc_ipLabel);

        ipTextField = new JTextField();
        GridBagConstraints gbc_ipTextField = new GridBagConstraints();
        gbc_ipTextField.insets = new Insets(0, 0, 5, 0);
        gbc_ipTextField.weightx = 1.0;
        gbc_ipTextField.fill = GridBagConstraints.BOTH;
        gbc_ipTextField.gridx = 1;
        gbc_ipTextField.gridy = 0;
        connInfoPanel.add(ipTextField, gbc_ipTextField);
        ipTextField.setColumns(10);

        portLabel = new JLabel("端口号：");
        GridBagConstraints gbc_portLabel = new GridBagConstraints();
        gbc_portLabel.anchor = GridBagConstraints.EAST;
        gbc_portLabel.insets = new Insets(0, 0, 5, 5);
        gbc_portLabel.gridx = 0;
        gbc_portLabel.gridy = 1;
        connInfoPanel.add(portLabel, gbc_portLabel);

        portTextField = new JTextField();
        GridBagConstraints gbc_portTextField = new GridBagConstraints();
        gbc_portTextField.insets = new Insets(0, 0, 5, 0);
        gbc_portTextField.fill = GridBagConstraints.HORIZONTAL;
        gbc_portTextField.gridx = 1;
        gbc_portTextField.gridy = 1;
        connInfoPanel.add(portTextField, gbc_portTextField);
        portTextField.setColumns(10);

        dbnameLabel = new JLabel("数据库名：");
        GridBagConstraints gbc_dbnameLabel = new GridBagConstraints();
        gbc_dbnameLabel.anchor = GridBagConstraints.EAST;
        gbc_dbnameLabel.insets = new Insets(0, 0, 5, 5);
        gbc_dbnameLabel.gridx = 0;
        gbc_dbnameLabel.gridy = 2;
        connInfoPanel.add(dbnameLabel, gbc_dbnameLabel);

        dbnameTextField = new JTextField();
        GridBagConstraints gbc_dbnameTextField = new GridBagConstraints();
        gbc_dbnameTextField.insets = new Insets(0, 0, 5, 0);
        gbc_dbnameTextField.fill = GridBagConstraints.HORIZONTAL;
        gbc_dbnameTextField.gridx = 1;
        gbc_dbnameTextField.gridy = 2;
        connInfoPanel.add(dbnameTextField, gbc_dbnameTextField);
        dbnameTextField.setColumns(10);

        usernameLabel = new JLabel("用户名：");
        GridBagConstraints gbc_usernameLabel = new GridBagConstraints();
        gbc_usernameLabel.anchor = GridBagConstraints.EAST;
        gbc_usernameLabel.insets = new Insets(0, 0, 5, 5);
        gbc_usernameLabel.gridx = 0;
        gbc_usernameLabel.gridy = 3;
        connInfoPanel.add(usernameLabel, gbc_usernameLabel);

        usernameTextField = new JTextField();
        GridBagConstraints gbc_usernameTextField = new GridBagConstraints();
        gbc_usernameTextField.insets = new Insets(0, 0, 5, 0);
        gbc_usernameTextField.fill = GridBagConstraints.HORIZONTAL;
        gbc_usernameTextField.gridx = 1;
        gbc_usernameTextField.gridy = 3;
        connInfoPanel.add(usernameTextField, gbc_usernameTextField);
        usernameTextField.setColumns(10);

        passwordLabel = new JLabel("密码：");
        GridBagConstraints gbc_passwordLabel = new GridBagConstraints();
        gbc_passwordLabel.anchor = GridBagConstraints.EAST;
        gbc_passwordLabel.insets = new Insets(0, 0, 5, 5);
        gbc_passwordLabel.gridx = 0;
        gbc_passwordLabel.gridy = 4;
        connInfoPanel.add(passwordLabel, gbc_passwordLabel);

        passwordTextField = new JTextField();
        GridBagConstraints gbc_passwordTextField = new GridBagConstraints();
        gbc_passwordTextField.insets = new Insets(0, 0, 5, 0);
        gbc_passwordTextField.fill = GridBagConstraints.HORIZONTAL;
        gbc_passwordTextField.gridx = 1;
        gbc_passwordTextField.gridy = 4;
        connInfoPanel.add(passwordTextField, gbc_passwordTextField);
        passwordTextField.setColumns(10);

        JPanel connBtnPanel = new JPanel();
        connPanel.add(connBtnPanel, BorderLayout.SOUTH);
        GridBagLayout gbl_connBtnPanel = new GridBagLayout();
        gbl_connBtnPanel.columnWidths = new int[] { 0, 0, 0, 0 };
        gbl_connBtnPanel.rowHeights = new int[] { 0, 0, 0 };
        gbl_connBtnPanel.columnWeights = new double[] { 0.0, 0.0, 0.0, Double.MIN_VALUE };
        gbl_connBtnPanel.rowWeights = new double[] { 0.0, 0.0, Double.MIN_VALUE };
        connBtnPanel.setLayout(gbl_connBtnPanel);

        connButton = new JButton("连接");
        connButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                try {
                    ConnPanel.this.connAction.connectDB(connInfo);
                } catch (BaseException ex) {
                    ConnPanel.this.connAction.processMessage(JOptionPane.ERROR_MESSAGE, ex.getLocalizedMessage(), ex);
                }
            }
        });
        GridBagConstraints gbc_connButton = new GridBagConstraints();
        gbc_connButton.anchor = GridBagConstraints.EAST;
        gbc_connButton.weightx = 1.0;
        gbc_connButton.insets = new Insets(0, 0, 5, 10);
        gbc_connButton.gridx = 0;
        gbc_connButton.gridy = 0;
        connBtnPanel.add(connButton, gbc_connButton);

        disconnButton = new JButton("断开");
        disconnButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                try {
                    ConnPanel.this.connAction.disconnectDB();
                } catch (Throwable ex) {
                    ConnPanel.this.connAction.processMessage(JOptionPane.ERROR_MESSAGE, ex.getLocalizedMessage(), ex);
                }
            }
        });
        GridBagConstraints gbc_disconnButton = new GridBagConstraints();
        gbc_disconnButton.anchor = GridBagConstraints.WEST;
        gbc_disconnButton.weightx = 1.0;
        gbc_disconnButton.insets = new Insets(0, 10, 5, 5);
        gbc_disconnButton.gridx = 1;
        gbc_disconnButton.gridy = 0;
        connBtnPanel.add(disconnButton, gbc_disconnButton);
        initDataBindings();
    }

    protected void initDataBindings() {
        BeanProperty<ConnInfo, String> connInfoBeanProperty = BeanProperty.create("host");
        BeanProperty<JTextField, String> jTextFieldBeanProperty = BeanProperty.create("text");
        AutoBinding<ConnInfo, String, JTextField, String> autoBinding = Bindings
                .createAutoBinding(UpdateStrategy.READ_WRITE, connInfo, connInfoBeanProperty,
                                   ipTextField, jTextFieldBeanProperty);
        autoBinding.bind();
        //
        BeanProperty<ConnInfo, String> connInfoBeanProperty_1 = BeanProperty.create("port");
        BeanProperty<JTextField, String> jTextFieldBeanProperty_1 = BeanProperty.create("text");
        AutoBinding<ConnInfo, String, JTextField, String> autoBinding_1 = Bindings
                .createAutoBinding(UpdateStrategy.READ_WRITE, connInfo, connInfoBeanProperty_1,
                                   portTextField, jTextFieldBeanProperty_1);
        autoBinding_1.bind();
        //
        BeanProperty<ConnInfo, String> connInfoBeanProperty_2 = BeanProperty.create("dbname");
        BeanProperty<JTextField, String> jTextFieldBeanProperty_2 = BeanProperty.create("text");
        AutoBinding<ConnInfo, String, JTextField, String> autoBinding_2 = Bindings
                .createAutoBinding(UpdateStrategy.READ_WRITE, connInfo, connInfoBeanProperty_2,
                                   dbnameTextField, jTextFieldBeanProperty_2);
        autoBinding_2.bind();
        //
        BeanProperty<ConnInfo, String> connInfoBeanProperty_3 = BeanProperty.create("username");
        BeanProperty<JTextField, String> jTextFieldBeanProperty_3 = BeanProperty.create("text");
        AutoBinding<ConnInfo, String, JTextField, String> autoBinding_3 = Bindings
                .createAutoBinding(UpdateStrategy.READ_WRITE, connInfo, connInfoBeanProperty_3,
                                   usernameTextField, jTextFieldBeanProperty_3);
        autoBinding_3.bind();
        //
        BeanProperty<ConnInfo, String> connInfoBeanProperty_4 = BeanProperty.create("password");
        BeanProperty<JTextField, String> jTextFieldBeanProperty_4 = BeanProperty.create("text");
        AutoBinding<ConnInfo, String, JTextField, String> autoBinding_4 = Bindings
                .createAutoBinding(UpdateStrategy.READ_WRITE, connInfo, connInfoBeanProperty_4,
                                   passwordTextField, jTextFieldBeanProperty_4);
        autoBinding_4.bind();
    }

    public void setConnectEnabled(boolean enabled) {
        ipTextField.setEnabled(enabled);
        portTextField.setEnabled(enabled);
        dbnameTextField.setEnabled(enabled);
        usernameTextField.setEnabled(enabled);
        passwordTextField.setEnabled(enabled);
        this.connButton.setEnabled(enabled);
        this.disconnButton.setEnabled(!enabled);
        super.setEnabled(enabled);
    }

    public void setConnAction(ConnAction connAction) {
        this.connAction = connAction;
    }

    public ConnAction getConnAction() {
        return connAction;
    }
}
