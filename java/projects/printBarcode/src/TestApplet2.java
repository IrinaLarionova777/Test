    // TestApplet.java
    import java.io.*;
    import java.awt.*;
    import java.awt.event.*;
    import java.applet.*;
    import javax.swing.*;
import javax.swing.border.*;

    public class TestApplet2 extends JApplet
      implements ActionListener {
   private JPanel pane = null;
     private JScrollPane scrolling = null;
     private JTextPane fileBox = null;
     private JTextField tfFilename = null;
     private JButton butLoad = null;
     private JButton butWrite = null;
     private final String LOAD = "load";
     private final String WRITE = "write";

   public void init() {
   try {
       jbInit();
     } catch(Exception e) {
       e.printStackTrace();
     }
   }

   // method which will read data from file, and return it in
      // String
   public String readFile(String fn) {
     String thisLine, ret = "";
     try {
       FileInputStream fin =  new FileInputStream(fn);
       BufferedReader myInput = new BufferedReader
                      (new InputStreamReader(fin));
       while ((thisLine = myInput.readLine()) != null) {  
         ret += thisLine + "\n";
       }
     } catch (Exception e) {
       ret = "Cannot load, exception!";
     }
     return ret;
   }

   private void jbInit() throws Exception {
     pane = new JPanel();
     pane.setBounds(new Rectangle(0, 0, 500, 325));
     pane.setLayout(null);
     pane.setBorder(BorderFactory.createEtchedBorder(
                    EtchedBorder.LOWERED));
     pane.setBackground(new Color(221, 194, 219));

     fileBox = new JTextPane();
     fileBox.setText("");
     fileBox.setEditable(false);
     scrolling = new JScrollPane(fileBox);
     scrolling.setBounds(new Rectangle(16, 65, 295, 225));

     tfFilename = new JTextField();
     tfFilename.setText("");
     tfFilename.setBounds(new Rectangle(16, 23, 206, 29));

     butLoad = new JButton();
     butLoad.setBounds(new Rectangle(331, 23, 80, 30));
     butLoad.setText("Load");
     butLoad.setActionCommand(LOAD);
     butLoad.addActionListener(this);

     butWrite = new JButton();
     butWrite.setBounds(new Rectangle(231, 23, 80, 30));
     butWrite.setText("Write");
     butWrite.setActionCommand(WRITE);
     butWrite.addActionListener(this);
     
     pane.add(scrolling);
     pane.add(tfFilename);
     pane.add(butLoad);
     pane.add(butWrite);


     setContentPane(pane);
   }

   public void actionPerformed(ActionEvent e) {
     if (e.getActionCommand().equals(LOAD)) {
         fileBox.setText(readFile(tfFilename.getText()));
   }
     if (e.getActionCommand().equals(WRITE)) {
    	 writeToFile2();
   }
  }
   
   public void writeToFile() throws IOException
   {
			  //String barcode   = getParameter("barcode");
			  String barcode="ggg";
		      String filename="c:\\temp\\out.txt";
		      BufferedWriter out=null;
		      try {
		    	  FileWriter fstream = new FileWriter(filename);
	    		  out = new BufferedWriter(fstream);
    		      out.write("Hello"+"\n");
			      out.write(barcode+"\n");
			      out.write("end");
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
   	    	System.err.println(e);
        }
			  

  } 
 }
