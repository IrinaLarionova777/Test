package isc.jasper;

import net.sf.jasperreports.engine.data.JRTableModelDataSource;
import net.sf.jasperreports.engine.design.JRDesignReportFont;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.design.JRDesignBand;
import net.sf.jasperreports.engine.design.JRDesignField;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JRDesignLine;
import net.sf.jasperreports.engine.design.JRDesignFrame;
import net.sf.jasperreports.engine.design.JRDesignStyle;
import net.sf.jasperreports.engine.design.JRDesignExpression;
import net.sf.jasperreports.engine.design.JRDesignTextField;
import net.sf.jasperreports.engine.design.JRDesignStaticText;
import net.sf.jasperreports.engine.design.JRDesignSection;
import net.sf.jasperreports.engine.design.JRDesignSubreport;
import net.sf.jasperreports.engine.JRBand;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRDefaultStyleProvider;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRStyle;
import net.sf.jasperreports.engine.design.JRDesignParameter;
import net.sf.jasperreports.engine.design.JRDesignSubreportParameter;


import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.type.ModeEnum;
import net.sf.jasperreports.engine.type.HorizontalAlignEnum;
import net.sf.jasperreports.engine.type.PositionTypeEnum;
import net.sf.jasperreports.engine.type.WhenNoDataTypeEnum;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;

import java.util.Map;
import java.util.HashMap;
import java.io.IOException;
import java.io.OutputStream;
import java.io.FileOutputStream;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.swing.JFrame;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.view.JRViewer;

/*
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.export.JRXmlExporter;
import net.sf.jasperreports.engine.export.JRXmlExporterParameter;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRRtfExporter;
*/

public class ReportTest1 {

	
	
	
	private static JasperPrint useReport(String connString, Map params) throws JRException, SQLException
	  {
		JasperDesign jasperDesine = getDesignSubReport();
		JasperReport rep = JasperCompileManager.compileReport(jasperDesine);
		System.out.println("rep="+rep);
						
	    JasperPrint result = null;
	    Connection conn = null;
	    try
	    {
	    	System.out.println("connString="+connString);
		    conn = DriverManager.getConnection(connString);
		    System.out.println("conn="+conn);
		    
	    	System.out.println("before fillReport");
	      result = JasperFillManager.fillReport(rep, params, conn);
	      System.out.println("after fillReport");
	    }
	    finally
	    {
	      conn.close();
	    }
	    return result;
	  }
	
