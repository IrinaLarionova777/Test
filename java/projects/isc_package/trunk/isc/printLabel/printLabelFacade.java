package isc.printLabel;

public class printLabelFacade {

	public static void LeikaIPS(String printerName, String barcode, String subscript1, String subscript2, Integer qCopies) throws Exception {
		if ((qCopies==null)||(qCopies<1)) { qCopies=1; }
		LeikaIPSinternal(printerName, barcode, subscript1, subscript2, qCopies);
		
	}
	
	private static void LeikaIPSinternal(String printerName, String barcode, String subscript1, String subscript2, Integer qCopies ) throws Exception {
		printLabelLeikaIPS.printLabel(printerName, barcode, subscript1, subscript2, qCopies);
		
	}
	
}
