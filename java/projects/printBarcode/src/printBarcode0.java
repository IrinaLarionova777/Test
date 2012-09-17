//package isc.barcode; 

import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;

public class printBarcode0 {

public static String print( String commandline, String printerName ) 
	{
	  String result="";
	  try {
	      // временно для отладки
		  //String commandline="^XA^FO20,20^BY3^BCN,100,Y,N,N^FD1234567890^FS^XZ";
		  
		  result="Задание НЕ отправлено на печать!";
		  DocFlavor byteFlavor = DocFlavor.BYTE_ARRAY.AUTOSENSE; //.TEXT_PLAIN_US_ASCII; 
		  Doc bytesDoc = new SimpleDoc(commandline.getBytes(), byteFlavor, null);
		  
		  // временно для отладки
		  //if ((printerName==null)||(printerName.equals(""))) { printerName="ZDesigner LP 2824 Plus (ZPL)"; }
		  
		  // если принтер не указан, то ищем принтер по умолчанию
		  if ((printerName==null)||(printerName.equals(""))) {
			  PrintService service = PrintServiceLookup.lookupDefaultPrintService();
			  if (service != null) {
				  printerName=service.getName();
 			  }
		  }
		  // 
		  if ((printerName!=null)&&(!printerName.equals(""))) {
		       PrintService[] services = PrintServiceLookup.lookupPrintServices(byteFlavor, null);
		       System.out.println(services.length);
		       if (services.length > 0) { 
			      for (int i=0; i<services.length; i++) {
			         if (services[i].getName().equals(printerName)) {
			        	 DocPrintJob job = services[i].createPrintJob();
			        	 job.print(bytesDoc, null);
        		         result="Задание отправлено на печать успешно";
	                 }
			      }
		       }
		  }
	  } 
	  catch(PrintException e) {
		  result=e.getMessage();
	  }
	  catch(Exception e) {
		  result=e.getMessage();
	  }
	  return result;
 }  

// get priners list
public static String getListPrinters() 
{
  String result="";
  char c0=0;
  try {
 	  DocFlavor byteFlavor = DocFlavor.BYTE_ARRAY.AUTOSENSE; //.TEXT_PLAIN_US_ASCII; 
      PrintService[] services = PrintServiceLookup.lookupPrintServices(byteFlavor, null);
	  if (services.length > 0) { 
		      for (int i=0; i<services.length; i++) {
		          result=result+((result.equals("")) ? "" : "*")+services[i].getName();
 		      }
	  }
  } 
  catch(Exception e) {
	  result=e.getMessage();
  }
  return result;
}  

}