	public static void executeAndSave(JasperPrint jp, String repFormat, String targetFileName) throws IOException, JRException, SQLException
	  {
		System.out.println("begin prepareExporter");
	    OutputStream out = new FileOutputStream(targetFileName);
	    try
	    {
	      isc.jasper.JasperFacade.prepareExporter(jp, out, repFormat).exportReport();
	    }
	    finally
	    {
	      out.close();
	    }
	    System.out.println("end prepareExporter");
	  }
	
	
	private static JasperDesign getDesignSubReport() throws JRException
	  {
	    //JasperDesign
	    JasperDesign jasperDesign = new JasperDesign();
	    jasperDesign.setName("subreport");
	    jasperDesign.setPageWidth(595);
	    jasperDesign.setPageHeight(842);
	    jasperDesign.setColumnWidth(515);
	    jasperDesign.setColumnSpacing(0);
	    jasperDesign.setLeftMargin(40);
	    jasperDesign.setRightMargin(40);
	    jasperDesign.setTopMargin(50);
	    jasperDesign.setBottomMargin(50);
	    
	    //Fonts
	    JRDesignStyle normalStyle = new JRDesignStyle();
	    normalStyle.setName("Arial_Normal");
	    normalStyle.setDefault(true);
	    normalStyle.setFontName("Arial");
	    normalStyle.setFontSize(12);
	    normalStyle.setPdfFontName("Helvetica");
	    normalStyle.setPdfEncoding("Cp1252");
	    normalStyle.setPdfEmbedded(false);
	    jasperDesign.addStyle(normalStyle);
	    
	    //Query
	    JRDesignQuery query = new JRDesignQuery();
	    query.setText("SELECT CTTSF_LabelText As Name,CTTSF_Reportable As Result, CTTSF_CL_Units As Units, CTTSF_CL_Text As Bounds from SQLUser.CT_TestSetFields where CT_TestSetFields.CTTSF_ParRef='A010'");
	    //query.setText("call Report.JasperReportGenerateTemplate_query1()");
	    jasperDesign.setQuery(query);
       	    
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
	    field.setName("Bounds");
	    field.setValueClass(java.lang.String.class);
	    jasperDesign.addField(field);

	    jasperDesign.setTitle(getTitleBand("Title subreport"));
	    
	    JRDesignStaticText staticText; 
	    JRDesignBand band;
	    JRDesignTextField textField;
	    JRDesignExpression expression;
	    JRDesignLine line;
	    	    
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

	    //Column header
	    band = new JRDesignBand();
	    jasperDesign.setColumnHeader(band);

	    //Detail
	    band = new JRDesignBand();
	    band.setHeight(20);
	    textField = new JRDesignTextField();
	    textField.setX(0);
	    textField.setY(4);
	    textField.setWidth(150);
	    textField.setHeight(15);
	    textField.setHorizontalAlignment(HorizontalAlignEnum.RIGHT);
	    textField.setStyle(normalStyle);
	    expression = new JRDesignExpression();
	    expression.setValueClass(java.lang.String.class);
	    expression.setText("$F{Name}");
	    textField.setExpression(expression);
	    band.addElement(textField);
	    textField = new JRDesignTextField();
	    textField.setStretchWithOverflow(true);
	    textField.setX(155);
	    textField.setY(4);
	    textField.setWidth(50);
	    textField.setHeight(15);
	    textField.setPositionType(PositionTypeEnum.FLOAT);
	    textField.setStyle(normalStyle);
	    expression = new JRDesignExpression();
	    expression.setValueClass(java.lang.String.class);
	    expression.setText("$F{Result}");
	    textField.setExpression(expression);
	    band.addElement(textField);
	    textField = new JRDesignTextField();
	    textField.setStretchWithOverflow(true);
	    textField.setX(260);
	    textField.setY(4);
	    textField.setWidth(100);
	    textField.setHeight(15);
	    textField.setPositionType(PositionTypeEnum.FLOAT);
	    textField.setStyle(normalStyle);
	    expression = new JRDesignExpression();
	    expression.setValueClass(java.lang.String.class);
	    expression.setText("$F{Units}");
	    textField.setExpression(expression);
	    band.addElement(textField);
	    textField = new JRDesignTextField();
	    textField.setStretchWithOverflow(true);
	    textField.setX(365);
	    textField.setY(4);
	    textField.setWidth(100);
	    textField.setHeight(15);
	    textField.setPositionType(PositionTypeEnum.FLOAT);
	    textField.setStyle(normalStyle);
	    expression = new JRDesignExpression();
	    expression.setValueClass(java.lang.String.class);
	    expression.setText("$F{Bounds}");
	    textField.setExpression(expression);
	    band.addElement(textField);
	    line = new JRDesignLine();
	    line.setX(0);
	    line.setY(19);
	    line.setWidth(515);
	    line.setHeight(0);
	    line.setPositionType(PositionTypeEnum.FLOAT);
	    band.addElement(line);
	    ((JRDesignSection)jasperDesign.getDetailSection()).addBand(band);

	    //Column footer
	    band = new JRDesignBand();
	    jasperDesign.setColumnFooter(band);

	    //Page footer
	    band = new JRDesignBand();
	    jasperDesign.setPageFooter(band);

	    //Summary
	    band = new JRDesignBand();
	    jasperDesign.setSummary(band);

	    jasperDesign.setWhenNoDataType(WhenNoDataTypeEnum.ALL_SECTIONS_NO_DETAIL);
	    return jasperDesign;
	  }
	
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
	    JRDesignStyle normalStyle = new JRDesignStyle();
	    normalStyle.setName("Arial_Normal");
	    normalStyle.setDefault(true);
	    normalStyle.setFontName("Arial");
	    normalStyle.setFontSize(12);
	    normalStyle.setPdfFontName("Helvetica");
	    normalStyle.setPdfEncoding("Cp1252");
	    normalStyle.setPdfEmbedded(false);
	    jasperDesign.addStyle(normalStyle);
	    
	    JRDesignBand band;
	    JRDesignStaticText staticText;
	    JRDesignTextField textField;
	    JRDesignExpression expression;
	    
	    JRDesignField field = new JRDesignField();
	    field.setName("dummy");
	    field.setValueClass(java.lang.String.class);
	    jasperDesign.addField(field);
	    
//	  Query
	    JRDesignQuery query = new JRDesignQuery();
	    query.setText("SELECT 1 as dummy");
	    jasperDesign.setQuery(query);
	    
