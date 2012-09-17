
import java.io.IOException;
import java.util.Scanner;
import java.io.FileInputStream;
import java.io.File;
import java.util.Properties;


public class printBarcodeEMC {


	public static void main(String[] args) {
		
		try {
		   //if (args.length==0) return;
		   // строка с данными : номер эпизода_delimeter_‘»ќ_delimeter_ƒата рождени€ (печатаемый вид)_delimeter_Doctor_delimeter_ƒата вз€ти€ материала (печатаемый вид)
		   String data=args[0];
		   System.out.println(data);
		
		   // read ini-file
		   String curDir = System.getProperty("user.dir");
		   Properties stringsIni=readIniFile(curDir+"\\printBarcode.ini");
		   // delimeter in data
		   String delimeter="^";
		   if (stringsIni.containsKey("delimeter")) {
			   delimeter=stringsIni.getProperty("delimeter");
		   }
		   // printer name
		   String printername=null;
		   if (stringsIni.containsKey("printername")) {
			   printername=stringsIni.getProperty("printername");
		   }
		   // command string
		   String commandstring=getCommandStringZPL(data,delimeter);
		   System.out.println("commandstring="+commandstring);
		   System.out.println("printername="+printername);
		   String result=printBarcode0.print(commandstring, printername );
		   System.out.println("result="+result);
		   
		}
		catch (Exception e) {
		   System.out.println(e.getMessage());
		}
		

	}
	
	// ini file: property=value
	private static Properties readIniFile(String fileName) throws IOException {
	
	      Properties p = new Properties();
	      if ((fileName!=null)&&(new File(fileName).canRead())) {
	          p.load(new FileInputStream(fileName));
	      }
	      return p;
	}
	
	private static String getCommandStringZPL(String data,String delimeter) {
		String commandString="^XA";
		//commandString=commandString+"~JP";
		commandString=commandString+"^CF0,25,17";
		char delim = delimeter.charAt(0);
		String fio=PieceDelimeter(data,2,delim);
		// fio
		if (!fio.equals("")) { 
			commandString=commandString+"^FO70,10";
			//commandString=commandString+"^AO,7,7";
			commandString=commandString+"^FD"+fio+"^FS";
		}
		// date of birhday
		String dateBirth=PieceDelimeter(data,3,delim);
		if (!dateBirth.equals("")) { 
			commandString=commandString+"^FO250,10";
			commandString=commandString+"^FD"+dateBirth+"^FS";
		}
		// num episode
		String episode=PieceDelimeter(data,1,delim);
		if (!episode.equals("")) { 
			commandString=commandString+"^FO70,50";
			commandString=commandString+"^BY2";
			commandString=commandString+"^BCN,80,Y,N,N";
			commandString=commandString+"^FD>;"+episode+"^FS"; //mode C
			//commandString=commandString+"^FD"+episode+"^FS";
		}
		// doctor name
		String doctor=PieceDelimeter(data,4,delim);
		if (!doctor.equals("")) { 
			commandString=commandString+"^FO70,150";
			commandString=commandString+"^FD"+doctor+"^FS";
		}
		// date of material
		String dateGet=PieceDelimeter(data,5,delim);
				if (!dateGet.equals("")) { 
					commandString=commandString+"^FO250,150";
					commandString=commandString+"^FD"+dateGet+"^FS";
				}
		commandString=commandString+"^XZ";
		return commandString;
	}
	
	private static String getCommandStringEPL(String data,String delimeter) {
		char lf=(char)10;
		String font="2";
		String x1="20",x2="220";
		String commandString=""+lf;
		commandString=commandString+"N"+lf;
		commandString=commandString+"FK\"*\""+lf; // delete all forms from memory
		commandString=commandString+"FK\"LABEL1\""+lf; // delete form "LABEL1" from memory
		commandString=commandString+"FS\"LABEL1\""+lf; // begins form "LABEL1" store sequence
		
		commandString=commandString+"D7"+lf; // select the print density (0-15)
		commandString=commandString+"S3"+lf; //select the print speed
		commandString=commandString+"Q200,16"+lf; //Qp1,p2,[±p3] p1 = Label length measured in dots, p2 = Gap length or thickness of black line, p3 = Offset length measured in dots
		commandString=commandString+"q376"+lf; //qp1 set the width of the printable area of the media, p1 = The width of the label measured in dots

		char delim = delimeter.charAt(0);
		String fio=PieceDelimeter(data,2,delim);
		// fio
		 //Ap1,p2,p3,p4,p5,p6,p7,ФDATAФ
		 //p1 = Horizontal start position
		 //p2 = Vertical start position
		 //p3 = Rotation 
		 //p4 = Font selection
		 //p5 = Horizontal multiplier
		 //p6 = Vertical multiplier
		 //p7 = Reverse image
		 // DATA = Fixed data field
		if (!fio.equals("")) { 
			commandString=commandString+"A"+x1+",10,0,"+font+",1,1,N,\""+fio+"\""+lf;
		}
		// date of birhday
		String dateBirth=PieceDelimeter(data,3,delim);
		if (!dateBirth.equals("")) { 
			commandString=commandString+"A"+x2+",10,0,"+font+",1,1,N,\""+dateBirth+"\""+lf;
		}
		// num episode
		 //Bp1,p2,p3,p4,p5,p6,p7,p8,ФDATAФ
		 //p1 = Horizontal start position
		 //p2 = Vertical start position
		 //p3 = Rotation Accepted Values:(0 = normal (no rotation) 1 = 90 degrees 2 = 180 degrees 3 = 270 degrees)
		 //p4 = Bar Code selection.
		 //p5 = Narrow bar width
		 //p6 = Wide bar width
		 //p7 = Bar code height
		 //p8 = Print human readable code
		 // DATA = Fixed data field
		String episode=PieceDelimeter(data,1,delim);
		if (!episode.equals("")) { 
			commandString=commandString+"B"+x1+",30,0,1,2,6,70,B,\""+episode+"\""+lf; //print standard bar codes.
		}
		// doctor name
		String doctor=PieceDelimeter(data,4,delim);
		if (!doctor.equals("")) { 
			//commandString=commandString+"A30,100,0,a,1,1,N,\""+doctor+"\""+lf;
			commandString=commandString+"A"+x1+",140,0,"+font+",1,1,N,\""+doctor+"\""+lf;
			
		}
		// date of material
		String dateGet=PieceDelimeter(data,5,delim);
		if (!dateGet.equals("")) { 
			commandString=commandString+"A"+x2+",140,0,"+font+",1,1,N,\""+dateGet+"\""+lf;
		}
				
		commandString=commandString+"FE"+lf; //end a form store sequence		
		commandString=commandString+"FR\"LABEL1\""+lf; //retrieve a form that was previoiusly stored in memory
		 //Pp1,[p2]
		 //p1 = Number of label sets
		 //p2 = Number of copies of each labael
		commandString=commandString+"P1"+lf; //print the contents of the image buffer
		commandString=commandString+lf;
		return commandString;
	}
	
	public static String PieceDelimeter (String strIn, int piece, int codeDelimeter) {
		if (piece<1) return strIn;
		int i=1,i1=-1,i2;
		char ch=(char)codeDelimeter;
		while (i<piece) { 
			i1 = strIn.indexOf(ch,i1+1);
			if (i1==-1) break;
			i++; 
		}
		if ((i1==-1)&(i<piece)) {return "";}
	    i2 = strIn.indexOf(ch,i1+1);
		if (i2!=-1) {return strIn.substring(i1+1, i2);}
		return strIn.substring(i1+1);
	}


}
