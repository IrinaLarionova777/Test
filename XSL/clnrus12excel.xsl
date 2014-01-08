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
 <!-- флаг 1/0 "Расшифровка по группам наборов тестов" -->
  <xsl:variable name="FlagDetailsGR" >
      <xsl:value-of select="FlagDetailsGR" />
  </xsl:variable >
 <!-- флаг 1/0 "Расшифровка по наборам тестов" -->
  <xsl:variable name="FlagDetailsTS" >
      <xsl:value-of select="FlagDetailsTS" />
  </xsl:variable >
 <!-- флаг 1/0 Доп.итог по результатам наборов тестов (норма/патология) -->
  <xsl:variable name="FlagNorm" >
      <xsl:value-of select="FlagNorm" />
  </xsl:variable >
 <!-- флаг 1/0 "Расшифровка по тестам" -->
  <xsl:variable name="FlagDetailsTC" >
      <xsl:value-of select="FlagDetailsTC" />
  </xsl:variable >
 <!-- флаг 1/0 "Количество тестов, для ктр. был проведен Контроль Качества" -->   
  <xsl:variable name="FlagQC" >
      <xsl:value-of select="FlagQC" />
  </xsl:variable >
 <!-- флаг 1/0 "Количество пациентов/лаб.номеров/образцов" -->
  <xsl:variable name="FlagEpis" >
      <xsl:value-of select="FlagEpis" />
  </xsl:variable >
 <!-- флаг 1/0 "Расшифровка по полученным образцам (пробиркам)" -->   
  <xsl:variable name="FlagSpecimen" >
      <xsl:value-of select="FlagSpecimen" />
  </xsl:variable >
 <!-- флаг 1/0 "Кол-во лаб.номеров зарегистр.через Medtak/Labtrak" -->   
  <xsl:variable name="FlagSystem" >
      <xsl:value-of select="FlagSystem" />
  </xsl:variable >
 <!-- флаг 1/0 "Доп.итог по cito (срочные назначения)" -->   
  <xsl:variable name="FlagCito" >
      <xsl:value-of select="FlagCito" />
  </xsl:variable >
<Worksheet ss:Name="Деятельность лаборатории" >
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="275"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Деятельность отделения за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Отдел лаборатории: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell ss:MergeAcross="4" ><Data ss:Type="String"></Data></Cell></Row>
  <xsl:if test='$FlagEpis = 0'> 
  <Row ss:Height="60" ss:StyleID="DefaultHeaderTable">
  <Cell>
      <Data ss:Type="String" > № п/п</Data>
    </Cell>
  <Cell>
      <Data ss:Type="String" > Наименование</Data>
    </Cell>
  <Cell>
      <Data ss:Type="String" > Выполнено наборов</Data>
    </Cell>
  <Cell>
      <Data ss:Type="String" > Выполнено тестов</Data>
    </Cell>
  </Row>
  <Row>
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
  </xsl:if >
  <xsl:if test='$FlagEpis = 1'> 
  <Row ss:Height="40" >
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > № п/п</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > Наименование</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > Выполнено наборов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > Выполнено тестов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > Кол-во пациентов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > Кол-во лаб.N</Data>
    </Cell>
     <xsl:if test='$FlagSystem = 1' >
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > из них</Data>
    </Cell>
     </xsl:if >
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > Кол-во образцов</Data>
    </Cell>
  </Row>
  <Row>
     <xsl:if test='$FlagSystem = 1' >
  <Cell ss:StyleID="DefaultCenterBold" ss:Index="7" >
      <Data ss:Type="String" > МТ</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:Index="8" >
      <Data ss:Type="String" > LT</Data>
    </Cell>
     </xsl:if >
  </Row>
   </xsl:if >
  <Row>
  <Cell  ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > ВСЕГО</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTC" />
      </Data>
    </Cell>
     <xsl:if test='$FlagEpis = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoPat" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoEpis" />
      </Data>
    </Cell>
        <xsl:if test='$FlagSystem = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoEpisMT" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoEpisLT" />
      </Data>
    </Cell>
         </xsl:if>   
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoSpecimen" />
      </Data>
    </Cell>
     </xsl:if >
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > Из них:</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
   <xsl:for-each select="ODep">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
       <xsl:if test='$FlagEpis = 1' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolPat" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolEpis" />
      </Data>
    </Cell>
          <xsl:if test='$FlagSystem = 1' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolEpisMT" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolEpisLT" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolSpecimen" />
      </Data>
    </Cell>
       </xsl:if >
  </Row>
   </xsl:for-each >
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" >
         <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>

