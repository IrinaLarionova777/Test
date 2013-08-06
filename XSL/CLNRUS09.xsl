<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="Windows-1251" omit-xml-declaration="no"/>
<xsl:variable name="pass">
 <![CDATA[
  <!--[if gte mso 9]><xml>
   <w:WordDocument>
    <w:View>Print</w:View>
    <w:Zoom>100</w:Zoom>
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
 
 <!-- флаг  1 = "Сводный по отделам (без разбивки по наборам тестов)"
            2 = "Расшифровка по наборам тестов"; 3 = "Расшифровка по тестам"; 4 = "Расшифровка по группам наборов тестов"  -->
 <xsl:variable name="FlagReport"><xsl:value-of select="FlagReport"/></xsl:variable>
 <!-- флаг 1/0 Доп.итоги по типу местоположения (амбулат/стацион./прочее) -->
 <xsl:variable name="FlagTypeLoc"><xsl:value-of select="FlagTypeLoc"/></xsl:variable>
 <!-- флаг 1/0 Развернуть таблицу -->
 <xsl:variable name="FlagTurnRound"><xsl:value-of select="FlagTurnRound"/></xsl:variable>
 <!-- флаг 1/0 Расшифровка кол-ва (Medtrak/Labtrak) -->
 <xsl:variable name="FlagSystem"><xsl:value-of select="FlagSystem"/></xsl:variable>
 <!-- флаг 1/0 Время выполнения набора тестов -->
 <xsl:variable name="FlagTimeTS"><xsl:value-of select="FlagTimeTS"/></xsl:variable>
 
  <title>Деятельность лаборатории (по местоположениям пациентов)</title>
  <xsl:value-of select="$pass" disable-output-escaping="yes"/>
  <style type="text/css">
     body {font-family: Times New Roman ;}
     .Cur9   { 	font-size : 9pt;  }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt; }
     .Cur12  { 	font-size : 12pt; }
     .Cur14  { font-size : 14pt;  }
     .Cur16 { font-size : 16pt; }
     .xl47	{ mso-style-parent:style0;
            	text-align:center;
	            vertical-align:middle;
	            border-top:.5pt solid black;
	            border-right:.5pt solid black;
	            border-bottom:none;
	            border-left:.5pt solid black;
	            white-space:normal;}
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
    <p class="Cur14" align="left"><b>Отчет о количестве выполненных исследований по местоположениям пациентов
       <br/>за период c <xsl:value-of select="Date1"/> по <xsl:value-of select="Date2"/></b></p>
    <p class="Cur12" align="left">
      <br/>Отдел: <xsl:value-of select="Department"/> / Местоположение пациента: <xsl:value-of select="PatLocation"/>
      <br/>Тип отчета: 
        <xsl:if test='$FlagReport = 1'>Сводный отчет по отделам (без разбивки по наборам тестов)</xsl:if>
        <xsl:if test='$FlagReport = 2'>Расшифровка по наборам тестов</xsl:if>
        <xsl:if test='$FlagReport = 3'>Расшифровка по тестам
              <xsl:if test='FlagNotCalcul = 1'> (без учета расчетных тестов)</xsl:if>
        </xsl:if>
        <xsl:if test='$FlagReport = 4'>Расшифровка по группам наборов тестов</xsl:if>
    </p>
    <br/>
<!-- ..............................................................................................
     I ВАРИАНТ =>  строим таблицу (строки - отделы; динамические столбцы - местоположения)
                   Сводный отчет по отделам (без разбивки по наборам тестов)
     ............................................................................................. -->
<xsl:if test='$FlagTurnRound = 0'>
 <xsl:if test='$FlagReport = 1'>
    <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
      <tr class="xl47">
        <td width="20%" rowspan="2"><b>Отдел</b></td>
        <xsl:if test='$FlagTypeLoc = 0'>
            <xsl:if test='$FlagSystem = 0'><td width="60pt" rowspan="2"><b>Общее кол-во выполн. наборов тестов</b></td></xsl:if>     
            <xsl:if test='$FlagSystem = 1'><td width="6%" colspan="3"><b>Кол-во выполн. наборов тестов</b></td></xsl:if>       
            <td width="10%" colspan='{ColOTHER}'><b>Местоположения</b></td>
        </xsl:if>
        <xsl:if test='$FlagTypeLoc = 1'>
            <xsl:if test='$FlagSystem = 0'><td width="15%" colspan="4"><b>Количество выполн. наборов тестов</b></td></xsl:if> 
            <xsl:if test='$FlagSystem = 1'><td width="15%" colspan="6"><b>Количество выполн. наборов тестов</b></td></xsl:if> 
            <xsl:if test='ColIN > 0'> <td width="15%" colspan='{ColIN}'><b>Стационар</b></td>  </xsl:if>
            <xsl:if test='ColOUT > 0'> <td width="15%" colspan='{ColOUT}'><b>Амбулатория</b></td> </xsl:if>
            <xsl:if test='ColOTHER > 0'> <td width="15%" colspan='{ColOTHER}'><b>Прочее</b></td> </xsl:if> 
        </xsl:if>
        <xsl:if test='$FlagTimeTS = 1'>
             <td width="5%" rowspan="2" style='mso-rotate:90'><b>Время выполнения (мин)</b></td>       
             <td width="5%" rowspan="2" style='mso-rotate:90'><b>Общее время выполнения (мин)</b></td>
         </xsl:if>         
      </tr>
      <!--  вторая строка шапки -->
      <tr class="xl47">
          <xsl:if test='$FlagTypeLoc = 0'>
              <xsl:if test='$FlagSystem = 1'>
                <td align="center"><b>Всего</b></td>
                <td align="center"><b>MT</b></td>
                <td align="center"><b>LT</b></td>
              </xsl:if> 
          </xsl:if> 
          <!-- cтроим шапку для Доп.итогов по типам местоположений  -->
          <xsl:if test='$FlagTypeLoc = 1'>
              <td width="5%"><b>Всего</b></td>
              <xsl:if test='$FlagSystem = 1'>
                  <td align="center"><b>MT</b></td>
                  <td align="center"><b>LT</b></td>
              </xsl:if>         
              <td width="5%"><b>Стац.</b></td>
              <td width="5%"><b>Амбул.</b></td>
              <td width="5%"><b>Прочее</b></td>
          </xsl:if>
          <xsl:for-each select="OColumnIN"><td align="center" HEIGHT="15pt" style='mso-rotate:90'><xsl:value-of select="Desc"/></td></xsl:for-each>
          <xsl:for-each select="OColumnOUT"><td align="center" HEIGHT="15pt" style='mso-rotate:90'><xsl:value-of select="Desc"/></td></xsl:for-each>
          <xsl:for-each select="OColumnOTHER"><td align="center" HEIGHT="15pt" style='mso-rotate:90'><xsl:value-of select="Desc"/></td></xsl:for-each>
      </tr>
      <!--  1 строка: общие итоги "ВСЕГО"  -->
      <tr style='background:#D9D9D9'>
          <td><b>ВСЕГО</b></td>
          <td align="right"><b><xsl:value-of select="ItogoTS"/></b></td>
          <xsl:if test='$FlagSystem = 1'>
              <td align="right"><b><xsl:value-of select="ItogoTS-MT"/></b></td>
              <td align="right"><b><xsl:value-of select="ItogoTS-LT"/></b></td>
          </xsl:if> 
          <xsl:if test='$FlagTypeLoc = 1'>
              <td align="right"><b><xsl:value-of select="Itogo-IN"/></b>
                  <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Itogo-IN-MT"/> / <xsl:value-of select="Itogo-IN-LT"/>)</xsl:if>
              </td> 
              <td align="right"><b><xsl:value-of select="Itogo-OUT"/></b>
                  <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Itogo-OUT-MT"/> / <xsl:value-of select="Itogo-OUT-LT"/>)</xsl:if>
              </td> 
              <td align="right"><b><xsl:value-of select="Itogo-OTHER"/></b>
                <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Itogo-OTHER-MT"/> / <xsl:value-of select="Itogo-OTHER-LT"/>)</xsl:if>
              </td> 
          </xsl:if>
          <xsl:for-each select="OItogoCol">	
              <td align="right"><b><xsl:value-of select="Kol"/></b>
                  <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-MT"/> / <xsl:value-of select="Kol-LT"/>)</xsl:if>  
              </td>
          </xsl:for-each>               
          <xsl:if test='$FlagTimeTS = 1'> 
              <td align="right" style='background:#D9D9D9'></td>
              <td align="right" style='background:#D9D9D9'><b><xsl:value-of select="ItogoTimeExec"/></b></td>
          </xsl:if>
      </tr>
      <!--  2 строка: пустая -->
      <tr>
          <td><b>Из них:</b></td>
          <td></td>
      </tr>   
      <!--  цикл по отделам   -->   
      <xsl:for-each select="OGr">	
        <tr>
            <td align="left"><xsl:value-of select="Code"/></td>
            <td style='background:#D9D9D0' align="right"><b><xsl:value-of select="Kol"/></b></td>
            <xsl:if test='$FlagSystem = 1'>
                <td style='background:#D9D9D0' align="right"><xsl:value-of select="Kol-MT"/></td>
                <td style='background:#D9D9D0' align="right"><xsl:value-of select="Kol-LT"/></td>
            </xsl:if>        
            <xsl:if test='$FlagTypeLoc = 1'>
                <td align="right"><xsl:value-of select="Kol-IN"/>
                    <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-IN-MT"/> / <xsl:value-of select="Kol-IN-LT"/>)</xsl:if> 
                </td>
                <td align="right"><xsl:value-of select="Kol-OUT"/>
                    <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-OUT-MT"/> / <xsl:value-of select="Kol-OUT-LT"/>)</xsl:if>
                </td>
                <td align="right"><xsl:value-of select="Kol-OTHER"/>
                    <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-OTHER-MT"/> / <xsl:value-of select="Kol-OTHER-LT"/>)</xsl:if>
                </td>
            </xsl:if>
            <!--  цикл по местоположениям  -->   
            <xsl:for-each select="OCol">	
                <td align="right"><xsl:value-of select="Kol"/>
                    <xsl:if test='Kol > 0'>
                       <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-MT"/> / <xsl:value-of select="Kol-LT"/>)</xsl:if>  
                    </xsl:if>  
                </td>
            </xsl:for-each>
            <xsl:if test='$FlagTimeTS = 1'> 
                <td align="right" style='background:#D9D9D0'></td>
                <td align="right" style='background:#D9D9D0'><b><xsl:value-of select="TimeExec"/></b></td>
            </xsl:if>                       
        </tr>   
      </xsl:for-each>
    </table>
 </xsl:if> <!-- дял FlagReport=1 -->
</xsl:if> <!-- дял FlagTurnRound=0 -->

<!-- ..............................................................................................
     II ВАРИАНТ =>  строим таблицу (строки - отделы; динамические столбцы - местоположения)
                   Расширенный отчет с разбивкой по наборам тестов/по тестам)
     ............................................................................................. -->
