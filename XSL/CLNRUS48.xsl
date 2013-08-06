<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="Windows-1251" omit-xml-declaration="no"/>
<xsl:variable name="pass">
 <![CDATA[
  <!--[if gte mso 9]><xml>
   <w:WordDocument>
    <w:View>Print</w:View>
    <w:Zoom>100</w:Zoom>
    <w:DoNotOptimizeForBrowser/>
    <w:DoNotShowRevisions/>
   </w:WordDocument>
  </xml><![endif]-->
 ]]>
</xsl:variable>  
<xsl:template match="baseO/OUser">
<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w="urn:schemas-microsoft-com:office:word">
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=windows-1251"/>
   <meta name="ProgId" content="Word.Document"/>
   <meta name="Generator" content="Microsoft Word 10"/>
   <meta name="Originator" content="Microsoft Word 10"/>
 <title>Отчет по контейнерам</title>
  <xsl:value-of select="$pass" disable-output-escaping="yes"/>
  <style type="text/css">
     body {font-family: Times New Roman ;}
     .Cur9   { 	font-size : 9pt;  }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt; }
     .Cur12  { 	font-size : 12pt; }
     .Cur14  { font-size : 14pt;  }
     .Cur16 { font-size : 16pt; }
     p{margin:0;padding:0;}
     @page Section1{
     mso-page-orientation:portrait;
     size:210mm 297mm;
     margin:10mm 10mm 10mm 10mm; }
     div.Section1{page:Section1;}
  </style> 
 </head>
 <body>
    <p class="Cur16" align="center"><b>Отчет по контейнерам за период с <xsl:value-of select="Date1"/> по <xsl:value-of select="Date2"/>
    </b></p>
 <div class="Section1"> 
	<table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt;">
	<xsl:for-each select="OGr">
	<tr class="Cur14"><td width="12cm" align="left">Плательщик</td><td style="font-weight: bold;"><xsl:value-of select="Payment" /> (<xsl:value-of select="PaymentCode" />)</td></tr>
	<tr><td style="font-weight: bold;" width="12cm" align="left">Контейнер</td><td align="center">Количество</td></tr>
	<xsl:for-each select="OCol">
	<tr><td width="12cm" align="left"><xsl:value-of select="ContName" /></td><td align="right"><xsl:value-of select="ContCount" /></td></tr>
	</xsl:for-each>
	</xsl:for-each>
	<tr><td style="font-weight: bold;" width="12cm" align="left">Итого</td><td align="right"><xsl:value-of select="Total" /></td></tr>
	</table>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
