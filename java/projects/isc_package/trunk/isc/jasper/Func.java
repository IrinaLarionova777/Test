package isc.jasper;

import net.sf.jasperreports.engine.JRDefaultScriptlet;

public class Func extends JRDefaultScriptlet {
	
	public static String Piece (String strIn, int piece) {
		return PieceDelimeter(strIn, piece, 0);
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
		//System.out.println("i1="+(i1+1));
	    i2 = strIn.indexOf(ch,i1+1);
		//System.out.println("i2="+i2);
		if (i2!=-1) {return strIn.substring(i1+1, i2);}
		return strIn.substring(i1+1);
	}
	
	public static String[] parsingStringOnPiece( String strIn, int codeDelimeter) {
		int i=1,i1=-1,i2;
		char ch=(char)codeDelimeter;
		while (true) { 
			i1 = strIn.indexOf(ch,i1+1);
			if (i1==-1) break;
		    i++;
		}
		String str;
		String[] pieces = new String[i];
		i=0;
		i1=-1;
		i2=0;
		while (true) { 
			i1 = strIn.indexOf(ch,i1+1);
			str="";
			if (i2==0) {  //первый кусочек 
				if (i1!=-1) { str = strIn.substring(0, i1); }
				else  {str = strIn.substring(0); }
				pieces[i]=str;
				i2=-1;
			}
			if (i1==-1) break;
			i2 = strIn.indexOf(ch,i1+1);
			str="";
			if (i2!=-1) { str = strIn.substring(i1+1, i2); }
			else  {str = strIn.substring(i1+1); }
			i++;
			pieces[i]=str;
		}
		return pieces;
	}
	
	public static String pathForJasper (String path) {
		String ret="";
		int len=path.length();
		int i=-1,ip=0;
		char ch='\\';
		if (path.indexOf(ch)==-1) return path;
		while (i<len) { 
			i = path.indexOf(ch,i+1);
			if (i==-1) break;
			ret=ret+path.substring(ip, i)+"\\";
			ip=i;
		}
		if (ip != i) ret=ret+path.substring(ip, len);
		return ret;
	}
	
	// for test
	public static void main(String[] args) {
		//System.out.println("pathForJasper="+pathForJasper("c:\\fff\\rrr"));
		String str="queryParam1";
		System.out.println("str="+str);
		System.out.println("substring="+str.substring(0,5));
		System.out.println("substring="+str.substring(5,6));
		System.out.println("str.length()="+str.length());
		System.out.println("str.substring(0, 10)="+str.substring(0, 10));
		if ((str.length() > 10) && (str.substring(0, 10).equals("queryParam"))) { System.out.println("str.substring(10)="+str.substring(10)); }
		int num=Integer.parseInt(str.substring(10));
		System.out.println("num="+num);
	}
	
}
