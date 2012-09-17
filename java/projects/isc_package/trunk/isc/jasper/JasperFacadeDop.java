package isc.jasper;

import java.util.Iterator;
import java.util.Map;
import java.util.HashMap;
import java.io.File;
import java.sql.SQLException;
import java.io.IOException;
import net.sf.jasperreports.engine.type.WhenNoDataTypeEnum;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JRException;
//import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JRDesignBand;
import net.sf.jasperreports.engine.design.JRDesignExpression;
import net.sf.jasperreports.engine.design.JRDesignParameter;
import net.sf.jasperreports.engine.design.JRDesignStyle;
import net.sf.jasperreports.engine.design.JRDesignTextField;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.engine.design.JRDesignStaticText;
import net.sf.jasperreports.engine.JRElement;
import net.sf.jasperreports.engine.JRParameter;
//import net.sf.jasperreports.engine.JRExpression;
import net.sf.jasperreports.engine.JRPropertiesMap;
import java.util.ArrayList;

import java.io.FileWriter;
import java.io.BufferedWriter;



public class JasperFacadeDop {
  
  //connString, repFormat не используются
  public static void setParametersReport(String connString, String fileJRXML, Map<String,String> params, String repFormat) throws JRException, SQLException, IOException
  {
	//для отладки
	// java.io.PrintWriter out = new java.io.PrintWriter(new java.io.FileWriter("c:\\temp\\outputfile.txt")); 
	  
	  
	JRDesignParameter param;  
	JasperDesign rptDesign;
	JRDesignBand bandHeader;
	JRDesignTextField textField;
	JRDesignExpression expression;
	JRDesignStaticText staticText;
	fileJRXML.toLowerCase();
	int pp=fileJRXML.indexOf("jrxml");
	if (pp==-1) {
		fileJRXML=fileJRXML+".jrxml";
		pp=fileJRXML.indexOf("jrxml");
	}
	String fileJasper=fileJRXML.substring(0,pp-1)+".jasper"; 
	System.out.println("fileJasper="+fileJasper);
	
	HashMap<String,String> paramsi = (params != null ? new HashMap(params) : new HashMap());  

	//style for new shablon
    JRDesignStyle style = new JRDesignStyle();
    style.setName("Arial_Normal");
    style.setFontName("Arial");
    style.setFontSize(10);

	File file = new File(fileJRXML);
	boolean exists = file.exists();
	if (exists) {
		rptDesign = JRXmlLoader.load(fileJRXML);
		bandHeader=(JRDesignBand)rptDesign.getPageHeader();
	}
	else {
		rptDesign = new JasperDesign();
		int margin=20;
	    rptDesign.setName(fileJRXML);
	    rptDesign.setPageHeight(842);
	    rptDesign.setPageWidth(595);
	    rptDesign.setTopMargin(20);
	    rptDesign.setBottomMargin(20);
	    rptDesign.setLeftMargin(margin);
	    rptDesign.setRightMargin(margin);
	    rptDesign.setWhenNoDataType(WhenNoDataTypeEnum.ALL_SECTIONS_NO_DETAIL);
	    
	    bandHeader = new JRDesignBand();
	    rptDesign.setPageHeader(bandHeader);
	    
	    rptDesign.addStyle(style);
	    	    
	}
	
	Iterator iterator = paramsi.entrySet().iterator();
   	String nameParam,typeParam;
   	int row=0;
	int heightBand=0;
   	while (iterator.hasNext()) {
   		    Map.Entry me = (Map.Entry)iterator.next();
   		    nameParam = me.getKey().toString();
   		    typeParam=me.getValue().toString();
     		param = new JRDesignParameter();
    		param.setName(nameParam);
      		if (typeParam.equals("Date")) {
    			param.setValueClass(java.util.Date.class);
    		}
    		else {
    			param.setValueClass(java.lang.String.class);
    		}
    		//out.println("rptDesign.getParametersList().contains(param)="+rptDesign.getParametersList().contains(param));
    		if (!rptDesign.getParametersList().contains(param)) {
    			rptDesign.addParameter(param);
     			if (!exists) {
    				staticText = new JRDesignStaticText();
    				staticText.setText(nameParam+"=");
    				staticText.setX(0);
    				staticText.setY(row*22);
    				staticText.setWidth(100);
    				staticText.setHeight(20);
    				staticText.setStyle(style);
    				bandHeader.addElement(staticText);
    				    			  
    				textField = new JRDesignTextField();
    			    textField.setX(105);
  			        textField.setY(row*22);
  			        textField.setWidth(300);
  			        textField.setHeight(20);
  			        textField.setBlankWhenNull(true);
  			        textField.setStyle(style);
  		            expression = new JRDesignExpression();
  			        expression.setValueClass(java.lang.String.class);
  			        if (typeParam.equals("Date")) {
  			    	   expression.setText("$P{"+nameParam+"}!=null ? new SimpleDateFormat(\"dd.MM.yyyy\").format($P{"+nameParam+"}) : \"\"");
   			        }
  			        else {
  			        	expression.setText("$P{"+nameParam+"}");
  			        }
   			        textField.setExpression(expression); 
    		        bandHeader.addElement(textField);	
    		        heightBand+=22;
    			    row++;
    			}
    		}
   	}
   	bandHeader.setHeight(heightBand);

   	//JasperCompileManager.verifyDesign(rptDesign);
    //JasperReport rptCompile = JasperCompileManager.compileReport(rptDesign);
   	JasperCompileManager.writeReportToXmlFile(rptDesign,fileJRXML);
    JasperCompileManager.compileReportToFile(rptDesign,fileJasper);
    
    //для отладки
    //out.close();
    
    return;
  }
  
