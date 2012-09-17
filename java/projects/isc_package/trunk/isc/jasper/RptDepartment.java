package isc.jasper;

import net.sf.jasperreports.engine.JRDefaultStyleProvider;
import net.sf.jasperreports.engine.JRException;
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


public class RptDepartment {

	public static JasperDesign getDesign(String codeDepartment) throws JRException
	  {
		   //JasperDesign
	    JasperDesign jasperDesign = new JasperDesign();
	    jasperDesign.setName("reportDepartment");
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
	    JRDesignStyle normalStyle = RptLevel0.getStyleNormal();
	    jasperDesign.addStyle(normalStyle);
	
	    JRDesignBand band;
	    JRDesignStaticText staticText;
	    JRDesignTextField textField;
	    JRDesignExpression expression;
	   
//		  Fields
	    JRDesignField field = new JRDesignField();
	    field.setName("subReportDepartment");
	    field.setValueClass(net.sf.jasperreports.engine.JasperReport.class);
	    jasperDesign.addField(field);
	    
	    //		  Title (here whole hat of report)
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
	    staticText.setText("Department "+codeDepartment);
	    band.addElement(staticText);
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
		exp.setText("$F{subReportSetTest}");
		exp.setValueClass(net.sf.jasperreports.engine.JasperReport.class);
		subReport.setExpression(exp);
		
		band.addElement(subReport);
		    
		((JRDesignSection)jasperDesign.getDetailSection()).addBand(band);
	    
	    return jasperDesign;
	  }
	
}