	    //Title
	    
	    band = new JRDesignBand();
	    band.setHeight(20);
	    staticText = new JRDesignStaticText();
	    staticText.setX(1);
	    staticText.setY(0);
	    staticText.setWidth(205);
	    staticText.setHeight(15);
	    staticText.setMode(ModeEnum.OPAQUE);
	    staticText.setStyle(normalStyle);
	    staticText.setText("TitleMainReport");
	    band.addElement(staticText);
	    
	    textField = new JRDesignTextField();
	    textField.setX(100);
	    textField.setY(1);
	    textField.setWidth(600);
	    textField.setHeight(15);
	    textField.setPositionType(PositionTypeEnum.FLOAT);
	    textField.setStyle(normalStyle);
	    expression = new JRDesignExpression();
	    expression.setValueClass(java.lang.String.class);
	    expression.setText("$P{REPORT_CONNECTION}.toString()");
	    textField.setExpression(expression);
	    band.addElement(textField);
	    
	    jasperDesign.setTitle(band);
	    
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
	    staticText.setText("Col1MainReport");
	    frame.addElement(staticText);
	    staticText = new JRDesignStaticText();
	    staticText.setX(55);
	    staticText.setY(0);
	    staticText.setWidth(205);
	    staticText.setHeight(15);
	    staticText.setMode(ModeEnum.OPAQUE);
	    staticText.setStyle(normalStyle);
	    staticText.setText("Col2MainReport");
	    frame.addElement(staticText);
	    frame.addElement(staticText);
	    jasperDesign.setPageHeader(band);
	    
	    
	    //Column header
	    band = new JRDesignBand();
	    jasperDesign.setColumnHeader(band);

	    //Details
	    band = new JRDesignBand();
	    band.setHeight(400);
	    
	    //JRStyle styleProvider = jasperDesign.getDefaultStyle();
	    JRDesignSubreport subReport = new JRDesignSubreport(normalStyle.getDefaultStyleProvider());
	    subReport.setHeight(30);
	    subReport.setWidth(200);
	    
	    JRDesignExpression expConnection = new JRDesignExpression();
	    //expConnection.setText("$P{connection}");
	    expConnection.setText("$P{REPORT_CONNECTION}");
	    expConnection.setValueClass(java.sql.Connection.class);
	    subReport.setConnectionExpression(expConnection);
	    
	    JRDesignExpression exp = new JRDesignExpression();
	    exp.setText("$P{sub1}");
	    exp.setValueClass(net.sf.jasperreports.engine.JasperReport.class);
	    subReport.setExpression(exp);
	    
	    /*
	    JRDesignExpression expDataSource = new JRDesignExpression();
	    expDataSource.setText("$P{datasource}");
	    //expConnection.setText("$P{REPORT_CONNECTION}");
	    expDataSource.setValueClass(net.sf.jasperreports.engine.JRDataSource.class);
	    subReport.setDataSourceExpression(expDataSource);
	    */
	    
	    JRDesignSubreportParameter paramSimple = new JRDesignSubreportParameter(); 
	    paramSimple.setName("StringParamSubReport");
	    JRDesignExpression exp2 = new JRDesignExpression();
	    exp2.setText("$P{StringParamMainReport}");
	    exp2.setValueClass(java.lang.String.class);
	    paramSimple.setExpression(exp2);
	    subReport.addParameter(paramSimple);
	    
	    band.addElement(subReport);
	    ((JRDesignSection)jasperDesign.getDetailSection()).addBand(band);
               
	    //Column footer
	    band = new JRDesignBand();
	    jasperDesign.setColumnFooter(band);

	    //Page footer
	    band = new JRDesignBand();
	    jasperDesign.setPageFooter(band);

	    //Summary
	    band = new JRDesignBand();
	    jasperDesign.setSummary(band);
	    
	    JRDesignParameter param1 = new JRDesignParameter();
	    param1.setName("sub1");
	    param1.setValueClass(net.sf.jasperreports.engine.JasperReport.class);
	    jasperDesign.addParameter(param1);
	    
	  /*
	    JRDesignParameter param2 = new JRDesignParameter();
	    param2.setName("connection");
	    param2.setValueClass(java.sql.Connection.class);
	    jasperDesign.addParameter(param2);
	    */
	  /*	    
	    JRDesignParameter param3 = new JRDesignParameter();
	    param3.setName("datasource");
	    param3.setValueClass(net.sf.jasperreports.engine.JRDataSource.class);
	    jasperDesign.addParameter(param3);
	  */  
	    
