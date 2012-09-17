package isc.pdfbox;

import java.awt.print.PrinterJob;
import javax.print.PrintService;
import org.apache.pdfbox.pdmodel.PDDocument;
import java.io.File;
import org.apache.pdfbox.util.PDFMergerUtility;
import org.apache.pdfbox.pdmodel.PDPage;

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
    	//mergeThreePDFfiles2("C:/temp/testdocx4j/testHead.pdf","C:/temp/testdocx4j/testBody.pdf","C:/temp/testdocx4j/testFooter.pdf","C:/temp/testdocx4j/testMerge.pdf");
    	
    	System.out.println(listPrinters());
		
		printSilent("C:\\temp\\test\\10023161_M200_2o.pdf ", "HP LaserJet 4250 PCL6");
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
	
	protected static void mergeThreePDFfiles(String fileHeader, String fileBody, String fileFooter, String fileDestination) throws Exception
	{
		PDFMergerUtility mergePdf = new PDFMergerUtility();
		
		if (new java.io.File(fileHeader).exists()) {
			mergePdf.addSource(fileHeader);
		}
		if (new java.io.File(fileBody).exists()) {
		    mergePdf.addSource(fileBody);
		}
		if (new java.io.File(fileFooter).exists()) {
		    mergePdf.addSource(fileFooter);
		}
		mergePdf.setDestinationFileName(fileDestination);
		mergePdf.mergeDocuments();
	}
	
	protected static void mergeThreePDFfiles2(String fileHeader, String fileBody, String fileFooter, String fileDestination) throws Exception
	{
		PDFMergerUtility mergePdf = new PDFMergerUtility();
 
		PDDocument fileRes = new PDDocument();
		//fileRes.load(fileHeader);
		PDPage page=new PDPage();
		fileRes.addPage(new PDPage());
		
		PDDocument fileH = new PDDocument();
		fileH.load(fileHeader);
		
		PDDocument fileB = new PDDocument();
		fileB.load(fileBody);
		
		PDDocument fileF = new PDDocument();
		fileF.load(fileFooter);
		
		//mergePdf.appendDocument(fileRes, fileH);
		
		//mergePdf.appendDocument(fileRes, fileB);
		
		//mergePdf.appendDocument(fileRes, fileF);
		
		fileRes.save(fileDestination);
		
		fileRes.close();
		
		//fileH.close();
		fileB.close();
		fileF.close();
		
	}
}