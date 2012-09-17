
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.IOException;

public class testWriteFile {

	
	public static void writeFile(String filename) throws IOException {
			  // Create file 
			  FileWriter fstream = new FileWriter(filename);
			  BufferedWriter out = new BufferedWriter(fstream);
			  char c1=1,c2=2;
			  out.write("Hello"+c1+c2);
			  //Close the output stream
			  out.close();
	}
	
	public static void main(String[] args) {
		try
		{
			writeFile("c:\\temp\\out.txt");
		}
		catch (Exception e){
			  System.err.println("Error: " + e.getMessage());
		}
	   

	}
	

}
