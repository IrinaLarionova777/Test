package isc.jodconverter;

import java.io.File;
import com.artofsolving.jodconverter.openoffice.connection.*;
import com.artofsolving.jodconverter.openoffice.converter.*;
import com.artofsolving.jodconverter.*;

public class jodconverterFacade {

	public static void main(String[] args) throws Exception {

	DocToPDF("C:/temp/testdocx4j/test2.doc","C:/temp/testdocx4j/test2.pdf");
	
	}

	public static void DocToPDF(String inputfile, String outputfile) throws Exception {
		
		// Link to OpenOffice.org, which needs to be running as a service in the background
		OpenOfficeConnection OOconnection = new SocketOpenOfficeConnection(8100);
		OOconnection.connect();

		File inFile = new File(inputfile);
		File outFile = new File(outputfile);

		// do the conversion
		DocumentConverter PDFconverter = new OpenOfficeDocumentConverter(OOconnection);
		PDFconverter.convert(inFile, outFile);

		OOconnection.disconnect();
		
	}
	
	
}

