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

   <xsl:variable name="DateFrom"><xsl:value-of select="DateFrom"/></xsl:variable>
   <xsl:variable name="DateTo"><xsl:value-of select="DateTo"/></xsl:variable>
   <xsl:variable name="FlagDetailsForTests"><xsl:value-of select="FlagDetailsForTests"/></xsl:variable>

  <title>Отчет для анализа работы прибора</title>
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
    <p class="Cur14" align="left">
	  <b>
		 Отчет для анализа работы приборов за период с <xsl:value-of select="$DateFrom"/> по <xsl:value-of select="$DateTo"/>
	     <xsl:if test='$FlagDetailsForTests = 1'>
				 (с детализацией по тестам)                             
	     </xsl:if> 
	  </b>
    </p>
    <br/>
    <table class="Cur12" border="1" sellspacing="0" width="100%" bordercolor="#000000" 
           style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 5.4pt 0cm 5.4pt'">  
      <xsl:for-each select="OGRDevice">	
         <tr style='background:#D9D9D9'>
          <td align="left" width="100%"><b>Анализотор <xsl:value-of select="Device"/></b></td>
         </tr>
          <tr>
          <td>
           <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" 
           style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 5.4pt 0cm 5.4pt'">  
           <thead> <!-- повторять заголовок таблицы на каждой странице  -->
            <tr>
             <td width="5%" align="center"  VALIGN="TOP"><b>Номер эпизода</b></td>
             <td width="30%" align="center" VALIGN="TOP"><b>Тесты</b></td>

             <xsl:if test='$FlagDetailsForTests != 1'>
               <td width="10%" align="center" VALIGN="TOP"><b>Дата и время регистрации эпизода</b></td>
             </xsl:if>
             <xsl:if test='$FlagDetailsForTests = 1'>
               <td width="10%" align="center" VALIGN="TOP"><b>Дата и время регистрации эпизода или теста</b></td>
             </xsl:if>
 
             <td width="10%" align="center" VALIGN="TOP"><b>Дата и время отправки задания на прибор</b></td>
             <td width="10%" align="center" VALIGN="TOP"><b>Дата и время получения результатов с прибора</b></td>
			 <td width="15%" align="center" VALIGN="TOP"><b>Дата и время авторизации результатов</b></td>	
             <td width="5%" align="center" VALIGN="TOP"><b>Срочность</b></td>
			 <td width="5%" align="center" VALIGN="TOP"><b>Время между регистрацией и авторизацией (мин)</b></td>
			 <td width="5%" align="center" VALIGN="TOP"><b>Время между отправкой задания на прибор и получения результатов с прибора (мин)</b></td>
			</tr>
           </thead>      

            <xsl:for-each select="OGrEpis">
              <xsl:variable name="Episode"><xsl:value-of select="Episode"/></xsl:variable>	
              
               <xsl:if test='$Episode = "Average"'>
                <tr style='background:#D9D9D9'>
                  <td align="left" colspan="3" VALIGN="TOP"><b>Средние значения по эпизодам</b></td>
                  <td align="left" VALIGN="TOP"><xsl:value-of select="DateTimeSet"/></td>
                  <td align="left" VALIGN="TOP"><xsl:value-of select="DateTimeGet"/></td>
	          <td align="left" VALIGN="TOP"><xsl:value-of select="DateTimeAuth"/></td>
                  <td align="left" VALIGN="TOP"><xsl:value-of select="Cito"/></td>
	          <td align="right" VALIGN="TOP"><b><xsl:value-of select="DiffEntryAuth"/></b></td>
	          <td align="right" VALIGN="TOP"><b><xsl:value-of select="DiffSetGet"/></b></td>
                </tr>
               </xsl:if>
               <xsl:if test='$Episode != "Average"'>
                <tr>
                  <td align="center" VALIGN="TOP"><xsl:value-of select="Episode"/></td>
                  <td align="left" VALIGN="TOP"><xsl:value-of select="Tests"/></td>
                  <td align="left" VALIGN="TOP"><xsl:value-of select="DateTimeEntry"/></td>          
                  <td align="left" VALIGN="TOP"><xsl:value-of select="DateTimeSet"/></td>
                  <td align="left" VALIGN="TOP"><xsl:value-of select="DateTimeGet"/></td>
	          <td align="left" VALIGN="TOP"><xsl:value-of select="DateTimeAuth"/></td>
                  <td align="left" VALIGN="TOP"><xsl:value-of select="Cito"/></td>
	          <td align="right" VALIGN="TOP"><xsl:value-of select="DiffEntryAuth"/></td>
	          <td align="right" VALIGN="TOP"><xsl:value-of select="DiffSetGet"/></td>
                 </tr>
               </xsl:if>
            </xsl:for-each>
          </table>
         </td>
         </tr>
      </xsl:for-each>
   </table> 

    <br/>
    <xsl:if test='$FlagDetailsForTests = 1'> 
      <p class="Cur14" align="left"><b>Средние величины по тестам</b></p>
    <table class="Cur12" border="1" sellspacing="0" width="100%" bordercolor="#000000" 
           style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 5.4pt 0cm 5.4pt'">  
      <xsl:for-each select="OGRDeviceAvg">	
         <tr>
          <td align="left" width="100%"><b>Анализотор <xsl:value-of select="Device"/></b></td>
         </tr>
          <tr>
          <td>
           <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" 
           style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 5.4pt 0cm 5.4pt'">  
           <thead> <!-- повторять заголовок таблицы на каждой странице  -->
            <tr>
             <td width="30%" align="center" VALIGN="TOP"><b>Тест</b></td>
	     <td width="5%" align="center" VALIGN="TOP"><b>Время между регистрацией и авторизацией (мин)</b></td>
	      <td width="5%" align="center" VALIGN="TOP"><b>Время между отправкой задания на прибор и получения результатов с прибора (мин)</b></td>
	    </tr>
           </thead>      

            <xsl:for-each select="OGrTestAvg">
              <tr>
                  <td align="left" VALIGN="TOP"><xsl:value-of select="Test"/></td>
	          <td align="right" VALIGN="TOP"><xsl:value-of select="DiffEntryAuth"/></td>
	          <td align="right" VALIGN="TOP"><xsl:value-of select="DiffSetGet"/></td>
	      </tr>
            </xsl:for-each>
          </table>
         </td>
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