  public static ArrayList<String> getParameters( String fileJRXML ) throws JRException, IOException
  {
	  ArrayList<String> paramslist = new ArrayList<String>();
	  
	  String parname,partype,pardesc,let5,let7,value,initValue,typeElement,key,vsp,propertyname;
	  int len;
	  char c1=1,c2=2;
	  JRParameter par;
	  JRPropertiesMap properties;
	  String[] nameProperties;
	  
	  // для отладки
	  //String filename="c:\\temp\\jasperlogd.txt";
	  
	  int pp=fileJRXML.indexOf("jrxml");
	  if (pp != -1) {
		 File file = new File(fileJRXML);
		 if (file.exists()) {
		    JasperDesign rptDesign = JRXmlLoader.load(fileJRXML);
		    
		    //report format (pdf or xsl ...) from report property format
		    String[] reportPropertes = rptDesign.getPropertyNames();
		    String property="";
            //logToFile("reportPropertes.length"+ reportPropertes.length+"\n", filename);  // для отладки
		    for (int i=0; i<reportPropertes.length; i++) {
		    	//logToFile("reportPropertes["+ i+"]="+reportPropertes[i]+"\n", filename);  // для отладки
		        if (reportPropertes[i].toLowerCase().equals("format")) {
		        	property=rptDesign.getProperty("format");
		        	paramslist.add("T"+c2+"y"+c2+"p"+c2+"e"+c2+"format"+c1+property);
		        }
		    }
		    
	        //параметры
		    JRParameter[] parameters=rptDesign.getParameters();
		    for (int i=0; i<parameters.length; i++) {
		    	par=parameters[i];
		    	pardesc=par.getDescription();
		    	if (pardesc==null) { pardesc=""; }
		    	parname=par.getName();
		    	partype=par.getValueClassName();
	      		
	   			initValue="";
	   			typeElement="";
	   			properties=null;
	   			if (par.hasProperties()) {
	   				properties=par.getPropertiesMap(); 
	   				nameProperties=properties.getPropertyNames();
	   				for (int k=0; k<nameProperties.length; k++) {
	   					propertyname = nameProperties[k].toLowerCase();
	   					if (propertyname.equals("typeelement")) {
	   						typeElement=properties.getProperty(nameProperties[k]).toLowerCase();
	   					}
	   					if (propertyname.equals("initvalue")) {
	   						initValue=properties.getProperty(nameProperties[k]);
	   					}
	   				}
	   				/*
 				   properties=par.getPropertiesMap(); 
 				   if (properties.containsProperty()) {
 					 typeElement=properties.getProperty("typeElement").toLowerCase(); 
 				   }
 				   if (properties.containsProperty("initValue")) {
 					  initValue=properties.getProperty("initValue"); 
 				   }*/
	   				
 			    }
		   			
      			// DateText (Description - InitialValue)
	   			if (partype.indexOf("java.util.Date")!=-1) {
	   				    typeElement="datetext";
	       			    //if (!initValue.matches("t[+-]?[0-9]?[0-9]?[0-9]?[0-9]?")) { initValue="t"; }
	   				    if (initValue.equals("")) { initValue="t"; }
				}
	   			
	   			// не обрабатывает параметры, у которых не определен тип и нет описания 
	   			if (typeElement.equals("")&&(pardesc.equals(""))) { continue; }
	   			
		        if ((!typeElement.equals("text"))&&(!typeElement.equals("datetext"))&&(!typeElement.equals("combobox"))&&(!typeElement.equals("listbox"))&&(!typeElement.equals("table"))&&(!typeElement.equals("checkbox"))&&(!typeElement.equals("radiobutton"))) {
		        	typeElement="text";
		        }
		        
		        if (pardesc.equals("")) { pardesc=parname; }
		        
		     // CheckBox (InitialValue(1/0))
		        if ((typeElement.equals("checkbox"))&&(!initValue.matches("[01]?"))) { initValue="0"; }
		        
		       	paramslist.add(parname+c1+typeElement+c1+pardesc+c1+initValue);
		        			
	       	    if (properties != null) {
        			nameProperties = properties.getPropertyNames();
			        for (int k=0; k<nameProperties.length; k++) {
			        	propertyname = nameProperties[k].toLowerCase();
			        	if ((propertyname.equals("typeelement"))||(propertyname.equals("initvalue"))) { continue; }
			        	key=nameProperties[k];
			        	value=properties.getProperty(key);
			        	if ((value==null)||(value.equals(""))) { continue; }
			        	vsp=key.toLowerCase();
			        	len=vsp.length();
			        	let7="";
			        	if (len>6) { let7=vsp.substring(0, 7); }
			        	let5="";
			        	if (len>4) { let5=vsp.substring(0, 5); }
		        	    if (let5.equals("data_")) {
			        	       paramslist.add("D"+c2+"a"+c2+"t"+c2+"a"+c2+parname+c1+key+c1+value); 
			        	}
		        	    else if (let5.equals("bind_")) {
		        	           paramslist.add("B"+c2+"i"+c2+"n"+c2+"d"+c2+parname+c1+key+c1+value); 
		        		}
		        	    else if (let7.equals("column_")) {
		        	    	   paramslist.add("C"+c2+"o"+c2+"l"+c2+"u"+c2+parname+c1+key+c1+value); 
		        		}
		        	    else {
		        	    	   if (vsp.equals("sql")) { key="sql"; }
		        	    	   if (vsp.equals("multiselect")) { key="multiSelect"; }
		        	    	   paramslist.add("P"+c2+"r"+c2+"o"+c2+"p"+c2+parname+c1+key+c1+value); 
		        		}
			        }
			    }
		    }
		   
		 }
      }
	return paramslist;
  }	
 
