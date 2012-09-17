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
import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.export.JRPdfExporterParameter;

//import net.sf.jasperreports.engine.JasperPrintManager;


public class rptEpisodeMB {
	
	//формирование одного файла с несколькими отчетами как бы
	public static void startReport(String connString, String targetFileName, Map<String,String> params, String repFormat ) throws IOException, JRException, SQLException
	{
		if ((repFormat==null)||(repFormat.equals(""))) repFormat="pdf";
		String refTmp=null;
		if (params.containsKey("refTmp"))  refTmp= (String)params.get("refTmp");
		//if (refTmp == null) return;
		
		String fileJasper=null;
		if (params.containsKey("fileJasper"))  fileJasper= (String)params.get("fileJasper");
		//if (fileJasper == null) return;
		
		String episode,node,value;
    	JasperPrint result=null;
    	HashMap<String,String> paramsRpt;
    	CallableStatement stParameters, stEpisodes;
    	java.sql.ResultSet rsEpisodes,rsParameters;
		
        //JasperDesign rptDesign = JRXmlLoader.load(fileJasper);
        //JasperReport rptCompile = JasperCompileManager.compileReport(rptDesign);
    	JasperReport rptCompile = (JasperReport) JRLoader.loadObject(fileJasper);
   
        List<JasperPrint> jasperPrintList = new ArrayList<JasperPrint>();
        	
		Connection connectionDB = DriverManager.getConnection(connString);
		try {
			stEpisodes = connectionDB.prepareCall("{call Report.EpisodeMB_queryEpisodes(?)}");
		    try {
		        stEpisodes.setString(1, refTmp);
	            rsEpisodes = stEpisodes.executeQuery();
	            stParameters = connectionDB.prepareCall("{call Report.EpisodeMB_queryParameters(?,?)}");
		        try {
		             while (rsEpisodes.next()) {
	    		         episode=rsEpisodes.getString("codeEpisode");
	    		         //параметры
	    		         paramsRpt = new HashMap<String,String>();
	    		         stParameters.setString(1, episode);
		    	         stParameters.setString(2, refTmp);
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
		              rsEpisodes.close();
		        }
		        finally 
		        {
		        	stParameters.close();
		        }
		    } 
		    finally
		    {
		    	stEpisodes.close();
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

