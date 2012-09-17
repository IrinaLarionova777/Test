package isc.jasper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import com.intersys.objects.CacheQuery;
import com.intersys.objects.CacheDatabase;
import com.intersys.objects.Database;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDefaultStyleProvider;
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
import net.sf.jasperreports.engine.design.JRDesignParameter;
import net.sf.jasperreports.engine.design.JRDesignSection;
import net.sf.jasperreports.engine.design.JRDesignStaticText;
import net.sf.jasperreports.engine.design.JRDesignStyle;
import net.sf.jasperreports.engine.design.JRDesignSubreport;
import net.sf.jasperreports.engine.design.JRDesignTextField;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.type.HorizontalAlignEnum;
import net.sf.jasperreports.engine.type.ModeEnum;
import net.sf.jasperreports.engine.type.SplitTypeEnum;
import net.sf.jasperreports.view.JRViewer;
import net.sf.jasperreports.engine.design.JRDesignGroup;



public class RptLevel0 {

	public static Connection connectionDB = null;
	
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
	    field.setName("department");
	    field.setValueClass(java.lang.String.class);
	    jasperDesign.addField(field);
	    
	    field = new JRDesignField();
	    field.setName("subReportSetTest");
	    field.setValueClass(net.sf.jasperreports.engine.JasperReport.class);
	    jasperDesign.addField(field);
	    
	    //Parameters
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
		exp.setText("$F{subReportSetTest}");
		exp.setValueClass(net.sf.jasperreports.engine.JasperReport.class);
		subReport.setExpression(exp);
		
		band.addElement(subReport);
		    
		((JRDesignSection)jasperDesign.getDetailSection()).addBand(band);
	    
		//Group
		JRDesignGroup group = new JRDesignGroup();
		group.setName("Department");
		exp = new JRDesignExpression();
		exp.setText("$F{department}");
		exp.setValueClass(java.lang.String.class);
		group.setExpression(exp);
		
		//		  Title (here whole hat of report)
	    band = getPageHeader();
		group.setGroupHeader(band);
		//group.setKeepTogether(true);
		group.setStartNewPage(true);
		//System.out.println(group.isKeepTogether());
		
		jasperDesign.addGroup(group);
		
	    return jasperDesign;
	  }
	
	 //Page header
	public static JRDesignBand getPageHeader() 
	{
		JRDesignBand band = new JRDesignBand();
    band.setHeight(30);
    JRDesignStyle normalStyle = getStyleNormal();
    
    JRDesignTextField textField = new JRDesignTextField();
    textField.setX(0);
    textField.setY(0);
    textField.setWidth(100);
    textField.setHeight(15);
    textField.setHorizontalAlignment(HorizontalAlignEnum.LEFT);
    textField.setStyle(normalStyle);
    JRDesignExpression expression = new JRDesignExpression();
    expression.setValueClass(java.lang.String.class);
    expression.setText("$F{department}");
    textField.setExpression(expression);
    band.addElement(textField);
    
    JRDesignFrame frame = new JRDesignFrame();
    frame.setX(0);
    frame.setY(15);
    frame.setWidth(515);
    frame.setHeight(15);
    frame.setMode(ModeEnum.OPAQUE);
    JRDesignStaticText staticText = new JRDesignStaticText();
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
    band.addElement(frame);
    
    return band;
	}
    
	public static JRDesignStyle getStyleNormal() 
	{ 
       JRDesignStyle style = new JRDesignStyle();
       style.setName("Arial_Normal");
       style.setDefault(true);
       style.setFontName("Arial");
       style.setFontSize(12);
       //style.setPdfFontName("Arial");
      style.setPdfEncoding("Cp1251");
     //style.setPdfEmbedded(true);
       return style;
	}
	
	//потом надо сделать нормально
	public static void openConnection() {
	    try {
		     String connString="jdbc:Cache://127.0.0.1:56773/DATA/?username=_SYSTEM&password=SYS";
		     connectionDB = DriverManager.getConnection(connString);
	    } catch (Exception ex) {
	    	ex.printStackTrace();
	    }
	}
	
//	потом надо сделать нормально
	public static Database openConnectionDB() {
		Database db = null;
	    try {
		     String connString="jdbc:Cache://127.0.0.1:56773/DATA";
		     db = CacheDatabase.getDatabase(connString, "_SYSTEM", "SYS");
		} catch (Exception ex) {
	    	ex.printStackTrace();
	    }
		return db;
	   
	}
	
	public static void main(String[] args) {
		openConnection();
		HashMap params = new HashMap();
		try {
			params.put("connection",connectionDB);
			
			Vector columns = new Vector();
			columns.addElement("department");
			columns.addElement("subReportSetTest");
			Vector dataMainReport = new Vector();
			
			JasperDesign mainDesign = getJasperDesignMainReport();
			//JasperCompileManager.compileReportToFile(mainDesign,"c:\\temp\\mainreportTest2.jasper");
			
		/*
			Database db = openConnectionDB();
			CacheQuery query = new CacheQuery(db,"Report.JasperReportGenerateTemplate","queryRpt");
	    	java.sql.ResultSet rs = query.execute();
	    */	
			//call Report.rptEpisode_querySetTest('E','E001\1','^test(2)')
			
			Statement stmt;
			java.sql.ResultSet rs;
		/*	
			stmt = connectionDB.createStatement();
	    	rs = stmt.executeQuery("call Report.rptEpisode_querySetTest('E','E001\1','^test(2)')");
	    	int cc=rs.getMetaData().getColumnCount();
	    	System.out.println("count columns="+cc);
	    	for (int i=0;i<cc;i++) { System.out.println("column"+i+"="+rs.getMetaData().getColumnName(i)); }
	    	*/
	    	stmt = connectionDB.createStatement();
	    	String arg="^test(2)";
	    	rs = stmt.executeQuery("call Report.rptEpisode_queryRpt('"+arg+"')");
	    	
	    	System.out.println("rs="+rs);
	    	System.out.println("rs.getMetaData().getColumnCount()="+rs.getMetaData().getColumnCount());
	    	rs.next();
	    	System.out.println("rs.getMetaData().getColumnTypet(0)="+rs.getMetaData().getColumnType(1));
	    	
			String department,codeSetTestCounter,codeSetTest;
			int i=0;
			
			while ( rs.next() ) {
				Vector row = new Vector();
				department = rs.getString(1);
				codeSetTestCounter = rs.getString(2);
				i++;
				JasperDesign subDesign = RptSetTest.getDesign(department, codeSetTestCounter, i);
				JasperCompileManager.compileReportToFile(subDesign,"c:\\temp\\sub"+i+".jasper");
				JasperReport subCompile = JasperCompileManager.compileReport(subDesign);
				row.addElement(department);
				row.addElement(subCompile);
				dataMainReport.addElement(row);
			}
						
			JasperReport mainCompile = JasperCompileManager.compileReport(mainDesign);
			
			TableModel tm = new DefaultTableModel(dataMainReport,columns);
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
