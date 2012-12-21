package isc.pdfbox;

import java.awt.print.PrinterJob;
import javax.print.PrintService;
import org.apache.pdfbox.pdmodel.PDDocument;
import java.io.File;

public class PdfboxFacade
{
	public static String listPrinters()
	{
       PrintService[] printService = PrinterJob.lookupPrintServices();
	   StringBuffer sb = new StringBuffer();
       for(int i = 0; i < printService.length; i++)
       {
         sb.append(printService[i].getName() + System.getProperty("line.separator"));
       }
	   
	   return sb.toString();
	}
	
    public static void main( String[] args ) throws Exception
    {
		System.out.println(listPrinters());
		
		printSilent("C:\\WORK\\pdfbox\\test.pdf", "HP LaserJet 4250 PCL6");
	}

	public static void printSilent(String pdfFile, String printerName) throws Exception
	{
	  printInternal(pdfFile, printerName, true);
	}

	public static void print(String pdfFile, String printerName) throws Exception
	{
	  printInternal(pdfFile, printerName, false);
	}

	protected static void printInternal(String pdfFile, String printerName, boolean silentPrint) throws Exception
	{
        PDDocument document = null;
        try
        {
            document = PDDocument.load( pdfFile );

            PrinterJob printJob = PrinterJob.getPrinterJob();
            printJob.setJobName(new File(pdfFile).getName());

            if (printerName == null) throw new IllegalArgumentException("Null printer name");

			PrintService[] printService = PrinterJob.lookupPrintServices();
			boolean printerFound = false;
			for(int i = 0; !printerFound && i < printService.length; i++)
			{
				if(printService[i].getName().indexOf(printerName) != -1)
				{
					printJob.setPrintService(printService[i]);
					printerFound = true;
				}
			}
			
			if (!printerFound) throw new RuntimeException("Printer not found: " + printerName);

            if( silentPrint )
            {
                document.silentPrint( printJob );
            }
            else
            {
                document.print( printJob );
            }
        }
        finally
        {
            if( document != null )
            {
                document.close();
            }
        }
    }
}