	    JRDesignParameter param4 = new JRDesignParameter();
	    param4.setName("StringParamMainReport");
	    param4.setValueClass(java.lang.String.class);
	    jasperDesign.addParameter(param4);
	    
	    jasperDesign.setWhenNoDataType(WhenNoDataTypeEnum.ALL_SECTIONS_NO_DETAIL);
	    
	    return jasperDesign;
	  }

//	etJasperDesignSubReport()
	private static JasperPrint useOneSubReport(String connString, Map params) throws JRException, SQLException
	  {
		
		TableModel tm = new DefaultTableModel(values,columns);
		JRDataSource ds = new JRTableModelDataSource(tm);
		
		JasperDesign mainReport = getJasperDesignMainReport();
				
		JasperDesign subDesine = getDesignSubReport();
		JasperReport subCompile = JasperCompileManager.compileReport(subDesine);
		JasperCompileManager.compileReportToFile(subDesine,"c:\\temp\\subreport.jasper");
		
		JasperReport rep = JasperCompileManager.compileReport(mainReport);
		JasperCompileManager.compileReportToFile(mainReport,"c:\\temp\\mainreport.jasper");
		System.out.println("rep="+rep);
						
	    JasperPrint result = null;
	    Connection conn = null;
	    try
	    {
	    	conn = DriverManager.getConnection(connString);
	    	
	    	//чтобы проверить, что суботчет работает
	    	//result = JasperFillManager.fillReport(subCompile, params, conn);
	    	
	    	params.put("sub1", subCompile);
	    	params.put("StringParamMainReport", "SimpleParameter");
	 //   	params.put("connection", conn);
	    	//params.put("datasource", ds);
	    	
		    result = JasperFillManager.fillReport(rep, params, conn);
		      //result = JasperFillManager.fillReport(rep,params,new JREmptyDataSource(1));
	    }
	    finally
	    {
	      conn.close();
	    }
	    return result;
	  }
	
	private static JRBand getTitleBand(String title)
	{
	JRDesignBand band = new JRDesignBand();
	band.setHeight(50);
	JRDesignLine line = new JRDesignLine();
	line.setX(0);
	line.setY(0);
	line.setWidth(515);
	line.setHeight(0);
	band.addElement(line);
	JRDesignStaticText textField = new JRDesignStaticText();
	textField.setX(0);
	textField.setY(10);
	textField.setWidth(515);
	textField.setHeight(30);
	JRDesignReportFont bigFont = new JRDesignReportFont();
	bigFont.setName("Arial_Normal");
	bigFont.setDefault(true);
	bigFont.setFontName("Arial");
	bigFont.setSize(22);
	bigFont.setPdfFontName("Helvetica");
	bigFont.setPdfEncoding("Cp1252");
	bigFont.setPdfEmbedded(false);
	textField.setFont(bigFont);
	textField.setText(title);
	band.addElement(textField);

	return band;
	}
	
	static String[] columns = {"Name","Result","Units","Bounds"};
	static String[][] values = {{"1","2","3"},{"4","5","6"},{"7","8","9"},{"10","11","12"}};
	
	public static void main(String[] args) {
		System.out.println("begin");
		String conn="jdbc:Cache://127.0.0.1:56773/DATA/?username=_SYSTEM&password=SYS";
		HashMap params = new HashMap();
		System.out.println("before execute");
		String targetFileName;
		try {
			/*
            //создание просто отчета - тест 1 - работает
			JasperPrint jp = useReport(conn, params); 
			targetFileName = "c:\\temp\\jaspertest1.pdf";
			*/
            //создание отчета с суботчетом - тест 2
		    JasperPrint jp = useOneSubReport(conn, params);
		    //targetFileName = "c:\\temp\\jaspertest2.pdf";
		    //executeAndSave(jp, "pdf", targetFileName);
		    
		    JRViewer viewer = new JRViewer(jp);


		    JFrame frame = new JFrame();
		    frame.setSize(800,600);
		    frame.setContentPane(viewer);
		    frame.setVisible(true);
		}
		catch (Exception ex) {
			System.out.println( "Caught exception: " + ex.getClass().getName()
		            + ": " + ex.getMessage() );
		        ex.printStackTrace();
		}
	}
	
}

