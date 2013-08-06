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
   <meta name="ProgId" content="Excel.Sheet"/>
   <meta name="Generator" content="Microsoft Excel 11"/>
   <meta name="Originator" content="Microsoft Excel 11"/>
 
 <!-- флаг 1/2/3 "тип отчета": 1 - Cписок пациентов / 2 - Cписок результатов / 3 - Результаты наборов тестов / 4 - Результаты тестов -->
 <xsl:variable name="FlagReport"><xsl:value-of select="FlagReport"/></xsl:variable>
 <!-- флаг 1/0 "Вывести местоположение пациента" -->
 <xsl:variable name="FlagLocPat"><xsl:value-of select="FlagLocPat"/></xsl:variable>
 <!-- флаг 1/0 "Вывести лечащего врача пациента" -->
 <xsl:variable name="FlagDocPat"><xsl:value-of select="FlagDocPat"/></xsl:variable>
 <!-- флаг 1/0 "Вывести категорию пациента" -->
 <xsl:variable name="FlagCatPat"><xsl:value-of select="FlagCatPat"/></xsl:variable>
 <!-- флаг 1/0 "Вывести плательщика" -->
 <xsl:variable name="FlagPayment"><xsl:value-of select="FlagPayment"/></xsl:variable>
 <!-- флаг 1/0 Выводить ошибки -->
 <xsl:variable name="FlagError"><xsl:value-of select="FlagError"/></xsl:variable>
 <!-- флаг 1/0 Вывести Дату забора образца" -->
 <xsl:variable name="FlagDateCol"><xsl:value-of select="FlagDateCol"/></xsl:variable>
     
  <title>Статистика по категориям пациентов (результаты)</title>
  <xsl:value-of select="$pass" disable-output-escaping="yes"/>
  <style type="text/css">
     body {font-family: Times New Roman ;}
     .Cur9   { 	font-size : 9pt;  }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt; }
     .Cur12  { 	font-size : 12pt; }
     .Cur14  { font-size : 14pt;  }
     .Cur16 { font-size : 16pt; }
     .xl42	{mso-style-parent:style0;
	           font-size:11.0pt;
	           font-family:"Times New Roman", serif;
	           mso-font-charset:204;
	           mso-number-format:Fixed;
	           text-align:right;
	           border:.5pt solid black;
	           white-space:normal;}
     .xl43	{   mso-style-parent:style0;
	          font-family:"Times New Roman", serif;
	          mso-font-charset:204;
	          mso-number-format:"\@";
	          text-align:center;
	          border:.5pt solid black;
	          white-space:normal;}      
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
    <p class="Cur14" align="center"><b>Статистика выполненных наборов тестов по категориям пациентов <xsl:value-of select="TC"/>
       <br/>за период c <xsl:value-of select="Date1"/> по <xsl:value-of select="Date2"/></b></p>
    <p class="Cur12" align="center">
      <br/>Отдел: <xsl:value-of select="Department"/> / Категория пациента: <xsl:value-of select="PatCategor"/><br/>
      Тип отчета: <xsl:if test='$FlagReport = 1'>1 - Cписок пациентов</xsl:if>
                  <xsl:if test='$FlagReport = 2'>2 - Cписок результатов</xsl:if>
                  <xsl:if test='$FlagReport = 3'>3 - Результаты наборов тестов</xsl:if>
                  <xsl:if test='$FlagReport = 4'>4 - Результаты тестов</xsl:if>
      <br/> 
    </p>
