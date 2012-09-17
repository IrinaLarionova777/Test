
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.applet.*;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Rectangle;

import javax.print.DocFlavor;
import javax.print.SimpleDoc;
import javax.print.PrintServiceLookup;
import javax.print.PrintService;
import javax.print.Doc;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.attribute.HashPrintServiceAttributeSet;
import javax.print.attribute.standard.PrinterName;
import javax.print.attribute.PrintServiceAttributeSet;
//import javax.swing.SwingUtilities;
import javax.swing.BorderFactory;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.EtchedBorder;

import javax.swing.JApplet;  


public class testWriteFile extends JApplet {

    private JPanel pane = null;
    private JTextField tfOk = null;
    //private JButton butOk = null;
    
    private String resultString="";
 	
	
		 public void init() {

			try {
				//запись в файл
				//writeToFile();
				//print 
				//printBarcode();
			}  
			   catch (Exception e) {
				   System.err.println(e);
	        }
	}

		 public void start() {
				try {
					doPanel();
				}  
				   catch (Exception e) {
					   resultString = e.getLocalizedMessage(); //System.err.println(e);
		  }
		} 
		 

   byte[] getSomeAsciiChars() {
	   String str= new String("Hello");
	   byte[] strb = str.getBytes();
	   return strb;
   }

  
   public void writeToFile() throws IOException
   {
			  String barcode   = getParameter("barcode");
			  //String barcode="ggg";
		      String filename="c:\\temp\\out.txt";
		      char c1=1,c2=2;
		      byte[] bytes = getSomeAsciiChars();
		      BufferedWriter out=null;
		      try {
		    	  FileWriter fstream = new FileWriter(filename);
	    		  out = new BufferedWriter(fstream);
    		      out.write("Hello"+c1+c2+"\n");
			      out.write(barcode+"\n");
			      out.write("end");
         		  out.write(bytes.toString());
        		  out.close();
		      }
		      finally {
		    	  if (out != null) {
			             out.close();
		    	  }
		      }
			  

  }
   
   public void writeToFile2() 
   {
		try {
			writeToFile();
        } catch(Exception e) {
   	    	tfOk.setText(e.getMessage()); //System.err.println(e);
        }
			  

  }
  
   public String writeToFileWithReturn() throws IOException
   {
	    String ans="Ok";
	    try {
	    	writeToFile();

	    } catch(Exception e) {
	    	ans=e.toString();
	    	//System.err.println(e);
	    }
	   return ans;   
  }
   
   // для вызова из javascript
   public void writeToFileExternal() {
	   //String ans="ok";
	   try {
	        javax.swing.SwingUtilities.invokeAndWait(new Runnable() {
	            public void run() {
	            	try {
	            		tfOk.setText("writeToFileExternal");
	            	    writeToFile();
	            	    //tfOk.setText("writeToFileExternal");
	            	} catch (IOException e) {
	            		tfOk.setText(e.getMessage());
	            	}
	                catch (Exception e) {
            	    	tfOk.setText(e.getMessage());
            	    }
	            	
	            }
	        });
	    } catch (Exception e) {
	    	tfOk.setText(e.getMessage());
	        //ans=e.toString();  //System.err.println(e);
	    }
	  //return ans;
	}
   
   // для вызова из javascript
   public String writeToFileExternal2() {
	   String ans="ok";
	   try {
	        javax.swing.SwingUtilities.invokeAndWait(new Runnable() {
	            public void run() {
	            	    writeToFile2();
           	
	            }
	        });
	    } catch (Exception e) {
	        ans=e.toString();  //System.err.println(e);
	    }
	   return ans;
	}
   
   public String readFile() {
	     String thisLine, ret = "";
	     String fn="c:\\temp\\out.txt";
	     try {
	       FileInputStream fin =  new FileInputStream(fn);
	       BufferedReader myInput = new BufferedReader
	                      (new InputStreamReader(fin));
	       while ((thisLine = myInput.readLine()) != null) {  
	         ret += thisLine + "\n";
	       }
	     } catch (Exception e) {
	       ret = e.toString(); //"Cannot load, exception!";
	     }
	     return ret;
	   }
   
   
	public void printBarcode() //throws PrintException
	{
	try {	
		String barcode   = getParameter("barcode");
		//String barcode="ggg";
		
		  DocFlavor byteFlavor = DocFlavor.BYTE_ARRAY.AUTOSENSE; //.TEXT_PLAIN_US_ASCII; 
		  String testString="^XA^FO20,20^BY3^BCN,100,Y,N,N^FD"+barcode+"^FS^XZ";
		  Doc bytesDoc = new SimpleDoc(testString.getBytes(), byteFlavor, null);
		  
		  //DocFlavor byteFlavor = DocFlavor.CHAR_ARRAY.TEXT_PLAIN;
		  //String testString="^XA^FO20,20^BY3^BCN,100,Y,N,N^FD"+barcode+"^FS^XZ";
		  //Doc bytesDoc = new SimpleDoc(testString, byteFlavor, null);
		  
		  //String printerName="HP LaserJet 4250 PCL6";
		  String printerName="ZDesigner LP 2824 Plus (ZPL)";
		  //PrintServiceAttributeSet aset = new HashPrintServiceAttributeSet();
		  //aset.add(new PrinterName(printerName, null)); 
		  //PrintService[] services = PrintServiceLookup.lookupPrintServices(byteFlavor, aset);
		  PrintService[] services = PrintServiceLookup.lookupPrintServices(byteFlavor, null);
		 //PrintService services = PrintServiceLookup.lookupDefaultPrintService();
		  if (services.length > 0) { 
			  for (int i=0; i<services.length; i++) {
			      if (services[i].getName().equals(printerName)) {
		             DocPrintJob job = services[i].createPrintJob();
	     	         job.print(bytesDoc, null);
		          }
			  }
		  }
	} catch (Exception e) {
        System.err.println(e);
    }
}  
   
   public String getAppletInfo()
   {
	   String barcode   = getParameter("barcode");
       return "barcode="+barcode;
   }

   public void doPanel() throws Exception {
		 
		 String barcode   = getParameter("barcode");
		 
	     pane = new JPanel();
	     pane.setBounds(new Rectangle(0, 0, 500, 50));
	     pane.setLayout(null);
	     pane.setBorder(BorderFactory.createEtchedBorder(
	                    EtchedBorder.LOWERED));
	     //pane.setBackground(new Color(221, 194, 219));

	     tfOk = new JTextField();
	     tfOk.setBounds(new Rectangle(0, 0, 500, 50));
	     tfOk.setBackground(new Color(221, 194, 219));
	     tfOk.setText("test"); //"Этикетка для "); //+barcode+" напечатана");
	     //tfOk.setText(resultString);
	     //tfOk.setBounds(new Rectangle(16, 23, 206, 29));

	     //butOk = new JButton();
	     //butOk.setBounds(new Rectangle(331, 23, 80, 30));
	     //butOk.setText("Ok");
	     //butOk.setActionCommand(CLOSE);
	     //butOk.addActionListener(this);

	      pane.add(tfOk);
	     //pane.add(butOk);

	     setContentPane(pane);
	   }
	 
	  
	
   
   
}
