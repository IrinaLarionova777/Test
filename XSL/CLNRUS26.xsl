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
 <!-- флаг 1/0 "Выводить только активные местоположения" -->
 <xsl:variable name="FlagActive"><xsl:value-of select="FlagActive"/></xsl:variable>
 <!-- флаг 1/0 "Формат печати + Кол-во копий" -->
 <xsl:variable name="FlagFR"><xsl:value-of select="FlagFR"/></xsl:variable>
 <!-- флаг 1/0 "Курьер" -->
 <xsl:variable name="FlagCour"><xsl:value-of select="FlagCour"/></xsl:variable>
 <!-- флаг 1/0 "Тип местоположения" -->
 <xsl:variable name="FlagType"><xsl:value-of select="FlagType"/></xsl:variable>
 <!-- флаг 1/0 "Клиент" -->
 <xsl:variable name="FlagClient"><xsl:value-of select="FlagClient"/></xsl:variable>
 <!-- флаг 1/0 "Язык" -->
 <xsl:variable name="FlagLang"><xsl:value-of select="FlagLang"/></xsl:variable>
 
  <title>Список местоположений пациентов</title>
  <xsl:value-of select="$pass" disable-output-escaping="yes"/>
  <style type="text/css">
     body {font-family: Times New Roman ;}
     .Cur9  { 	font-size : 9pt; }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt;  }
     .Cur12  { 	font-size : 12pt;  }
     .Cur14 { font-size : 14pt; }
     .Cur16 { font-size : 16pt; }
     p{margin:0;padding:0;}
     @page Section1{
     mso-page-orientation: landscape;
     size:297mm 210mm;
     margin:10mm 10mm 10mm 10mm; }
     div.Section1{page:Section1;}
  </style> 
 </head>
 <body>
 <div class="Section1">
    <p class="Cur16" align="center"><b><xsl:value-of select="NameLaboratoty"/></b></p>
    <p class="Cur14" align="center"><b>Список местоположений пациентов для типа: <xsl:value-of select="TypeLocation"/></b></p>
    <br/>
    <table class="Cur10" border="1" sellspacing="0" width="100%" bordercolor="#000000" 
           style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 5.4pt 0cm 5.4pt'">  
      <thead> <!-- повторять заголовок таблицы на каждой странице  -->
      <tr>
        <td width="5%" align="center"><b>Код</b></td>
        <td width="20%" align="center"><b>Наименование местоположения</b></td>
        <td width="3%" align="center"><b>№ посл.</b></td>  
        <xsl:if test='$FlagActive = 0'><td width="3%" align="center"><b>Акт.</b></td></xsl:if>
        <xsl:if test='$FlagFR = 1'>
            <td width="5%" align="center"><b>Формат<br/>печати</b></td>
            <td width="3%" align="center"><b>Кол-во<br/>копий</b></td>
        </xsl:if>
        <xsl:if test='$FlagCour = 1'><td width="10%" align="center"><b>Курьер</b></td></xsl:if>
        <xsl:if test='$FlagType = 1'><td width="10%" align="center"><b>Тип местоположения</b></td></xsl:if>
        <xsl:if test='$FlagClient = 1'><td width="5%" align="center"><b>Клиент</b></td></xsl:if>
        <xsl:if test='$FlagLang = 1'><td width="5%" align="center"><b>Язык</b></td></xsl:if>
      </tr>
      </thead>      
      <xsl:for-each select="ONext">	
         <tr>
          <td align="left"><xsl:value-of select="Code"/></td>
          <td align="left"><xsl:value-of select="Desc"/></td>
          <td align="center"><xsl:value-of select="Sequence"/></td>
          <xsl:if test='$FlagActive = 0'><td align="center"><xsl:value-of select="FlagActive"/></td></xsl:if>
          <xsl:if test='$FlagFR = 1'>
              <td align="left"><xsl:value-of select="PrintFormat"/></td>
              <td align="center"><xsl:value-of select="NoCopies"/></td>
          </xsl:if>
          <xsl:if test='$FlagCour = 1'><td align="left"><xsl:value-of select="Courier"/></td></xsl:if>          
          <xsl:if test='$FlagType = 1'><td align="left"><xsl:value-of select="Type"/></td></xsl:if>          
          <xsl:if test='$FlagClient = 1'><td align="left"><xsl:value-of select="Client"/></td></xsl:if>    
          <xsl:if test='$FlagLang = 1'><td align="left"><xsl:value-of select="Lang"/></td></xsl:if>    
         </tr>
      </xsl:for-each>
   </table> 
 <!-- подвал -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
