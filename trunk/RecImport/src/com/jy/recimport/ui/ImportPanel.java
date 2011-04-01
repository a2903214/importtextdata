package com.jy.recimport.ui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

import com.jy.recimport.action.ImportAction;
import com.jy.recimport.model.ImportInfo;
import com.jy.recimport.util.BaseException;

import org.jdesktop.beansbinding.BeanProperty;
import org.jdesktop.beansbinding.AutoBinding;
import org.jdesktop.beansbinding.Bindings;
import org.jdesktop.beansbinding.AutoBinding.UpdateStrategy;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class ImportPanel extends JPanel {
    
    private ImportAction importAction;
    private ImportInfo importInfo;

	/**
	 * 
	 */
	private static final long serialVersionUID = 4342866949653972599L;
	private JTextField filepathTextField;
	
	public void setEnabled(boolean enabled){	    
	    for ( Component c: this.getComponents() ){
	        c.setEnabled(enabled);
	    }
	    super.setEnabled(enabled);
	}

	/**
	 * Create the panel.
	 */
	public ImportPanel() {
	    setBorder(new CompoundBorder(new TitledBorder(new LineBorder(new Color(0, 0, 0)), "\u5BFC\u5165\u6570\u636E\u9762\u677F", TitledBorder.LEADING, TitledBorder.TOP, null, new Color(0, 0, 0)), new EmptyBorder(0, 20, 15, 20)));
	    setLayout(new BorderLayout(0, 0));
	    
	    JPanel fileInfoPanel = new JPanel();
	    add(fileInfoPanel, BorderLayout.CENTER);
	    GridBagLayout gbl_fileInfoPanel = new GridBagLayout();
	    gbl_fileInfoPanel.columnWidths = new int[]{0, 0, 0, 0};
	    gbl_fileInfoPanel.rowHeights = new int[]{0, 0};
	    gbl_fileInfoPanel.columnWeights = new double[]{0.0, 0.0, 0.0, Double.MIN_VALUE};
	    gbl_fileInfoPanel.rowWeights = new double[]{0.0, Double.MIN_VALUE};
	    fileInfoPanel.setLayout(gbl_fileInfoPanel);
	    
	    JLabel filepathLabel = new JLabel("文件路径：");
	    GridBagConstraints gbc_filepathLabel = new GridBagConstraints();
	    gbc_filepathLabel.fill = GridBagConstraints.VERTICAL;
	    gbc_filepathLabel.insets = new Insets(0, 0, 0, 5);
	    gbc_filepathLabel.anchor = GridBagConstraints.EAST;
	    gbc_filepathLabel.gridx = 0;
	    gbc_filepathLabel.gridy = 0;
	    fileInfoPanel.add(filepathLabel, gbc_filepathLabel);
	    
	    filepathTextField = new JTextField();
	    GridBagConstraints gbc_filepathTextField = new GridBagConstraints();
	    gbc_filepathTextField.weightx = 1.0;
	    gbc_filepathTextField.insets = new Insets(0, 0, 0, 5);
	    gbc_filepathTextField.fill = GridBagConstraints.BOTH;
	    gbc_filepathTextField.gridx = 1;
	    gbc_filepathTextField.gridy = 0;
	    fileInfoPanel.add(filepathTextField, gbc_filepathTextField);
	    filepathTextField.setColumns(10);
	    
	    JButton browseButton = new JButton("...");
	    GridBagConstraints gbc_browseButton = new GridBagConstraints();
	    gbc_browseButton.fill = GridBagConstraints.VERTICAL;
	    gbc_browseButton.anchor = GridBagConstraints.EAST;
	    gbc_browseButton.gridx = 2;
	    gbc_browseButton.gridy = 0;
	    fileInfoPanel.add(browseButton, gbc_browseButton);
	    
	    JPanel buttonPanel = new JPanel();
	    add(buttonPanel, BorderLayout.SOUTH);
	    GridBagLayout gbl_buttonPanel = new GridBagLayout();
	    gbl_buttonPanel.columnWidths = new int[]{0, 0, 0};
	    gbl_buttonPanel.rowHeights = new int[]{0, 0};
	    gbl_buttonPanel.columnWeights = new double[]{1.0, 1.0, Double.MIN_VALUE};
	    gbl_buttonPanel.rowWeights = new double[]{0.0, Double.MIN_VALUE};
	    buttonPanel.setLayout(gbl_buttonPanel);
	    
	    JButton importButton = new JButton("导入数据");
	    importButton.addActionListener(new ActionListener() {
	        public void actionPerformed(ActionEvent e) {
	            try {
                    ImportPanel.this.importAction.importData(importInfo);
                } catch (BaseException e1) {
                    JOptionPane.showMessageDialog(ImportPanel.this, "导入数据失败",
                                                  e1.getLocalizedMessage(),
                                                  JOptionPane.ERROR_MESSAGE);
                }
	        }
	    });
	    GridBagConstraints gbc_importButton = new GridBagConstraints();
	    gbc_importButton.anchor = GridBagConstraints.EAST;
	    gbc_importButton.insets = new Insets(0, 0, 0, 10);
	    gbc_importButton.gridx = 0;
	    gbc_importButton.gridy = 0;
	    buttonPanel.add(importButton, gbc_importButton);
	    initDataBindings();
	}

    public void setImportInfo(ImportInfo importInfo) {
        this.importInfo = importInfo;
    }

    public ImportInfo getImportInfo() {
        return importInfo;
    }

    public void setImportAction(ImportAction importAction) {
        this.importAction = importAction;
    }

    public ImportAction getImportAction() {
        return importAction;
    }

    protected void initDataBindings() {
        BeanProperty<ImportInfo, String> importInfoBeanProperty = BeanProperty.create("filePath");
        BeanProperty<JTextField, String> jTextFieldBeanProperty = BeanProperty.create("text");
        AutoBinding<ImportInfo, String, JTextField, String> autoBinding = Bindings.createAutoBinding(UpdateStrategy.READ_WRITE, importInfo, importInfoBeanProperty, filepathTextField, jTextFieldBeanProperty);
        autoBinding.bind();
    }
}
