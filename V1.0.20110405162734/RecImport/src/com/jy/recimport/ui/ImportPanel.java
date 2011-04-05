package com.jy.recimport.ui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

import javax.swing.JButton;
import javax.swing.JFileChooser;
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

import com.jy.recimport.action.ImportAction;
import com.jy.recimport.model.ImportInfo;
import com.jy.recimport.util.BaseException;

public class ImportPanel extends JPanel {

    private ImportAction importAction;
    private ImportInfo importInfo = new ImportInfo();

    /**
	 * 
	 */
    private static final long serialVersionUID = 4342866949653972599L;
    private JTextField filepathTextField;
    private JButton importButton;
    private JButton browseButton;
    private JLabel encodingLabel;
    private JTextField encodingTextField;
    private JFileChooser jFileChooser ;
    private JLabel scaleLabel;
    private JTextField scaleTextField;

    public void setEnabled(boolean enabled) {
        this.filepathTextField.setEnabled(enabled);
        importButton.setEnabled(enabled);
        browseButton.setEnabled(enabled);
        encodingTextField.setEnabled(enabled);
        scaleTextField.setEnabled(enabled);
    }

    /**
     * Create the panel.
     */
    public ImportPanel() {
        setBorder(new CompoundBorder(new TitledBorder(new LineBorder(new Color(0, 0, 0)),
                "\u5BFC\u5165\u6570\u636E\u9762\u677F", TitledBorder.LEADING, TitledBorder.TOP,
                null, new Color(0, 0, 0)), new EmptyBorder(0, 20, 15, 20)));
        setLayout(new BorderLayout(0, 0));

        JPanel fileInfoPanel = new JPanel();
        add(fileInfoPanel, BorderLayout.CENTER);
        GridBagLayout gbl_fileInfoPanel = new GridBagLayout();
        gbl_fileInfoPanel.columnWidths = new int[] { 0, 0, 0, 0 };
        gbl_fileInfoPanel.rowHeights = new int[] { 0, 0, 0, 0 };
        gbl_fileInfoPanel.columnWeights = new double[] { 0.0, 1.0, 0.0, Double.MIN_VALUE };
        gbl_fileInfoPanel.rowWeights = new double[] { 0.0, 0.0, 0.0, Double.MIN_VALUE };
        fileInfoPanel.setLayout(gbl_fileInfoPanel);

        JLabel filepathLabel = new JLabel("文件路径：");
        GridBagConstraints gbc_filepathLabel = new GridBagConstraints();
        gbc_filepathLabel.fill = GridBagConstraints.VERTICAL;
        gbc_filepathLabel.insets = new Insets(0, 0, 5, 5);
        gbc_filepathLabel.anchor = GridBagConstraints.EAST;
        gbc_filepathLabel.gridx = 0;
        gbc_filepathLabel.gridy = 0;
        fileInfoPanel.add(filepathLabel, gbc_filepathLabel);

        filepathTextField = new JTextField();
        GridBagConstraints gbc_filepathTextField = new GridBagConstraints();
        gbc_filepathTextField.weightx = 1.0;
        gbc_filepathTextField.insets = new Insets(0, 0, 5, 5);
        gbc_filepathTextField.fill = GridBagConstraints.BOTH;
        gbc_filepathTextField.gridx = 1;
        gbc_filepathTextField.gridy = 0;
        fileInfoPanel.add(filepathTextField, gbc_filepathTextField);
        filepathTextField.setColumns(10);

        jFileChooser = new JFileChooser();
        jFileChooser.setMultiSelectionEnabled(false);
        
        browseButton = new JButton("...");
        browseButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {

                if ( JFileChooser.APPROVE_OPTION == jFileChooser.showOpenDialog(null) ){
                    File file = jFileChooser.getSelectedFile();
                    filepathTextField.setText(file.getAbsolutePath());
                }
            }
        });        
        
        GridBagConstraints gbc_browseButton = new GridBagConstraints();
        gbc_browseButton.insets = new Insets(0, 0, 5, 0);
        gbc_browseButton.fill = GridBagConstraints.VERTICAL;
        gbc_browseButton.anchor = GridBagConstraints.EAST;
        gbc_browseButton.gridx = 2;
        gbc_browseButton.gridy = 0;
        fileInfoPanel.add(browseButton, gbc_browseButton);
        
        encodingLabel = new JLabel("文件编码：");
        GridBagConstraints gbc_encodingLabel = new GridBagConstraints();
        gbc_encodingLabel.anchor = GridBagConstraints.EAST;
        gbc_encodingLabel.fill = GridBagConstraints.VERTICAL;
        gbc_encodingLabel.insets = new Insets(0, 0, 5, 5);
        gbc_encodingLabel.gridx = 0;
        gbc_encodingLabel.gridy = 1;
        fileInfoPanel.add(encodingLabel, gbc_encodingLabel);
        
        encodingTextField = new JTextField();
        GridBagConstraints gbc_encodingTextField = new GridBagConstraints();
        gbc_encodingTextField.weightx = 1.0;
        gbc_encodingTextField.insets = new Insets(0, 0, 5, 5);
        gbc_encodingTextField.fill = GridBagConstraints.BOTH;
        gbc_encodingTextField.gridx = 1;
        gbc_encodingTextField.gridy = 1;
        fileInfoPanel.add(encodingTextField, gbc_encodingTextField);
        encodingTextField.setColumns(10);
        
        scaleLabel = new JLabel("缩放比例：");
        GridBagConstraints gbc_scaleLabel = new GridBagConstraints();
        gbc_scaleLabel.anchor = GridBagConstraints.EAST;
        gbc_scaleLabel.insets = new Insets(0, 0, 0, 5);
        gbc_scaleLabel.gridx = 0;
        gbc_scaleLabel.gridy = 2;
        fileInfoPanel.add(scaleLabel, gbc_scaleLabel);
        
        scaleTextField = new JTextField();
        GridBagConstraints gbc_scaleTextField = new GridBagConstraints();
        gbc_scaleTextField.insets = new Insets(0, 0, 0, 5);
        gbc_scaleTextField.fill = GridBagConstraints.HORIZONTAL;
        gbc_scaleTextField.gridx = 1;
        gbc_scaleTextField.gridy = 2;
        fileInfoPanel.add(scaleTextField, gbc_scaleTextField);
        scaleTextField.setColumns(10);

        JPanel buttonPanel = new JPanel();
        add(buttonPanel, BorderLayout.SOUTH);
        GridBagLayout gbl_buttonPanel = new GridBagLayout();
        gbl_buttonPanel.columnWidths = new int[] { 0, 0, 0 };
        gbl_buttonPanel.rowHeights = new int[] { 0, 0 };
        gbl_buttonPanel.columnWeights = new double[] { 1.0, 1.0, Double.MIN_VALUE };
        gbl_buttonPanel.rowWeights = new double[] { 0.0, Double.MIN_VALUE };
        buttonPanel.setLayout(gbl_buttonPanel);

        importButton = new JButton("导入数据");
        importButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                try {
                    ImportPanel.this.importAction.importData(importInfo);
                    ImportPanel.this.importAction.processMessage(JOptionPane.INFORMATION_MESSAGE, "导入数据成功", null);
                } catch (BaseException ex) {
                    ImportPanel.this.importAction.processMessage(JOptionPane.ERROR_MESSAGE, ex.getLocalizedMessage(), ex);
                }
            }
        });
        GridBagConstraints gbc_importButton = new GridBagConstraints();
        gbc_importButton.anchor = GridBagConstraints.EAST;
        gbc_importButton.insets = new Insets(5, 5, 5, 10);
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
        //
        BeanProperty<ImportInfo, String> importInfoBeanProperty_1 = BeanProperty.create("fileEncoding");
        BeanProperty<JTextField, String> jTextFieldBeanProperty_1 = BeanProperty.create("text");
        AutoBinding<ImportInfo, String, JTextField, String> autoBinding_1 = Bindings.createAutoBinding(UpdateStrategy.READ_WRITE, importInfo, importInfoBeanProperty_1, encodingTextField, jTextFieldBeanProperty_1);
        autoBinding_1.bind();
        //
        BeanProperty<ImportInfo, String> importInfoBeanProperty_2 = BeanProperty.create("scale");
        BeanProperty<JTextField, String> jTextFieldBeanProperty_2 = BeanProperty.create("text");
        AutoBinding<ImportInfo, String, JTextField, String> autoBinding_2 = Bindings.createAutoBinding(UpdateStrategy.READ_WRITE, importInfo, importInfoBeanProperty_2, scaleTextField, jTextFieldBeanProperty_2);
        autoBinding_2.bind();
    }
}
