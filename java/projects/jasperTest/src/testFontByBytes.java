import java.io.InputStream;
import java.io.FileInputStream;
import java.io.File;
import java.io.IOException;


public class testFontByBytes {

	// Returns the contents of the file in a byte array.
	public static byte[] getBytesFromFile(File file) throws IOException {
	    InputStream is = new FileInputStream(file);

	    // Get the size of the file
	    long length = file.length();

	    // You cannot create an array using a long type.
	    // It needs to be an int type.
	    // Before converting to an int type, check
	    // to ensure that file is not larger than Integer.MAX_VALUE.
	    if (length > Integer.MAX_VALUE) {
	        // File is too large
	    }

	    // Create the byte array to hold the data
	    byte[] bytes = new byte[(int)length];

	    // Read in the bytes
	    int offset = 0;
	    int numRead = 0;
	    while (offset < bytes.length
	           && (numRead=is.read(bytes, offset, bytes.length-offset)) >= 0) {
	        offset += numRead;
	    }

	    // Ensure all the bytes have been read in
	    if (offset < bytes.length) {
	        throw new IOException("Could not completely read file "+file.getName());
	    }

	    // Close the input stream and return bytes
	    is.close();
	    return bytes;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
     File file = new File("C:\\work\\vr\\times.ttf");
     byte[] bytes;
     try {
    	 bytes = getBytesFromFile(file);
    	 int i=0;
    	 byte bb;
    	 String s;
    	 char cc;
    	 s="\u2192\u0050";
    	 System.out.println("cc="+s);
    	 //for (int j=300;j<400;j++) {
    //		 System.out.println(" Character.forDigit("+j+",10)="+Character.forDigit(j,8)); 
    	// }
    	 
    	 /*
    	 while (i<bytes.length) {
    		 bb=bytes[i];
    		 s=Byte.toString(bb);
    		 cc = Character.forDigit(24,10);
    		 System.out.println("bb="+bb+" Character.forDigit(24,10)="+Character.forDigit(24,10));
    		 i++;
    	 }*/
     } catch(Exception ex) {
    	 ex.printStackTrace();
     }
     
	}

}
