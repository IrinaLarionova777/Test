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

  <title>Отчет о времени выполнения исследований (TAT)</title>
  <xsl:value-of select="$pass" disable-output-escaping="yes"/>
  <style type="text/css">
     body {font-family: Times New Roman ;}
     .Cur9  { 	font-size : 9pt; }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt;  }
     .Cur12  { 	font-size : 12pt;  }
     .Cur14  { 	font-size : 14pt;  }
     .Cur16 { font-size : 16pt; }
     .CurGroup { font-size : 12pt; }
     .xl43	{   mso-style-parent:style0;
	          font-family:"Times New Roman", serif;
	          mso-font-charset:204;
	          mso-number-format:"\@";
	          text-align:center;
	          border:.5pt solid black;
	          white-space:normal;}     
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
    <p class="Cur16" align="center"><b><xsl:value-of select="NameReport"/></b></p>
    <p class="Cur14" align="center"><b>за период c <xsl:value-of select="DateFrom"/> по <xsl:value-of select="DateTo"/></b></p>
    <p class="Cur12" align="left">
          <b><xsl:value-of select="NameGroup"/><xsl:text>   </xsl:text></b><xsl:value-of select="StringGroup"/>
          <xsl:if test='PatLocation != ""'><br/><b>Местоположение пациента:</b><xsl:text>   </xsl:text><xsl:value-of select="PatLocation"/></xsl:if>              
    </p>
  <br/>
  <table class="Cur12" border="1" sellspacing="0" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px">  
    <thead>
    <tr>
        <td width="15%" align="center"><b>Дата</b></td> 
        <td width="15%" align="center"><b>Всего групп</b></td>
        <td width="15%" align="center"><b>Среднее (мин)</b></td>
        <td width="15%" align="center"><b>Медиана (мин)</b></td>
        <td width="15%" align="center"><b>75% центиль (мин)</b></td>
        <td width="15%" align="center"><b>90% центиль (мин)</b></td>
    </tr>
    </thead>
    <xsl:for-each select="ONext">
        <tr>
          <td align="center"><xsl:value-of select="DateAuth"/></td>
          <td align="center"><xsl:value-of select="TotalCount"/></td>
          <td align="center"><xsl:value-of select="Mean"/></td>
          <td align="center"><xsl:value-of select="Median"/></td>
          <td align="center"><xsl:value-of select="Percentile75"/></td>
          <td align="center"><xsl:value-of select="Percentile90"/></td>
        </tr>   
    </xsl:for-each> 


    <!--общий итог -->
        <tr style='background:#D9D9D9'>
          <td align="center"><b>Итого</b></td>
          <td align="center"><b><xsl:value-of select="Itog_TotalCount"/></b></td>
          <td align="center"><b><xsl:value-of select="Itog_Mean"/></b></td>
          <td align="center"><b><xsl:value-of select="Itog_Median"/></b></td>
          <td align="center"><b><xsl:value-of select="Itog_Percentile75"/></b></td>
          <td align="center"><b><xsl:value-of select="Itog_Percentile90"/></b></td>
        </tr>   
  </table>
<!-- подвал -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
