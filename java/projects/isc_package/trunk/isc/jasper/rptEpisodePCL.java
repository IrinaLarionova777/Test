package isc.jasper;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.CallableStatement;
import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;
//import java.awt.Color;


//import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
//import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
//import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
//import net.sf.jasperreports.engine.data.JRTableModelDataSource;
import net.sf.jasperreports.engine.design.JRDesignBand;
import net.sf.jasperreports.engine.design.JRDesignExpression;
import net.sf.jasperreports.engine.design.JRDesignField;
import net.sf.jasperreports.engine.design.JRDesignGroup;
//import net.sf.jasperreports.engine.JRGroup;
//import net.sf.jasperreports.engine.design.JRDesignLine;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JRDesignSection;
//import net.sf.jasperreports.engine.design.JRDesignStaticText;
import net.sf.jasperreports.engine.design.JRDesignStyle;
//import net.sf.jasperreports.engine.design.JRDesignConditionalStyle;
import net.sf.jasperreports.engine.type.ModeEnum;
import net.sf.jasperreports.engine.design.JRDesignTextField;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.design.JRDesignFrame;
//import net.sf.jasperreports.engine.JRBoxPenProvider;
//import net.sf.jasperreports.engine.JRBox;
import net.sf.jasperreports.engine.type.HorizontalAlignEnum;
import net.sf.jasperreports.engine.type.SplitTypeEnum;
import net.sf.jasperreports.engine.type.WhenNoDataTypeEnum;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.engine.design.JRDesignParameter;


public class rptEpisodePCL {

