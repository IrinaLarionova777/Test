package isc.jasper;

import java.sql.Statement;
import java.util.HashMap;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import com.intersys.objects.CacheDatabase;
import com.intersys.objects.Database;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRTableModelDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.view.JRViewer;


public class TestQuery {
	
	public static void main(String[] args) {
		Database connectionDB = null;
	    try {
		     String connString="jdbc:Cache://127.0.0.1:56773/DATA";
		     connectionDB = CacheDatabase.getDatabase(connString, "_SYSTEM", "SYS");
		} catch (Exception ex) {
	    	ex.printStackTrace();
	    }
		try {
				
			Statement stmt;
			java.sql.ResultSet rs;
			
	    	stmt = connectionDB.createStatement();
	    	String arg="aaaa";
	    	rs = stmt.executeQuery("call Report.testQuery_qq('"+arg+"')");
	    	
	    	System.out.println("rs="+rs);
	    	int columnsCount=rs.getMetaData().getColumnCount();
	    	System.out.println("rs.getMetaData().getColumnCount()="+columnsCount);
	    	for (int i=0;i<columnsCount;i++) {
	    	     	System.out.println(rs.getMetaData().getColumnName(i+1));
	    	}
			connectionDB.close();
	    }
	   	catch (Exception ex) {
		        ex.printStackTrace();
		}
	}
	
}
