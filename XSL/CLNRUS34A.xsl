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
 <!-- флаг 1/0 Доп.вывод реквизитов -->
 <xsl:variable name="FlagMRN"><xsl:value-of select="FlagMRN"/></xsl:variable> 
 <xsl:variable name="FlagFIO"><xsl:value-of select="FlagFIO"/></xsl:variable> 
 <xsl:variable name="FlagSex"><xsl:value-of select="FlagSex"/></xsl:variable> 
 <xsl:variable name="FlagDOB"><xsl:value-of select="FlagDOB"/></xsl:variable> 
 <xsl:variable name="FlagAge"><xsl:value-of select="FlagAge"/></xsl:variable> 
 <xsl:variable name="FlagPregn"><xsl:value-of select="FlagPregn"/></xsl:variable> 
 <xsl:variable name="FlagAddress"><xsl:value-of select="FlagAddress"/></xsl:variable> 
 <xsl:variable name="FlagDiagn"><xsl:value-of select="FlagDiagn"/></xsl:variable> 
 <xsl:variable name="FlagDateCol"><xsl:value-of select="FlagDateCol"/></xsl:variable> 
 <xsl:variable name="FlagTimeCol"><xsl:value-of select="FlagTimeCol"/></xsl:variable> 
 <xsl:variable name="FlagSpec"><xsl:value-of select="FlagSpec"/></xsl:variable> 
 <xsl:variable name="FlagCategPat"><xsl:value-of select="FlagCategPat"/></xsl:variable> 
 <xsl:variable name="FlagLocPat"><xsl:value-of select="FlagLocPat"/></xsl:variable> 
 <xsl:variable name="FlagDocPat"><xsl:value-of select="FlagDocPat"/></xsl:variable> 
 <xsl:variable name="FlagPayPat"><xsl:value-of select="FlagPayPat"/></xsl:variable> 
 <xsl:variable name="FlagEpis"><xsl:value-of select="FlagEpis"/></xsl:variable> 
 <xsl:variable name="FlagTS"><xsl:value-of select="FlagTS"/></xsl:variable>
 <xsl:variable name="FlagDateExec"><xsl:value-of select="FlagDateExec"/></xsl:variable> 
 <xsl:variable name="FlagTimeExec"><xsl:value-of select="FlagTimeExec"/></xsl:variable> 
 <xsl:variable name="FlagSNOMED"><xsl:value-of select="FlagSNOMED"/></xsl:variable> 
 <!-- флаг 1/0 "Вывести единицы измерения для теста" -->
 <xsl:variable name="FlagUnits"><xsl:value-of select="FlagUnits"/></xsl:variable> 
 <!-- флаг 1/0 "Вывести Цветовую палитру строк в соответствии с Флагом результата" -->
 <xsl:variable name="FlagColor"><xsl:value-of select="FlagColor"/></xsl:variable> 
 <!-- флаг 1/0 "Сортировка данных" -->
 <xsl:variable name="FlagSort1"><xsl:value-of select="FlagSort1"/></xsl:variable> 
 <xsl:variable name="FlagSort2"><xsl:value-of select="FlagSort2"/></xsl:variable> 
 <xsl:variable name="FlagSort3"><xsl:value-of select="FlagSort3"/></xsl:variable> 

  <title>Рез-ты исследований наборов тестов</title>
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
    <p class="Cur16" align="center"><b><xsl:value-of select="NameLaboratoty"/></b></p>
    <p class="Cur14" align="center"><b>Результаты исследований за период c <xsl:value-of select="Date1"/> по <xsl:value-of select="Date2"/></b></p>
    <p class="Cur12" align="left">
          <b>Набор тестов: </b><xsl:value-of select="TestSet"/>
          <xsl:if test='PatLocation != ""'><br/><b>Местоположение пациента:</b><xsl:value-of select="PatLocation"/></xsl:if>       
          <xsl:if test='FlagSort != 0'>
              <br/><b>Сортировка данных:</b>
              <xsl:if test='$FlagSort1 = 1'> 1 - <xsl:value-of select="NameSort1"/> </xsl:if> 
              <xsl:if test='$FlagSort2 = 1'> / 2 - <xsl:value-of select="NameSort2"/> </xsl:if> 
              <xsl:if test='$FlagSort3 = 1'> / 3 - <xsl:value-of select="NameSort3"/> </xsl:if>
          </xsl:if> 
    </p>
  <br/>
  <table class="Cur10" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px">  
    <thead>
    <tr>
        <td width="5%" align="center"><b>№ п/п</b></td> 
        <xsl:if test='$FlagSort1 = 1'><td width="5%" align="center"><b><xsl:value-of select="NameSort1"/></b></td></xsl:if> 
        <xsl:if test='$FlagSort2 = 1'><td width="5%" align="center"><b><xsl:value-of select="NameSort2"/></b></td></xsl:if> 
        <xsl:if test='$FlagSort3 = 1'><td width="5%" align="center"><b><xsl:value-of select="NameSort3"/></b></td></xsl:if> 
        <xsl:if test='$FlagTS = 1'><td width="25%" align="center"><b>Набор тестов</b></td></xsl:if>
        <xsl:if test='$FlagDateExec = 1'><td width="25%" align="center"><b>Дата выполн.</b></td></xsl:if>
        <!--<xsl:if test='$FlagTimeExec = 1'><td width="25%" align="center"><b>Время вып.</b></td></xsl:if>-->
        <xsl:if test='$FlagEpis = 1'><td width="25%" align="center"><b>Лаб.номер</b></td></xsl:if>
        <xsl:if test='$FlagFIO = 1'><td width="25%" align="center"><b>ФИО пациента</b></td></xsl:if>
        <xsl:if test='$FlagMRN = 1'><td width="5%" align="center"><b>Номер МК</b></td></xsl:if>
        <xsl:if test='$FlagSex = 1'><td width="3%" align="center"><b>Пол</b></td></xsl:if> 
        <xsl:if test='$FlagDOB = 1'><td width="3%" align="center"><b>Дата рожд.</b></td></xsl:if> 
        <xsl:if test='$FlagAge = 1'><td width="3%" align="center"><b>Возр.</b></td></xsl:if> 
        <xsl:if test='$FlagPregn = 1'><td width="3%" align="center"><b>Берем</b></td></xsl:if> 
        <xsl:if test='$FlagAddress = 1'><td width="10%" align="center"><b>Адрес пациента</b></td></xsl:if>
        <xsl:if test='$FlagDiagn = 1'><td width="10%" align="center"><b>Клинич.анамнез</b></td></xsl:if>
        <xsl:if test='$FlagDateCol = 1'><td width="5%" align="center"><b>Дата забора</b></td></xsl:if>
        <xsl:if test='$FlagTimeCol = 1'><td width="5%" align="center"><b>Время забора</b></td></xsl:if>
        <xsl:if test='$FlagSpec = 1'><td width="5%" align="center"><b>Тип образца</b></td></xsl:if>
        <xsl:if test='$FlagCategPat = 1'><td width="5%" align="center"><b>Катег.</b></td></xsl:if>
        <xsl:if test='$FlagLocPat = 1'><td width="10%" align="center"><b>Местополож. пациента</b></td></xsl:if>    
        <xsl:if test='$FlagDocPat = 1'><td width="10%" align="center"><b>Врач</b></td></xsl:if>    
        <xsl:if test='$FlagPayPat = 1'><td width="10%" align="center"><b>Плательщик</b></td></xsl:if>
        <xsl:if test='$FlagSNOMED = 1'><td width="10%" align="center"><b>SNOMED</b></td></xsl:if>
        <td width="20%" align="center"><b>Результат</b></td>
        <td width="5%" align="center"><b>Флаг</b></td>
    </tr>
    </thead>
    <xsl:for-each select="ONext">
        <tr>
          <xsl:variable name="BackgroundFlag"><xsl:value-of select="BackColour"/></xsl:variable>
          <td style='background:{$BackgroundFlag}' align="center"><xsl:value-of select="NN"/></td>
          <xsl:if test='$FlagSort1 = 1'><td style='background:{$BackgroundFlag}' align="left" class="Cur12"><b><xsl:value-of select="Sort1"/></b></td></xsl:if> 
          <xsl:if test='$FlagSort2 = 1'><td style='background:{$BackgroundFlag}' align="left" class="xl43"><xsl:value-of select="Sort2"/></td></xsl:if>
          <xsl:if test='$FlagSort3 = 1'><td style='background:{$BackgroundFlag}' align="left" class="xl43"><xsl:value-of select="Sort3"/></td></xsl:if>        
          <xsl:if test='$FlagTS = 1'><td style='background:{$BackgroundFlag}' align="left"><xsl:value-of select="TestSet"/></td></xsl:if>
          <xsl:if test='$FlagDateExec = 1'><td style='background:{$BackgroundFlag}' align="left"><xsl:value-of select="DateExec"/></td></xsl:if>
          <!--<xsl:if test='$FlagTimeExec = 1'><td style='background:{$BackgroundFlag}' align="left"><xsl:value-of select="TimeExec"/></td></xsl:if>-->
          <xsl:if test='$FlagEpis = 1'><td style='background:{$BackgroundFlag}' align="center" class="xl43"><xsl:value-of select="Epis"/></td></xsl:if>
          <xsl:if test='$FlagFIO = 1'><td style='background:{$BackgroundFlag}' align="left" class="xl43"><xsl:value-of select="FIO"/></td></xsl:if>
          <xsl:if test='$FlagMRN = 1'><td style='background:{$BackgroundFlag}' align="center" class="xl43"><xsl:value-of select="MRN"/></td></xsl:if>
          <xsl:if test='$FlagSex = 1'><td style='background:{$BackgroundFlag}' align="center"><xsl:value-of select="Sex"/></td></xsl:if>
          <xsl:if test='$FlagDOB = 1'><td style='background:{$BackgroundFlag}' align="center"><xsl:value-of select="DOB"/></td></xsl:if>
          <xsl:if test='$FlagAge = 1'><td style='background:{$BackgroundFlag}' align="center"><xsl:value-of select="Age"/></td></xsl:if>
          <xsl:if test='$FlagPregn = 1'><td style='background:{$BackgroundFlag}' align="center"><xsl:value-of select="PregnWeek"/></td></xsl:if>
          <xsl:if test='$FlagAddress = 1'><td style='background:{$BackgroundFlag}' align="center"><xsl:value-of select="Address"/></td></xsl:if>
          <xsl:if test='$FlagDiagn = 1'><td style='background:{$BackgroundFlag}' align="center"><xsl:value-of select="Diagn"/></td></xsl:if>                  
          <xsl:if test='$FlagDateCol = 1'><td style='background:{$BackgroundFlag}' align="center"><xsl:value-of select="DateCol"/></td></xsl:if>
          <xsl:if test='$FlagTimeCol = 1'><td style='background:{$BackgroundFlag}' align="center"><xsl:value-of select="TimeCol"/></td></xsl:if>
          <xsl:if test='$FlagSpec = 1'><td style='background:{$BackgroundFlag}' align="center"><xsl:value-of select="Specimen"/></td></xsl:if>
          <xsl:if test='$FlagCategPat = 1'><td style='background:{$BackgroundFlag}' align="center"><xsl:if test='Categ != ""'>"<xsl:value-of select="Categ"/>"</xsl:if></td></xsl:if>
          <xsl:if test='$FlagLocPat = 1'><td style='background:{$BackgroundFlag}' align="left"><xsl:value-of select="Location"/></td></xsl:if>
          <xsl:if test='$FlagDocPat = 1'><td style='background:{$BackgroundFlag}' align="left"><xsl:value-of select="Doctor"/></td></xsl:if>
          <xsl:if test='$FlagPayPat = 1'><td style='background:{$BackgroundFlag}' align="left"><xsl:value-of select="Payment"/></td></xsl:if>
          <xsl:if test='$FlagSNOMED = 1'><td style='background:{$BackgroundFlag}' align="left"><xsl:value-of select="SNOMED"/></td></xsl:if>
          <td style='background:{$BackgroundFlag}' align="left">
              <xsl:for-each select="OResult"> 
                    <xsl:value-of select="TC"/> (<xsl:value-of select="Desc"/>) = <xsl:value-of select="Res"/>  
                    <xsl:if test='Flag != "N"'><b>&#160; * &#160;</b></xsl:if>
                    <xsl:if test='$FlagUnits = 1'> &#160; <xsl:value-of select="Units"/></xsl:if>
                    <br/>
              </xsl:for-each> 
              <xsl:for-each select="OComment"><i><xsl:value-of select="Res"/></i><br/></xsl:for-each>               
          </td> 
          <td style='background:{$BackgroundFlag}' align="center"><xsl:value-of select="Flag"/></td>
        </tr>   
    </xsl:for-each> 
 </table>
 <br/>
    <!--общий итог -->
    <p class="CurGroup">
      <b>Общее число выполненных исследований за заданный период =  <xsl:value-of select="Itog-KolTS"/>
      ; из них "патологических" результатов = <xsl:value-of select="Itog-KolTS-H"/> 
      </b>
    </p>
 <!-- подвал -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
