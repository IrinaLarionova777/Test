package isc.jasper;

import java.awt.Color;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//import java.util.HashMap;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JRDesignBand;
import net.sf.jasperreports.engine.design.JRDesignConditionalStyle;
import net.sf.jasperreports.engine.design.JRDesignExpression;
import net.sf.jasperreports.engine.design.JRDesignField;
import net.sf.jasperreports.engine.design.JRDesignFrame;
import net.sf.jasperreports.engine.design.JRDesignGroup;
import net.sf.jasperreports.engine.design.JRDesignLine;
import net.sf.jasperreports.engine.design.JRDesignParameter;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JRDesignSection;
import net.sf.jasperreports.engine.design.JRDesignStaticText;
import net.sf.jasperreports.engine.design.JRDesignStyle;
import net.sf.jasperreports.engine.design.JRDesignTextField;
import net.sf.jasperreports.engine.type.HorizontalAlignEnum;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.type.VerticalAlignEnum;
import net.sf.jasperreports.engine.type.ModeEnum;
import net.sf.jasperreports.engine.type.SplitTypeEnum;
import net.sf.jasperreports.engine.type.WhenNoDataTypeEnum;
import net.sf.jasperreports.engine.design.JRDesignImage;
//import net.sf.jasperreports.engine.JRLineBox;

import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;

import net.sf.jasperreports.engine.xml.JRXmlLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.export.JRPdfExporterParameter;
//import net.sf.jasperreports.engine.JasperPrintManager;


public class rptEpisodePCL2 {