<br/> 
<!-- .........................  1 - Cписок пациентов  ..................................-->  
<xsl:if test='$FlagReport = 1'>
 <table class="Cur9" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px">  
    <tr>
        <td width="5%" align="center"><b>Регистр.№</b></td>
        <td width="25%" align="center"><b>ФИО пациента</b></td>
        <td width="3%" align="center"><b>Пол</b></td>
        <td width="5%" align="center"><b>Дата рожд.</b></td>
        <td width="5%" align="center"><b>Лаб. номер</b></td>
        <xsl:if test='$FlagDateCol = 1'><td width="3%" align="center"><b>Дата забора</b></td></xsl:if>  
        <xsl:if test='$FlagLocPat = 1'><td width="10%" align="center"><b>Местоположение пациента</b></td></xsl:if>  
        <xsl:if test='$FlagDocPat = 1'><td width="10%" align="center"><b>Врач</b></td></xsl:if>  
        <xsl:if test='$FlagCatPat = 1'><td width="5%" align="center"><b>Катег.</b></td></xsl:if> 
        <xsl:if test='$FlagPayment = 1'><td width="15%" align="center"><b>Плательщик</b></td></xsl:if>  
        <td width="20%" align="center"><b>Набор тестов</b></td>
        <td width="5%" align="center"><b>Кол-во</b></td>
    </tr>
    <xsl:for-each select="OGr">	
        <tr>
          <td align="left" class="xl43"><b><xsl:value-of select="MRN"/></b></td>
          <td align="left" class="xl43"><xsl:value-of select="FIO"/></td>
          <td align="center"><xsl:value-of select="Sex"/></td>
          <td align="center"><xsl:value-of select="DB"/></td>
          <td align="center" class="xl43"><b><xsl:value-of select="Epis"/></b></td>
          <xsl:if test='$FlagDateCol = 1'><td align="center"><xsl:value-of select="DateCol"/></td></xsl:if>   
          <xsl:if test='$FlagLocPat = 1'><td align="left"><xsl:value-of select="Location"/></td></xsl:if>  
          <xsl:if test='$FlagDocPat = 1'><td align="left"><xsl:value-of select="Doctor"/></td></xsl:if>
          <xsl:if test='$FlagCatPat = 1'><td align="center"><xsl:value-of select="Categ"/></td></xsl:if>
          <xsl:if test='$FlagPayment = 1'><td align="left"><xsl:value-of select="Payment"/></td></xsl:if>            
          <td align="left"><xsl:value-of select="TS"/></td>
          <td align="right"><b><xsl:value-of select="Count"/></b></td>       
        </tr> 
    </xsl:for-each> 
 </table>
</xsl:if>
<!-- ...........................  2 - Cписок результатов  ..............................-->  
<xsl:if test='$FlagReport = 2'>
 <table class="Cur9" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px">  
    <tr>
        <td width="5%" align="center"><b>Регистр.№</b></td>
        <td width="25%" align="center"><b>ФИО пациента</b></td>
        <td width="3%" align="center"><b>Пол</b></td>
        <td width="5%" align="center"><b>Дата рожд.</b></td>
        <td width="5%" align="center"><b>Лаб. номер</b></td>
        <xsl:if test='$FlagDateCol = 1'><td width="3%" align="center"><b>Дата забора</b></td></xsl:if>   
        <xsl:if test='$FlagLocPat = 1'><td width="10%" align="center"><b>Местоположение пациента</b></td></xsl:if>  
        <xsl:if test='$FlagDocPat = 1'><td width="10%" align="center"><b>Врач</b></td></xsl:if>  
        <xsl:if test='$FlagCatPat = 1'><td width="5%" align="center"><b>Катег.</b></td></xsl:if> 
        <xsl:if test='$FlagPayment = 1'><td width="15%" align="center"><b>Плательщик</b></td></xsl:if>  
        <td width="20%" align="center"><b>Результаты</b></td>
    </tr>
    <xsl:for-each select="OGr">	
        <tr>
          <td align="left" class="xl43"><b><xsl:value-of select="MRN"/></b></td>
          <td align="left" class="xl43"><xsl:value-of select="FIO"/></td>
          <td align="center"><xsl:value-of select="Sex"/></td>
          <td align="center"><xsl:value-of select="DB"/></td>
          <td align="center" class="xl43"><b><xsl:value-of select="Epis"/></b></td>
          <xsl:if test='$FlagDateCol = 1'><td align="center"><xsl:value-of select="DateCol"/></td></xsl:if>    
          <xsl:if test='$FlagLocPat = 1'><td align="left"><xsl:value-of select="Location"/></td></xsl:if>  
          <xsl:if test='$FlagDocPat = 1'><td align="left"><xsl:value-of select="Doctor"/></td></xsl:if>
          <xsl:if test='$FlagCatPat = 1'><td align="center"><xsl:value-of select="Categ"/></td></xsl:if>
          <xsl:if test='$FlagPayment = 1'><td align="left"><xsl:value-of select="Payment"/></td></xsl:if>            
          <td class="xl43">
              <xsl:for-each select="OGrResult"><b>[<xsl:value-of select="TS"/></b>] <xsl:value-of select="Res"/><br/></xsl:for-each>
          </td>
        </tr> 
    </xsl:for-each> 
 </table>
