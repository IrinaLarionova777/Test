package isc.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStreamReader;

public class processUtils {

	public static void main(String[] args) throws Exception {

	boolean result = processUtils.isRunning("notepad.exe");

	if (result == false) {
		//String command="cmd /c start "+System.getenv("windir") +"\\system32\\"+"notepad.exe";
		String command=System.getenv("windir") +"\\system32\\"+"notepad.exe";
		//System.out.println(command);
		executeProcess(command);
		
	}
    //msgBox("Is notepad running ?  " + (result ? " Yes" : "No"));
	
	}

	  public static boolean isRunning(String process) {
	    boolean found = false;
	    try {
	        File file = File.createTempFile("realhowto",".vbs");
	        file.deleteOnExit();
	        FileWriter fw = new java.io.FileWriter(file);

	        String vbs = "Set WshShell = WScript.CreateObject(\"WScript.Shell\")\n"
	                   + "Set locator = CreateObject(\"WbemScripting.SWbemLocator\")\n"
	                   + "Set service = locator.ConnectServer()\n"
	                   + "Set processes = service.ExecQuery _\n"
	                   + " (\"select * from Win32_Process where name='" + process +"'\")\n"
	                   + "For Each process in processes\n"
	                   + "wscript.echo process.Name \n"
	                   + "Next\n"
	                   + "Set WSHShell = Nothing\n";

	        fw.write(vbs);
	        fw.close();
	        Process p = Runtime.getRuntime().exec("cscript //NoLogo " + file.getPath());  // visible console
	        //Process p = Runtime.getRuntime().exec("wscript //NoLogo " + file.getPath()); // no visible console
	        BufferedReader input =
	            new BufferedReader
	              (new InputStreamReader(p.getInputStream()));
	        String line;
	        line = input.readLine();
	        if (line != null) {
	            if (line.equals(process)) {
	              found = true;
	            }
	        }
	        input.close();

	    }
	    catch(Exception e){
	        e.printStackTrace();
	    }
	    return found;
	  }

	  public static void executeProcess( String command ) throws Exception {
		  //String line;
		  //System.out.println(command);
		  if ((command != null)&&(!command.equals(""))) {
		        Process p = Runtime.getRuntime().exec(command);
		        /*
		        BufferedReader bri = new BufferedReader(new InputStreamReader(p.getInputStream()));
		        System.out.println("a");
		        while ((line = bri.readLine()) != null) {
		                System.out.println(line);
		        }
		        bri.close();
		       
		        System.out.println("B");
		        BufferedReader bre = new BufferedReader(new InputStreamReader(p.getErrorStream()));
		        while ((line = bre.readLine()) != null) {
		                System.out.println(line);
		        }
		        bre.close();
		        */
		        //p.waitFor();
		  }
		}
	  
	  
	  public static void msgBox(String msg) {
	    javax.swing.JOptionPane.showConfirmDialog((java.awt.Component)
	       null, msg, "processUtils", javax.swing.JOptionPane.DEFAULT_OPTION);
	  }
	
	
}

