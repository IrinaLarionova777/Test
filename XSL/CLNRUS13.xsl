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
 <title>СВОДНАЯ СТАТИСТИКА выполненных исследований по Годам/Месяцам/Дням </title>
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
 <div class="Section1">
    <p class="Cur16" align="center"><b><xsl:value-of select="NameLaboratoty"/></b></p>
    <p class="Cur14" align="center"><b>СВОДНАЯ Статистика выполненных исследований (наборов тестов) по <xsl:value-of select="TypeReport"/> 
       <br/>за период c <xsl:value-of select="Date1"/> по <xsl:value-of select="Date2"/></b></p>
    <p class="Cur12" align="center">Отдел: <xsl:value-of select="Department"/><br/></p>
    <br/>
<!--  Сводный отчет по отделам (без разбивки по наборам тестов) -->
<xsl:if test='$FlagDetailsTS = 0'>
  <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
   <tr align="center">
     <td width="20%"><b>Отдел</b></td>
     <td width="10%"><b>Общее кол-во</b></td>
     <xsl:for-each select="OCol"><td width="5%"><b><xsl:value-of select="Code"/></b></td></xsl:for-each>
   </tr>
   <tr>
       <td style='background:#D9D9D9' align="left"><b>ВСЕГО выполненно наборов тестов</b></td>
       <td style='background:#D9D9D9' align="right"><b><xsl:value-of select="Itogo-Kol"/></b></td>
       <xsl:for-each select="OItogoCol"><td style='background:#D9D9D9' align="right"><b><xsl:value-of select="Kol"/></b></td></xsl:for-each>
   </tr>
   <tr>
       <td align="left"><i>в том числе по отделам:</i></td>
       <td></td>
       <xsl:for-each select="OItogoCol"><td></td></xsl:for-each>
   </tr>   
   <xsl:for-each select="OGr">	
     <tr>
       <td align="left"><xsl:value-of select="Code"/></td>
       <td align="right"><xsl:value-of select="Kol"/></td>
       <xsl:for-each select="OCol"><td align="right"><xsl:value-of select="Kol"/></td></xsl:for-each>
     </tr>
   </xsl:for-each>
  </table>
</xsl:if>
<!--  Расширенный отчет с разбивкой по наборам тестов -->
<xsl:if test='$FlagDetailsTS = 1'>
  <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
   <tr align="center">
     <td width="30%"><b>Отдел / Набор тестов</b></td>
     <td width="10%"><b>Общее кол-во</b></td>
     <xsl:for-each select="OCol"><td width="5%"><b><xsl:value-of select="Code"/></b></td></xsl:for-each>
   </tr>
   <tr>
       <td style='background:#D9D9D9' align="left"><b>ВСЕГО выполненно наборов тестов</b></td>
       <td style='background:#D9D9D9' align="right"><b><xsl:value-of select="Itogo-Kol"/></b></td>
       <xsl:for-each select="OItogoCol"><td style='background:#D9D9D9' align="right"><b><xsl:value-of select="Kol"/></b></td></xsl:for-each>
   </tr>
   <tr>
       <td align="left"><i>в том числе по отделам:</i></td>
       <td></td>
       <xsl:for-each select="OItogoCol"><td></td></xsl:for-each>
   </tr>   
   <xsl:for-each select="OGr">	
     <tr style='background:#D9D9D9'>
        <td><b><xsl:value-of select="Code"/></b></td>
        <td align="right"><b><xsl:value-of select="Kol"/></b></td>
        <xsl:for-each select="OCol"><td align="right"><b><xsl:value-of select="Kol"/></b></td></xsl:for-each>
     </tr>
     <xsl:for-each select="OTS">	
       <tr class="Cur10">
          <td align="left"><xsl:value-of select="Code"/></td>
          <td style='background:#D9D9D9' align="right"><b><xsl:value-of select="Kol"/></b></td>
          <xsl:for-each select="OCol"><td align="right"><xsl:value-of select="Kol"/></td></xsl:for-each>
       </tr>
     </xsl:for-each>  <!-- для TS -->
   </xsl:for-each>   <!--  для Gr -->
  </table>
</xsl:if>
 <!-- подвал -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
