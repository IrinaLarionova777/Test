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
 <title>Список заказов по исполнителям</title>
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
     mso-page-orientation:landscape;
     size:297mm 210mm;
     margin:10mm 10mm 10mm 10mm; }
     div.Section1{page:Section1;}
  </style> 
 </head>
 <body>
<xsl:for-each select="OGr">
<xsl:variable name="pageStyle"><xsl:if test="(position( )) > 1">page-break-before: always;</xsl:if></xsl:variable>
 <br clear='all' style='{$pageStyle}'/>
 <div class="Section1"> 
    <p class="Cur14" align="right"><xsl:value-of select="UslDesc"/></p>
	<table class="Cur12" border="0" cellspacing="0" width="100%" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; padding:0cm 7.4pt 0cm 7.4pt'">
	<tr>
	<td width="12cm" align="left">Исполнитель: <xsl:value-of select="ReferralLab" /></td><td align="center">Дата и время формирования: <xsl:value-of select="TimeSent"/></td>
	</tr>
	</table>
    <br/>
  <table class="Cur10" border="1" cellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
   <tr align="center">
     <td><b>№ п/п</b></td>
     <td><b>Номер заказа</b></td>
     <td><b>ФИО пациента</b></td>
     <td><b>Пол</b></td>
     <td><b>ДР</b></td>
     <td><b>Название исследования</b></td>
     <td><b>Внешнее название исследования</b></td>
     <td><b>Образец</b></td>
     <td><b>Дата забора</b></td>
     <td><b>Примечания<br />
(бер./ф. цикла /сут. диурез)</b></td>
     <td width="3cm"><b>Комментарии</b></td>
   </tr>
   <xsl:for-each select="OCol">
   <tr>
     <td><xsl:value-of select="OrderNum"/></td>
     <td><xsl:value-of select="TestNum"/></td>
     <td><xsl:value-of select="PatName"/></td>
     <td><xsl:value-of select="Sex"/></td>
     <td><xsl:value-of select="Birth"/></td>
     <td><xsl:value-of select="TestName"/></td>
     <td><xsl:value-of select="ExtTestName"/></td>
     <td><xsl:value-of select="Desc"/></td>
     <td><xsl:value-of select="TestDate"/></td>
     <td><xsl:value-of select="Pregnant"/></td>
     <td width="3cm"></td>
   </tr>
   </xsl:for-each>
  </table>
 <!-- подвал -->
 <table class="Cur12" border="0" cellspacing="0" width="100%" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; padding:0cm 7.4pt 0cm 7.4pt'">
 <tr>
 <td>Итого заказов: <xsl:value-of select="TotalOrders"/></td><td>Итого исследований: <xsl:value-of select="TotalTests"/></td>
 </tr>
 </table>
 </div>
</xsl:for-each>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