	public static JasperDesign getDesign(String department, String refTmp, Connection connectionDB, JasperDesign shablon, CallableStatement stParameters, CallableStatement stStruct, Integer kolFields, JRDesignStyle normalStyle, JRDesignStyle rowStyle, JRDesignStyle normalStyle10, JRDesignStyle symbolStyle ) throws JRException,SQLException
	  {
		JasperDesign jasperDesign = new JasperDesign();
		int margin=20;
	    jasperDesign.setName("department_"+department);
	    jasperDesign.setPageHeight(842);
	    jasperDesign.setPageWidth(595);
	    jasperDesign.setTopMargin(20);
	    jasperDesign.setBottomMargin(20);
	    jasperDesign.setLeftMargin(margin);
	    jasperDesign.setRightMargin(margin);
	    jasperDesign.setWhenNoDataType(WhenNoDataTypeEnum.NO_PAGES);
	    
	    int heightLine=10;
	    int widthAval = jasperDesign.getPageWidth()-jasperDesign.getLeftMargin()-jasperDesign.getRightMargin();
	    
	    // need vars
	    java.sql.ResultSet rs;
	    JRDesignParameter param;
	    JRDesignBand band;
	    JRDesignTextField textField;
	    JRDesignExpression expression;
	    JRDesignField field;
	    JRDesignGroup group;
	    
//		Fonts
		jasperDesign.addStyle(normalStyle);
		// style conditional for zebra
		jasperDesign.addStyle(rowStyle);
		// style for page header
		jasperDesign.addStyle(normalStyle10);
		// style for spec symbols
		jasperDesign.addStyle(symbolStyle);

	    //Query
	    JRDesignQuery query = new JRDesignQuery();
	    query.setText("call Report.EpisodePCL2_queryRpt('"+department+"','"+refTmp+"')");
	    jasperDesign.setQuery(query);
	      
	    int numField=0,offsetField=0,widthField=0;
	    JRDesignBand bandDetails = new JRDesignBand();
	    bandDetails.setHeight(heightLine);
	    bandDetails.setSplitType(SplitTypeEnum.STRETCH);
		    
	    //Parameters
	   	rs = stParameters.executeQuery();
	   	while (rs.next()) {
  	    		param = new JRDesignParameter();
	    		param.setName(rs.getString("parameterName"));
	    		param.setValueClass(java.lang.String.class);
	    		jasperDesign.addParameter(param);
	    		//System.out.println("par="+rs.getString("parameterName"));
	   	}
	   	rs.close();
	  	 		
//		  Fields
	   	//field for number of page
	    field = new JRDesignField();
	    field.setName("numPage");
	    field.setValueClass(java.lang.String.class);
	    jasperDesign.addField(field);
	   	
	    System.out.println("kolFields="+kolFields);
	    for (int i=1;i<kolFields+1;i++) {
		    field = new JRDesignField();
		    field.setName("field"+i);
		    field.setValueClass(java.lang.String.class);
		    jasperDesign.addField(field);
	    }
	   	
	    bandDetails.setHeight(heightLine);
	    JRDesignFrame frame = new JRDesignFrame();
	    frame.setKey("frameDetails");
	    frame.setStyle(rowStyle);
	    frame.setMode(ModeEnum.OPAQUE);
	    frame.setHeight(heightLine);
	    frame.setWidth(widthAval);
	    frame.setX(0);
	    frame.setY(0);
	    
	    float factorProportional=0;
    	Float vr;
    	String specSign;
	    
	    rs = stStruct.executeQuery();
	    		    	
	    	while (rs.next()) {
	    		numField=rs.getInt("numberField");
	    		factorProportional=rs.getFloat("factorProportional");
	    		//if (widthLetter==0) { widthLetter=widthLetter0; }
	    		vr=rs.getInt("offsetField")*factorProportional;
	    		offsetField=(vr.intValue()-margin);
	    		//System.out.println("offset="+offsetField);
	    		vr=rs.getInt("widthField")*factorProportional;
	    		widthField=(vr.intValue());
	    		//widthField=(rs.getInt("widthField")*widthLetter);
	    		if (widthField==0) widthField=widthAval-offsetField;
	    		specSign = rs.getString("specSign");
	    			    		
			    textField = new JRDesignTextField();
			      textField.setX(offsetField);
			      textField.setY(0);
			      textField.setWidth(widthField);
			      textField.setHeight(heightLine);
			      textField.setHorizontalAlignment(HorizontalAlignEnum.LEFT);
			      if ((specSign != null)&&((specSign.equals("FLAG-HIGH"))||(specSign.equals("FLAG-LOW")))) {
			    	  textField.setStyle(symbolStyle);
			      }
			      else {
			    	  textField.setStyle(normalStyle);
			      }
			      textField.setBlankWhenNull(true);
			      textField.setPrintWhenDetailOverflows(true);
			      
			      expression = new JRDesignExpression();
			        expression.setValueClass(java.lang.String.class);
			        if ((specSign != null)&&(specSign.equals("FLAG-HIGH"))) {
			        	expression.setText("($F{field"+numField+"}.equals(\"FLAG-HIGH\")) ?  \"\\u2191\" : $F{field"+numField+"}");
			        }
			        else if ((specSign != null)&&(specSign.equals("FLAG-LOW"))) {
			        	expression.setText("($F{field"+numField+"}.equals(\"FLAG-LOW\")) ?  \"\\u2193\" : $F{field"+numField+"}");
			        }
			        else {
			        	expression.setText("$F{field"+numField+"}");
			        }
			      textField.setExpression(expression);
			      frame.addElement(textField);
	    	}
	    	rs.close();
	    	
			byte bound = new Byte("5");
			//JRLineBox border = frame.getLineBox();
			frame.setLeftBorder(bound);
			frame.setRightBorder(bound);
			bandDetails.addElement(frame); 
			
	    ((JRDesignSection)jasperDesign.getDetailSection()).addBand(bandDetails);    
	
		//fictive Group for header
	    group = new JRDesignGroup();
		group.setName("pageHeaderFooter");
		expression = new JRDesignExpression();
        expression.setValueClass(java.lang.String.class);
        expression.setText("$F{numPage}");
		group.setExpression(expression);
	    
		// Group Header = PageHeader from template
		band = new JRDesignBand();
	    band = getPageHeader(department, widthAval, shablon, normalStyle10);
	    group.setGroupHeader(band);
			
	    // Group Footer = PageFooter
        band = new JRDesignBand();
        band = (JRDesignBand)shablon.getPageFooter();
		group.setGroupFooter(band);    
		
		jasperDesign.addGroup(group);
		    
		return jasperDesign;
	  }
	
