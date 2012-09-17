package isc.jasper;

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
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;

import net.sf.jasperreports.engine.export.oasis.JROdtExporter;

import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.HashPrintServiceAttributeSet;
import javax.print.attribute.PrintServiceAttributeSet;
import net.sf.jasperreports.engine.export.JRPrintServiceExporter;
import net.sf.jasperreports.engine.export.JRPrintServiceExporterParameter;
import javax.print.attribute.standard.MediaSizeName;

public class JasperFacadeTest {
  public static void main(String[] args) throws Throwable
  {
    //System.out.println(execute("jdbc:Cache://127.0.0.1:1972/ENSEMBLE/?username=_SYSTEM&password=SYS", "C:/WORK/java/test.jasper", "pdf", null).length);
  }
  
  public static byte[] execute(String connString, String fileName, String repFormat, Map params) throws IOException, JRException, SQLException
  {
    JasperPrint jp = executeInternal(connString, fileName, params);
    ByteArrayOutputStream out = new ByteArrayOutputStream();
    prepareExporter(jp, out, repFormat).exportReport();
    return out.toByteArray();
  }
  
  public static void executeAndSave(String connString, String fileName, String repFormat, Map params, String targetFileName) throws IOException, JRException, SQLException
  {
	  JasperPrint jp = executeInternal(connString, fileName, params);

      OutputStream out = new FileOutputStream(targetFileName);
      try
      {
        prepareExporter(jp, out, repFormat).exportReport();
      }
      finally
      {
        out.close();
      }
  }
  
  public static void save(JasperPrint jp, String repFormat, String targetFileName) throws IOException, JRException, SQLException
  {
    OutputStream out = new FileOutputStream(targetFileName);
    try
    {
      prepareExporter(jp, out, repFormat).exportReport();
    }
    finally
    {
      out.close();
    }
  }

  private static JasperPrint executeInternal(String connString, String fileName, Map params) throws JRException, SQLException
  {
    JasperReport rep = (JasperReport)JRLoader.loadObject(new File(fileName));
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
  
  public static JRExporter prepareExporter(JasperPrint jp, OutputStream out, String reportFormat)
  {
    JRExporter exporter = getExporter(reportFormat);
    
    exporter.setParameter(JRExporterParameter.JASPER_PRINT, jp);
    exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);

    return exporter;
  }
  
  public static JRExporter getExporter(String reportFormat)
  {
    JRExporter exporter = null;
    
    if (reportFormat.equals("xml"))
    {
      exporter = new JRXmlExporter();
      exporter.setParameter(JRXmlExporterParameter.IS_EMBEDDING_IMAGES, Boolean.TRUE);
    }
    else if (reportFormat.equals("html"))
    {
      exporter = new JRHtmlExporter();
    }
    else if (reportFormat.equals("xls"))
    {
      exporter = new JRXlsExporter();
      //exporter = new JExcelApiExporter();
      exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);
      exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.FALSE);
      exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
      exporter.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.FALSE);
      exporter.setParameter(JRXlsExporterParameter.IGNORE_PAGE_MARGINS,Boolean.TRUE);
      exporter.setParameter(JRXlsExporterParameter.IS_FONT_SIZE_FIX_ENABLED,Boolean.TRUE);
      exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_COLUMNS,Boolean.FALSE);
      //exporter.setParameter(JRXlsExporterParameter.IS_COLLAPSE_ROW_SPAN,Boolean.TRUE);
   /*
          <property name="net.sf.jasperreports.export.xls.exclude.origin.band.1" value="pageHeader"/>
  	<property name="net.sf.jasperreports.export.xls.exclude.origin.band.2" value="pageFooter"/>
  	<property name="net.sf.jasperreports.export.xls.exclude.origin.keep.first.band.2" value="columnHeader"/>
  	<property name="net.sf.jasperreports.export.xls.remove.empty.space.between.rows" value="true"/>
  	<property name="net.sf.jasperreports.export.xls.remove.empty.space.between.columns" value="true"/>
  	 */
    }
    else if (reportFormat.equals("pdf"))
    {
      exporter = new JRPdfExporter();
    }
    else if (reportFormat.equals("odt"))
    {
      exporter = new JROdtExporter();
    }
    else if (reportFormat.equals("docx"))
    {
      exporter = new JRDocxExporter();
    }
    else if (reportFormat.equals("xlsx"))
    {
      exporter = new JRXlsxExporter();
    }
    else if (reportFormat.equals("rtf"))
    {
       exporter = new JRRtfExporter();
    }
    else if (reportFormat.equals("print")) {
	   PrintRequestAttributeSet printRequestAttributeSet = new HashPrintRequestAttributeSet();
	   printRequestAttributeSet.add(MediaSizeName.ISO_A4);

	   PrintServiceAttributeSet printServiceAttributeSet = new HashPrintServiceAttributeSet();
	
	   exporter = new JRPrintServiceExporter();
	
	   exporter.setParameter(JRPrintServiceExporterParameter.PRINT_REQUEST_ATTRIBUTE_SET, printRequestAttributeSet);
	   exporter.setParameter(JRPrintServiceExporterParameter.PRINT_SERVICE_ATTRIBUTE_SET, printServiceAttributeSet);
	   exporter.setParameter(JRPrintServiceExporterParameter.DISPLAY_PAGE_DIALOG, Boolean.FALSE);
	   exporter.setParameter(JRPrintServiceExporterParameter.DISPLAY_PRINT_DIALOG, Boolean.TRUE);
	   
    }
   
    return exporter;
  }
  
}

