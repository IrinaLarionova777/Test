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
 <!-- флаг 1/0 "Выводить только активные РЛ" -->
 <xsl:variable name="FlagActiveWS"><xsl:value-of select="FlagActiveWS"/></xsl:variable>
 <!-- флаг 1/0 Доп.вывод реквизитов РЛ -->
 <xsl:variable name="FlagManual"><xsl:value-of select="FlagManual"/></xsl:variable>
 <xsl:variable name="FlagMaxVisits"><xsl:value-of select="FlagMaxVisits"/></xsl:variable>
 <xsl:variable name="FlagColumn"><xsl:value-of select="FlagColumn"/></xsl:variable>
 <xsl:variable name="FlagCalculate"><xsl:value-of select="FlagCalculate"/></xsl:variable>
 <xsl:variable name="FlagDoc"><xsl:value-of select="FlagDoc"/></xsl:variable>
 <xsl:variable name="FlagPrevResult"><xsl:value-of select="FlagPrevResult"/></xsl:variable>
 <xsl:variable name="FlagRearrange"><xsl:value-of select="FlagRearrange"/></xsl:variable>
 <xsl:variable name="FlagPAP"><xsl:value-of select="FlagPAP"/></xsl:variable>
 <xsl:variable name="FlagClose"><xsl:value-of select="FlagClose"/></xsl:variable>
 <xsl:variable name="FlagClinNotes"><xsl:value-of select="FlagClinNotes"/></xsl:variable>
 <xsl:variable name="FlagSynonym"><xsl:value-of select="FlagSynonym"/></xsl:variable>
 <xsl:variable name="FlagPending"><xsl:value-of select="FlagPending"/></xsl:variable>
 <xsl:variable name="FlagIndicator"><xsl:value-of select="FlagIndicator"/></xsl:variable>
 <xsl:variable name="FlagPrintOnlyTS"><xsl:value-of select="FlagPrintOnlyTS"/></xsl:variable>
 <xsl:variable name="FlagDirect"><xsl:value-of select="FlagDirect"/></xsl:variable>
 <xsl:variable name="FlagFont"><xsl:value-of select="FlagFont"/></xsl:variable>
 <xsl:variable name="FlagComments"><xsl:value-of select="FlagComments"/></xsl:variable>
 <xsl:variable name="FlagLastPrint"><xsl:value-of select="FlagLastPrint"/></xsl:variable>
 <xsl:variable name="FlagLastNum"><xsl:value-of select="FlagLastNum"/></xsl:variable>
 <!-- флаг 1/0 "Отдел/Наборы тестов/Контроль качества" -->
 <xsl:variable name="FlagDep"><xsl:value-of select="FlagDep"/></xsl:variable>
 <xsl:variable name="FlagTS"><xsl:value-of select="FlagTS"/></xsl:variable>
 <xsl:variable name="FlagQC"><xsl:value-of select="FlagQC"/></xsl:variable>
  <title>Список рабочих листов</title>
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
    <p class="Cur14" align="center"><b>Список рабочих листов для отдела: <xsl:value-of select="Department"/></b></p>
    <br/>
    <table class="Cur10" border="1" sellspacing="0" width="100%" bordercolor="#000000" 
           style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 5.4pt 0cm 5.4pt'">  
      <thead> <!-- повторять заголовок таблицы на каждой странице  -->
      <tr>
        <td width="5%" align="center"><b>Код</b></td>
        <td width="20%" align="center"><b>Наименование РЛ</b></td>
        <xsl:if test='$FlagActiveWS = 0'><td width="3%" align="center"><b>Акт.</b></td></xsl:if>
        <xsl:if test='$FlagManual = 1'><td width="3%" align="center"><b>Ручное<br/>создание</b></td></xsl:if>
        <xsl:if test='$FlagMaxVisits = 1'><td width="3%" align="center"><b>MAX кол-во<br/>образцов</b></td></xsl:if>        
        <xsl:if test='$FlagColumn = 1'>
            <td width="3%" align="center"><b>Размер столб.<br/>для печати</b></td>
            <td width="3%" align="center"><b>Размер столб.<br/>для ввода</b></td>
        </xsl:if>
        <xsl:if test='$FlagCalculate = 1'><td width="3%" align="center"><b>Вычисл.<br/>тесты</b></td></xsl:if>
        <xsl:if test='$FlagDoc = 1'><td width="3%" align="center"><b>Врач</b></td></xsl:if>
        <xsl:if test='$FlagPrevResult = 1'><td width="3%" align="center"><b>Пред.<br/>рез-ты</b></td></xsl:if>
        <xsl:if test='$FlagRearrange = 1'><td width="3%" align="center"><b>Перестр.<br/>при печ.</b></td></xsl:if>
        <xsl:if test='$FlagPAP = 1'><td width="3%" align="center"><b>Печать<br/>разреш.пац.</b></td></xsl:if>
        <xsl:if test='$FlagClose = 1'><td width="3%" align="center"><b>Закрыть<br/>после печати</b></td></xsl:if>                                
        <xsl:if test='$FlagClinNotes = 1'><td width="3%" align="center"><b>Клинич.<br/>примеч.</b></td></xsl:if>
        <xsl:if test='$FlagSynonym = 1'>
            <td width="3%" align="center"><b>Синоним<br/>для теста</b></td>
            <td width="3%" align="center"><b>Синоним<br/>для набора</b></td>            
        </xsl:if>
        <xsl:if test='$FlagPending = 1'><td width="3%" align="center"><b>Перемест.ждущ.<br/>пац.в тек.РЛ</b></td></xsl:if>
        <xsl:if test='$FlagIndicator = 1'>
            <td width="3%" align="center"><b>Индикатор<br/>рез-тов</b></td>
            <td width="3%" align="center"><b>Индикатор<br/>статусов</b></td>
        </xsl:if>
        <xsl:if test='$FlagPrintOnlyTS = 1'><td width="3%" align="center"><b>Наб.тестов без<br/>разб.по тестам</b></td></xsl:if>                       
        <xsl:if test='$FlagDirect = 1'><td width="3%" align="center"><b>Расположение<br/>листа</b></td></xsl:if>
        <xsl:if test='$FlagFont = 1'><td width="3%" align="center"><b>Шрифт</b></td></xsl:if>
        <xsl:if test='$FlagComments = 1'><td width="15%" align="center"><b>Комментарий</b></td></xsl:if>
        <xsl:if test='$FlagDep = 1'><td width="3%" align="center"><b>Отдел</b></td></xsl:if>
        <xsl:if test='$FlagTS = 1'><td width="15%" align="center"><b>Наборы тестов</b></td></xsl:if>
        <xsl:if test='$FlagQC = 1'><td width="15%" align="center"><b>Контроль Качества</b></td></xsl:if>                
        <xsl:if test='$FlagLastPrint = 1'><td align="center"><b>Дата/время<br/>последней печати</b></td></xsl:if>
        <xsl:if test='$FlagLastNum = 1'><td align="center"><b>Последний № РЛ</b></td></xsl:if>              
      </tr>
      </thead>      
      <xsl:for-each select="ONext">	
         <tr>
          <td align="center"><xsl:value-of select="Code"/></td>
          <td align="left"><xsl:value-of select="Desc"/></td>
          <xsl:if test='$FlagActiveWS = 0'><td align="center"><xsl:value-of select="FlagActive"/></td></xsl:if>
          <xsl:if test='$FlagManual = 1'><td align="center"><xsl:value-of select="ManualCreation"/></td></xsl:if>
          <xsl:if test='$FlagMaxVisits = 1'><td align="center"><xsl:value-of select="MaxVisits"/></td></xsl:if>          
          <xsl:if test='$FlagColumn = 1'>
              <td align="center"><xsl:value-of select="ColumnPrinting"/></td>
              <td align="center"><xsl:value-of select="ColumnEntry"/></td>
          </xsl:if>
          <xsl:if test='$FlagCalculate = 1'><td align="center"><xsl:value-of select="PrintCalculatedFields"/></td></xsl:if>
          <xsl:if test='$FlagDoc = 1'><td align="center"><xsl:value-of select="PrintDoctor"/></td></xsl:if>
          <xsl:if test='$FlagPrevResult = 1'><td align="center"><xsl:value-of select="PreviousResults"/></td></xsl:if>
          <xsl:if test='$FlagRearrange = 1'><td align="center"><xsl:value-of select="RearrangeWhenPrinting"/></td></xsl:if>
          <xsl:if test='$FlagPAP = 1'><td align="center"><xsl:value-of select="PrintAuthorisedPatients"/></td></xsl:if>                  
          <xsl:if test='$FlagClose = 1'><td align="center"><xsl:value-of select="CloseAfterPrinting"/></td></xsl:if>          
          <xsl:if test='$FlagClinNotes = 1'><td align="center"><xsl:value-of select="ClinicalNotes"/></td></xsl:if>
          <xsl:if test='$FlagSynonym = 1'>
              <td align="center"><xsl:value-of select="UseSynonymsForTI"/></td>
              <td align="center"><xsl:value-of select="UseSynonymsForTS"/></td>
          </xsl:if>
          <xsl:if test='$FlagPending = 1'><td align="center"><xsl:value-of select="PendingToCurrent"/></td></xsl:if>
          <xsl:if test='$FlagIndicator = 1'>
              <td align="center"><xsl:value-of select="ResultIndicators"/></td>
              <td align="center"><xsl:value-of select="StatusIndicators"/></td>
          </xsl:if>
          <xsl:if test='$FlagPrintOnlyTS = 1'><td align="center"><xsl:value-of select="PrintOnlyTS"/></td></xsl:if>
          <xsl:if test='$FlagDirect = 1'><td align="center"><xsl:value-of select="PrintDirection"/></td></xsl:if>
          <xsl:if test='$FlagFont = 1'><td align="center"><xsl:value-of select="Font"/></td></xsl:if>
          <xsl:if test='$FlagComments = 1'>
              <td align="left"><xsl:for-each select="OComments"><xsl:value-of select="Desc"/><br/></xsl:for-each></td>
          </xsl:if>
          <xsl:if test='$FlagDep = 1'><td align="center"><xsl:value-of select="Department"/></td></xsl:if>
          <xsl:if test='$FlagTS = 1'>
              <td align="left"><xsl:for-each select="OTS"><xsl:value-of select="TestSet"/><br/></xsl:for-each></td>
          </xsl:if>
          <xsl:if test='$FlagQC = 1'>
              <td align="left"><xsl:for-each select="OQC"><xsl:value-of select="Desc"/><br/></xsl:for-each></td>
          </xsl:if>
          <xsl:if test='$FlagLastPrint = 1'><td align="center"><xsl:value-of select="DateTimeLastPrint"/></td></xsl:if>
          <xsl:if test='$FlagLastNum = 1'><td align="center"><xsl:value-of select="LastNum"/></td></xsl:if>
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