</xsl:if>
<!-- ........................... 3 - Результаты наборов тестов / 4 - Результаты тестов .................................-->  
<xsl:if test='$FlagReport > 2'>
 <table class="Cur9" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px">  
    <tr>
        <td width="5%" align="center"><b>Регистр.№</b></td>
        <td width="25%" align="center"><b>ФИО пациента</b></td>
        <td width="3%" align="center"><b>Пол</b></td>
        <td width="5%" align="center"><b>Дата рожд.</b></td>
        <td width="5%" align="center"><b>Лаб. номер</b></td>
        <xsl:if test='$FlagDateCol = 1'><td width="3%" align="center"><b>Дата забора</b></td></xsl:if>   
        <xsl:if test='$FlagLocPat = 1'><td width="10%" align="center"><b>Местоположение пациента</b></td></xsl:if>  
        <xsl:if test='$FlagDocPat = 1'><td width="10%" align="center"><b>Врач</b></td></xsl:if>  
        <xsl:if test='$FlagCatPat = 1'><td width="5%" align="center"><b>Катег.</b></td></xsl:if> 
        <xsl:if test='$FlagPayment = 1'><td width="15%" align="center"><b>Плательщик</b></td></xsl:if>  
        <xsl:for-each select="OCol"><td width="3%" align="center"><b><xsl:value-of select="Code"/></b></td></xsl:for-each>
    </tr>
    <xsl:for-each select="OGr">	
        <tr>
          <td align="left" class="xl43"><b><xsl:value-of select="MRN"/></b></td>
          <td align="left" class="xl43"><xsl:value-of select="FIO"/></td>
          <td align="center"><xsl:value-of select="Sex"/></td>
          <td align="center"><xsl:value-of select="DB"/></td>
          <td align="center" class="xl43"><b><xsl:value-of select="Epis"/></b></td>
          <xsl:if test='$FlagDateCol = 1'><td align="center"><xsl:value-of select="DateCol"/></td></xsl:if>    
          <xsl:if test='$FlagLocPat = 1'><td align="left"><xsl:value-of select="Location"/></td></xsl:if>  
          <xsl:if test='$FlagDocPat = 1'><td align="left"><xsl:value-of select="Doctor"/></td></xsl:if>
          <xsl:if test='$FlagCatPat = 1'><td align="center"><xsl:value-of select="Categ"/></td></xsl:if>
          <xsl:if test='$FlagPayment = 1'><td align="left"><xsl:value-of select="Payment"/></td></xsl:if>            
          <xsl:for-each select="OCol"><td class="xl43"><xsl:value-of select='Result'/></td></xsl:for-each>
        </tr> 
    </xsl:for-each> 
 </table>
</xsl:if>
 <!-- подвал -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 <!-- флаг 1/0 Выводить ошибки -->
 <xsl:if test='$FlagError = 1'>
  <p class="Cur12"><b>Список ошибок</b></p>
  <table class="Cur10" border="0" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px">
    <xsl:for-each select="OERROR">	
      <tr><td colspan="5"><xsl:value-of select="Er"/></td></tr>
    </xsl:for-each>      
 </table>
 <br/>
</xsl:if>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
