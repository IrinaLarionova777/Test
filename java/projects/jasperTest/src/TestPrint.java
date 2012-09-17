import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperPrintManager;

public class TestPrint {

	public static void startRpt() 
	{
		try {
			String conn = "jdbc:Cache://127.0.0.1:21025/DATA/?username=report&password=report";
			Connection connectionDB = DriverManager.getConnection(conn);
			JasperDesign jasperDesign = JRXmlLoader.load("c:\\work\\jasper\\testPrint.jrxml");
			
			JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
			
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, new HashMap(), connectionDB);
			
			JasperPrintManager.printReport(jasperPrint, true);
			
			
		} catch(Exception ex) {
		   ex.printStackTrace();	
		}
	}
	
	public static void main(String[] args) {
	  
	try {
		String conn = "jdbc:Cache://127.0.0.1:21025/DATA/?username=report&password=report";
		Connection connectionDB = DriverManager.getConnection(conn);
		JasperDesign jasperDesign = JRXmlLoader.load("c:\\work\\jasper\\testPrint.jrxml");
		
		JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, new HashMap(), connectionDB);
		
		JasperPrintManager.printReport(jasperPrint, true);
		
		
	} catch(Exception ex) {
	   ex.printStackTrace();	
	}
	}

}
