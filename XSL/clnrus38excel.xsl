<?xml version="1.0" encoding="windows-1251" ?>
  <xsl:stylesheet version="1.0"
    xmlns="urn:schemas-microsoft-com:office:spreadsheet"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:o="urn:schemas-microsoft-com:office:office" 
    xmlns:x="urn:schemas-microsoft-com:office:excel" 
    xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
    xmlns:user="urn:my-scripts">

  <xsl:output method="xml" encoding="Windows-1251" omit-xml-declaration="no"/>
<xsl:template match="baseO/OUser" >
  <!-- флаг  1 = "Сводный по отделам (без разбивки по наборам тестов)"
            2 = "Расшифровка по наборам тестов"; 3 = "Расшифровка по тестам"; 4 = "Расшифровка по группам наборов тестов"  -->
  <xsl:variable name="FlagReport" >
      <xsl:value-of select="FlagReport" />
  </xsl:variable >
 <!-- флаг 1/0 Развернуть таблицу -->
  <xsl:variable name="FlagTurnRound" >
      <xsl:value-of select="FlagTurnRound" />
  </xsl:variable >
<Worksheet ss:Name="Деятельность лаборатории" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Portrait"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="70"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >Отчет о количестве выполненных исследований по направляющим врачам за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >Отдел: <xsl:value-of select="Department" /> / Врач: <xsl:value-of select="Doctor" /> <xsl:if test='$FlagReport = 1' > Сводный отчет по отделам (без разбивки по наборам тестов) </xsl:if > <xsl:if test='$FlagReport = 2' > Расшифровка по наборам тестов </xsl:if > <xsl:if test='$FlagReport = 3'>Расшифровка по тестам <xsl:if test='FlagNotCalcul = 1' > (без учета расчетных тестов) </xsl:if > </xsl:if > <xsl:if test='$FlagReport = 4' > Расшифровка по группам наборов тестов </xsl:if >
      </Data>
    </Cell>
  </Row>
 <!-- ..............................................................................................
     I ВАРИАНТ =>  строим таблицу (строки - отделы; динамические столбцы - врачи)
                   Сводный отчет по отделам (без разбивки по наборам тестов)
     ............................................................................................. -->
<xsl:if test='$FlagTurnRound = 0' >
 <xsl:if test='$FlagReport = 1' >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Отдел</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Общее кол-во выполн. наборов тестов</Data>
    </Cell>
     <xsl:for-each select="OColumn">	
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
     </xsl:for-each>         
  </Row>
   <!--  1 строка: общие итоги "ВСЕГО"  -->
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > ВСЕГО</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
     <xsl:for-each select="OItogoCol">	
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
     </xsl:for-each>               
  </Row>
   <!--  2 строка: пустая -->
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > Из них:</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
   <!--  цикл по отделам   -->   
   <xsl:for-each select="OGr">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
       <xsl:for-each select="OCol">	
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
       </xsl:for-each>              
  </Row>
   </xsl:for-each >
  </xsl:if >
      <!-- дял FlagReport=1 -->
  <!-- ..............................................................................................
     II ВАРИАНТ =>  строим таблицу (строки - отделы; динамические столбцы - врачи)
                   Расширенный отчет с разбивкой по наборам тестов/по тестам)
     ............................................................................................. -->
 <xsl:if test='$FlagReport != 1' >
  <Row><Cell ss:MergeAcross="2" ><Data ss:Type="String" ></Data></Cell></Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
     <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Отдел / Набор тестов</Data>
    </Cell>
     </xsl:if >
     <xsl:if test='$FlagReport = 3' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Отдел / Тесты</Data>
    </Cell>
     </xsl:if >
     <xsl:if test='$FlagReport = 4' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Группа наборов тестов / Набор тестов</Data>
    </Cell>
     </xsl:if>     
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Общее кол-во выполн. исследований</Data>
    </Cell>
     <xsl:for-each select="OColumn">	
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
     </xsl:for-each >
  </Row>
   <!--  1 строка: общие итоги "ВСЕГО"   -->
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > ВСЕГО</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
     <xsl:for-each select="OItogoCol">	
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
     </xsl:for-each>               
  </Row>
   <!--  2 строка: пустая -->
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > Из них:</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
   <!--  цикл по отделам   -->   
   <xsl:for-each select="OGr">	
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
      <xsl:for-each select="OCol">	
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
      </xsl:for-each>              
  </Row>
   <!--  цикл по наборам тестов   -->         
    <xsl:for-each select="OTS">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
          <xsl:for-each select="OCol">	
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
         </xsl:for-each>              
  </Row>
      </xsl:for-each >
  </xsl:for-each >
  </xsl:if >
      <!-- для FlagSummary=0 -->
 </xsl:if >
     <!-- для FlagTurnRound=0 -->
 <!-- ..............................................................................................
     III ВАРИАНТ =>  разворачиваем таблицу (строки - врачи; динамические столбцы - отделы) 
                     Сводный отчет по отделам (без разбивки по наборам тестов)
     ............................................................................................. -->
<xsl:if test='$FlagTurnRound = 1'> 
  <Row><Cell ss:MergeAcross="2" ><Data ss:Type="String" ></Data></Cell></Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Направляющий врач</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Общее кол-во выполн. наборов тестов</Data>
    </Cell>
     <xsl:for-each select="OColumn">	
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
     </xsl:for-each >
  </Row>
   <!--  1 строка: общие итоги "ВСЕГО" -->
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > ВСЕГО</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
     <xsl:for-each select="OItogoCol">	
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
     </xsl:for-each>               
  </Row>
   <!--  2 строка: пустая -->
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > Из них:</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
   <!--  цикл по врачам -->   
   <xsl:for-each select="OGr">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
          <xsl:for-each select="OCol">	
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
          </xsl:for-each>              
  </Row>
   </xsl:for-each >
 </xsl:if >
     <!-- для FlagTurnRound=1 -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
 <!-- подвал -->
  <Row ss:StyleID="Default" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
