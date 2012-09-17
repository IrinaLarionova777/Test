package isc.jasper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRTableModelDataSource;
import net.sf.jasperreports.engine.design.JRDesignBand;
import net.sf.jasperreports.engine.design.JRDesignExpression;
import net.sf.jasperreports.engine.design.JRDesignField;
import net.sf.jasperreports.engine.design.JRDesignFrame;
import net.sf.jasperreports.engine.design.JRDesignLine;
import net.sf.jasperreports.engine.design.JRDesignParameter;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JRDesignSection;
import net.sf.jasperreports.engine.design.JRDesignStaticText;
import net.sf.jasperreports.engine.design.JRDesignStyle;
import net.sf.jasperreports.engine.design.JRDesignSubreport;
import net.sf.jasperreports.engine.design.JRDesignTextField;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.type.HorizontalAlignEnum;
import net.sf.jasperreports.engine.type.ModeEnum;
import net.sf.jasperreports.engine.type.PositionTypeEnum;
import net.sf.jasperreports.engine.type.SplitTypeEnum;
import net.sf.jasperreports.view.JRViewer;
import net.sf.jasperreports.engine.JRDefaultStyleProvider;

import net.sf.jasperreports.view.JRViewer;

import com.intersys.objects.*;
import com.intersys.jdbc.*;


public class ReportTest3 {

	static Connection connectionDB = null;
	static String[] setTests = {"A010","C070"}; 
		
	private static JasperDesign getJasperDesignMainReport() throws JRException
	  {
	    //JasperDesign
	    JasperDesign jasperDesign = new JasperDesign();
	    jasperDesign.setName("reportMain");
	    jasperDesign.setPageWidth(595);
	    jasperDesign.setPageHeight(842);
	    jasperDesign.setColumnWidth(515);
	    jasperDesign.setColumnSpacing(0);
	    jasperDesign.setLeftMargin(40);
	    jasperDesign.setRightMargin(40);
	    jasperDesign.setTopMargin(50);
	    jasperDesign.setBottomMargin(50);
	    
	    jasperDesign.setColumnCount(1);
	   	    
//	  Fonts
	    JRDesignStyle normalStyle = getStyleNormal();
	    jasperDesign.addStyle(normalStyle);
	
	    JRDesignBand band;
	    JRDesignStaticText staticText;
	    JRDesignTextField textField;
	    JRDesignExpression expression;
	   
//		  Fields
	    JRDesignField field = new JRDesignField();
	    field.setName("subReport");
	    field.setValueClass(net.sf.jasperreports.engine.JasperReport.class);
	    jasperDesign.addField(field);
	    
	    //Page header
	    band = new JRDesignBand();
	    band.setHeight(20);
	    JRDesignFrame frame = new JRDesignFrame();
	    frame.setX(0);
	    frame.setY(5);
	    frame.setWidth(515);
	    frame.setHeight(15);
	    frame.setMode(ModeEnum.OPAQUE);
	    band.addElement(frame);
	    staticText = new JRDesignStaticText();
	    staticText.setX(0);
	    staticText.setY(0);
	    staticText.setWidth(55);
	    staticText.setHeight(15);
	    staticText.setMode(ModeEnum.OPAQUE);
	    staticText.setHorizontalAlignment(HorizontalAlignEnum.CENTER);
	    staticText.setStyle(normalStyle);
	    staticText.setText("Name");
	    frame.addElement(staticText);
	    staticText = new JRDesignStaticText();
	    staticText.setX(55);
	    staticText.setY(0);
	    staticText.setWidth(205);
	    staticText.setHeight(15);
	    staticText.setMode(ModeEnum.OPAQUE);
	    staticText.setStyle(normalStyle);
	    staticText.setText("Result");
	    frame.addElement(staticText);
	    staticText = new JRDesignStaticText();
	    staticText.setX(260);
	    staticText.setY(0);
	    staticText.setWidth(100);
	    staticText.setHeight(15);
	    staticText.setMode(ModeEnum.OPAQUE);
	    staticText.setStyle(normalStyle);
	    staticText.setText("Units");
	    frame.addElement(staticText);
	    staticText = new JRDesignStaticText();
	    staticText.setX(360);
	    staticText.setY(0);
	    staticText.setWidth(155);
	    staticText.setHeight(15);
	    staticText.setMode(ModeEnum.OPAQUE);
	    staticText.setStyle(normalStyle);
	    staticText.setText("Bounds");
	    frame.addElement(staticText);
	    jasperDesign.setPageHeader(band);
	    
	    JRDesignParameter param = new JRDesignParameter();
	    param.setName("connection");
	    param.setValueClass(java.sql.Connection.class);
	    jasperDesign.addParameter(param);
	    
	  //Details 
	    band = new JRDesignBand();
	    band.setHeight(100);
	    band.setSplitType(SplitTypeEnum.STRETCH);
	  
	    JRDefaultStyleProvider styleProvider = normalStyle.getDefaultStyleProvider();
        JRDesignSubreport subReport = new JRDesignSubreport(styleProvider);
		subReport.setHeight(100);
		subReport.setWidth(200);
		    
		JRDesignExpression expConnection = new JRDesignExpression();
		expConnection.setText("$P{connection}");
		expConnection.setValueClass(java.sql.Connection.class);
		subReport.setConnectionExpression(expConnection);
		    
		JRDesignExpression exp = new JRDesignExpression();
		exp.setText("$F{subReport}");
		exp.setValueClass(net.sf.jasperreports.engine.JasperReport.class);
		subReport.setExpression(exp);
		
		band.addElement(subReport);
		    
		((JRDesignSection)jasperDesign.getDetailSection()).addBand(band);
	    
	    return jasperDesign;
	  }
	
