package isc.jasper;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;

//import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.engine.util.JRLoader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.design.JRDesignParameter;
import net.sf.jasperreports.engine.export.JRPdfExporterParameter;

//import net.sf.jasperreports.engine.JasperPrintManager;


//формирование одного файла с несколькими отчетами 
//params("query") - имя запроса для создания нескольких отчетов  
//params("query2") - имя запроса для получения параметров каждого отчета
//params("kolParametersQuery") - кол-во передаваемых параметров в query=params("query")
// их значения в узлах 
//params("queryParam1...")
//параметры для передачи в params("query2") - они могу быть получены из запроса query=params("query") и из params("queryParam1...")
//их номера столбцов перечислены в узлах 
//params("query2Param1...")=номер столбца query=params("query") _ $c(0) _ номер параметра params("queryParam1...")

public class groupReport1 {
	
	public static void startReport(String connString, String targetFileName, Map<String,String> params, String repFormat) throws IOException, JRException, SQLException
	{
		if ((repFormat==null)||(repFormat.equals(""))) repFormat="pdf";
		String query=null,queryParams=null,fileJasper=null;
		Integer kolParametersQuery=0;
		if (params.containsKey("fileJasper"))  fileJasper= (String)params.get("fileJasper");
		if (params.containsKey("query"))  query= (String)params.get("query");
		if (params.containsKey("query2"))  queryParams= (String)params.get("query2");
		if (params.containsKey("kolParametersQuery"))  kolParametersQuery= Integer.getInteger(params.get("kolParametersQuery"));
		//if (query == null) return;
		String node,value,vsp;
		Integer num,valuenum=0,valuenum2=0;
		
	   	JasperPrint result=null;
    	HashMap<String,String> paramsRpt;
    	CallableStatement stParameters, st;
    	java.sql.ResultSet rs,rsParameters;
		
        //JasperDesign rptDesign = JRXmlLoader.load(fileJasper);
        //JasperReport rptCompile = JasperCompileManager.compileReport(rptDesign);
    	//javax.swing.JOptionPane.showMessageDialog(null,"fileJasper="+fileJasper);
    	JasperReport rptCompile = (JasperReport) JRLoader.loadObject(fileJasper);
   
        List<JasperPrint> jasperPrintList = new ArrayList<JasperPrint>();
        	
		Connection connectionDB = DriverManager.getConnection(connString);
		try {
			st = connectionDB.prepareCall("{"+query+"}");
		    try {
		    	Iterator<String> iterator = params.keySet().iterator();
		    	while (iterator.hasNext()) {
		   		    node=iterator.next().toString();
		   		    value = params.get(node);
		   		    if ((node.length() > 10) && (node.substring(0, 10).equals("queryParam"))) {
		   		    	num=Integer.parseInt(node.substring(10));
		   		    	st.setString(num, params.get(node));
		   		    }
		     	}
		        rs = st.executeQuery();
		        stParameters = connectionDB.prepareCall("{" + queryParams + "}");
		        try {
		             while (rs.next()) {
		            	 
		            	  Iterator<String> iterator2 = params.keySet().iterator();
	    			    	while (iterator2.hasNext()) {
	    			   		    node=iterator2.next().toString();
	    			   		    value = params.get(node);
	    			   		    if ((node.length() > 11) && (node.substring(0, 11).equals("query2Param"))) {
	    			   		    	vsp=Func.Piece(value, 1);
	    			   		    	valuenum=0;
	    			   		        if ((vsp != null) && (!vsp.equals(""))) valuenum = Integer.parseInt(vsp);
	    			   		        vsp=Func.Piece(value, 2);
	    			   		    	valuenum2=0;
	    			   		        if ((vsp != null) && (!vsp.equals(""))) valuenum2 = Integer.parseInt(vsp);
		    			   		   	num=Integer.parseInt(node.substring(11));
	    			   		    	if (valuenum != 0) stParameters.setString(num, rs.getString(valuenum));
	    			   		    	if (valuenum2 != 0) stParameters.setString(num, params.get("queryParam"+valuenum2));
	    			   		    }
	    			     	}
		            	 
	    		         //параметры
	    		         paramsRpt = new HashMap<String,String>();
	    		         rsParameters = stParameters.executeQuery();
	    		         while (rsParameters.next()) {
	    			        node=rsParameters.getString("node");
	    			        value=rsParameters.getString("value");
	    			        paramsRpt.put(node, value);
	    		         }
                         rsParameters.close();	    	
	        	         result = JasperFillManager.fillReport(rptCompile, paramsRpt, connectionDB);
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
		    	st.close();
		    }
	    	JRExporter exporter = isc.jasper.JasperFacade.getExporter(repFormat);
	    	exporter.setParameter(JRExporterParameter.JASPER_PRINT_LIST, jasperPrintList);
			if (!repFormat.equals("print")) exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, targetFileName);
			exporter.setParameter(JRPdfExporterParameter.IS_CREATING_BATCH_MODE_BOOKMARKS, Boolean.TRUE);
			
			exporter.exportReport();
		}
		finally 
		{
		    connectionDB.close();
		}
		
		
	}
	
}


