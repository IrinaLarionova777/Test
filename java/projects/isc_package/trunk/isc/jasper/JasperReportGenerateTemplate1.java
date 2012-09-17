package isc.jasper;

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

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.type.ModeEnum;
import net.sf.jasperreports.engine.type.HorizontalAlignEnum;
import net.sf.jasperreports.engine.type.PositionTypeEnum;

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
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperFillManager;

import java.awt.Color;


public class JasperReportGenerateTemplate1 {

	private static JasperPrint executeInternal(String connString, Map params) throws JRException, SQLException
	  {
		JasperDesign jasperDesine = getJasperDesign1();
		JasperReport rep = JasperCompileManager.compileReport(jasperDesine);
						
	    Map map = params != null ? new HashMap(params) : new HashMap();    

	    JasperPrint result = null;
	    Connection conn = DriverManager.getConnection(connString);
	    try
	    {
	      result = JasperFillManager.fillReport(rep, map, conn);
	    }
	    finally
	    {
	      conn.close();
	    }
	    return result;
	  }
	
	public static void executeAndSave(String connString, String repFormat, Map params, String targetFileName) throws IOException, JRException, SQLException
	  {
	    JasperPrint jp = executeInternal(connString, params);

	    OutputStream out = new FileOutputStream(targetFileName);
	    try
	    {
	      isc.jasper.JasperFacade.prepareExporter(jp, out, repFormat).exportReport();
	    }
	    finally
	    {
	      out.close();
	    }
	  }
	
	
	private static JasperDesign getJasperDesign1() throws JRException
	  {
	    //JasperDesign
	    JasperDesign jasperDesign = new JasperDesign();
	    jasperDesign.setName("Тестовый отчет с генерацией напрямую");
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
	    //query.setText("SELECT Name,Result,Units,Bounds FROM Address $P!{OrderByClause}");
	    query.setText("call Report.JasperReportGenerateTemplate_query1()");
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
	    frame.setForecolor(new Color(0x33, 0x33, 0x33));
	    frame.setBackcolor(new Color(0x33, 0x33, 0x33));
	    frame.setMode(ModeEnum.OPAQUE);
	    band.addElement(frame);
	    staticText = new JRDesignStaticText();
	    staticText.setX(0);
	    staticText.setY(0);
	    staticText.setWidth(55);
	    staticText.setHeight(15);
	    staticText.setForecolor(Color.white);
	    staticText.setBackcolor(new Color(0x33, 0x33, 0x33));
	    staticText.setMode(ModeEnum.OPAQUE);
	    staticText.setHorizontalAlignment(HorizontalAlignEnum.CENTER);
	    staticText.setStyle(normalStyle);
	    staticText.setText("Название");
	    frame.addElement(staticText);
	    staticText = new JRDesignStaticText();
	    staticText.setX(55);
	    staticText.setY(0);
	    staticText.setWidth(205);
	    staticText.setHeight(15);
	    staticText.setForecolor(Color.white);
	    staticText.setBackcolor(new Color(0x33, 0x33, 0x33));
	    staticText.setMode(ModeEnum.OPAQUE);
	    staticText.setStyle(normalStyle);
	    staticText.setText("Результат");
	    frame.addElement(staticText);
	    staticText = new JRDesignStaticText();
	    staticText.setX(260);
	    staticText.setY(0);
	    staticText.setWidth(100);
	    staticText.setHeight(15);
	    staticText.setForecolor(Color.white);
	    staticText.setBackcolor(new Color(0x33, 0x33, 0x33));
	    staticText.setMode(ModeEnum.OPAQUE);
	    staticText.setStyle(normalStyle);
	    staticText.setText("Единицы измерения");
	    frame.addElement(staticText);
	    staticText = new JRDesignStaticText();
	    staticText.setX(360);
	    staticText.setY(0);
	    staticText.setWidth(155);
	    staticText.setHeight(15);
	    staticText.setForecolor(Color.white);
	    staticText.setBackcolor(new Color(0x33, 0x33, 0x33));
	    staticText.setMode(ModeEnum.OPAQUE);
	    staticText.setStyle(normalStyle);
	    staticText.setText("Референсные границы");
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
	    textField.setWidth(50);
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
	    textField.setX(55);
	    textField.setY(4);
	    textField.setWidth(200);
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
	    textField.setX(360);
	    textField.setY(4);
	    textField.setWidth(155);
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
	    line.setForecolor(new Color(0x80, 0x80, 0x80));
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

	    return jasperDesign;
	  }
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