	public static JRDesignBand getPageHeader(String department, int widthAval, JasperDesign shablon, JRDesignStyle normalStyle10) {
		JRDesignBand bandShablon = (JRDesignBand)shablon.getPageHeader();
		JRDesignBand band = (JRDesignBand)bandShablon.clone();
	
		//JRDesignImage imgLogo = (JRDesignImage)band.getElementByKey("logo");
		//JRDesignExpression expression = new JRDesignExpression();
        //expression.setValueClass(java.lang.String.class);
        //expression.setText("\""+Func.pathForJasper(pathJRXML+"\\logo.png")+"\"");
        //if (imgLogo != null) imgLogo.setExpression(expression);
	    /*
	    //добавляем заголовок таблицы в зависимости от отдела
	    band = (JRDesignBand)shablon.getGroups()[0].getGroupHeader();
	    if (department.equals("H")||department.equals("D"))  band = (JRDesignBand)shablon.getGroups()[1].getGroupHeader();
	    if (department.equals("G"))  band = (JRDesignBand)shablon.getGroups()[2].getGroupHeader();
	    bandHeader.setHeight(bandHeader.getHeight()+band.getHeight());
	    JRElement[] allElementsOfBand = band.getElements();
	    JRElement element;
        for (int i=0; i<allElementsOfBand.length; i++) {
        	element=allElementsOfBand[i];
        	element.set
        }
		*/
		int addHeight;
		int heightOld=band.getHeight();
	   	if (department.equals("H")||department.equals("D")) {
			addHeight=10;
			band.setHeight(heightOld+addHeight);
			JRDesignLine line = new JRDesignLine();
			line.setX(0);
			line.setY(heightOld+addHeight-1);
			line.setWidth(widthAval);
			line.setHeight(1);
			line.setPen(new Byte("5"));
			band.addElement(line);
		}
		else  {
			addHeight=30;
			band.setHeight(heightOld+addHeight);
			JRDesignFrame frame = new JRDesignFrame();
			frame.setX(0);
			frame.setY(heightOld);
			frame.setWidth(widthAval);
			frame.setHeight(addHeight-1);
		    frame.setMode(ModeEnum.OPAQUE);
		    frame.setStyle(normalStyle10);
		    byte bound = new Byte("5");
		    frame.setLeftBorder(bound);
		    frame.setRightBorder(bound);
		    frame.setBottomBorder(bound);
		    frame.setTopBorder(bound);
		    frame.setBackcolor(new Color(204,204,204));
			    
		    JRDesignStaticText staticText;
		    staticText = new JRDesignStaticText();
		    staticText.setText("Наименование теста");
		    staticText.setX(50);
		    staticText.setY(1);
		    staticText.setHeight(addHeight-2);
		    staticText.setWidth(270);
		    staticText.setHorizontalAlignment(HorizontalAlignEnum.LEFT);
		    staticText.setVerticalAlignment(VerticalAlignEnum.MIDDLE);
		    staticText.setBold(true);
		    frame.addElement(staticText);
		    staticText = new JRDesignStaticText();
		    staticText.setText("Результат");
		    int left=285;
		    if (department.equals("G")) left=300;
		    staticText.setX(left);
		    staticText.setY(1);
		    staticText.setHeight(addHeight-2);
		    staticText.setWidth(100);
		    staticText.setHorizontalAlignment(HorizontalAlignEnum.LEFT);
		    staticText.setVerticalAlignment(VerticalAlignEnum.MIDDLE);
		    staticText.setBold(true);
		    frame.addElement(staticText);
		    if (!department.equals("G")) {
		       staticText = new JRDesignStaticText();
		       staticText.setText("Единицы измерения");
		       staticText.setX(362);
		       staticText.setY(1);
		       staticText.setHeight(addHeight-2);
	           staticText.setWidth(78);
		       staticText.setHorizontalAlignment(HorizontalAlignEnum.LEFT);
		       staticText.setVerticalAlignment(VerticalAlignEnum.MIDDLE);
		       staticText.setBold(true);
		       frame.addElement(staticText);
		       staticText = new JRDesignStaticText();
		       staticText.setText("Референсные значения");
		       staticText.setX(458);
		       staticText.setY(1);
		       staticText.setHeight(addHeight-2);
		       staticText.setWidth(70);
		       staticText.setHorizontalAlignment(HorizontalAlignEnum.LEFT);
		       staticText.setVerticalAlignment(VerticalAlignEnum.MIDDLE);
		       staticText.setBold(true);
		       frame.addElement(staticText);
		    }
		    band.addElement(frame);
		}
        
      return band;
	}   
    