<x:WorksheetOptions>
  <x:PageSetup>
     <x:Layout x:Orientation="Landscape"/>
     <x:Header x:Margin="0.3"/>
     <x:Footer x:Margin="0.3"/>
     <x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
  </x:PageSetup>
</x:WorksheetOptions>

</Worksheet>
<!-- NextWorkSheet starttitle Расшифровка по группам наборам тестов endtitle -->
<!--  "Расшифровка по группам наборам тестов" -->
<xsl:if test='$FlagDetailsGR = 1' >
<Worksheet ss:Name="По группам наборам тестов" >
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="300"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > Деятельность отделения за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > Отдел лаборатории: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > Расшифровка по группам наборов тестов</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Код</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Наименование группы наборов тестов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Выполнено наборов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Выполнено тестов</Data>
    </Cell>
  </Row>
   <xsl:for-each select="OGroup">	
    <xsl:if test='$FlagDetailsTS = 0' >
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
  </Row>
    </xsl:if >
    <!--  "Расшифровка по наборам тестов для группы наборов" -->
    <xsl:if test='$FlagDetailsTS = 1' >
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
  </Row>
      <xsl:for-each select="OTS">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
  </Row>
       </xsl:for-each >
    </xsl:if>       
   </xsl:for-each >
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > ВСЕГО выполнено :</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoGRTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoGRTC" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" >
         <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>

<x:WorksheetOptions>
  <x:PageSetup>
     <x:Layout x:Orientation="Portrait"/>
     <x:Header x:Margin="0.3"/>
     <x:Footer x:Margin="0.3"/>
     <x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
  </x:PageSetup>
</x:WorksheetOptions>

</Worksheet>
</xsl:if >
<!-- NextWorkSheet starttitle Расшифровка по наборам тестов endtitle -->
 <!--  "Расшифровка по наборам тестов" -->
 <xsl:if test='$FlagDetailsTS = 1' >
<Worksheet ss:Name="По наборам тестов " >
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="350"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > Деятельность отделения за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > Отдел лаборатории: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > Расшифровка по выполненным наборам тестов</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
   <xsl:if test='$FlagNorm = 0' >
  <Row>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Код</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Наименование набора тестов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Выполнено наборов</Data>
    </Cell>
         <xsl:if test='$FlagNorm = 1' >
  <Cell ss:MergeAcross="1"  ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > из них</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagCito = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > В т.ч. по "Cito"</Data>
    </Cell>
         </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Выполнено тестов</Data>
    </Cell>
  </Row>
   </xsl:if >
   <xsl:if test='$FlagNorm = 1' >
  <Row>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > Код</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > Наименование набора тестов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > Выполнено наборов</Data>
    </Cell>
         <xsl:if test='$FlagNorm = 1' >
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > из них</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagCito = 1' >
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > В т.ч. по "Cito"</Data>
    </Cell>
         </xsl:if >
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > Выполнено тестов</Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultCenterBold"  ss:Index="4" >
      <Data ss:Type="String" > в норме</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold"  ss:Index="5" >
      <Data ss:Type="String" > патоло- гических</Data>
    </Cell>
  </Row>
   </xsl:if >
   <xsl:for-each select="ODep">	
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
      <xsl:if test='$FlagNorm = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolFlagN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolFlagA" />
      </Data>
    </Cell>
      </xsl:if >
       <xsl:if test='$FlagCito = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolCito" />
      </Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
  </Row>
    <xsl:for-each select="OTS">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
          <xsl:if test='$FlagNorm = 1' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolFlagN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolFlagA" />
      </Data>
    </Cell>
          </xsl:if >
           <xsl:if test='$FlagCito = 1' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolCito" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
  </Row>
      </xsl:for-each >
   </xsl:for-each >
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > ВСЕГО выполнено наборов тестов:</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
     <xsl:if test='$FlagNorm = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoFlagN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoFlagA" />
      </Data>
    </Cell>
     </xsl:if >
      <xsl:if test='$FlagCito = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoCito" />
      </Data>
    </Cell>
      </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTC" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" >
         <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>

