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
 <!-- флаг 1/0 Доп.вывод реквизитов анализаторов -->
 <xsl:variable name="FlagCOM"><xsl:value-of select="FlagCOM"/></xsl:variable>
 <xsl:variable name="FlagDirect"><xsl:value-of select="FlagDirect"/></xsl:variable>
 <xsl:variable name="FlagPRG"><xsl:value-of select="FlagPRG"/></xsl:variable>
 <xsl:variable name="FlagDep"><xsl:value-of select="FlagDep"/></xsl:variable>
 <xsl:variable name="FlagTS"><xsl:value-of select="FlagTS"/></xsl:variable>
 <xsl:variable name="FlagTC"><xsl:value-of select="FlagTC"/></xsl:variable> 
 <xsl:variable name="FlagQC"><xsl:value-of select="FlagQC"/></xsl:variable>

  <title>Список анализаторов</title>
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
     @page Section1{  mso-page-orientation:landscape;
                      size:297mm 210mm;
                      margin:10mm 10mm 10mm 10mm; }
     div.Section1{page:Section1;}
  </style> 
 </head>
 <body>
 <div class="Section1">
    <p class="Cur16" align="center"><b><xsl:value-of select="NameLaboratoty"/></b></p>
    <p class="Cur14" align="center"><b>Список анализаторов для отдела: <xsl:value-of select="Department"/></b></p>
    <br/>
    <table class="Cur12" border="1" sellspacing="0" width="100%" bordercolor="#000000" 
           style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 5.4pt 0cm 5.4pt'">  
      <thead> <!-- повторять заголовок таблицы на каждой странице  -->
      <tr>
        <td width="5%" align="center"><b>Код</b></td>
        <td width="15%" align="center"><b>Наименование анализатора</b></td>
        <xsl:if test='$FlagCOM = 1'><td width="3%" align="center"><b>COM-порт</b></td></xsl:if>
        <xsl:if test='$FlagDirect = 1'><td width="3%" align="center"><b>Режим работы</b></td></xsl:if>
        <xsl:if test='$FlagPRG = 1'><td width="3%" align="center"><b>Программа</b></td></xsl:if>
        <xsl:if test='$FlagDep = 1'><td width="5%" align="center"><b>Отдел</b></td></xsl:if>
        <xsl:if test='$FlagTS = 1'><td width="25%" align="center"><b>Наборы тестов</b></td></xsl:if>
        <xsl:if test='$FlagTC = 1'><td width="25%" align="center"><b>Тесты</b></td></xsl:if>
        <xsl:if test='$FlagQC = 1'><td width="10%" align="center"><b>Контроль Качества</b></td></xsl:if>                
      </tr>
      </thead>      
      <xsl:for-each select="ONext">	
         <tr>
          <td align="center" VALIGN="TOP"><xsl:value-of select="Code"/></td>
          <td align="left" VALIGN="TOP"><xsl:value-of select="Desc"/></td>
          <xsl:if test='$FlagCOM = 1'><td align="center" VALIGN="TOP"><xsl:value-of select="COM"/></td></xsl:if>
          <xsl:if test='$FlagDirect = 1'><td align="left" VALIGN="TOP"><xsl:value-of select="Direct"/></td></xsl:if>
          <xsl:if test='$FlagPRG = 1'><td align="center" VALIGN="TOP"><xsl:value-of select="Programm"/></td></xsl:if>      
          <xsl:if test='$FlagDep = 1'><td align="center" VALIGN="TOP"><xsl:value-of select="Department"/></td></xsl:if>          
          <xsl:if test='$FlagTS = 1'>
                <td align="left" class="Cur10" VALIGN="TOP">
                      <xsl:for-each select="OTS"><xsl:value-of select="TestSet"/><br/></xsl:for-each>
                </td>
          </xsl:if>
          <xsl:if test='$FlagTC = 1'>
                <td align="left" class="Cur10" VALIGN="TOP">
                      <xsl:for-each select="OTC">
                          <xsl:value-of select="Test"/> = <b><xsl:value-of select="TestID"/></b>  (<xsl:value-of select="Direction"/>)
                          <xsl:value-of select="Divider"/> <xsl:value-of select="Suffix"/>
                          <br/>
                      </xsl:for-each>
                </td>
          </xsl:if>
          <xsl:if test='$FlagQC = 1'>
                <td align="left" class="Cur10"><xsl:for-each select="OQC"><xsl:value-of select="Desc"/><br/></xsl:for-each></td>
          </xsl:if>
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