	public static JRDesignStyle getStyleNormal(int heightLine) 
	{ 
       JRDesignStyle style = new JRDesignStyle();
       style.setName("Arial_Normal");
       style.setDefault(true);
       style.setFontName("Arial");
       style.setFontSize(heightLine-2);
       //style.setPdfFontName("Arial");
       //style.setPdfEncoding("CP1251");
       //style.setPdfEmbedded(true);
       return style;
	}
	
	public static JRDesignStyle getStyleSymbol(int heightLine) 
	{ 
       JRDesignStyle style = new JRDesignStyle();
       style.setName("Symbol_Normal");
       style.setDefault(false);
       style.setFontName("DejaVu Serif");
       style.setFontSize(heightLine-2);
       //style.setForecolor(new Color(254,0,0));
       //style.setPdfFontName("C:\\work\\fonts\\arial\\fonts\\DejaVuSerif.ttf");
       //style.setPdfEncoding("Identity-H");
       //style.setPdfEncoding("CP1251");
       //style.setPdfEmbedded(true);
       return style;
	}
	
	public static JRDesignStyle getStyleNormal10(int heightLine) 
	{ 
	   JRDesignStyle style = getStyleNormal(heightLine);
       style.setName("Arial_Normal10");
       style.setDefault(false);
       style.setFontSize(10);
       return style;
	}
	
	public static JRDesignStyle getStyleBold(int heightLine) 
	{ 
	   JRDesignStyle style = getStyleNormal(heightLine);
       style.setName("Arial_Bold");
       style.setDefault(false);
       style.setBold(true);
       return style;
	}
	
	public static JRDesignStyle getStyleItalic(int heightLine) 
	{ 
	   JRDesignStyle style = getStyleNormal(heightLine);
       style.setName("Arial_Italic");
       style.setDefault(false);
       style.setItalic(true);
       return style;
	}
	
	public static JRDesignStyle getStyleUnderline(int heightLine) 
	{ 
	   JRDesignStyle style = getStyleNormal(heightLine);
       style.setName("Arial_Underline");
       style.setDefault(false);
       style.setUnderline(true);
       return style;
	}
	
	public static JRDesignStyle getStyleRow(int heightLine) throws JRException
	{ 
	   JRDesignStyle style = getStyleNormal(heightLine);
	   style.setDefault(false);
       style.setName("Row");
       style.setMode(ModeEnum.TRANSPARENT);
       JRDesignConditionalStyle condStyle = new JRDesignConditionalStyle();
       JRDesignExpression expression = new JRDesignExpression();
		  expression.setText("$V{REPORT_COUNT}%2 == 0");
		  expression.setValueClass(java.lang.Boolean.class);
       condStyle.setConditionExpression(expression);
       condStyle.setBackcolor(new Color(240,240,240));
       condStyle.setMode(ModeEnum.OPAQUE);
       style.addConditionalStyle(condStyle);
       return style;
	}
	
