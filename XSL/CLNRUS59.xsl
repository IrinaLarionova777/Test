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

  <title>Журнал учета рабочего времени анализатора</title>
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
    <p class="Cur16" align="left"><b><xsl:value-of select="NameReport"/></b></p>
    <p class="Cur14" align="left"><b>за период c <xsl:value-of select="DateFrom"/> по <xsl:value-of select="DateTo"/></b></p>
  <br/>
    <table class="Cur12" border="1" sellspacing="0" width="60%" bordercolor="#000000" 
           style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 5.4pt 0cm 5.4pt'">  

      <xsl:for-each select="OGrAnalyzer">
         <tr>
         </tr>	
         <tr style='background:#D9D9D9'>
          <td align="left" width="100%"><b><xsl:value-of select="Analyzer"/></b></td>
         </tr>
          <tr>
          <td colspan="3">
           <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" 
           style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 5.4pt 0cm 5.4pt'">  
           <thead> <!-- повторять заголовок таблицы на каждой странице  -->
              <td width="20%" align="center" VALIGN="TOP"><b>Дата</b></td>
	      <td width="20%" align="center" VALIGN="TOP"><b>Время первого исследования</b></td>
	      <td width="20%" align="center" VALIGN="TOP"><b>Время последнего исследования</b></td>
	      <td width="20%" align="center" VALIGN="TOP"><b>Время работы (мин.)</b></td>
              <td width="20%" align="center" VALIGN="TOP"><b>Время работы (час.мин)</b></td>
           </thead>      

            <xsl:for-each select="OGrDay">
              <tr>
                  <td align="left" VALIGN="TOP"><xsl:value-of select="Date"/></td>
	          <td align="right" VALIGN="TOP"><xsl:value-of select="Min"/></td>
	          <td align="right" VALIGN="TOP"><xsl:value-of select="Max"/></td>
	          <td align="right" VALIGN="TOP"><xsl:value-of select="Ras"/></td>
                  <td align="right" VALIGN="TOP"><xsl:value-of select="RasHour"/></td>
	      </tr>
            </xsl:for-each>
    
            <tr style='background:#D9D9D9'>
                  <td align="left" VALIGN="TOP" colspan="3"><b>Всего <xsl:value-of select="Analyzer"/></b></td>
	          <td align="right" VALIGN="TOP"><b><xsl:value-of select="Ras"/></b></td>
                  <td align="right" VALIGN="TOP"><b><xsl:value-of select="RasHour"/></b></td>

	    </tr>
    
          </table>
         </td>
         </tr>
      </xsl:for-each>
     
      <tr>
         <td align="left" VALIGN="TOP"><b>Итого время работы <xsl:value-of select="RasO"/> мин. ( <xsl:value-of select="RasHourO"/> час <xsl:value-of select="RasMinutO"/> мин.)</b></td>
      </tr>
     
   </table>

 <br/>
    <!--общий итог -->
 <!-- подвал -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