<xsl:if test='$FlagTurnRound = 0'>
 <xsl:if test='$FlagReport != 1'>
  <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
   <tr class="xl47">
     <xsl:if test='$FlagReport = 2'><td width="15%" rowspan="2"><b>Отдел / Набор тестов</b></td></xsl:if>
     <xsl:if test='$FlagReport = 3'><td width="15%" rowspan="2"><b>Отдел / Тесты</b></td></xsl:if>
     <xsl:if test='$FlagReport = 4'><td width="15%" rowspan="2"><b>Группа наборов тестов / Набор тестов</b></td></xsl:if>     
     <xsl:if test='$FlagTypeLoc = 0'>
        <xsl:if test='$FlagSystem = 0'><td width="60pt" rowspan="2"><b>Общее кол-во выполн. исследований</b></td></xsl:if>
        <xsl:if test='$FlagSystem = 1'><td width="6%" colspan="3" HEIGHT="15pt"><b>Кол-во выполн. исследований</b></td></xsl:if> 
        <td width="10%" colspan='{ColOTHER}'><b>Местоположения</b></td>
     </xsl:if>
     <xsl:if test='$FlagTypeLoc = 1'>
        <xsl:if test='$FlagSystem = 0'><td width="15%" colspan="4"><b>Количество выполн. исследований</b></td></xsl:if> 
        <xsl:if test='$FlagSystem = 1'><td width="15%" colspan="6"><b>Количество выполн. исследований</b></td></xsl:if> 
        <xsl:if test='ColIN > 0'> <td width="15%" colspan='{ColIN}'><b>Стационар</b></td>  </xsl:if>
        <xsl:if test='ColOUT > 0'> <td width="15%" colspan='{ColOUT}'><b>Амбулатория</b></td> </xsl:if>
        <xsl:if test='ColOTHER > 0'> <td width="15%" colspan='{ColOTHER}'><b>Прочее</b></td> </xsl:if> 
     </xsl:if>
     <xsl:if test='$FlagTimeTS = 1'>
              <td width="5%" rowspan="2" style='mso-rotate:90'><b>Время выполнения (мин)</b></td>       
              <td width="5%" rowspan="2" style='mso-rotate:90'><b>Общее время выполнения (мин)</b></td>
     </xsl:if>              
  </tr>
  <!--  вторая строка шапки -->
   <tr class="xl47">
    <xsl:if test='$FlagTypeLoc = 0'>
       <xsl:if test='$FlagSystem = 1'>
           <td align="center"><b>Всего</b></td>
           <td align="center"><b>MT</b></td>
           <td align="center"><b>LT</b></td>
       </xsl:if> 
     </xsl:if> 
     <!-- строим шапку для Доп.итогов по типам местоположений  -->
     <xsl:if test='$FlagTypeLoc = 1'>
        <td width="5%"><b>Всего</b></td>
        <xsl:if test='$FlagSystem = 1'>
           <td align="center"><b>MT</b></td>
           <td align="center"><b>LT</b></td>
        </xsl:if>         
        <td width="5%"><b>Стац.</b></td>
        <td width="5%"><b>Амбул.</b></td>
        <td width="5%"><b>Прочее</b></td>
     </xsl:if>
     <xsl:for-each select="OColumnIN"><td align="center" HEIGHT="15pt" style='mso-rotate:90'><xsl:value-of select="Desc"/></td></xsl:for-each>
     <xsl:for-each select="OColumnOUT"><td align="center" HEIGHT="15pt" style='mso-rotate:90'><xsl:value-of select="Desc"/></td></xsl:for-each>
     <xsl:for-each select="OColumnOTHER"><td align="center" HEIGHT="15pt" style='mso-rotate:90'><xsl:value-of select="Desc"/></td></xsl:for-each>
   </tr>
   <!--  1 строка: общие итоги "ВСЕГО"   -->
   <tr style='background:#D9D9D9'>
     <td><b>ВСЕГО</b></td>
     <td align="right"><b><xsl:value-of select="ItogoTS"/></b></td>
     <xsl:if test='$FlagSystem = 1'>
           <td align="right"><b><xsl:value-of select="ItogoTS-MT"/></b></td>
           <td align="right"><b><xsl:value-of select="ItogoTS-LT"/></b></td>
     </xsl:if> 
     <xsl:if test='$FlagTypeLoc = 1'>
        <td align="right"><b><xsl:value-of select="Itogo-IN"/></b>
             <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Itogo-IN-MT"/> / <xsl:value-of select="Itogo-IN-LT"/>)</xsl:if>
        </td>
        <td align="right"><b><xsl:value-of select="Itogo-OUT"/></b>
            <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Itogo-OUT-MT"/> / <xsl:value-of select="Itogo-OUT-LT"/>)</xsl:if>
        </td>  
        <td align="right"><b><xsl:value-of select="Itogo-OTHER"/></b>
            <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Itogo-OTHER-MT"/> / <xsl:value-of select="Itogo-OTHER-LT"/>)</xsl:if>
        </td> 
     </xsl:if>
     <xsl:for-each select="OItogoCol">	
        <td align="right"><b><xsl:value-of select="Kol"/></b>
            <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-MT"/> / <xsl:value-of select="Kol-LT"/>)</xsl:if>  
        </td>
     </xsl:for-each>
     <xsl:if test='$FlagTimeTS = 1'> 
              <td align="right"></td>
              <td align="right"><b><xsl:value-of select="ItogoTimeExec"/></b></td>
      </xsl:if>                   
   </tr>
   <!--  2 строка: пустая -->
   <tr>
     <td><b>Из них:</b></td>
     <td></td>
   </tr>   
   <!--  цикл по отделам   -->   
   <xsl:for-each select="OGr">	
    <tr style='background:#D9D9D0'>
      <td><b><xsl:value-of select="Code"/></b></td>
      <td align="right"><b><xsl:value-of select="Kol"/></b></td>
      <xsl:if test='$FlagSystem = 1'>
           <td style='background:#D9D9D0' align="right"><xsl:value-of select="Kol-MT"/></td>
           <td style='background:#D9D9D0' align="right"><xsl:value-of select="Kol-LT"/></td>
       </xsl:if>        
       <xsl:if test='$FlagTypeLoc = 1'>
          <td align="right"><xsl:value-of select="Kol-IN"/>
              <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-IN-MT"/> / <xsl:value-of select="Kol-IN-LT"/>)</xsl:if>          
          </td>
          <td align="right"><xsl:value-of select="Kol-OUT"/>
              <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-OUT-MT"/> / <xsl:value-of select="Kol-OUT-LT"/>)</xsl:if>
          </td>
          <td align="right"><xsl:value-of select="Kol-OTHER"/>
              <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-OTHER-MT"/> / <xsl:value-of select="Kol-OTHER-LT"/>)</xsl:if>
          </td>
      </xsl:if>
      <xsl:for-each select="OCol">	
            <td align="right"><xsl:value-of select="Kol"/>
              <xsl:if test='Kol > 0'>
                <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-MT"/> / <xsl:value-of select="Kol-LT"/>)</xsl:if>  
              </xsl:if>
            </td>
      </xsl:for-each>  
      <xsl:if test='$FlagTimeTS = 1'> 
              <td align="right"></td>
              <td align="right"><b><xsl:value-of select="TimeExec"/></b></td>
      </xsl:if>                
    </tr>
   <!--  цикл по наборам тестов   -->         
    <xsl:for-each select="OTS">	
       <tr class="Cur10">
          <td align="left"><xsl:value-of select="Code"/></td>
          <td style='background:#D9D9D0' align="right"><b><xsl:value-of select="Kol"/></b></td>
          <xsl:if test='$FlagSystem = 1'>
              <td style='background:#D9D9D0' align="right"><xsl:value-of select="Kol-MT"/></td>
              <td style='background:#D9D9D0' align="right"><xsl:value-of select="Kol-LT"/></td>
          </xsl:if>        
          <xsl:if test='$FlagTypeLoc = 1'>
              <td align="right"><xsl:value-of select="Kol-IN"/>
                  <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-IN-MT"/> / <xsl:value-of select="Kol-IN-LT"/>)</xsl:if>
              </td>
              <td align="right"><xsl:value-of select="Kol-OUT"/>
                  <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-OUT-MT"/> / <xsl:value-of select="Kol-OUT-LT"/>)</xsl:if>
              </td>
              <td align="right"><xsl:value-of select="Kol-OTHER"/>
                  <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-OTHER-MT"/> / <xsl:value-of select="Kol-OTHER-LT"/>)</xsl:if>
              </td>
          </xsl:if>
          <xsl:for-each select="OCol">	
             <td align="right"><xsl:value-of select="Kol"/>
               <xsl:if test='Kol > 0'>
                 <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-MT"/> / <xsl:value-of select="Kol-LT"/>)</xsl:if>  
               </xsl:if>
             </td>
         </xsl:for-each>              
         <xsl:if test='$FlagTimeTS = 1'> 
              <td align="right" style='background:#D9D9D0'><b><xsl:value-of select="Time"/></b></td>
              <td align="right" style='background:#D9D9D0'><b><xsl:value-of select="TimeExec"/></b></td>
         </xsl:if>
       </tr>
      </xsl:for-each>
  </xsl:for-each>
 </table>
 </xsl:if> <!-- для FlagSummary=0 -->