	public static void startReport(String connString, String targetFileName, Map<String,String> params, String repFormat ) throws IOException, JRException, SQLException
	{
		if ((repFormat==null)||(repFormat.equals(""))) repFormat="pdf";
		String refTmp=null;
		if (params.containsKey("refTmp"))  refTmp= (String)params.get("refTmp");
		if (refTmp == null) return;
		
		CallableStatement stDepartments,stInfo,stStruct,stParameters;
		JasperDesign shablon;
		String department,nameDepartment,fioDoctor,dateOut,sectionName,kolAllPages;
    	String initPage;
    	int kolFields;
    	JasperPrint result=null;
    	JasperDesign rptDesine;
    	JasperReport rptCompile;
		
		List<JasperPrint> jasperPrintList = new ArrayList<JasperPrint>();
		
//		Fonts
		int heightLine=10;
		JRDesignStyle normalStyle = getStyleNormal(heightLine);
		// style conditional for zebra
		JRDesignStyle rowStyle = getStyleRow(heightLine);
		// style for page header
		JRDesignStyle normalStyle10 = getStyleNormal10(heightLine);
		// style for spec symbols
		JRDesignStyle symbolStyle = getStyleSymbol(heightLine);
				
		Connection connectionDB = DriverManager.getConnection(connString);
		try 
		{
			//path to jrxml with template
			String pathJRXML="";
			stInfo = connectionDB.prepareCall("{? = call Report.JasperReportTune_getDirJasper()}");	
			try {
			    stInfo.registerOutParameter(1, java.sql.Types.VARCHAR);
			    stInfo.execute();
		        pathJRXML = stInfo.getString(1);
			}
			finally {
		        stInfo.close();
			}
				
		    //load template from file and подмениваем путь к рисунку 
		    shablon = JRXmlLoader.load(pathJRXML+"\\rptEpisodeDepTitle2.jrxml");	
			JRDesignBand band = (JRDesignBand)shablon.getPageHeader();
			JRDesignImage imgLogo = (JRDesignImage)band.getElementByKey("logo");
			if (imgLogo != null) {
			    JRDesignExpression expression = new JRDesignExpression();
	            expression.setValueClass(java.lang.String.class);
	            expression.setText("\""+Func.pathForJasper(pathJRXML+"\\logo.png")+"\"");
	            imgLogo.setExpression(expression);
	            //shablon.setPageHeader(band);
			}
		    
		    stDepartments = connectionDB.prepareCall("{call Report.EpisodePCL2_queryDepartments(?)}");
		    try {
		    	stStruct = connectionDB.prepareCall("{call Report.EpisodePCL2_queryStruct(?,?)}");
		    	try {
		    		stParameters = connectionDB.prepareCall("{call Report.EpisodePCL2_queryParameters(?,?)}");
		    		try {
		    	        stDepartments.setString(1, refTmp);
		                java.sql.ResultSet rs = stDepartments.executeQuery(); 
		    
	    	     	    while (rs.next()) {
	    	     	    	//добавочные параметры - кторые зависят от department
	             		     department=rs.getString("department");
	    	        	     nameDepartment=rs.getString("nameDepartment");
	    		             fioDoctor=rs.getString("fioDoctor");
	    		             dateOut=rs.getString("dateOut");
	    		             sectionName=rs.getString("sectionName");
	    		            //initPage=Integer.parseInt(rs.getString("initPage"));
	    		             initPage=rs.getString("initPage");
	    		             kolAllPages=rs.getString("kolAllPages");
	    		             //kolFields=Integer.parseInt(rs.getString("kolFields"));
	    		             kolFields=rs.getInt("kolFields");
	    		             params.put("nameDepartment", nameDepartment);
    	   		             params.put("fioDoctor", fioDoctor);
    	   		             params.put("dateOut", dateOut);
    	   		             params.put("initPage", initPage);
    	   		             params.put("sectionName", sectionName);
    	   		             params.put("kolAllPages", kolAllPages);
    	   
    	   		    	   		
    	   		             stStruct.setString(1, department);
    	   		             stStruct.setString(2, refTmp);
    	   		             stParameters.setString(1, department);
 	   		                 stParameters.setString(2, refTmp);
    	    	             rptDesine = getDesign(department, refTmp, connectionDB, shablon, stParameters, stStruct, kolFields, normalStyle, rowStyle, normalStyle10, symbolStyle);
    	    
     		           	     rptCompile = JasperCompileManager.compileReport(rptDesine);
     			             JasperCompileManager.compileReportToFile(rptDesine,"c:\\temp\\episode"+department+".jasper");
     			
     			             result = JasperFillManager.fillReport(rptCompile, params, connectionDB);
     			             jasperPrintList.add(result);
		    	
		                }
	       	            rs.close();
		    	    }
		    	    finally 
		    	    {
		    		        stParameters.close();
		    	    }
		        }
		        finally 
		        {
		    	    stStruct.close();
		        }
		    }
		    finally 
		    {
		    	stDepartments.close();
		    }
	    

		}
		finally 
		{
		    connectionDB.close();
		}
		
    	JRExporter exporter = isc.jasper.JasperFacade.getExporter(repFormat);
    	exporter.setParameter(JRExporterParameter.JASPER_PRINT_LIST, jasperPrintList);
		if (!repFormat.equals("print")) exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, targetFileName);
		exporter.setParameter(JRPdfExporterParameter.IS_CREATING_BATCH_MODE_BOOKMARKS, Boolean.TRUE);
		