  // не используется - это было при создании в jasper отдельного файла с описание экрана запроса параметров
  public static ArrayList<String> getParametersFromSpecialFile( String fileJRXML ) throws JRException, IOException
  {
	  ArrayList<String> paramslist = new ArrayList<String>();
	  
	  String parclass,vsp,parname,partype,pardesc,let3,val9;
	  int counterLabels=0,parX,parY,parWidth,parHeight,pp1,pp2,k,num;
	  JRDesignStaticText staticText;
	  JRDesignTextField textField;
	  //JRExpression expression;
	  char c1=1,c2=2;
	  JRParameter par;
	  JRPropertiesMap properties;
	  String[] nameProperties;
	  
	
	  //String fileJRXML="C:\\work\\jasper\\report22.jrxml";
	  int pp=fileJRXML.indexOf("jrxml");
	  if (pp != -1) {
		 File file = new File(fileJRXML);
		 if (file.exists()) {
		    JasperDesign shablon = JRXmlLoader.load(fileJRXML);
		    JRParameter[] parameters=shablon.getParameters();
		    HashMap<String,Integer> parinv = new HashMap<String,Integer>();
		    for (int i=0; i<parameters.length; i++) {
		    	parinv.put(parameters[i].getName(),i);
		    }
		
		    JRDesignBand band = (JRDesignBand)shablon.getTitle();
		    JRElement[] elements=band.getElements();
		    
		    for (int i=0; i<elements.length; i++) {
		       //System.out.println("i="+i+" "+elements[i].getClass());
		        parclass=elements[i].getClass().toString();
		        parX=elements[i].getX();
		        parY=elements[i].getY();
		        parWidth=elements[i].getWidth();
		        parHeight=elements[i].getHeight();
		        if (parclass.indexOf("JRDesignStaticText") != -1) {
		        	staticText = (JRDesignStaticText)elements[i];
		        	counterLabels++;
		        	vsp="Label"+c1+parY+c1+parX+c1+parWidth+c1+parHeight+c1+c1+c1+staticText.getText();
		        	paramslist.add("Label"+counterLabels+c1+vsp);
		        }
		        if (parclass.indexOf("JRDesignTextField") != -1) {
		        	textField = (JRDesignTextField)elements[i];
		        	vsp=textField.getExpression().getText();
		        	pp1=-1;
		        	pp2=-1;
		        	pp1=vsp.indexOf("$P{");
		        	if (pp1!=-1) { pp2=vsp.indexOf("}", pp1); }
		        	if (pp2!=-1) { 
		        		parname=vsp.substring(pp1+3, pp2); 
		        		
		        		if (parinv.containsKey(parname)) {
		        			k=parinv.get(parname);
		        			par=parameters[k];
		        			partype=par.getValueClassName();
		        			pardesc=par.getDescription();
		        			if (pardesc==null) { pardesc=""; }
		        			let3=parname.substring(0, 3);
		        			
		        			// DateText (Description - InitialValue)
		        			if (partype.indexOf("java.util.Date")!=-1) {
		        			   if (!pardesc.matches("t[+-]?[0-9]?[0-9]?[0-9]?[0-9]?")) { pardesc="t"; }
		        	           vsp="DateText"+c1+parY+c1+parX+c1+parWidth+c1+parHeight+c1+c1+c1+pardesc;
		        	           paramslist.add(parname+c1+vsp);
		        			}
		        			
		        			// Text (Description - InitialValue)
		        			else if (let3.equals("txt")) {
		        			   vsp="Text"+c1+parY+c1+parX+c1+parWidth+c1+parHeight+c1+c1+c1+pardesc;
			        	       paramslist.add(parname+c1+vsp);
		        			}
		        			
		        			// CheckBox (Description - InitialValue(1/0) )
		        			else if (let3.equals("chb")) {
		        			   if (!pardesc.matches("[01]?")) { pardesc=""; }
		        			   val9="";
		        			   //System.out.println("hasProperties="+par.hasProperties());
		        			   if (par.hasProperties()) {
		        				   properties=par.getPropertiesMap(); 
		        				   if (properties.containsProperty("text")) {
		        					  val9=properties.getProperty("text"); 
		        				   }
		        			   }
		        			   vsp="CheckBox"+c1+parY+c1+parX+c1+parWidth+c1+parHeight+c1+c1+c1+pardesc+c1+val9;
			        	       paramslist.add(parname+c1+vsp);
		        			}
		        			// RadioButton (Description - InitialValue, Properties: key-value)
		        			else if (let3.equals("rdb")) {
			        			   //System.out.println("hasProperties="+par.hasProperties());
			        			   vsp="RadioButton"+c1+parY+c1+parX+c1+parWidth+c1+parHeight+c1+c1+c1+pardesc;
				        	       paramslist.add(parname+c1+vsp);
		        				   if (par.hasProperties()) {
			        				   properties=par.getPropertiesMap();
			        				   nameProperties = properties.getPropertyNames();
			        				   for ( k=0; k<nameProperties.length; k++) {
			        					  val9=properties.getProperty(nameProperties[k]); 
			        					  if (val9 != null) { paramslist.add("D"+c2+"a"+c2+"t"+c2+"a"+c2+parname+c1+nameProperties[k]+c1+val9); }
			        				   }
			        			   }

		        			}
		        			// ComboBox (Properties: sql - sql запрос или набор key-value)
		        			else if ((let3.equals("cmb"))|(let3.equals("lst"))|(let3.equals("tbl"))) {
		        				       val9="";
			        				   if (par.hasProperties()) {
		        					   properties=par.getPropertiesMap();
		        					   if (properties.containsProperty("sql")) {
		        						      // binding
		        						      nameProperties = properties.getPropertyNames();
				        				      for ( k=0; k<nameProperties.length; k++) {
				        				    	  if (nameProperties[k].equals("sql")) continue;
				        				    	  if (nameProperties[k].substring(0, 4).equals("bind")) {
				        				              //vsp=nameProperties[k].substring(4,nameProperties[k].length());
				        				              //num=0;
				        				              //if (vsp != null) { num=Integer.parseInt(vsp); }
				        					          val9=properties.getProperty(nameProperties[k]); 
				        					          if (val9 != null) { paramslist.add("B"+c2+"i"+c2+"n"+c2+"d"+c2+parname+c1+nameProperties[k]+c1+val9); }
				        				    	  }
				        				      }
		        						      // sql запрос
				        					  val9=properties.getProperty("sql"); 
				        			   } 
		        					   else {
			        				      nameProperties = properties.getPropertyNames();
			        				      for ( k=0; k<nameProperties.length; k++) {
			        					     val9=properties.getProperty(nameProperties[k]); 
			        					     if (val9 != null) { paramslist.add("D"+c2+"a"+c2+"t"+c2+"a"+c2+parname+c1+nameProperties[k]+c1+val9); }
			        				      }
			        				      val9="";
		        					   }
		        					   partype="ComboBox";
		        					   if (let3.equals("lst")) { partype="ListBox"; }
		        					   if (let3.equals("tbl")) { partype="Table"; }
				        			   vsp=partype+c1+parY+c1+parX+c1+parWidth+c1+parHeight+c1+c1+c1+c1+val9; //+pardesc;
					        	       paramslist.add(parname+c1+vsp);
			        			   }

		        			}
		        		}
		        	}
		        }
		    }   
		 }
      }
	return paramslist;
  }	
 
  private static void logToFile(String text, String filename)  throws IOException
  {
	  BufferedWriter writer = null;
	  try {
		    writer = new BufferedWriter(new FileWriter(filename, true));
		    writer.write(text);
		    writer.flush();
		    writer.close();
	  }
	 finally {
	     if (writer != null) {
	    	 writer.close();
		  }
	 }
	}
   
  public static void main(String[] args) throws JRException, SQLException, IOException
  {
	  String fileJRXML="C:\\work\\jasper\\report18.jrxml";
	  
	  ArrayList paramslist = getParameters( fileJRXML );
	
	  System.out.println("paramslist.size()= "+paramslist.size());
	   	for (int i=0; i<paramslist.size(); i++) {
	   		System.out.println("list "+ i + "=" + paramslist.get(i));
	   	}
  }	 
  
  
  
}



