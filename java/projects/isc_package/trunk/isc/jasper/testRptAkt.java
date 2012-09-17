package isc.jasper;

import java.sql.Connection;
import java.util.HashMap;

import javax.swing.JFrame;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.view.JRViewer;

import java.util.Map;
import java.util.HashMap;
import java.io.IOException;
import java.io.File;
import java.io.OutputStream;
import java.io.FileOutputStream;
import java.io.ByteArrayOutputStream;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.export.JRXmlExporter;
import net.sf.jasperreports.engine.export.JRXmlExporterParameter;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRRtfExporter;


public class testRptAkt {
	
//	 for test
	public static void main(String[] args) {
		String connString="jdbc:Cache://127.0.0.1:56773/DATA/?username=_SYSTEM&password=SYS";
		String setTest;
		HashMap params = new HashMap();
		try
		    {
			RptLevel0.openConnection();
			Connection connectionDB = RptLevel0.connectionDB;
			
			String fileName="c:\\JasperTest2\\rptAkt.jasper";
			JasperReport rep = (JasperReport)JRLoader.loadObject(new File(fileName));
			
		  	params.put("pDateFrom","62100");
		  	params.put("pDateTo","62300");
		  	params.put("pDateAkt","62300");
		  			    
			params.put("pNameHospital","NameHospital"); 
				
			params.put("pSumItog","1000.00");
			params.put("pSumItogProp","1000.00");
			
							
			params.put("prefTemp","^test(\"javaTest\")");

			params.put("pContractNo","numContr");
			params.put("pContractDate","dateContr");
			params.put("pNameHospital","pNameHospital");
			params.put("pPositionHospital","pPositionHospital");
			params.put("pFioHospital","pFioHospital");
			params.put("pNameExecuter","pNameExecuter");
			params.put("pPositionExecuter","pPositionExecuter");
			params.put("pFioExecuter","pFioExecuter");
			
			
							
			JasperPrint result = JasperFillManager.fillReport(rep, params, connectionDB);
			
			connectionDB.close();
			
			String targetFileName = "c:\\temp\\rptAkt.xls";
		    ReportTest1.executeAndSave(result, "xls", targetFileName);
			
			/*
			JRViewer viewer = new JRViewer(result);

			JFrame frame = new JFrame();
			frame.setSize(800,600);
			frame.setContentPane(viewer);
			frame.setVisible(true);
			*/
		    }
	   	catch (Exception ex) {
		        ex.printStackTrace();
		}
	}
}

