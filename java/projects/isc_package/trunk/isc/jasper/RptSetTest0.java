package isc.jasper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.HashMap;

import javax.swing.JFrame;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRTableModelDataSource;
import net.sf.jasperreports.engine.design.JRDesignBand;
import net.sf.jasperreports.engine.design.JRDesignExpression;
import net.sf.jasperreports.engine.design.JRDesignField;
import net.sf.jasperreports.engine.design.JRDesignLine;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JRDesignSection;
import net.sf.jasperreports.engine.design.JRDesignStaticText;
import net.sf.jasperreports.engine.design.JRDesignStyle;
import net.sf.jasperreports.engine.design.JRDesignTextField;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.type.HorizontalAlignEnum;
import net.sf.jasperreports.engine.type.ModeEnum;
import net.sf.jasperreports.engine.type.SplitTypeEnum;
import net.sf.jasperreports.view.JRViewer;


public class RptSetTest0 {

	public static JasperDesign getDesign(String Department, String setTest, int numberSubReport) throws JRException
	  {
		
	    JasperDesign jasperDesign = new JasperDesign();
	    jasperDesign.setName("SetTest"+numberSubReport);
	    
//		Fonts
	    JRDesignStyle normalStyle = RptLevel0.getStyleNormal();
	    jasperDesign.addStyle(normalStyle);
	    
	    //Query
	    JRDesignQuery query = new JRDesignQuery();
	    query.setText("SELECT CTTSF_LabelText As Name,CTTSF_Reportable As Result, CTTSF_CL_Units As Units, CTTSF_CL_Text As Range from SQLUser.CT_TestSetFields where CT_TestSetFields.CTTSF_ParRef='"+setTest+"'");
	    //query.setText("call Report.JasperReportGenerateTemplate_query1()");
	    jasperDesign.setQuery(query);
	    
	    int offsetText=0,offsetResult=0,offsetUnits=0,offsetRange=0;
	    try {
	    	String sql="SELECT TOP 1 CTTSF_CL_Text As offsetText, CTTSF_CL_Prompt As offsetResult, CTTSF_CL_Units As offsetUnits, CTTSF_CL_NormalRanges As offsetBounds from SQLUser.CT_TestSetFields where CT_TestSetFields.CTTSF_ParRef='"+setTest+"'";
	    	Statement stmt = RptLevel0.connectionDB.createStatement();	
	    	java.sql.ResultSet rs = stmt.executeQuery(sql);
	    	while (rs.next()) {
	    		offsetText=rs.getInt(1);
	    		offsetResult=rs.getInt(2);
	    		offsetUnits=rs.getInt(3);
	    		offsetRange=rs.getInt(4);
	    	}
	    } catch (Exception ex) {
	    	ex.printStackTrace();
	    }	
	    System.out.println("offsetText="+offsetText+" "+"offsetResult="+offsetResult+" "+"offsetUnits="+offsetUnits+" "+"offsetRange="+offsetRange);
	    
	    	//	  Fields
		    JRDesignField field = new JRDesignField();
		    field.setName("Name");
		    field.setValueClass(java.lang.String.class);
		    jasperDesign.addField(field);

		    field = new JRDesignField();
		    field.setName("Result");
		    field.setValueClass(java.lang.String.class);
		    jasperDesign.addField(field);

		    field = new JRDesignField();
		    field.setName("Units");
		    field.setValueClass(java.lang.String.class);
		    jasperDesign.addField(field);

		    field = new JRDesignField();
		    field.setName("Range");
		    field.setValueClass(java.lang.String.class);
		    jasperDesign.addField(field);
		    
		    JRDesignStaticText staticText; 
		    JRDesignBand band;
		    JRDesignTextField textField;
		    JRDesignExpression expression;
		    JRDesignLine line;
		    
//		  Title
		    band = new JRDesignBand();
		    band.setHeight(15);
		    staticText = new JRDesignStaticText();
		    staticText.setX(1);
		    staticText.setY(0);
		    staticText.setWidth(205);
		    staticText.setHeight(15);
		    staticText.setMode(ModeEnum.OPAQUE);
		    staticText.setStyle(normalStyle);
		    staticText.setText("TitleSubReport "+setTest);
		    band.addElement(staticText);
		    jasperDesign.setTitle(band);

		    //		  Detail
		    int widthLetter=5;
		    band = new JRDesignBand();
		    band.setHeight(20);
		    band.setSplitType(SplitTypeEnum.STRETCH);
		    textField = new JRDesignTextField();
		    textField.setX(offsetText*widthLetter);
		    textField.setY(0);
		    textField.setWidth(100);
		    textField.setHeight(20);
		    textField.setHorizontalAlignment(HorizontalAlignEnum.LEFT);
		    textField.setStyle(normalStyle);
		    expression = new JRDesignExpression();
		    expression.setValueClass(java.lang.String.class);
		    expression.setText("$F{Name}");
		    textField.setExpression(expression);
		    band.addElement(textField);
		    textField = new JRDesignTextField();
		    textField.setStretchWithOverflow(true);
		    textField.setX(offsetResult*widthLetter);
		    textField.setY(0);
		    textField.setWidth(100);
		    textField.setHeight(20);
		    //textField.setPositionType(PositionTypeEnum.FLOAT);
		    textField.setStyle(normalStyle);
		    expression = new JRDesignExpression();
		    expression.setValueClass(java.lang.String.class);
		    expression.setText("$F{Result}");
		    textField.setExpression(expression);
		    band.addElement(textField);
		    textField = new JRDesignTextField();
		    textField.setStretchWithOverflow(true);
		    textField.setX(offsetUnits*widthLetter);
		    textField.setY(0);
		    textField.setWidth(100);
		    textField.setHeight(20);
		    //textField.setPositionType(PositionTypeEnum.FLOAT);
		    textField.setStyle(normalStyle);
		    expression = new JRDesignExpression();
		    expression.setValueClass(java.lang.String.class);
		    expression.setText("$F{Units}");
		    textField.setExpression(expression);
		    band.addElement(textField);
		    textField = new JRDesignTextField();
		    textField.setStretchWithOverflow(true);
		    textField.setX(offsetRange*widthLetter);
		    textField.setY(0);
		    textField.setWidth(100);
		    textField.setHeight(20);
		    //textField.setPositionType(PositionTypeEnum.FLOAT);
		    textField.setStyle(normalStyle);
		    expression = new JRDesignExpression();
		    expression.setValueClass(java.lang.String.class);
		    expression.setText("$F{Range}");
		    textField.setExpression(expression);
		    band.addElement(textField);
		  
		    ((JRDesignSection)jasperDesign.getDetailSection()).addBand(band);
		    
		return jasperDesign;
	  }
	
	// for test
	public static void main(String[] args) {
		String connString="jdbc:Cache://127.0.0.1:56773/DATA/?username=_SYSTEM&password=SYS";
		String setTest;
		HashMap params = new HashMap();
		try
		    {
			RptLevel0.openConnection();DriverManager.getConnection(connString);
			Connection connectionDB = RptLevel0.connectionDB;
			params.put("connection",connectionDB);
			JasperDesign subDesine = getDesign("A","A010",0);
			JasperReport subCompile = JasperCompileManager.compileReport(subDesine);
			//JasperReport mainCompile = JasperCompileManager.compileReport(mainDesign);
			
			JasperPrint result = JasperFillManager.fillReport(subCompile, params, connectionDB);
			
			connectionDB.close();
			
			JRViewer viewer = new JRViewer(result);

			JFrame frame = new JFrame();
			frame.setSize(800,600);
			frame.setContentPane(viewer);
			frame.setVisible(true);
		    }
	   	catch (Exception ex) {
		        ex.printStackTrace();
		}
	}
	
	
}
