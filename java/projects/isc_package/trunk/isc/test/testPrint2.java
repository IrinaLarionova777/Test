package isc.test;

	import java.awt.BasicStroke;
	import java.awt.Color;
	import java.awt.Component;
	import java.awt.Font;
	import java.awt.FontMetrics;
	import java.awt.Graphics;
	import java.awt.Graphics2D;
	import java.awt.Image;
	import java.awt.MediaTracker;
	import java.awt.Toolkit;
	import java.awt.geom.Rectangle2D;
	import java.awt.print.Book;
	import java.awt.print.PageFormat;
	import java.awt.print.Printable;
	import java.awt.print.PrinterJob;
	import java.net.MalformedURLException;
	import java.net.URL;

	public class testPrint2 {
	  public static void main(String[] args) {

		  testPrint2 example = new testPrint2();
	    System.exit(0);
	  }

	  //--- Private instances declarations
	  private final static int POINTS_PER_INCH = 72;

	  /**
	   * Constructor: Example6
	   * <p>
	   *  
	   */
	  public testPrint2() {

	    //--- Create a new PrinterJob object
	    PrinterJob printJob = PrinterJob.getPrinterJob();

	    //--- Create a new book to add pages to
	    Book book = new Book();

		    //--- Add the document page using a landscape page format
	    PageFormat documentPageFormat = new PageFormat();
	    //documentPageFormat.setOrientation(PageFormat.LANDSCAPE);
	    book.append(new testPrint(), documentPageFormat);

	    //--- Tell the printJob to use the book as the pageable object
	    printJob.setPageable(book);

	    //--- Show the print dialog box. If the user click the
	    //--- print button we then proceed to print else we cancel
	    //--- the process.
	    if (printJob.printDialog()) {
	      try {
	        printJob.print();
	      } catch (Exception PrintException) {
	        PrintException.printStackTrace();
	      }
	    }
	  }

}
