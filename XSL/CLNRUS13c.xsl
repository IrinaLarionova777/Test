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
 <!-- флаг 1/0 расшифровка по наборам тестов -->
 <xsl:variable name="FlagDetailsTS"><xsl:value-of select="FlagDetailsTS"/></xsl:variable>
 <!-- флаг 1/0 расшифровка по секциям -->
 <xsl:variable name="FlagSect"><xsl:value-of select="FlagSect"/></xsl:variable>
 <!-- флаг 1/2/3 без группировки/ группировка по заказчикам/ группировка по услугам -->
 <xsl:variable name="FlagGr"><xsl:value-of select="FlagGr"/></xsl:variable>
 <title>Количество обработанных контейнеров по Годам/Кварталам/Месяцам/Неделям/Дням </title>
  <xsl:value-of select="$pass" disable-output-escaping="yes"/>
  <style type="text/css">
     body {font-family: Times New Roman ;}
     .Cur9   { 	font-size : 9pt;  }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt; }
     .Cur12  { 	font-size : 12pt; }
     .Cur14  { font-size : 14pt;  }
     .Cur16 { font-size : 16pt; }
	 .num { mso-number-format:"\#\,\#\#0\.00"; }
     p{margin:0;padding:0;}
     @page Section1{
     mso-page-orientation:landscape;
     size:297mm 210mm;
     margin:10mm 10mm 10mm 10mm; }
     div.Section1{page:Section1;}
  </style> 
 </head>
 <body>
 <div class="Section1">
    <p class="Cur16" align="center"><b><xsl:value-of select="NameLaboratoty"/></b></p>
    <p class="Cur14" align="center"><b>Количество обработанных контейнеров по <xsl:value-of select="TypeReport"/> 
       <br/>за период c <xsl:value-of select="Date1"/> по <xsl:value-of select="Date2"/></b></p>
    <p class="Cur12" align="center">Плательщик: <xsl:value-of select="Payment"/> <br/></p>
    <br/>
<xsl:choose>
  <xsl:when test='$FlagGr = 2'>
<!--  Сводный отчет по отделам (без разбивки по наборам тестов и секциям) -->
  <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
   <tr align="center">
     <td width="20%" rowspan="2"><b>Заказчик </b></td>
     <xsl:call-template name="tabhead1"/>
   </tr>
   <xsl:call-template name="tabhead2"/>
   <xsl:for-each select="OGr">
     <tr>
       <td align="left"><xsl:value-of select="Code"/></td>
       <xsl:call-template name="periodData"/>
     </tr>
	  <xsl:for-each select="OGrDep">
		 <tr style='background:#D9D9D9'>
			<td><b><i><xsl:value-of select="Code"/></i></b></td>
			<xsl:call-template name="periodData"/>
		 </tr>
	   </xsl:for-each>
   </xsl:for-each>
  </table>
  <!-- конец группировки по заказчикам -->
  </xsl:when>
  
</xsl:choose>
 <!-- подвал -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
<xsl:template name="tabhead1">
 <td width="10%" rowspan="2"><b>Общее кол-во</b></td>
 <xsl:for-each select="OCol"><td width="5%" ><b><xsl:value-of select="Code"/></b></td></xsl:for-each>
</xsl:template>
<xsl:template name="tabhead2">
   <tr align="center">
     <xsl:for-each select="OCol">
          <td width="5%">Кол-во услуг</td>
      </xsl:for-each>
   </tr>
   <tr>
       <td style='background:#D9D9D9' align="left"><b>ВСЕГО обработано контейнеров</b></td>
       <td style='background:#D9D9D9' align="right"><b><xsl:value-of select="Itogo-Kol"/></b></td>
       <xsl:for-each select="OItogoCol">
            <td style='background:#D9D9D9' align="right"><b><xsl:value-of select="Kol"/></b></td>
       </xsl:for-each>
   </tr>
</xsl:template>
<xsl:template name="periodData">
	<td align="right"><xsl:value-of select="Kol"/></td>
	<xsl:for-each select="OCol">
           <td align="right"><xsl:value-of select="Kol"/></td>
        </xsl:for-each>
</xsl:template>
</xsl:stylesheet>