<x:WorksheetOptions>
  <x:PageSetup>
     <x:Layout x:Orientation="Landscape"/>
     <x:Header x:Margin="0.3"/>
     <x:Footer x:Margin="0.3"/>
     <x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
  </x:PageSetup>
</x:WorksheetOptions>

</Worksheet>
 </xsl:if >
<!-- NextWorkSheet starttitle Расшифровка по тестам endtitle -->
<!--  "Расшифровка по тестам" -->
<xsl:if test='$FlagDetailsTC = 1' >
<Worksheet ss:Name="По тестам " >
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="350"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > Деятельность отделения за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > Отдел лаборатории: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > Расшифровка по выполненым тестам</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Код</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Наименование теста</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Выполнено тестов</Data>
    </Cell>
     <xsl:if test='$FlagQC = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Контроль качества</Data>
    </Cell>
     </xsl:if >
  </Row>
   <xsl:for-each select="ODep">	
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
      <xsl:if test='$FlagQC = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolQC" />
      </Data>
    </Cell>
      </xsl:if>      
  </Row>
    <xsl:for-each select="OTC">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
          <xsl:if test='$FlagQC = 1' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolQC" />
      </Data>
    </Cell>
          </xsl:if >
  </Row>
      </xsl:for-each >
   </xsl:for-each >
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > ВСЕГО выполнено тестов:</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTC" />
      </Data>
    </Cell>
     <xsl:if test='$FlagQC = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoQC" />
      </Data>
    </Cell>
     </xsl:if>  
  </Row>
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" >
         <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>

<x:WorksheetOptions>
  <x:PageSetup>
     <x:Layout x:Orientation="Portrait"/>
     <x:Header x:Margin="0.3"/>
     <x:Footer x:Margin="0.3"/>
     <x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
  </x:PageSetup>
</x:WorksheetOptions>

</Worksheet>
</xsl:if >
<!-- NextWorkSheet starttitle Расшифровка по полученным образцам (пробиркам) endtitle -->
<!--  "Расшифровка по полученным образцам (пробиркам)" -->
<xsl:if test='$FlagSpecimen = 1' >
<Worksheet ss:Name="По образцам (пробиркам)" >
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="300"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Деятельность отделения за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Отдел лаборатории: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Расшифровка по полученным образцам:</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Код</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Наименование образца</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во образцов (получено)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Выполнено наб.тестов</Data>
    </Cell>
  </Row>
   <xsl:for-each select="OSpecimen">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolSpecimen" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  </Row>
   </xsl:for-each >
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > ВСЕГО :</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoSpecimen" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
  </Row>
 <!-- подвал -->
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>

<x:WorksheetOptions>
  <x:PageSetup>
     <x:Layout x:Orientation="Portrait"/>
     <x:Header x:Margin="0.3"/>
     <x:Footer x:Margin="0.3"/>
     <x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
  </x:PageSetup>
</x:WorksheetOptions>

</Worksheet>
</xsl:if >
</xsl:template >
</xsl:stylesheet >