	private static JasperDesign getDesignSubReport(String setTest, int numberSubReport) throws JRException
	  {
		
	    JasperDesign jasperDesign = new JasperDesign();
	    jasperDesign.setName("subreport"+numberSubReport);
	    
//		Fonts
	    JRDesignStyle normalStyle = getStyleNormal();
	    jasperDesign.addStyle(normalStyle);
	    
	    //Query
	    JRDesignQuery query = new JRDesignQuery();
	    query.setText("SELECT CTTSF_LabelText As Name,CTTSF_Reportable As Result, CTTSF_CL_Units As Units, CTTSF_CL_Text As Range from SQLUser.CT_TestSetFields where CT_TestSetFields.CTTSF_ParRef='"+setTest+"'");
	    //query.setText("call Report.JasperReportGenerateTemplate_query1()");
	    jasperDesign.setQuery(query);
	    
	    int offsetText=0,offsetResult=0,offsetUnits=0,offsetRange=0;
	    try {
	    	String sql="SELECT TOP 1 CTTSF_CL_Text As offsetText, CTTSF_CL_Prompt As offsetResult, CTTSF_CL_Units As offsetUnits, CTTSF_CL_NormalRanges As offsetBounds from SQLUser.CT_TestSetFields where CT_TestSetFields.CTTSF_ParRef='"+setTest+"'";
	    	Statement stmt = connectionDB.createStatement();	
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
		    band.setHeight(20);
		    band = new JRDesignBand();
		    band.setHeight(20);
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
	
	private static JRDesignStyle getStyleNormal() 
	{ 
       JRDesignStyle style = new JRDesignStyle();
       style.setName("Arial_Normal");
       style.setDefault(true);
       style.setFontName("Arial");
       style.setFontSize(12);
       style.setPdfFontName("Helvetica");
       style.setPdfEncoding("Cp1252");
       style.setPdfEmbedded(false);
       return style;
	}
	
	public static void main(String[] args) {
		String connString="jdbc:Cache://127.0.0.1:56773/DATA/?username=_SYSTEM&password=SYS";
		String setTest;
		HashMap params = new HashMap();
		int len = setTests.length;
		String[] columns = {"subReport"};
		JasperReport[][] subReports;
		subReports = new JasperReport[len][1];
		try
		    {
			connectionDB = DriverManager.getConnection(connString);
			params.put("connection",connectionDB);
			JasperDesign mainDesign = getJasperDesignMainReport();
			JasperCompileManager.compileReportToFile(mainDesign,"c:\\temp\\mainreportTest2.jasper");
			for (int i=0; i<len;i++) {
				setTest = setTests[i];
				JasperDesign subDesine = getDesignSubReport(setTest,i);
				JasperReport subCompile = JasperCompileManager.compileReport(subDesine);
				subReports[i][0]=subCompile;
			}
			JasperReport mainCompile = JasperCompileManager.compileReport(mainDesign);
			
			TableModel tm = new DefaultTableModel(subReports,columns);
			JRDataSource dataSource = new JRTableModelDataSource(tm);
			
			JasperPrint result = JasperFillManager.fillReport(mainCompile,params,dataSource);
			
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

