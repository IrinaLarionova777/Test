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
 
 <!-- флаг 1/2 "Тип отчета" -->
 <xsl:variable name="FlagReport"><xsl:value-of select="FlagReport"/></xsl:variable>
 <!-- флаг 1/0 "Выводить только активные записи" -->
 <xsl:variable name="FlagActive"><xsl:value-of select="FlagActive"/></xsl:variable>
 <!-- флаг 1/0 "Тип сортировки данных -->
 <xsl:variable name="FlagSort"><xsl:value-of select="FlagSort"/></xsl:variable>
 <!-- флаг 1/0 "номер последовательности" -->
 <xsl:variable name="FlagNpp"><xsl:value-of select="FlagNpp"/></xsl:variable>
 <!-- флаг 1/0 "нац.номер + классификация + вкл.в отчет"   -->
 <xsl:variable name="FlagDop"><xsl:value-of select="FlagDop"/></xsl:variable>
 <!-- флаг 1/0 "Привязка к анализаторам" -->
 <xsl:variable name="FlagMIF"><xsl:value-of select="FlagMIF"/></xsl:variable>
 
  <title>Список микроорганизмов/антибиотиков</title>
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
     mso-page-orientation: portrate;
     size:210mm 297mm;
     margin:10mm 10mm 10mm 10mm; }
     div.Section1{page:Section1;}
  </style> 
 </head>
 <body>
 <div class="Section1"> 
 <!-- Тип отчета 1 = Список антибиотиков  -->
 <xsl:if test='$FlagReport = 1'>    
    <p class="Cur16" align="center"><b><xsl:value-of select="NameLaboratoty"/></b></p>
    <p class="Cur14" align="center"><b>Список антибиотиков</b></p>
    <br/>
    <table class="Cur10" border="1" sellspacing="0" width="100%" bordercolor="#000000" 
           style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 5.4pt 0cm 5.4pt'">  
      <thead> <!-- повторять заголовок таблицы на каждой странице  -->
      <tr>
        <td width="5%" align="center"><b>Код</b></td>
        <td width="20%" align="center"><b>Наименование антибиотика</b></td>
        <xsl:if test='$FlagNpp = 1'><td width="3%" align="center"><b>№ посл.</b></td></xsl:if>
        <xsl:if test='$FlagActive = 0'><td width="3%" align="center"><b>Акт.</b></td></xsl:if>
        <xsl:if test='$FlagMIF = 1'>
            <xsl:for-each select="OCol"><td width="3%"><b><xsl:value-of select="Code"/></b></td></xsl:for-each>
        </xsl:if>
      </tr>
      </thead>      
      <xsl:for-each select="ONext">	
        <xsl:sort order="ascending" select="Desc[$FlagSort='2']"/>
        <xsl:sort order="ascending" select="Sequence[$FlagSort='3']"/>
         <tr>
          <td align="left"><xsl:value-of select="Code"/></td>
          <td align="left"><xsl:value-of select="Desc"/></td>
          <xsl:if test='$FlagNpp = 1'><td align="center"><xsl:value-of select="Sequence"/></td></xsl:if>
          <xsl:if test='$FlagActive = 0'><td align="center"><xsl:value-of select="FlagActive"/></td></xsl:if>
          <xsl:if test='$FlagMIF = 1'>
              <xsl:for-each select="OCol"><td align="right"><xsl:value-of select="MIF"/></td></xsl:for-each>
          </xsl:if>
         </tr>
      </xsl:for-each>
   </table>
 </xsl:if> 
 <!-- Тип отчета 2 = Список микроорганизмов  -->
 <xsl:if test='$FlagReport = 2'>    
    <p class="Cur14" align="center"><b>Список микроорганизмов для <xsl:value-of select="NameLaboratoty"/></b></p>
    <br/>
    <table class="Cur10" border="1" sellspacing="0" width="100%" bordercolor="#000000" 
           style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 5.4pt 0cm 5.4pt'">  
      <thead> <!-- повторять заголовок таблицы на каждой странице  -->
      <tr>
        <td width="5%" align="center"><b>Код</b></td>
        <td width="20%" align="center"><b>Наименование микроорганизма</b></td>
        <td width="5%" align="center"><b>Синоним</b></td>
        <xsl:if test='$FlagNpp = 1'><td width="3%" align="center"><b>№ посл.</b></td></xsl:if>  
        <xsl:if test='$FlagActive = 0'><td width="3%" align="center"><b>Акт.</b></td></xsl:if>
        <xsl:if test='$FlagDop = 1'>
            <td width="5%" align="center"><b>Нац. номер</b></td>
            <td width="5%" align="center"><b>Класси- фикация</b></td>
            <td width="5%" align="center"><b>Вкл.в отчет</b></td>
        </xsl:if>
        <xsl:if test='$FlagMIF = 1'>
            <xsl:for-each select="OCol"><td width="5%"><b><xsl:value-of select="Code"/></b></td></xsl:for-each>
        </xsl:if>
      </tr>
      </thead>      
      <xsl:for-each select="ONext">	
         <xsl:sort order="ascending" select="Desc[$FlagSort='2']"/>     
         <tr>
          <td align="left"><xsl:value-of select="Code"/></td>
          <td align="left"><xsl:value-of select="Desc"/></td>
          <td align="left"><xsl:value-of select="Synon"/></td>          
          <xsl:if test='$FlagNpp = 1'><td align="center"><xsl:value-of select="Sequence"/></td></xsl:if>
          <xsl:if test='$FlagActive = 0'><td align="center"><xsl:value-of select="FlagActive"/></td></xsl:if>
          <xsl:if test='$FlagDop = 1'>
              <td align="center"><xsl:value-of select="NatID"/></td>
              <td align="center"><xsl:value-of select="Class"/></td>
              <td align="center"><xsl:value-of select="FlagRep"/></td>          
          </xsl:if>        
          <xsl:if test='$FlagMIF = 1'>
            <xsl:for-each select="OCol"><td align="right"><xsl:value-of select="MIF"/></td></xsl:for-each>
          </xsl:if>
         </tr>
      </xsl:for-each>
   </table>
 </xsl:if> 
 <!-- подвал -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