</xsl:if> <!-- для FlagTurnRound=0 -->

<!-- ..............................................................................................
     III ВАРИАНТ =>  разворачиваем таблицу (строки - местоположения; динамические столбцы - отделы) 
                     Сводный отчет по отделам (без разбивки по наборам тестов)
     ............................................................................................. -->
<xsl:if test='$FlagTurnRound = 1'> 
  <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
   <tr class="xl47">
     <td width="150pt" rowspan="2"><b>Местоположения пациентов</b></td>
     <xsl:if test='$FlagSystem = 0'><td width="10pt" rowspan="2"><b>Количество<br/>выполн.<br/>наборов<br/>тестов</b></td></xsl:if> 
     <xsl:if test='$FlagSystem = 1'><td width="10pt" HEIGHT="15pt" colspan="3"><b>Количество выполн. наборов тестов</b></td></xsl:if> 
     <td width="50pt" colspan='{ColDEP}'><b>Отделы лаборатории</b></td>
   </tr>
   <!--  вторая строка шапки -->
   <tr class="xl47">
    <xsl:if test='$FlagSystem = 1'>
           <td align="center"><b>Всего</b></td>
           <td align="center"><b>MT</b></td>
           <td align="center"><b>LT</b></td>
     </xsl:if> 
     <xsl:for-each select="OColumn"><td align="center" HEIGHT="15pt" style='mso-rotate:90'><xsl:value-of select="Desc"/></td></xsl:for-each>
   </tr>
   <!--  1 строка: общие итоги "ВСЕГО" -->
   <tr style='background:#D9D9D9'>
     <td><b>ВСЕГО</b></td>
     <td align="right"><b><xsl:value-of select="ItogoTS"/></b></td>
     <xsl:if test='$FlagSystem = 1'>
           <td align="right"><b><xsl:value-of select="ItogoTS-MT"/></b></td>
           <td align="right"><b><xsl:value-of select="ItogoTS-LT"/></b></td>
     </xsl:if> 
     <xsl:for-each select="OItogoCol">	
        <td align="right"><b><xsl:value-of select="Kol"/></b>
            <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-MT"/> / <xsl:value-of select="Kol-LT"/>)</xsl:if>   
         </td>
     </xsl:for-each>               
   </tr>
   <!--  2 строка: пустая -->
   <tr>
     <td><b>Из них:</b></td>
     <td></td>
   </tr>   
   <!--  цикл по типам местоположений (стационарный/амбулаторный/прочее) -->   
   <xsl:for-each select="OGr">	
     <xsl:if test='$FlagTypeLoc = 1'>
       <tr style='background:#D9D9D0'>
         <td align="left"><b><xsl:value-of select="Code"/></b></td>
         <td align="right"><b><xsl:value-of select="Kol"/></b></td>
         <xsl:if test='$FlagSystem = 1'>
            <td align="right"><xsl:value-of select="Kol-MT"/></td>
            <td align="right"><xsl:value-of select="Kol-LT"/></td>
         </xsl:if>   
         <xsl:for-each select="OCol">	
            <td align="right"><b><xsl:value-of select="Kol"/></b>
               <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-MT"/> / <xsl:value-of select="Kol-LT"/>)</xsl:if>   
            </td>
         </xsl:for-each>              
       </tr>
     </xsl:if>   
     <!-- цикл по местоположениям  -->
     <xsl:for-each select="OGr2">
       <tr>	
          <td align="left"><xsl:value-of select="Code"/></td>
          <td style='background:#D9D9D0' align="right"><b><xsl:value-of select="Kol"/></b></td>          
          <xsl:if test='$FlagSystem = 1'>
              <td style='background:#D9D9D0' align="right"><xsl:value-of select="Kol-MT"/></td>
              <td style='background:#D9D9D0' align="right"><xsl:value-of select="Kol-LT"/></td>
          </xsl:if>  
          <xsl:for-each select="OCol">	
              <td align="right"><xsl:value-of select="Kol"/>
                <xsl:if test='Kol > 0'> 
                   <xsl:if test='$FlagSystem = 1'> (<xsl:value-of select="Kol-MT"/> / <xsl:value-of select="Kol-LT"/>)</xsl:if>
                </xsl:if>   
              </td>
          </xsl:for-each>              
       </tr>
     </xsl:for-each>
   </xsl:for-each>
  </table>
</xsl:if> <!-- для FlagTurnRound=1 -->
 <!-- подвал -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
