import java.awt.Color;
import java.awt.Rectangle;
import javax.swing.JApplet;  
import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.JTextPane;
import javax.swing.border.EtchedBorder;

//Выриант апплета с печатью во время загрузки апплета и с выводом строки-результата в окно апплета
// В html-страничке пытаюсь закрыть окно по флагу flagCloseWindow или по таймеру 
public class printBarcodeInit extends JApplet  {

         private JPanel pane = null;
	     private JTextField tfOk = null;
	     private String resultString="";
	     public Boolean flagCloseWindow=false;
	     
	
 public void init() {
			try {
				flagCloseWindow=false;
				resultString=printBarcode();
			}  
			catch (Exception e) {
				resultString = e.getMessage();
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
	
 public String printBarcode() 
	{
	    String commandline   = getParameter("barcode");
	    String printerName = getParameter("printerName");
	    return printBarcode0.print(commandline,printerName);
 }  

 
 public void doPanel() throws Exception {
	 
	 String barcode   = getParameter("barcode");
	 
     pane = new JPanel();
     pane.setBounds(new Rectangle(0, 0, 500, 50));
     pane.setLayout(null);
     pane.setBorder(BorderFactory.createEtchedBorder(EtchedBorder.LOWERED));
 
     tfOk = new JTextField();
     tfOk.setBounds(new Rectangle(0, 0, 500, 50));
     tfOk.setBackground(new Color(221, 194, 219));
     tfOk.setText(resultString); 
  
      pane.add(tfOk);
 
     setContentPane(pane);
   }
 
  
}