		exporter.exportReport();
		
		//JasperPrintManager.printReport(result, true);		
	
	}
	/*
	// for test
	public static void main(String[] args) {
		String connString="jdbc:Cache://127.0.0.1:56773/DATA/?username=_SYSTEM&password=SYS";
		String setTest;
		HashMap params;
		try {
			RptLevel0.openConnection();
			Connection connectionDB = RptLevel0.connectionDB;
			//params.put("connection",connectionDB);
			
			String refTmp="^test(3)";
		
			String format="pdf";
		    JRExporter exporter = isc.jasper.JasperFacade.getExporter(format);
		    String targetFileName;
		    targetFileName = "c:\\temp\\rptBatch."+format;
		    
		    List jasperPrintList = new ArrayList();
		
			Statement stmt = RptLevel0.connectionDB.createStatement();	
	    	java.sql.ResultSet rs = stmt.executeQuery("call Report.EpisodePCL2_queryDepartments('"+refTmp+"')");
	    	
	    	String department;
	    	OutputStream out;
	    	JasperPrint result;
	    	JasperDesign rptDesine;
	    	JasperReport rptCompile;
	    	Vector rptDesignArr = new Vector();
	    	Vector rptCompileArr = new Vector();
	    	while (rs.next()) {
	    		department=rs.getString("department");
	    		params = new HashMap();
	    		//"CardNumber","FullName","DOB","Address1","Address2","InsCompany","InsSerial","InsNumber","HospitalDepartment","DateTimeOfCollection","DateOfReceiving","Sex"
	    		params.put("CardNumber", rs.getString("CardNumber"));
	    		params.put("FullName", rs.getString("FullName"));
	    		
     			rptDesine = getDesign(department,refTmp,connectionDB);
     			rptDesignArr.addElement(rptDesine);
     			rptCompile = JasperCompileManager.compileReport(rptDesine);
     			rptCompileArr.addElement(rptCompile);
     			
     			result = JasperFillManager.fillReport(rptCompile, params, connectionDB);
     			jasperPrintList.add(result);  //JRLoader.loadObjectFromLocation("build/reports/Report1.jrprint"));
		    	
		    	//targetFileName = "c:\\temp\\rpt"+department+".rtf";
		    	//out = new FileOutputStream(targetFileName);
		    	//ReportTest1.executeAndSave(result, "rtf", targetFileName);
	    	}			
			//
	    	exporter.setParameter(JRExporterParameter.JASPER_PRINT_LIST, jasperPrintList);
			exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, targetFileName);
			exporter.setParameter(JRPdfExporterParameter.IS_CREATING_BATCH_MODE_BOOKMARKS, Boolean.TRUE);
			
			exporter.exportReport();
	    	
	    	connectionDB.close();
	    	
	    	
			//JRViewer viewer = new JRViewer(result);

			//JFrame frame = new JFrame();
			//frame.setSize(800,600);
			//frame.setContentPane(viewer);
			//frame.setVisible(true); 
		    }
	   	catch (Exception ex) {
		        ex.printStackTrace();
		}
	}
	
	*/
}

