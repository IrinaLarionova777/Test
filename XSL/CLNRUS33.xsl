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
 
 <!-- флаг 1/0 "Вывести список лаб.номеров с патологическими результатами" -->
 <xsl:variable name="FlagListPat"><xsl:value-of select="FlagListPat"/></xsl:variable>
 <!-- флаг 1/0 "Расшифровка по наборам тестов" -->
 <xsl:variable name="FlagTS"><xsl:value-of select="FlagTS"/></xsl:variable>
 <!-- флаг 1/0 "Расшифровка по тестам" -->
 <xsl:variable name="FlagTC"><xsl:value-of select="FlagTC"/></xsl:variable>
 <!-- флаг 1/0 "Расшифровка по наборам -> тестам" -->
 <xsl:variable name="FlagTSTC"><xsl:value-of select="FlagTSTC"/></xsl:variable>
 <!-- флаг 1/0 "Расшифровка по тестам -> наборам" -->
 <xsl:variable name="FlagTCTS"><xsl:value-of select="FlagTCTS"/></xsl:variable>
 <!-- флаг 1/0 "ПОСЧИТАТЬ только общеее кол-во (без разбивки по возрастам и паталогии)" -->
 <xsl:variable name="FlagOnlyCount"><xsl:value-of select="FlagOnlyCount"/></xsl:variable>
 
  <title>Статистика по группам наборов тестов (разбивка по возрастам)</title>
  <xsl:value-of select="$pass" disable-output-escaping="yes"/>
  <style type="text/css">
     body {font-family: Times New Roman ;}
     .Cur9  { 	font-size : 9pt; }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt;  }
     .Cur12  { 	font-size : 12pt;  }
     .Cur14  { 	font-size : 14pt;  }
     .Cur16 { font-size : 16pt; }
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
    <p class="Cur14" align="center"><b>Сведения о результатах исследований за период с <xsl:value-of select="Date1"/> по <xsl:value-of select="Date2"/></b></p>
    <br/>
    <table class="Cur12" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
      <thead>
      <tr>
        <td width="40%" align="center"><b>Группа наборов тестов  <xsl:if test='$FlagTS = 1'>  / Набор тестов</xsl:if>
                              <xsl:if test='$FlagTC = 1'>  / Тест</xsl:if></b></td>
        <td width="5%" align="center"><b>Всего</b></td>
        <xsl:if test='$FlagOnlyCount = 0'>
            <td width="5%" align="center"><b>Взрослые</b></td>
            <td width="170mm" align="center"><b>Дети<br/>(0-17]</b></td>
            <td width="170mm" align="center"><b>Дети<br/>(15-17]</b></td>
            <td width="145mm" align="center"><b>Дети<br/>(0-14]</b></td>
            <td width="145mm" align="center"><b>Дети<br/>(0-1]</b></td>
            <td width="145mm" align="center"><b>Дети<br/>(1-2]</b></td>
            <td width="145mm" align="center"><b>Дети<br/>(3-6]</b></td>
            <td width="10%" align="center"><b>из них<br/>патологи- ческих</b></td>
        </xsl:if>         
      </tr>
      </thead>
      <tr style='background:#D9D9D9'>
          <td><b><xsl:value-of select="GroupTS"/></b></td>        
          <td align="right"><b><xsl:value-of select="Itog-KolTS"/></b></td>
          <xsl:if test='$FlagOnlyCount = 0'>
              <td align="right"><b><xsl:value-of select="Itog-KolTS-1"/></b></td>
              <td align="right"><b><xsl:value-of select="Itog-KolTS-2"/></b></td>
              <td align="right"><b><xsl:value-of select="Itog-KolTS-3"/></b></td>
              <td align="right"><b><xsl:value-of select="Itog-KolTS-4"/></b></td>
              <td align="right"><b><xsl:value-of select="Itog-KolTS-5"/></b></td>
              <td align="right"><b><xsl:value-of select="Itog-KolTS-6"/></b></td>
              <td align="right"><b><xsl:value-of select="Itog-KolTS-7"/></b></td>
              <td align="right"><b><xsl:value-of select="Itog-KolTS-H"/></b></td>
          </xsl:if>  
      </tr>
      <xsl:if test='$FlagTS = 1'>  
        <tr><td align="left" colspan='{ColCount}'><br/><i><b>Расшифровка по наборам тестов:</b></i></td></tr>       
        <xsl:for-each select="OGrTS">	
          <tr class="Cur11">
            <td><xsl:value-of select="Code"/> - <xsl:value-of select="Name"/></td>        
            <td align="right"><xsl:value-of select="KolTS"/></td>
            <xsl:if test='$FlagOnlyCount = 0'>
                <td align="right"><xsl:value-of select="KolTS-1"/></td>
                <td align="right"><xsl:value-of select="KolTS-2"/></td>
                <td align="right"><xsl:value-of select="KolTS-3"/></td>
                <td align="right"><xsl:value-of select="KolTS-4"/></td>
                <td align="right"><xsl:value-of select="KolTS-5"/></td>
                <td align="right"><xsl:value-of select="KolTS-6"/></td>
                <td align="right"><xsl:value-of select="KolTS-7"/></td>
                <td align="right"><xsl:value-of select="KolTS-H"/></td>
            </xsl:if>  
          </tr>  
        </xsl:for-each>
      </xsl:if>   
      <xsl:if test='$FlagTC = 1'>  
        <tr><td align="left" colspan='{ColCount}'><br/><i><b>Расшифровка по тестам:</b></i></td></tr>
        <xsl:for-each select="OGrTC">	
          <tr class="Cur11">
            <td><xsl:value-of select="Code"/> - <xsl:value-of select="Name"/></td>        
            <td align="right"><xsl:value-of select="KolTC"/></td>
            <xsl:if test='$FlagOnlyCount = 0'>
                <td align="right"><xsl:value-of select="KolTC-1"/></td>
                <td align="right"><xsl:value-of select="KolTC-2"/></td>
                <td align="right"><xsl:value-of select="KolTC-3"/></td>
                <td align="right"><xsl:value-of select="KolTC-4"/></td>
                <td align="right"><xsl:value-of select="KolTC-5"/></td>
                <td align="right"><xsl:value-of select="KolTC-6"/></td>
                <td align="right"><xsl:value-of select="KolTC-7"/></td>
                <td align="right"><xsl:value-of select="KolTC-H"/></td>
            </xsl:if>  
          </tr>  
        </xsl:for-each>  
      </xsl:if>         
    </table>
    <br/>
    <!-- ................  Расшифровка по наборам -> тестам ...................... -->
    <xsl:if test='$FlagTSTC = 1'>  
      <br/>
      <p><i><b>Расшифровка по наборам тестов -> тестам</b></i></p>
      <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
        <thead>
        <tr>
          <td width="10%" align="center"><b>Наборов тестов</b></td>
          <td width="25%" align="center"><b>Тест</b></td>
          <td width="5%" align="center"><b>Всего</b></td>
          <xsl:if test='$FlagOnlyCount = 0'>
              <td width="5%" align="center"><b>Взрослые</b></td>
              <td width="170mm" align="center"><b>Дети<br/>(0-17]</b></td>
              <td width="170mm" align="center"><b>Дети<br/>(15-17]</b></td>
              <td width="145mm" align="center"><b>Дети<br/>(0-14]</b></td>
              <td width="145mm" align="center"><b>Дети<br/>(0-1]</b></td>
              <td width="145mm" align="center"><b>Дети<br/>(1-2]</b></td>
              <td width="145mm" align="center"><b>Дети<br/>(3-6]</b></td>
              <td width="10%" align="center"><b>из них<br/>патологи- ческих</b></td>
          </xsl:if>  
        </tr>
        </thead> 
        <xsl:for-each select="OGrTSTC">	
          <tr style='background:#D9D9D9'>
            <td colspan="2"><xsl:value-of select="Code"/> - <xsl:value-of select="Name"/></td>      
            <td align="right"><xsl:value-of select="KolTS"/></td>
            <xsl:if test='$FlagOnlyCount = 0'>
                <td align="right"><xsl:value-of select="KolTS-1"/></td>
                <td align="right"><xsl:value-of select="KolTS-2"/></td>
                <td align="right"><xsl:value-of select="KolTS-3"/></td>
                <td align="right"><xsl:value-of select="KolTS-4"/></td>
                <td align="right"><xsl:value-of select="KolTS-5"/></td>
                <td align="right"><xsl:value-of select="KolTS-6"/></td>
                <td align="right"><xsl:value-of select="KolTS-7"/></td>
                <td align="right"><xsl:value-of select="KolTS-H"/></td>
            </xsl:if>  
          </tr>  
          <xsl:for-each select="OGrTC">	
            <tr>
              <td></td>                
              <td><xsl:value-of select="Code"/> - <xsl:value-of select="Name"/></td>        
              <td align="right"><xsl:value-of select="KolTC"/></td> 
              <xsl:if test='$FlagOnlyCount = 0'>
                  <td align="right"><xsl:value-of select="KolTC-1"/></td>
                  <td align="right"><xsl:value-of select="KolTC-2"/></td>
                  <td align="right"><xsl:value-of select="KolTC-3"/></td>
                  <td align="right"><xsl:value-of select="KolTC-4"/></td>
                  <td align="right"><xsl:value-of select="KolTC-5"/></td>
                  <td align="right"><xsl:value-of select="KolTC-6"/></td>
                  <td align="right"><xsl:value-of select="KolTC-7"/></td>
                  <td align="right"><xsl:value-of select="KolTC-H"/></td>
              </xsl:if>  
            </tr>
          </xsl:for-each>  
        </xsl:for-each>  
      </table>
    </xsl:if>         
     <!-- ................  Расшифровка по тестам -> наборам  ...................... -->
    <xsl:if test='$FlagTCTS = 1'>  
      <br/>
      <p><i><b>Расшифровка по тестам -> наборам тестов</b></i></p>
      <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
        <thead>
        <tr>
          <td width="10%" align="center"><b>Тест</b></td>
          <td width="25%" align="center"><b>Наборов тестов</b></td>
          <td width="5%" align="center"><b>Всего</b></td>
          <xsl:if test='$FlagOnlyCount = 0'>
              <td width="5%" align="center"><b>Взрослые</b></td>
              <td width="170mm" align="center"><b>Дети<br/>(0-17]</b></td>
              <td width="170mm" align="center"><b>Дети<br/>(15-17]</b></td>
              <td width="145mm" align="center"><b>Дети<br/>(0-14]</b></td>
              <td width="145mm" align="center"><b>Дети<br/>(0-1]</b></td>
              <td width="145mm" align="center"><b>Дети<br/>(1-2]</b></td>
              <td width="145mm" align="center"><b>Дети<br/>(3-6]</b></td>
              <td width="10%" align="center"><b>из них<br/>патологи- ческих</b></td>
          </xsl:if>  
        </tr>
        </thead> 
        <xsl:for-each select="OGrTCTS">	
          <tr style='background:#D9D9D9'>
            <td colspan="2"><xsl:value-of select="Code"/> - <xsl:value-of select="Name"/></td>      
            <td align="right"><xsl:value-of select="KolTC"/></td>
            <xsl:if test='$FlagOnlyCount = 0'>
                <td align="right"><xsl:value-of select="KolTC-1"/></td>
                <td align="right"><xsl:value-of select="KolTC-2"/></td>
                <td align="right"><xsl:value-of select="KolTC-3"/></td>
                <td align="right"><xsl:value-of select="KolTC-4"/></td>
                <td align="right"><xsl:value-of select="KolTC-5"/></td>
                <td align="right"><xsl:value-of select="KolTC-6"/></td>
                <td align="right"><xsl:value-of select="KolTC-7"/></td>
                <td align="right"><xsl:value-of select="KolTC-H"/></td>
            </xsl:if>  
          </tr>  
          <xsl:for-each select="OGrTS">	
            <tr>
              <td></td>                
              <td><xsl:value-of select="Code"/> - <xsl:value-of select="Name"/></td>        
              <td align="right"><xsl:value-of select="KolTS"/></td> 
              <xsl:if test='$FlagOnlyCount = 0'>
                  <td align="right"><xsl:value-of select="KolTS-1"/></td>
                  <td align="right"><xsl:value-of select="KolTS-2"/></td>
                  <td align="right"><xsl:value-of select="KolTS-3"/></td>
                  <td align="right"><xsl:value-of select="KolTS-4"/></td>
                  <td align="right"><xsl:value-of select="KolTS-5"/></td>
                  <td align="right"><xsl:value-of select="KolTS-6"/></td>
                  <td align="right"><xsl:value-of select="KolTS-7"/></td>
                  <td align="right"><xsl:value-of select="KolTS-H"/></td>
              </xsl:if>  
            </tr>
          </xsl:for-each>  
        </xsl:for-each>  
      </table>
    </xsl:if>         
 <!-- .................  "Вывести список пациентов с патологическими результатами"    .................... -->
 <xsl:if test='$FlagListPat = 1'>  
   <br/>
   <p class="Cur12"><i><b>Список пациентов с патологическими результатами</b></i></p>
   <table class="Cur10" border="1" sellspacing="0" width="100%" bordercolor="#000000" 
        style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
               border-bottom:solid windowtext 0.5pt;border-right:solid windowtext 0.5pt; padding:0cm 3.5pt 0cm 3.5pt'"> 
     <thead>
     <tr>
       <td width="3%" align="center"><b>№<br/>п/п</b></td>
       <td width="5%" align="center"><b>Лаб. номер</b></td>
       <td width="15%" align="center"><b>Фамилия И.О.</b></td>
       <td width="2%" align="center"><b>Пол</b></td>
       <td width="3%" align="center"><b>Возр.</b></td>
       <td width="5%" align="center"><b>№ МК</b></td>
       <td width="5%" align="center"><b>Дата<br/>забора</b></td> 
       <td width="20%" align="center"><b>Набор тестов</b></td>
       <td width="40%" align="center"><b>Патологические результаты тестов</b></td>
     </tr>    
     </thead>
     <xsl:for-each select="OListPat">	
     <tr>
       <td align="center"><xsl:value-of select="NGr"/></td>
       <td class="CurGroup" align="center"><b><xsl:value-of select="Epis"/></b></td>
       <td class="CurGroup" align="left"><xsl:value-of select="Name"/></td>
       <td align="center"><xsl:value-of select="Sex"/></td>
       <td align="center"><xsl:value-of select="Age"/></td>
       <td align="center"><xsl:value-of select="MRN"/></td>
       <td align="center"><xsl:value-of select="DateCol"/></td>
       <td align="left"><xsl:value-of select="NameTS"/></td>
       <td align="left"><xsl:value-of select="ResultTS"/></td>
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
