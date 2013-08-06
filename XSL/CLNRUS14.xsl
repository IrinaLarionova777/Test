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
  <!-- флаг 1/0 "Вывести доп.столбец "Z-Score"" -->
 <xsl:variable name="FlagZScore"><xsl:value-of select="FlagZScore"/></xsl:variable>
  <!-- флаг 1/0 "Вывести сводные данные по тесту (Фиксир.ср., SD и т.д.)" -->
 <xsl:variable name="FlagDetailTC"><xsl:value-of select="FlagDetailTC"/></xsl:variable>
  <title>Журнал контроля качества</title>
  <xsl:value-of select="$pass" disable-output-escaping="yes"/>
  <style type="text/css">
     body {font-family: Times New Roman ;}
     .Cur16  {  font-size : 16pt;  }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt; }
     .Cur12  { 	font-size : 12pt; }
     .Cur13  { 	font-size : 13pt; }
     .Cur14  { font-size : 14pt;  }
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
    <p class="Cur14" align="center"><b>Журнал контроля качества за период c <xsl:value-of select="Date1"/> по <xsl:value-of select="Date2"/>
        <br/>Отдел: </b><xsl:value-of select="Отдел"/>
    </p>
    <br/><br/>
 <!-- контрольный материал-->
 <xsl:for-each select="OGr">	
  <table class="Cur12" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; background:#D9D9D9; 
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
    <tr>     
       <td width="32%">Контрольный материал</td>
       <td width="7%">Лот №</td>
       <td width="30%">Тип</td>
       <td width="6%" align="center">Уровень</td>
       <td width="5%" align="center">Дата открытия</td>
       <td width="5%" align="center">Дата истечения</td>
       <td width="5%" align="center">Дата закрытия</td>
    </tr>
    <tr>     
       <td class="Cur14"><b><xsl:value-of select="QC"/></b></td>
       <td class="Cur14"><b><xsl:value-of select="QCLot"/></b></td>
       <td class="Cur14"><b><xsl:value-of select="QCType"/> (<xsl:value-of select="QCWM"/>)</b></td>    
       <td><xsl:value-of select="QCLevelDesc"/></td>      
       <td><xsl:value-of select="OpeningDate"/></td>      
       <td><xsl:value-of select="ExpiryDate"/></td>      
       <td><xsl:value-of select="CloseDate"/></td>      
    </tr>
  </table>
  <br/>
 <!-- ........................................................................................ -->  
 <!-- ................... Вывести все тесты в общей таблице .................................. -->    
 <xsl:if test='$FlagDetailTC = 0'>
  <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
   <tr align="center">
     <td width="30%" rowspan="2"><b>Тест</b></td>
     <td width="5%" rowspan="2"><b>Дата</b></td>
     <xsl:if test='$FlagZScore = 0'>
        <td width="20%" colspan="3"><b>1 Уровень</b></td>
        <td width="20%" colspan="3"><b>2 Уровень</b></td>
        <td width="20%" colspan="3"><b>3 Уровень</b></td>
     </xsl:if>
     <xsl:if test='$FlagZScore = 1'>
        <td width="20%" colspan="4"><b>1 Уровень</b></td>
        <td width="20%" colspan="4"><b>2 Уровень</b></td>
        <td width="20%" colspan="4"><b>3 Уровень</b></td>
     </xsl:if>
   </tr>
   <tr>
     <td width="10%"><b>Результат</b></td>
     <xsl:if test='$FlagZScore = 1'><td width="5%"><b>Z_Score</b></td></xsl:if>
     <td width="5%"><b>Правило</b></td>
     <td width="5%"><b>Искл.</b></td> 
     <td width="10%"><b>Результат</b></td>
     <xsl:if test='$FlagZScore = 1'><td width="5%"><b>Z_Score</b></td></xsl:if>
     <td width="5%"><b>Правило</b></td>
     <td width="5%"><b>Искл.</b></td>
     <td width="10%"><b>Результат</b></td>
     <xsl:if test='$FlagZScore = 1'><td width="5%"><b>Z_Score</b></td></xsl:if>
     <td width="5%"><b>Правило</b></td>
     <td width="5%"><b>Искл.</b></td>
   </tr>
     <xsl:for-each select="OTest">	
       <tr style='background:#D9D9D9'>
          <td align="left" colspan="11"><b><xsl:value-of select="TestCode"/> - <xsl:value-of select="TestDesc"/></b></td>
      </tr>
       <xsl:for-each select="OData">	
          <tr>
             <td></td>
             <td align="center"><xsl:value-of select="Date"/></td>
             <!-- 1 уровень -->
             <xsl:variable name="background1">
                <xsl:value-of select="RuleColor-1"/>
             </xsl:variable>
             <td style='background:{$background1}' align="center"><xsl:value-of select="Value-1"/></td>
             <xsl:if test='$FlagZScore = 1'><td style='background:{$background1}' align="center"><xsl:value-of select="ZScore-1"/></td></xsl:if>
             <td style='background:{$background1}' align="center"><xsl:value-of select="Rule-1"/></td>
             <td style='background:{$background1}' align="center"><xsl:value-of select="Exclude-1"/></td>
             <!-- 2 уровень -->
             <xsl:variable name="background2">
                <xsl:value-of select="RuleColor-2"/>
             </xsl:variable>
             <td style='background:{$background2}' align="center"><xsl:value-of select="Value-2"/></td>
             <xsl:if test='$FlagZScore = 1'><td style='background:{$background2}' align="center"><xsl:value-of select="ZScore-2"/></td></xsl:if>
             <td style='background:{$background2}' align="center"><xsl:value-of select="Rule-2"/></td>
             <td style='background:{$background2}' align="center"><xsl:value-of select="Exclude-2"/></td>
             <!-- 3 уровень -->
             <xsl:variable name="background3">
                <xsl:value-of select="RuleColor-3"/>
             </xsl:variable>
             <td style='background:{$background3}' align="center"><xsl:value-of select="Value-3"/></td>
             <xsl:if test='$FlagZScore = 1'><td style='background:{$background3}' align="center"><xsl:value-of select="ZScore-3"/></td></xsl:if>
             <td style='background:{$background3}' align="center"><xsl:value-of select="Rule-3"/></td>
             <td style='background:{$background3}' align="center"><xsl:value-of select="Exclude-3"/></td>
          </tr>
       </xsl:for-each>  <!-- для Data -->
     </xsl:for-each>  <!-- для Test -->
   </table>
   <xsl:if test="not(last()=position())">
      <br/><br/><br/>
   </xsl:if>
 </xsl:if>   <!-- для FlagDetailTC=0 -->
 
 <!-- ........................................................................................ --> 
 <!-- Вывести каждый тест отдельной таблицей + сводные данные по тесту (Фиксир.ср., SD и т.д.)--> 
 <xsl:if test='$FlagDetailTC = 1'>
  <xsl:for-each select="OTest">
    <br/>	
    <p class="Cur13" style='color:blue'><b><u><xsl:value-of select="TestCode"/> - <xsl:value-of select="TestDesc"/></u></b></p>
    <p class="Cur12"><i>Сводные данные</i></p>
    <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
      <tr align="center">
        <td width="5%"><b>Уровень</b></td>
        <td width="10%"><b>Фиксир.среднее</b></td>
        <td width="10%"><b>Фиксир.SD</b></td>
        <td width="10%"><b>Плав.среднее</b></td>
        <td width="10%"><b>Плав.SD</b></td>
        <td width="10%"><b>Коэф.вариации</b></td>
        <td width="10%"><b>Кол-во_точек</b></td>
        <td width="10%"><b>Тип</b></td>
      </tr>
      <xsl:for-each select="OLevel">
        <tr>
            <td align="center"><b><xsl:value-of select="DescLevel"/></b></td>
            <td align="center"><xsl:value-of select="FixedMean"/></td>
            <td align="center"><xsl:value-of select="FixedSD"/></td>
            <td align="center"><xsl:value-of select="FloatingMean"/></td>
            <td align="center"><xsl:value-of select="FloatingSD"/></td>
            <td align="center"><xsl:value-of select="CV"/></td>
            <td align="center"><xsl:value-of select="Count"/></td>
            <td align="center"><xsl:value-of select="CalcType"/></td>
        </tr>
      </xsl:for-each>  
    </table> 
    <!-- расшифровка значений по дням -->  
    <p class="Cur12"><i>Расшифровка по дням</i></p>
    <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
       <tr align="center">
          <td width="5%" rowspan="2"><b>Дата</b></td>
          <xsl:if test='$FlagZScore = 0'>
            <td width="20%" colspan="3"><b>1 Уровень</b></td>
            <td width="20%" colspan="3"><b>2 Уровень</b></td>
            <td width="20%" colspan="3"><b>3 Уровень</b></td>
          </xsl:if>
          <xsl:if test='$FlagZScore = 1'>
            <td width="20%" colspan="4"><b>1 Уровень</b></td>
            <td width="20%" colspan="4"><b>2 Уровень</b></td>
            <td width="20%" colspan="4"><b>3 Уровень</b></td>
          </xsl:if>
       </tr>
       <tr>
          <td width="10%"><b>Результат</b></td>
          <xsl:if test='$FlagZScore = 1'><td width="5%"><b>Z_Score</b></td></xsl:if>
          <td width="5%"><b>Правило</b></td>
          <td width="5%"><b>Искл.</b></td> 
          <td width="10%"><b>Результат</b></td>
          <xsl:if test='$FlagZScore = 1'><td width="5%"><b>Z_Score</b></td></xsl:if>
          <td width="5%"><b>Правило</b></td>
          <td width="5%"><b>Искл.</b></td>
          <td width="10%"><b>Результат</b></td>
          <xsl:if test='$FlagZScore = 1'><td width="5%"><b>Z_Score</b></td></xsl:if>
          <td width="5%"><b>Правило</b></td>
          <td width="5%"><b>Искл.</b></td>
       </tr>   
       <xsl:for-each select="OData">	
         <tr>
             <td align="center"><xsl:value-of select="Date"/></td>
             <!-- 1 уровень -->
             <xsl:variable name="background1">
                <xsl:value-of select="RuleColor-1"/>
             </xsl:variable>
             <td style='background:{$background1}' align="center"><xsl:value-of select="Value-1"/></td>
             <xsl:if test='$FlagZScore = 1'><td style='background:{$background1}' align="center"><xsl:value-of select="ZScore-1"/></td></xsl:if>
             <td style='background:{$background1}' align="center"><xsl:value-of select="Rule-1"/></td>
             <td style='background:{$background1}' align="center"><xsl:value-of select="Exclude-1"/></td>
             <!-- 2 уровень -->
             <xsl:variable name="background2">
                <xsl:value-of select="RuleColor-2"/>
             </xsl:variable>
             <td style='background:{$background2}' align="center"><xsl:value-of select="Value-2"/></td>
             <xsl:if test='$FlagZScore = 1'><td style='background:{$background2}' align="center"><xsl:value-of select="ZScore-2"/></td></xsl:if>
             <td style='background:{$background2}' align="center"><xsl:value-of select="Rule-2"/></td>
             <td style='background:{$background2}' align="center"><xsl:value-of select="Exclude-2"/></td>
             <!-- 3 уровень -->
             <xsl:variable name="background3">
                <xsl:value-of select="RuleColor-3"/>
             </xsl:variable>
             <td style='background:{$background3}' align="center"><xsl:value-of select="Value-3"/></td>
             <xsl:if test='$FlagZScore = 1'><td style='background:{$background3}' align="center"><xsl:value-of select="ZScore-3"/></td></xsl:if>
             <td style='background:{$background3}' align="center"><xsl:value-of select="Rule-3"/></td>
             <td style='background:{$background3}' align="center"><xsl:value-of select="Exclude-3"/></td>
         </tr>
       </xsl:for-each>  <!-- для Data -->
    </table>    
  </xsl:for-each>  <!-- для Test -->
  <xsl:if test="not(last()=position())"> <br/><br/><br/></xsl:if> 
 </xsl:if>  <!-- для FlagDetailTC=1 -->
 </xsl:for-each>   <!--  для Gr -->
 <!-- подвал -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