	//get report design
	public static JasperDesign getDesign(HashMap<String,String> params, Connection connectionDB) throws JRException,SQLException
	  {
		String refTmp=null;
		if (params.containsKey("refTmp"))  refTmp= (String)params.get("refTmp");
				
		JasperDesign jasperDesign = new JasperDesign();
		int margin=20;
	    jasperDesign.setName("EpisodePCL");
	    jasperDesign.setPageHeight(842);
	    jasperDesign.setPageWidth(595);
	    jasperDesign.setTopMargin(20);
	    jasperDesign.setBottomMargin(20);
	    jasperDesign.setLeftMargin(margin);
	    jasperDesign.setRightMargin(margin);
	    jasperDesign.setWhenNoDataType(WhenNoDataTypeEnum.NO_PAGES);
	    	   	    
	    int heightLine=10;
	    
//		Fonts
		JRDesignStyle normalStyle = rptEpisodePCL2.getStyleNormal(heightLine);
		jasperDesign.addStyle(normalStyle);
		// style conditional for zebra
		JRDesignStyle rowStyle = rptEpisodePCL2.getStyleRow(heightLine);
		jasperDesign.addStyle(rowStyle);
		// style for page header
		JRDesignStyle normalStyle10 = rptEpisodePCL2.getStyleNormal10(heightLine);
		jasperDesign.addStyle(normalStyle10);
		// style for spec symbols
		JRDesignStyle symbolStyle = rptEpisodePCL2.getStyleSymbol(heightLine);
		jasperDesign.addStyle(symbolStyle);
		// style for bold normal symbol
		JRDesignStyle boldStyle = rptEpisodePCL2.getStyleBold(heightLine);
		jasperDesign.addStyle(boldStyle);
		// style for italic normal symbol
		JRDesignStyle italicStyle = rptEpisodePCL2.getStyleItalic(heightLine);
		jasperDesign.addStyle(italicStyle);
		// style for underline normal symbol
		JRDesignStyle underlineStyle = rptEpisodePCL2.getStyleUnderline(heightLine);
		jasperDesign.addStyle(underlineStyle);
		
	    //Query
	    JRDesignQuery query = new JRDesignQuery();
	    query.setText("call Report.EpisodePCL_queryRpt('"+refTmp+"')");
	    jasperDesign.setQuery(query);
	    
	    // need vars
	    CallableStatement stmt;
	    java.sql.ResultSet rs;
	    JRDesignParameter param;
	    JRDesignBand band;
	    JRDesignTextField textField;
	    JRDesignExpression expression;
	       
	    //Parameters
	   	Iterator<String> iterator = params.keySet().iterator();
	   	String node;
	   	while (iterator.hasNext()) {
	   		    node=iterator.next().toString();
  	    		param = new JRDesignParameter();
	    		param.setName(node);
	    		param.setValueClass(java.lang.String.class);
	    		jasperDesign.addParameter(param);
	   	}
	    
	    //	  Fields
	    JRDesignField field;
	    field = new JRDesignField();
	    field.setName("department");
	    field.setValueClass(java.lang.String.class);
	    jasperDesign.addField(field);
	    field = new JRDesignField();
	    field.setName("nameDepartment");
	    field.setValueClass(java.lang.String.class);
	    jasperDesign.addField(field);
	    field = new JRDesignField();
	    field.setName("fioDoctor");
	    field.setValueClass(java.lang.String.class);
	    jasperDesign.addField(field);
	    field = new JRDesignField();
	    field.setName("dateOut");
	    field.setValueClass(java.lang.String.class);
	    jasperDesign.addField(field);
	    field = new JRDesignField();
	    field.setName("sectionName");
	    field.setValueClass(java.lang.String.class);
	    jasperDesign.addField(field);
	    field = new JRDesignField();
	    field.setName("numPage");
	    field.setValueClass(java.lang.String.class);
	    jasperDesign.addField(field);
	    
	    //counter fields
	    int fieldsCount=0;
	    if (params.containsKey("kolFields"))  fieldsCount= Integer.parseInt(params.get("kolFields"));
	    /*
	    CallableStatement cstmt = connectionDB.prepareCall("{? = call Report.EpisodePCL_getInfoFields(?)}");	
	    cstmt.setString(2, refTmp);
	    cstmt.registerOutParameter(1, java.sql.Types.VARCHAR);
	    cstmt.execute();
	    String fieldsInfo = cstmt.getString(1);
	    int fieldsCount = Integer.parseInt(Func.PieceDelimeter(fieldsInfo, 1, 0));
	    //int widthLetter0 = Integer.parseInt(Func.PieceDelimeter(fieldsInfo, 3, 0));
	    */
	  	    	    
	    for (int i=1;i<fieldsCount+1;i++) {
		    field = new JRDesignField();
		    field.setName("field"+i);
		    field.setValueClass(java.lang.String.class);
		    jasperDesign.addField(field);
	    }
	    
	    //Detail
	    int widthAval = jasperDesign.getPageWidth()-jasperDesign.getLeftMargin()-jasperDesign.getRightMargin();
	    JRDesignBand bandDetails = new JRDesignBand();
	    bandDetails.setHeight(heightLine);
	    bandDetails.setSplitType(SplitTypeEnum.STRETCH);
	    JRDesignFrame frame = new JRDesignFrame();
	    frame.setKey("frameDetails");
	    frame.setStyle(rowStyle);
	    frame.setMode(ModeEnum.OPAQUE);
	    frame.setHeight(heightLine);
	    frame.setWidth(widthAval);
	    
	    stmt = connectionDB.prepareCall("{call Report.EpisodePCL_queryStruct(?)}"); 
	    try {
	    	stmt.setString(1, refTmp);
	       	rs = stmt.executeQuery();
	    		    	
	    	int numField=0,offsetField=0,widthField=0;
	    	float factorProportional=0;
	    	Float vr;
	    	String specSign,style;
	    	while (rs.next()) {
	    		numField=rs.getInt("numberField");
	    		factorProportional=rs.getFloat("factorProportional");
	    		vr=rs.getInt("offsetField")*factorProportional;
	    		offsetField=(vr.intValue()-margin);
	    		vr=rs.getInt("widthField")*factorProportional;
	    		widthField=(vr.intValue());
	    		if (widthField==0) widthField=widthAval-offsetField;
	    		specSign = rs.getString("specSign");
	    		style=rs.getString("specStyle");
	    		if (style==null) style="";
	    		
			    textField = new JRDesignTextField();
			      textField.setX(offsetField);
			      textField.setY(0);
			      textField.setWidth(widthField);
			      textField.setHeight(heightLine);
			      textField.setHorizontalAlignment(HorizontalAlignEnum.LEFT);
			      textField.setBlankWhenNull(true);
			      if ((specSign != null)&&((specSign.equals("FLAG-HIGH"))||(specSign.equals("FLAG-LOW")))) {
			    	  textField.setStyle(symbolStyle);
			      }
			      else {
			    	  if ( !style.equals("BOLD") && !style.equals("ITALIC") && !style.equals("UNDERLINE") ) textField.setStyle(normalStyle);
			    	  else if (style.equals("BOLD")) textField.setStyle(boldStyle);
			    	  else if (style.equals("ITALIC")) textField.setStyle(italicStyle);
			    	  else if (style.equals("UNDERLINE")) textField.setStyle(underlineStyle);
			      }
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
	    }
	    finally
	    {
	    	stmt.close();
	    }
	    
	    	byte bound;
	       	bound = new Byte("5");
	    	frame.setLeftBorder(bound);
	    	frame.setRightBorder(bound);
	    	frame.setBottomBorder(bound);
	    	bandDetails.addElement(frame);
	    	
	    	((JRDesignSection)jasperDesign.getDetailSection()).addBand(bandDetails);
 
			//Group real
	    	String stringGroupExpression="$F{department}+$F{nameDepartment}+$F{fioDoctor}+$F{dateOut}+$F{sectionName}+$F{numPage}";
		    JRDesignGroup group = new JRDesignGroup();
			group.setName("department");
			expression = new JRDesignExpression();
	        expression.setValueClass(java.lang.String.class);
	        expression.setText(stringGroupExpression);
			group.setExpression(expression);
			
			// Group Page Header (here whole hat of report)
			String pathJRXML=null;
			if (params.containsKey("pathJRXML"))  pathJRXML= (String)params.get("pathJRXML");
			JasperDesign shablon = getShablon(pathJRXML);
			band = new JRDesignBand();
			band = (JRDesignBand)shablon.getPageHeader();
		    group.setGroupHeader(band);
            //		  group.setKeepTogether(true);
			group.setStartNewPage(true);
			group.setReprintHeaderOnEachPage(true);
			//jasperDesign.setPageHeader(band);
					    
			// Group Page Footer
			band = new JRDesignBand();
			band = (JRDesignBand)shablon.getPageFooter();
			group.setGroupFooter(band);
			//jasperDesign.setPageFooter(band);
		    
			//fictive Group 2 for columnHeader הכÿ גסוץ מעהוכממג, ךטנמלו H, D
		    JRDesignGroup group2 = new JRDesignGroup();
			group2.setName("department2");
			expression = new JRDesignExpression();
	        expression.setValueClass(java.lang.String.class);
	        expression.setText(stringGroupExpression);
			group2.setExpression(expression);
		    
			// Group 2 Header 
			band = new JRDesignBand();	
			band = (JRDesignBand)shablon.getGroups()[0].getGroupHeader();
			expression = new JRDesignExpression();
	        expression.setValueClass(java.lang.Boolean.class);
	        expression.setText("!($F{department}.equals(\"H\")|$F{department}.equals(\"D\")|$F{department}.equals(\"G\"))");
	        band.setPrintWhenExpression(expression);
	        group2.setStartNewPage(true);
	   	    group2.setGroupHeader(band);
	   	    group2.setReprintHeaderOnEachPage(true);
		    
	   	   // fictive Group 3 Header - הכÿ מעהוכמג H,D 
	   	    JRDesignGroup group3 = new JRDesignGroup();
			group3.setName("department3");
			expression = new JRDesignExpression();
	        expression.setValueClass(java.lang.String.class);
	        expression.setText(stringGroupExpression);
			group3.setExpression(expression);
	   		band = new JRDesignBand();
	   		band = (JRDesignBand)shablon.getGroups()[1].getGroupHeader();
	   		expression = new JRDesignExpression();
	   		expression.setValueClass(java.lang.Boolean.class);
	   		expression.setText("$F{department}.equals(\"H\")|$F{department}.equals(\"D\")");
	   		band.setPrintWhenExpression(expression);
	   		group3.setGroupHeader(band);
	   		group3.setReprintHeaderOnEachPage(true);
	   	    
	   	   // fictive Group 4 Header - הכÿ מעהוכמג G 
	   	    JRDesignGroup group4 = new JRDesignGroup();
			group4.setName("department4");
			expression = new JRDesignExpression();
	        expression.setValueClass(java.lang.String.class);
	        expression.setText(stringGroupExpression);
			group4.setExpression(expression);
	   		band = new JRDesignBand();
	   		band = (JRDesignBand)shablon.getGroups()[2].getGroupHeader();
	   		expression = new JRDesignExpression();
	   		expression.setValueClass(java.lang.Boolean.class);
	   		expression.setText("$F{department}.equals(\"G\")");
	   		band.setPrintWhenExpression(expression);
	   		group4.setGroupHeader(band);
	   		group4.setReprintHeaderOnEachPage(true);
	   		
			jasperDesign.addGroup(group);
			jasperDesign.addGroup(group2);
			jasperDesign.addGroup(group3);
			jasperDesign.addGroup(group4);
		   
		return jasperDesign;
	  }
	
	public static JasperDesign getShablon(String pathJRXML) throws JRException 
	{
		JasperDesign shablon = null;
	    shablon = JRXmlLoader.load(pathJRXML+"\\rptEpisodeDepTitle.jrxml");
		return shablon;
	}

	public static void startReport(String connString, String targetFileName, Map<String,String> params, String repFormat ) throws IOException, JRException, SQLException
	{
		HashMap<String,String> paramsi = params != null ? new HashMap<String,String>(params) : new HashMap<String,String>();
		if ((repFormat==null)||(repFormat.equals(""))) repFormat="pdf";
				
		Connection connectionDB = DriverManager.getConnection(connString);
		try 
		{
			JasperDesign rptDesine = getDesign(paramsi, connectionDB);
		    
		    //compile
			JasperReport rptCompile = JasperCompileManager.compileReport(rptDesine);
		    JasperCompileManager.compileReportToFile(rptDesine,"c:\\temp\\episode2.jasper");
		    
		    //fill
		    JasperPrint result = JasperFillManager.fillReport(rptCompile, paramsi, connectionDB);
		    		    
		    //export
		    //repFormat="print";
		    isc.jasper.JasperFacade.save(result, repFormat, targetFileName);
		    
		    //System.out.println("before print");
		    //JasperPrintManager.printReport(result, true);
		}
		finally 
		{
		    connectionDB.close();
		}
		
		
	}

	
	
}
