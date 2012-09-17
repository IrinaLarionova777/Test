import java.applet.Applet;
import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.PrintException;

//Выриант апплета с печатью при вызове метода print с возвращением строки-результата 
public class printBarcode extends Applet  {

	/*
	public void start() {
		String ans=print();
	}
 */
 public String print( String commandline, String printerName ) {
		return printBarcode0.print(commandline,printerName);
 }
	
 public String getListPrinters() {
		return printBarcode0.getListPrinters();
}
 
}
