package isc.printLabel;

import java.awt.print.Book;
import java.awt.print.PrinterException;
//import java.awt.print.PrinterGraphics;
import java.awt.Graphics;
import java.awt.print.PageFormat;
import java.awt.print.PrinterJob;
//import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.DocFlavor;

import java.awt.Component;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Color;
import java.awt.print.Printable;
//import java.awt.image.BufferedImage;
//import javax.imageio.ImageIO;
//import javax.print.DocFlavor;
//import javax.print.DocPrintJob;
//import javax.print.PrintService;
//import javax.print.PrintServiceLookup;

//import java.io.FileInputStream;
//import java.awt.image.ImageObserver;
//import java.awt.Toolkit;

import com.itextpdf.text.pdf.Barcode128;

// Класс для печати этикетки на Leika IPS
public class printLabelLeikaIPS extends Component implements Printable { 

     static final long serialVersionUID = 42L;
	 public String barcode;
	 public String string1;
	 public String string2;

	 
public int print(Graphics g, PageFormat pf, int page) throws PrinterException {

     if (page > 0) { /* We have only one page, and 'page' is zero-based */
     return NO_SUCH_PAGE;
     }

     /* User (0,0) is typically outside the imageable area, so we must
     * translate by the X and Y values in the PageFormat to avoid clipping
     */
      Graphics2D g2d = (Graphics2D)g;
      g2d.translate(pf.getImageableX(), pf.getImageableY());

      int barcodeHeight=30;
      int leftMargin=10;
      int width=120;
      int y,ydelta;
      ydelta=20;
    		  
     Barcode128 code = new Barcode128();
     code.setCode(this.barcode);
     //code.setX(1);
     code.setBarHeight(barcodeHeight);
     y=1;
     Image imgBarcode=code.createAwtImage(Color.black, Color.white);
     //Image imgBarcode=code.createAwtImage(new Color(255,255,255), new Color(0,0,0));
     g.drawImage(imgBarcode,leftMargin,y,width,barcodeHeight,this);
     y=y+barcodeHeight+10;
     g.drawString(this.barcode, leftMargin, y);
     y=y+ydelta;
     g.drawString(this.string1, leftMargin, y);
     y=y+ydelta;
     g.drawString(this.string2, leftMargin, y);
     
     /* tell the caller that this page is part of the printed document */
     return PAGE_EXISTS;
}

public static void printLabel2(String printerName, String barcode, String subscript1, String subscript2 ) throws Exception {
	printLabelLeikaIPS o=new printLabelLeikaIPS();
	o.string1=subscript1;
	o.string2=subscript2;
	o.barcode=barcode;
	PrinterJob job = PrinterJob.getPrinterJob();
	job.setPrintable(o);
	
    if ((printerName!=null)&&(!printerName.equals(""))) {
	       PrintService[] services = PrintServiceLookup.lookupPrintServices(DocFlavor.BYTE_ARRAY.AUTOSENSE, null); //.BYTE_ARRAY.AUTOSENSE, null);
	       //System.out.println(services.length);
	       if (services.length > 0) { 
		      for (int i=0; i<services.length; i++) {
		         if (services[i].getName().equals(printerName)) {
		        	 job.setPrintService(services[i]);
		        	 job.print();
               }
		      }
	       }
	  }
 
}


public static void printLabel(String printerName, String barcode, String subscript1, String subscript2, Integer qCopies ) throws Exception {
	printLabelLeikaIPS o=new printLabelLeikaIPS();
	o.string1=subscript1;
	o.string2=subscript2;
	o.barcode=barcode;
	
	// кол-во копий для печати
	/*
	int qcopies=1;
	if ((qCopies!=null)&&(!qCopies.equals(""))) {
		qcopies=Integer.parseInt(qCopies);
	}
	if (qcopies<1) { qcopies=1; }
    */
	if ((qCopies==null)||(qCopies<1)) { qCopies=1; }
	
	 //--- Create a new PrinterJob object
    PrinterJob job = PrinterJob.getPrinterJob();

    //--- Create a new book to add pages to
    Book book = new Book();

	    //--- Add the document page using a landscape page format
    PageFormat documentPageFormat = new PageFormat();
    //documentPageFormat.setOrientation(PageFormat.LANDSCAPE);
    book.append(o, documentPageFormat);

    //--- Tell the printJob to use the book as the pageable object
    job.setPageable(book);
	
    if ((printerName!=null)&&(!printerName.equals(""))) {
	       PrintService[] services = PrintServiceLookup.lookupPrintServices(DocFlavor.BYTE_ARRAY.AUTOSENSE, null); //.BYTE_ARRAY.AUTOSENSE, null);
	       //System.out.println(services.length);
	       if (services.length > 0) { 
		      for (int i=0; i<services.length; i++) {
		         if (services[i].getName().equals(printerName)) {
		        	 job.setPrintService(services[i]);
		        	 for (int j=0; j<qCopies; j++) {
		        		 job.print(); 
		        	 }
               }
		      }
	       }
	  }
 
}

public static void main(String[] args) throws Exception {
	//printLabel("HP LaserJet 4250 PCL6","12345678", "Фамилия Имя Отчество", "еще что-то " ); 
	//printLabel("ZDesigner LP 2824 Plus (ZPL)","12345678", "Фамилия Имя Отчество", "еще что-то " );
	printLabel("HP LaserJet 4250 PCL6","12345678", "Фамилия Имя Отчество", "еще что-то ", 1 );
	
}

}
