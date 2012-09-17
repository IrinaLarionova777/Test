package isc.WordToPDF;

import isc.jasper.Func;
import isc.utils.processUtils;

import java.io.File;
import java.io.FileOutputStream;
//import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.itextpdf.text.Document;
//import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
//import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;
//import com.itextpdf.text.Chunk;
//import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Font;
import com.itextpdf.text.pdf.BaseFont;
//import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.ColumnText;

// JOD Converter
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
//import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeException;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;
import com.artofsolving.jodconverter.DocumentConverter;

public class CreatePDFfromWordEMC {
	
static com.itextpdf.text.pdf.PdfContentByte contentbyte;
static int alignleft=com.itextpdf.text.pdf.PdfContentByte.ALIGN_LEFT; 
static int alignright=com.itextpdf.text.pdf.PdfContentByte.ALIGN_RIGHT; 
static int aligncenter=com.itextpdf.text.pdf.PdfContentByte.ALIGN_CENTER; 
static Document document;
// Создание pdf-файла с результатом по эпизоду (с header and footer) из doc-файла (doc->pdf с помощью java-библиотеки JODConvertor, которая использует OpenOffice (должен быть запущен как процесс или как служба))	
// Печатать полученный файл или нет - по ненулевым полям 18,19,20 (все ненулевые) в params (печать с помощью SumatraPDF)
// params:
// 1  - наименование компании
// 2  - номер эпизода
// 3  - фио пациента
// 4  - возраст пациента
// 5  - пол пациента
// 6  - дата рождения пациента
// 7  - дата сбора материала
// 8  - время сбора материала
// 9  - фио врача
// 10 - тип отчета (interime or final)
// 11 - флаг (1 - не печатать фио и дата рождения пациента)
// 12 - флаг (1 - надо переводить body результата из doc to pdf)
// 13 - 
// 14 - 
// 15 - 
// 16 - 
// 17 - путь к файлу запусчка OpenOffice (soffice.exe)
// 18 - путь к файлу SumatraPDF.exe (для печати)
// 19 - имя принтера
// 20 - кол-во копий для печати
public static void CreatePDFfromWord(String fileBody, String fileResult, String params, String language, String fileLogo, String fileFaximile, String fileStamp ) throws Exception { //throws DocumentException,IOException, Exception {
	
	  if (fileBody==null) return;
	  if (params==null) return;
	  
	   String fileBodyDoc=fileBody+".doc";
	   String fileBodyPDF=fileBody+".pdf";
	   
	   if (!(new File(fileBodyDoc).exists())) return;
	   
	   // Перевод файла с "телом" from DOC to PDF
	   String flagTransBodyDOCtoPDF=Func.PieceDelimeter(params, 12, 0); // флаг, надо ли переводить из doc to pdf
	   if (flagTransBodyDOCtoPDF.equals("1")) {
		   String pathOpenOffice=Func.PieceDelimeter(params, 17, 0);
	        DocToPDF(fileBodyDoc, fileBodyPDF, pathOpenOffice);
	   }
	   else  {
		   if (!(new File(fileBodyPDF).exists())) return;
	   }
	   
	   // текущий момент
	   String timestamp=(new SimpleDateFormat("dd/MM/yyyy HH:mm")).format(new Date());
	   
	   // Формирование pdf-файла с шапкой, результатом и футером
	   
	   // Открыть новый fileResult
	   // A4: width=595.0 height=842.0
	   //Document(Rectangle pageSize, float marginLeft, float marginRight, float marginTop, float marginBottom) 
		document = new Document(PageSize.A4,0f,0f,0f,0f);

		PdfWriter writer = PdfWriter.getInstance(document,new FileOutputStream(fileResult));
		document.open();
		contentbyte = writer.getDirectContent();
		
		Float width=document.getPageSize().getWidth()-document.leftMargin()-document.rightMargin();
		Float heightFull=document.getPageSize().getHeight()-document.topMargin()-document.bottomMargin();
		
		if (language==null) { language="rus"; }
	
		// Body
		PdfReader reader = new PdfReader(fileBodyPDF);
		int npages = reader.getNumberOfPages();
		
		float x2=document.getPageSize().getWidth()-30f;
		String fontLocation="fonts/cour.ttf"; 
		BaseFont baseFont = BaseFont.createFont(fontLocation, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
		final Font font = new Font(baseFont, 8, Font.NORMAL);
		
		Phrase phrase;
		ColumnText ct;
		String tmp;

		float heightHeader; //=188f;
		float heightFooter=100f;

		Image instance;
		PdfImportedPage page;
		// Go through all pages
		for (int i = 1; i <= npages; i++) {
			page = writer.getImportedPage(reader, i);
			instance = Image.getInstance(page);
				if (i>1) {
				document.newPage();
				writer.setPageEmpty(false);
			}
				// НА КАЖДОЙ СТРАНИЦЕ И Header and Footer
				/*
			//если на первой странице только Header
			if ((i==1)&&(npages!=1)) {
				instance.scaleToFit(width,heightFull-heightHeader-marginBottom);
				instance.setAbsolutePosition(0f, marginBottom);
			}
			// если на последней странице только Footer
			if ((i==npages)&&(npages!=1)) {
				instance.scaleAbsolute(width,heightFull-heightFooter-marginTop);
			}
			// если не первая и не послядняя страница
			if ((i != 1) && (i != npages))  {
				instance.scaleAbsolute(width,heightFull-marginTop-marginBottom);
				instance.setAbsolutePosition(0f, marginBottom);
			}
			// если на первой странице и Header and Footer
			if (npages==1) {
				instance.scaleAbsolute(width,heightFull-heightHeader-heightFooter);
				instance.setAbsolutePosition(0f, heightFooter);
			}
			*/
			// add Header
			heightHeader=document.getPageSize().getHeight()-CreateHeader(params, language, fileLogo);
			
			// add Body Page
			instance.scaleAbsolute(width,heightFull-heightHeader-heightFooter);
			instance.setAbsolutePosition(0f, heightFooter);
			document.add(instance);
			
			//add footer
			CreateFooter(params, language, fileFaximile, fileStamp, new Integer(npages).toString(), heightFooter );
			
			// page number
			int y=35;
			tmp=(language.equals("eng") ? "Page " : "Стр. ")+(new Integer(i).toString())+"/"+(new Integer(npages).toString());
			ct = new ColumnText(contentbyte);
			phrase = new Phrase(tmp, font);
			ct.setSimpleColumn(phrase, x2-100, y, x2, y-10, 0, alignright);
			ct.go();
			//timestamp
			y=y-8;
			ct = new ColumnText(contentbyte);
			phrase = new Phrase(timestamp, font);
			ct.setSimpleColumn(phrase, x2-100, y, x2, y-10, 0, alignright);
			ct.go();
		}
		
		document.close(); 
		
		// Печать pdf-файла, если нужно
		String pathSumatraPDF=Func.PieceDelimeter(params, 18, 0);
		String printerName=Func.PieceDelimeter(params, 19, 0);
		String qCopies=Func.PieceDelimeter(params, 20, 0);
		if ((!pathSumatraPDF.equals(""))&&(!printerName.equals(""))&&(!qCopies.equals(""))) {
			int qcopies=Integer.parseInt(qCopies);
			System.out.println("qcopies="+qcopies);
			if (qcopies>0) {
				String command="\""+pathSumatraPDF+"SumatraPDF.exe\""+" -print-to \""+printerName+"\" \""+fileResult+"\"";
				System.out.println("command="+command);
				for (int i=0; i<qcopies; i++) {
					processUtils.executeProcess(command);
				}
			}
		}

} 

public static void DocToPDF(String inputfile, String outputfile, String pathOpenOffice) throws Exception { // IOException,OpenOfficeException, Exception {
	
	// Link to OpenOffice.org, which needs to be running as a service in the background
	 if ((inputfile != null)&&(outputfile!=null)) {
		 File inFile = new File(inputfile);
		 if (inFile.exists()) {
			 
			// test existense process OpenOffice
			//System.out.println(processUtils.isRunning("soffice.exe"));
			if (!processUtils.isRunning("soffice.exe")) {
				if ((pathOpenOffice==null)||(pathOpenOffice.equals(""))) {
					pathOpenOffice="C:\\Program Files (x86)\\OpenOffice.org 3\\program\\";
				}
				int len=pathOpenOffice.length();
				if (pathOpenOffice.substring(len-1, len)!="\\") {
					pathOpenOffice=pathOpenOffice+"\\";
				}
				String command="\""+pathOpenOffice+"soffice.exe\" -headless -accept=\"socket,host=127.0.0.1,port=8100;urp;\" -nofirststartwizard";
				System.out.println(command);
				processUtils.executeProcess(command);
				Thread.sleep(1000);
			} 
			 
			OpenOfficeConnection OOconnection = new SocketOpenOfficeConnection(8100);
			OOconnection.connect();

			File outFile = new File(outputfile);

			// do the conversion
			DocumentConverter PDFconverter = new OpenOfficeDocumentConverter(OOconnection);
			PDFconverter.convert(inFile, outFile);

			OOconnection.disconnect();
		 }
	 }
}

private static float CreateHeader(String params, String language, String fileLogo ) throws Exception { //DocumentException,IOException, Exception {
	Float width=document.getPageSize().getWidth()-document.leftMargin()-document.rightMargin();
	//font
	String fontLocation="fonts/cour.ttf";  //"fonts/times.ttf"; 
	BaseFont baseFont = BaseFont.createFont(fontLocation, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
	BaseFont baseFontBold = BaseFont.createFont("fonts/courbd.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
	final Font font = new Font(baseFont, 10, Font.NORMAL);
	final Font fontBold = new Font(baseFontBold, 10, Font.NORMAL);

	// данные
	String company=Func.PieceDelimeter(params, 1, 0);
	if (company.length()>55) { company=company.substring(0,56); }
	String episode=Func.PieceDelimeter(params, 2, 0);
	String patient=Func.PieceDelimeter(params, 3, 0);
	if (patient.length()>38) {	patient=patient.substring(0,39); }
	String age=Func.PieceDelimeter(params, 4, 0);
	String sex=Func.PieceDelimeter(params, 5, 0);
	String dob=Func.PieceDelimeter(params, 6, 0);
	String date=Func.PieceDelimeter(params, 7, 0);
	String time=Func.PieceDelimeter(params, 8, 0);
	String doctor=Func.PieceDelimeter(params, 9, 0);
	if (doctor.length()>31) { doctor=doctor.substring(0,32); }
	String flagImpersonalResult=Func.PieceDelimeter(params, 11, 0);
	if (flagImpersonalResult==null) { flagImpersonalResult="0"; }
	
	//System.out.println("params="+params+" company="+company);

	String tmp;
	Phrase phrase;
	float x1=30f;
	float x2=document.getPageSize().getWidth()-30f;
	float y,ydelta;
	float xx2,xx3,xx4;
	ColumnText ct;
	
	//logo
	if ((fileLogo != null)&&(!fileLogo.equals(""))&&(new File(fileLogo).exists())) {
		Image instance = Image.getInstance(fileLogo);
		//instance.setAbsolutePosition(50f, 50f);
		instance.scaleAbsolute(width-60,75f);
		instance.setAbsolutePosition(30f, 730f);
		document.add(instance);
	}
	
    // Company 
	y=710;
	ydelta=16;
	tmp=(language.equals("eng") ? "Company: " : "Организация: ")+company;
	if ((tmp!=null)&&(!tmp.equals(""))) {
	   if (tmp.length()>100) { tmp=tmp.substring(0, 101); }
	   ct = new ColumnText(contentbyte);
	   phrase = new Phrase(tmp, fontBold);
	   ct.setSimpleColumn(phrase, x1, y, x1+400, y-ydelta, 0, alignleft);
	   ct.go();
	}
	// Episode
	tmp=(language.equals("eng") ? "Lab.Visit: " : "Лаб.номер: ")+episode;
	ct = new ColumnText(contentbyte);
	phrase = new Phrase(tmp, fontBold);
	ct.setSimpleColumn(phrase, x1+400, y, x2, y-ydelta, 0, alignright);
	ct.go();
	
	// line
	y=y-12;
	contentbyte.setLineWidth(0.5f);
	contentbyte.moveTo(x1, y);
	contentbyte.lineTo(x2, y);
	contentbyte.stroke();
	
	xx2=x1+35;
	xx3=x1+230;
	xx4=x1+280;
	//System.out.print("x1="+x1+", xx2="+xx2+", xx3="+xx3+", xx4="+xx4+", x2="+x2);
	y=y-12;
	
	// label Date
	tmp=(language.equals("eng") ? "DATE: " : "ДАТА: ");
	ct = new ColumnText(contentbyte);
	phrase = new Phrase(tmp, fontBold);
	ct.setSimpleColumn(phrase, x1, y, xx2, y-ydelta, 0, alignleft);
	ct.go();
	
	// Date
	tmp=date;
	if ((tmp!=null)&&(!tmp.equals(""))) {
	   ct = new ColumnText(contentbyte);
	   phrase = new Phrase(tmp, font);
	   ct.setSimpleColumn(phrase, xx2, y, xx3, y-ydelta, 0, alignleft);
	   ct.go();
	}
	// label Patient
	tmp=(language.equals("eng") ? "PATIENT: " : "ПАЦИЕНТ: ");
	if (flagImpersonalResult.equals("1")) { tmp=""; }
	if ((tmp!=null)&&(!tmp.equals(""))) {
	   ct = new ColumnText(contentbyte);
	   phrase = new Phrase(tmp, fontBold);
	   ct.setSimpleColumn(phrase, xx3, y, xx4, y-ydelta, 0, alignleft);
	   ct.go();
	}	
	// Patient
	tmp=patient;
	if (flagImpersonalResult.equals("1")) { tmp=""; }
	if ((tmp!=null)&&(!tmp.equals(""))) {
	   ct = new ColumnText(contentbyte);
	   phrase = new Phrase(tmp, fontBold);
	   ct.setSimpleColumn(phrase, xx4, y, x2, y-ydelta, 0, alignleft);
	   ct.go();
	}
	y=y-ydelta;
	
	// label Time
	tmp=(language.equals("eng") ? "TIME: " : "ВРЕМЯ: ");
	ct = new ColumnText(contentbyte);
	phrase = new Phrase(tmp, fontBold);
	ct.setSimpleColumn(phrase, x1, y, xx2+1, y-ydelta, 0, alignleft);
	ct.go();
		
	// Time
	tmp=time;
	if ((tmp!=null)&&(!tmp.equals(""))) {
	   ct = new ColumnText(contentbyte);
	   phrase = new Phrase(tmp, font);
	   ct.setSimpleColumn(phrase, xx2, y, xx3, y-ydelta, 0, alignleft);
	   ct.go();
	}
		
	// label Age 
	tmp=(language.equals("eng") ? "AGE: " : "ВОЗРАСТ: ");
	ct = new ColumnText(contentbyte);
	phrase = new Phrase(tmp, fontBold);
	ct.setSimpleColumn(phrase, xx3, y, xx4, y-ydelta, 0, alignleft);
	ct.go();
			
	// age
	tmp=age;
	if ((tmp!=null)&&(!tmp.equals(""))) {
	   ct = new ColumnText(contentbyte);
	   phrase = new Phrase(tmp, font);
	   ct.setSimpleColumn(phrase, xx4, y, xx4+100, y-ydelta, 0, alignleft);
	   ct.go();
	}
	// label Sex 
	tmp=(language.equals("eng") ? "SEX: " : "ПОЛ: ");
	ct = new ColumnText(contentbyte);
	phrase = new Phrase(tmp, fontBold);
	ct.setSimpleColumn(phrase, xx4+100, y, xx4+150, y-ydelta, 0, alignleft);
	ct.go();
				
	// sex
	tmp=sex;
	if ((tmp!=null)&&(!tmp.equals(""))) {
	   ct = new ColumnText(contentbyte);
	   phrase = new Phrase(tmp, font);
	   ct.setSimpleColumn(phrase, xx4+150, y, x2, y-ydelta, 0, alignleft);
	   ct.go();
	}
	y=y-ydelta;
	
	// label Doctor
	tmp=(language.equals("eng") ? "DR: " : "ВРАЧ: ");
	ct = new ColumnText(contentbyte);
	phrase = new Phrase(tmp, fontBold);
	ct.setSimpleColumn(phrase, x1, y, xx2, y-ydelta, 0, alignleft);
	ct.go();
		
	// Doctor
	tmp=doctor;
	if ((tmp!=null)&&(!tmp.equals(""))) {
	   ct = new ColumnText(contentbyte);
	   phrase = new Phrase(tmp, font);
	   ct.setSimpleColumn(phrase, xx2-4, y, xx3, y-ydelta, 0, alignleft);
	   ct.go();
	}	
	// label DOB
	tmp=(language.equals("eng") ? "DOB: " : "Д.Р.: ");
	if (flagImpersonalResult.equals("1")) { tmp=""; }
	if ((tmp!=null)&&(!tmp.equals(""))) {
	   ct = new ColumnText(contentbyte);
	   phrase = new Phrase(tmp, fontBold);
	   ct.setSimpleColumn(phrase, xx3, y, xx4, y-ydelta, 0, alignleft);
	   ct.go();
	}		
	// DOB
	tmp=dob;
	if (flagImpersonalResult.equals("1")) { tmp=""; }
	if ((tmp!=null)&&(!tmp.equals(""))) {
	   ct = new ColumnText(contentbyte);
	   phrase = new Phrase(tmp, font);
	   ct.setSimpleColumn(phrase, xx4, y, x2, y-ydelta, 0, alignleft);
	   ct.go();
	}
	// line
	y=y-7;
	contentbyte.setLineWidth(0.5f);
	contentbyte.moveTo(x1, y);
	contentbyte.lineTo(x2, y);
	contentbyte.stroke();
	
	return y;
}

private static void CreateFooter(String params, String language, String fileFaximile, String fileStamp, String npages, float heightFooter ) throws Exception { //DocumentException,IOException, Exception {
	//Float width=document.getPageSize().getWidth()-document.leftMargin()-document.rightMargin();
	//font
	String fontLocation="fonts/cour.ttf"; 
	BaseFont baseFont = BaseFont.createFont(fontLocation, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
	final Font font = new Font(baseFont, 10, Font.NORMAL);
	//final Font fontBold = new Font(baseFont, 8, Font.BOLD);

	// данные
	String typereport=Func.PieceDelimeter(params, 10, 0);
	
	String tmp;
	Phrase phrase;
	float x1=30f;
	float x2=document.getPageSize().getWidth()-30f;
	float y,ydelta=10;
	ColumnText ct;
	
 	tmp=(language.equals("eng") ? "DOCTOR'S SIGNATURE " : "ВРАЧ ")+"  ____________________________________       "+(language.equals("eng") ? "STAMP" : "ШТАМП");
	y=heightFooter-35;
	ct = new ColumnText(contentbyte);
	phrase = new Phrase(tmp, font);
	ct.setSimpleColumn(phrase, x1+80, y, x2+20, y-ydelta, 0, alignleft);
	ct.go();

	// INTERIM REPORT 
	tmp=typereport;
	y=y-30;
	if ((tmp!=null)&&(!tmp.equals(""))) {
	   ct = new ColumnText(contentbyte);
	   phrase = new Phrase(tmp, font);
	   ct.setSimpleColumn(phrase, x1+70, y, x1+400, y-ydelta, 0, aligncenter);
	   ct.go();
	}
	//faximile
	if ((fileFaximile!=null)&&(!fileFaximile.equals(""))&&(new File(fileFaximile).exists())) {
		Image instance = Image.getInstance(fileFaximile);
		instance.setAbsolutePosition(250f, 60f);
		instance.scaleAbsolute(85f,25f);
		document.add(instance);
	}
	
	//stamp
	if ((fileStamp!=null)&&(!fileStamp.equals(""))&&(new File(fileStamp).exists())) {
		Image instance = Image.getInstance(fileStamp);
		instance.setAbsolutePosition(380f, 30f);
		instance.scaleAbsolute(110f,110f);
		document.add(instance);
	}
}	

public static void main(String[] args) throws Exception { //DocumentException,IOException, Exception {
	String episode="10023161"; //"10024987";
	String testset="M200";
	String tscnt="2";
	String pathBody = "c:\\temp\\test";
	String pathResult = "c:\\temp\\test";
	String fileLogo = "c:\\temp\\test\\test.jpg";
	String fileBody=pathBody+"\\"+episode+"_"+testset+"_"+tscnt;
	   //String fileBodyPDF=pathBody+"\\"+episode+"_"+testset+"_"+tscnt+".pdf";
	   String fileResult=pathResult+"\\"+episode+"_"+testset+"_"+tscnt+"o.pdf";
	//CreatePDFfromWordEMC(episode, testset, tscnt, pathBody, pathResult, fileLogo);
	   String language="eng";
	   Character ch0=0;
	   //String params="Орловская компания Орловская компания Орловская 1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9 0 "+ch0+ch0+"Фамилия Имя Отчество 1233456789 1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9 hhhh"+ch0+"27 y/o"+ch0+"female"+ch0+"16.10.1984"+ch0+"15.04.2012"+ch0+ch0+"вщсещк fdfgdfgdfgdfgd dfgdgdf123456789"+ch0+"INTERIM REPORT траляля"+ch0+ch0+"1";
	   String params="Орловская компания Орловская компания Орловская 1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9 0 "+ch0+ch0+"Test Ivan Ivanovich 1233456789 1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9 hhhh"+ch0+"2 года 12 мес."+ch0+"female"+ch0+"16.10.1984"+ch0+"15.04.2012"+ch0+ch0+"вщсещк fdfgdfgdfgdfgd dfgdgdf123456789"+ch0+"INTERIM REPORT траляля"+ch0+ch0+"1";
	   params=params+ch0+ch0+ch0+ch0+ch0+ch0+"C:\\Apl\\SumatraPDF\\"+ch0+"HP LaserJet P2050 Series PCL6"+ch0+"2";
	   //params="";
	   String fileFaximile="C:\\temp\\emc\\stamp\\faximile_serobyan.png"; // faximile_dorofeev.png";
	   String fileStamp="C:\\temp\\emc\\stamp\\stamp_emc.png";
	   CreatePDFfromWord(fileBody, fileResult, params, language, fileLogo, fileFaximile, fileStamp);
}

	
}
