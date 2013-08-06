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
 
 <!-- флаг 1/0 "Расшифровка по группам наборов тестов" -->
 <xsl:variable name="FlagDetailsGR"><xsl:value-of select="FlagDetailsGR"/></xsl:variable>
 <!-- флаг 1/0 "Расшифровка по наборам тестов" -->
 <xsl:variable name="FlagDetailsTS"><xsl:value-of select="FlagDetailsTS"/></xsl:variable>
 <!-- флаг 1/0 Доп.итог по результатам наборов тестов (норма/патология) -->
 <xsl:variable name="FlagNorm"><xsl:value-of select="FlagNorm"/></xsl:variable>
 <!-- флаг 1/0 "Расшифровка по тестам" -->
 <xsl:variable name="FlagDetailsTC"><xsl:value-of select="FlagDetailsTC"/></xsl:variable>   
 <!-- флаг 1/0 "Количество тестов, для ктр. был проведен Контроль Качества" -->   
 <xsl:variable name="FlagQC"><xsl:value-of select="FlagQC"/></xsl:variable>   
 <!-- флаг 1/0 "Количество пациентов/лаб.номеров/образцов" -->
 <xsl:variable name="FlagEpis"><xsl:value-of select="FlagEpis"/></xsl:variable>   
 <!-- флаг 1/0 "Расшифровка по полученным образцам (пробиркам)" -->   
 <xsl:variable name="FlagSpecimen"><xsl:value-of select="FlagSpecimen"/></xsl:variable>   
 <!-- флаг 1/0 "Кол-во лаб.номеров зарегистр.через Medtak/Labtrak" -->   
 <xsl:variable name="FlagSystem"><xsl:value-of select="FlagSystem"/></xsl:variable>   
 <!-- флаг 1/0 "Доп.итог по cito (срочные назначения)" -->   
 <xsl:variable name="FlagCito"><xsl:value-of select="FlagCito"/></xsl:variable>      
  
  <title>Деятельность лаборатории за период</title>
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
     mso-page-orientation:portrate;
     size:210mm 297mm;
     margin:10mm 10mm 10mm 10mm; }
     div.Section1{page:Section1;}
  </style> 
 </head>
 <body>
 <div class="Section1">
    <p class="Cur16" align="center"><b><xsl:value-of select="NameLaboratoty"/></b></p>
    <p class="Cur14" align="center"><b>Деятельность отделения за период c <xsl:value-of select="Date1"/> по <xsl:value-of select="Date2"/></b></p>
    <p class="Cur12" align="center">Отдел лаборатории: <xsl:value-of select="Department"/></p>
  <br/>
  <table class="Cur12" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
  <xsl:if test='$FlagEpis = 0'> 
   <tr align="center">
     <td width="5%"><b>№ п/п</b></td>
     <td width="55%"><b>Наименование</b></td>
     <td width="10%"><b>Выполнено <br/>наборов</b></td>
     <td width="10%"><b>Выполнено <br/>тестов</b></td>
   </tr>
   <tr>
     <td></td>
     <td></td>
     <td></td>
     <td></td>
   </tr>    
  </xsl:if>
  <xsl:if test='$FlagEpis = 1'> 
   <tr align="center">
     <td width="5%" rowspan="2"><b>№ п/п</b></td>
     <td width="55%" rowspan="2"><b>Наименование</b></td>
     <td width="10%" rowspan="2"><b>Выполнено <br/>наборов</b></td>
     <td width="10%" rowspan="2"><b>Выполнено <br/>тестов</b></td>
     <td width="10%" rowspan="2"><b>Кол-во <br/>пациентов</b></td>
     <td width="10%" rowspan="2"><b>Кол-во <br/>лаб.N</b></td>  
     <xsl:if test='$FlagSystem = 1'>
        <td width="10%" colspan="2">из них</td>    
     </xsl:if>
     <td width="10%" rowspan="2"><b>Кол-во <br/>образцов</b></td>
   </tr>
   <tr>
     <xsl:if test='$FlagSystem = 1'>
       <td width="5%">МТ</td>
       <td width="5%">LT</td>      
     </xsl:if>
   </tr>
   </xsl:if>
   <tr style='background:#D9D9D9'>
     <td></td>
     <td><b>ВСЕГО</b></td>
     <td align="right"><b><xsl:value-of select="ItogoTS"/></b></td>
     <td align="right"><b><xsl:value-of select="ItogoTC"/></b></td>
     <xsl:if test='$FlagEpis = 1'>
        <td align="right"><b><xsl:value-of select="ItogoPat"/></b></td>
        <td align="right"><b><xsl:value-of select="ItogoEpis"/></b></td>  
        <xsl:if test='$FlagSystem = 1'>
            <td align="right"><xsl:value-of select="ItogoEpisMT"/></td>
            <td align="right"><xsl:value-of select="ItogoEpisLT"/></td>
         </xsl:if>   
        <td align="right"><xsl:value-of select="ItogoSpecimen"/></td>
     </xsl:if>
   </tr>
   <tr>
     <td></td>
     <td><b>Из них:</b></td>
     <td></td>
   </tr>   
   <xsl:for-each select="ODep">	
     <tr>
       <td align="left"><xsl:value-of select="NGr"/></td>
       <td align="left"><xsl:value-of select="Desc"/></td>
       <td align="right"><xsl:value-of select="KolTS"/></td>
       <td align="right"><xsl:value-of select="KolTC"/></td>
       <xsl:if test='$FlagEpis = 1'>
          <td align="right"><b><xsl:value-of select="KolPat"/></b></td>
          <td align="right"><b><xsl:value-of select="KolEpis"/></b></td>      
          <xsl:if test='$FlagSystem = 1'>
              <td align="right"><xsl:value-of select="KolEpisMT"/></td>   
              <td align="right"><xsl:value-of select="KolEpisLT"/></td>   
           </xsl:if>
           <td align="right"><xsl:value-of select="KolSpecimen"/></td>
       </xsl:if>
     </tr>
   </xsl:for-each>
  </table>

 <!--  "Расшифровка по группам наборам тестов" -->
 <xsl:if test='$FlagDetailsGR = 1'>
  <br/><p class="Cur14"><b>Расшифровка по группам наборов тестов:</b></p>
  <br/><br/>
  <table class="Cur12" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
   <tr align="center">
     <td width="20%"><b>Код</b></td>
     <td width="60%"><b>Наименование группы наборов тестов</b></td>
     <td width="10%"><b>Выполнено <br/>наборов</b></td>
     <td width="10%"><b>Выполнено <br/>тестов</b></td>    
   </tr>
   <xsl:for-each select="OGroup">	
    <xsl:if test='$FlagDetailsTS = 0'>
      <tr>
        <td><xsl:value-of select="Code"/></td> 
        <td><xsl:value-of select="Desc"/></td>
        <td align="right"><xsl:value-of select="KolTS"/></td>
        <td align="right"><xsl:value-of select="KolTC"/></td>      
      </tr>
    </xsl:if>
    <!--  "Расшифровка по наборам тестов для группы наборов" -->
    <xsl:if test='$FlagDetailsTS = 1'>
      <tr class="Cur12" style='background:#D9D9D9'>
        <td><xsl:value-of select="Code"/></td> 
        <td><xsl:value-of select="Desc"/></td>
        <td align="right"><xsl:value-of select="KolTS"/></td>      
        <td align="right"><xsl:value-of select="KolTC"/></td>      
      </tr>
      <xsl:for-each select="OTS">	
          <tr class="Cur12">
            <td align="left"><xsl:value-of select="Code"/></td>
            <td align="left"><xsl:value-of select="Desc"/></td>
            <td align="right"><xsl:value-of select="KolTS"/></td>
            <td align="right"><xsl:value-of select="KolTC"/></td>
          </tr>
       </xsl:for-each>
    </xsl:if>       
   </xsl:for-each>
   <tr style='background:#D9D9D9'>
     <td></td>
     <td><b>ВСЕГО выполнено :</b></td>
     <td align="right"><b><xsl:value-of select="ItogoGRTS"/></b></td>
     <td align="right"><b><xsl:value-of select="ItogoGRTC"/></b></td>
   </tr>
  </table>
 </xsl:if>
 
 <!--  "Расшифровка по наборам тестов" -->
 <xsl:if test='$FlagDetailsTS = 1'>
  <br/><p class="Cur14"><b>Расшифровка по выполненным наборам тестов:</b></p>
  <br/><br/>
  <table class="Cur12" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
   
   <xsl:if test='$FlagNorm = 0'>
      <tr align="center">
        <td width="10%"><b>Код</b></td>
        <td width="70%"><b>Наименование набора тестов</b></td>
        <td width="10%"><b>Выполнено <br/>наборов</b></td>
        <xsl:if test='$FlagNorm = 1'><td width="5%" colspan="2"><b>из них<br/></b></td></xsl:if>
        <xsl:if test='$FlagCito = 1'><td width="10%"><b>В т.ч. по "Cito"</b></td></xsl:if>   
        <td width="10%"><b>Выполнено <br/>тестов</b></td>
      </tr>   
   </xsl:if>
   <xsl:if test='$FlagNorm = 1'>
      <tr align="center">
        <td width="10%" rowspan="2"><b>Код</b></td>
        <td width="70%" rowspan="2"><b>Наименование набора тестов</b></td>
        <td width="10%" rowspan="2"><b>Выполнено <br/>наборов</b></td>
        <xsl:if test='$FlagNorm = 1'><td width="5%" colspan="2"><b>из них<br/></b></td></xsl:if>
        <xsl:if test='$FlagCito = 1'><td width="10%" rowspan="2"><b>В т.ч. по "Cito"</b></td></xsl:if>   
        <td width="10%" rowspan="2"><b>Выполнено <br/>тестов</b></td>
      </tr>
      <tr>
        <td width="5%">в норме</td>
        <td width="5%">патоло- <br/>гических</td>      
      </tr>   
   </xsl:if>
   <xsl:for-each select="ODep">	
    <tr class="Cur12" style='background:#D9D9D9'>
      <td colspan="2" align="left"><b><xsl:value-of select="Desc"/></b></td>
      <td align="right"><b><xsl:value-of select="KolTS"/></b></td>
      <xsl:if test='$FlagNorm = 1'>
        <td align="right"><xsl:value-of select="KolFlagN"/></td>
        <td align="right"><xsl:value-of select="KolFlagA"/></td>
      </xsl:if>
      <xsl:if test='$FlagCito = 1'><td align="right"><xsl:value-of select="KolCito"/></td></xsl:if>
      <td align="right"><b><xsl:value-of select="KolTC"/></b></td>
    </tr>
    <xsl:for-each select="OTS">	
       <tr class="Cur12">
          <td align="left"><xsl:value-of select="Code"/></td>
          <td align="left"><xsl:value-of select="Desc"/></td>
          <td align="right"><xsl:value-of select="KolTS"/></td>
          <xsl:if test='$FlagNorm = 1'>
              <td align="right"><xsl:value-of select="KolFlagN"/></td>
              <td align="right"><xsl:value-of select="KolFlagA"/></td>
          </xsl:if>
          <xsl:if test='$FlagCito = 1'><td align="right"><xsl:value-of select="KolCito"/></td></xsl:if>
          <td align="right"><xsl:value-of select="KolTC"/></td>
       </tr>
      </xsl:for-each>
   </xsl:for-each>
   <tr style='background:#D9D9D9'>
     <td colspan="2"><b>ВСЕГО выполнено наборов тестов:</b></td>
     <td align="right"><b><xsl:value-of select="ItogoTS"/></b></td>
     <xsl:if test='$FlagNorm = 1'>
              <td align="right"><xsl:value-of select="ItogoFlagN"/></td>
              <td align="right"><xsl:value-of select="ItogoFlagA"/></td>
     </xsl:if>
     <xsl:if test='$FlagCito = 1'><td align="right"><b><xsl:value-of select="ItogoCito"/></b></td></xsl:if>
     <td align="right"><b><xsl:value-of select="ItogoTC"/></b></td>
   </tr>
  </table>
 </xsl:if>

 <!--  "Расшифровка по тестам" -->
 <xsl:if test='$FlagDetailsTC = 1'>
  <br/><p class="Cur14"><b>Расшифровка по выполненым тестам:</b></p>
  <br/><br/>
  <table class="Cur12" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
   <tr align="center">
     <td width="10%"><b>Код</b></td>
     <td width="70%"><b>Наименование теста</b></td>
     <td width="20%"><b>Выполнено <br/>тестов</b></td>
     <xsl:if test='$FlagQC = 1'>
        <td width="20%"><b>Контроль качества</b></td>
     </xsl:if>
   </tr>
   <xsl:for-each select="ODep">	
    <tr class="Cur12" style='background:#D9D9D9'>
      <td colspan="2" align="left"><b><xsl:value-of select="Desc"/></b></td>
      <td align="right"><b><xsl:value-of select="KolTC"/></b></td>
      <xsl:if test='$FlagQC = 1'>
          <td align="right"><b><xsl:value-of select="KolQC"/></b></td>
      </xsl:if>      
    </tr>
    <xsl:for-each select="OTC">	
       <tr class="Cur12">
          <td align="left"><xsl:value-of select="Code"/></td>
          <td align="left"><xsl:value-of select="Desc"/></td>
          <td align="right"><xsl:value-of select="Kol"/></td>
          <xsl:if test='$FlagQC = 1'>
            <td align="right"><xsl:value-of select="KolQC"/></td>
          </xsl:if>
       </tr>
      </xsl:for-each>
   </xsl:for-each>
   <tr style='background:#D9D9D9'>
     <td colspan="2"><b>ВСЕГО выполнено тестов:</b></td>
     <td align="right"><b><xsl:value-of select="ItogoTC"/></b></td>
     <xsl:if test='$FlagQC = 1'>
         <td align="right"><b><xsl:value-of select="ItogoQC"/></b></td>
     </xsl:if>  
   </tr>
  </table>
 </xsl:if>

 <!--  "Расшифровка по полученным образцам (пробиркам)" -->
 <xsl:if test='$FlagSpecimen = 1'>
  <br/>
  <p class="Cur14"><b>Расшифровка по полученным образцам:</b></p>
  <br/>
  <table class="Cur12" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
   <tr align="center">
     <td width="10%"><b>Код</b></td>
     <td width="60%"><b>Наименование образца</b></td>
     <td width="30%"><b>Кол-во образцов<br/> (получено)</b></td>   
     <td width="10%"><b>Выполнено <br/>наб.тестов</b></td>
   </tr>
   <xsl:for-each select="OSpecimen">	
      <tr>
        <td><xsl:value-of select="Code"/></td> 
        <td><xsl:value-of select="Desc"/></td>
        <td align="right"><xsl:value-of select="KolSpecimen"/></td>  
        <td align="right"><xsl:value-of select="KolTS"/></td>
      </tr>
   </xsl:for-each>
   <tr style='background:#D9D9D9'>
     <td colspan="2"><b>ВСЕГО :</b></td>
     <td align="right"><b><xsl:value-of select="ItogoSpecimen"/></b></td>
     <td align="right"><b><xsl:value-of select="ItogoTS"/></b></td>
   </tr>
  </table>
 </xsl:if>
 <!-- подвал -->
 <br />
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
