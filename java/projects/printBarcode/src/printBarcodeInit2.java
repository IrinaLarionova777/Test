

import java.applet.Applet;
import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.PrintException;


// Выриант апплета с печатью во время загрузки апплета и с выводом строки-результата в статусбар
public class printBarcodeInit2 extends Applet  {

 public void init() {
		try {
			this.showStatus(printBarcode());
		}  
		   catch (Exception e) {
			   this.showStatus(e.getMessage()); 
  }
}
	
 public String printBarcode() throws PrintException
	{
	    String commandline   = getParameter("barcode");
	    String printerName = getParameter("printerName");
	    return printBarcode0.print(commandline,printerName);
 }  

   
}
