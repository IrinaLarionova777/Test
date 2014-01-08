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
 <!-- флаг 1/2/3 "тип отчета": 1 - Cписок пациентов / 2 - Cписок результатов / 3 - Результаты наборов тестов / 4 - Результаты тестов -->
  <xsl:variable name="FlagReport" >
      <xsl:value-of select="FlagReport" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести местоположение пациента" -->
  <xsl:variable name="FlagLocPat" >
      <xsl:value-of select="FlagLocPat" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести лечащего врача пациента" -->
  <xsl:variable name="FlagDocPat" >
      <xsl:value-of select="FlagDocPat" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести категорию пациента" -->
  <xsl:variable name="FlagCatPat" >
      <xsl:value-of select="FlagCatPat" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести плательщика" -->
  <xsl:variable name="FlagPayment" >
      <xsl:value-of select="FlagPayment" />
  </xsl:variable >
 <!-- флаг 1/0 Выводить ошибки -->
  <xsl:variable name="FlagError" >
      <xsl:value-of select="FlagError" />
  </xsl:variable >
 <!-- флаг 1/0 Вывести Дату забора образца" -->
  <xsl:variable name="FlagDateCol" >
      <xsl:value-of select="FlagDateCol" />
  </xsl:variable >
<Worksheet ss:Name="Статистика по категориям" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
<xsl:if test='$FlagDateCol = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagLocPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagDocPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagCatPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
</xsl:if>
<xsl:if test='$FlagPayment = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="120"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="160"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
</xsl:if>
<xsl:if test='$FlagReport = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagReport = 2' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
</xsl:if>
<xsl:if test='$FlagReport > 2' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >Статистика выполненных наборов тестов по категориям пациентов <xsl:value-of select="TC" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >Отдел: <xsl:value-of select="Department" /> / Категория пациента: <xsl:value-of select="PatCategor" /> Тип отчета: <xsl:if test='$FlagReport = 1' > 1 - Cписок пациентов </xsl:if > <xsl:if test='$FlagReport = 2' > 2 - Cписок результатов </xsl:if > <xsl:if test='$FlagReport = 3' > 3 - Результаты наборов тестов </xsl:if > <xsl:if test='$FlagReport = 4' > 4 - Результаты тестов </xsl:if >
      </Data>
    </Cell>
  </Row>
<!-- .........................  1 - Cписок пациентов  ..................................-->  
<xsl:if test='$FlagReport = 1' >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Регистр.№</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ФИО пациента</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Пол</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата рожд.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Лаб. номер</Data>
    </Cell>
         <xsl:if test='$FlagDateCol = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата забора</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Местоположение пациента</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Врач</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagCatPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Катег.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagPayment = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Плательщик</Data>
    </Cell>
         </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Набор тестов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во</Data>
    </Cell>
  </Row>
    <xsl:for-each select="OGr">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="MRN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="FIO" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Sex" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DB" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Epis" />
      </Data>
    </Cell>
           <xsl:if test='$FlagDateCol = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DateCol" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Location" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagDocPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Doctor" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagCatPat = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Categ" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagPayment = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Payment" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="TS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
  </Row>
    </xsl:for-each> 
</xsl:if >
<!-- ...........................  2 - Cписок результатов  ..............................-->  
<xsl:if test='$FlagReport = 2' >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Регистр.№</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ФИО пациента</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Пол</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата рожд.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Лаб. номер</Data>
    </Cell>
         <xsl:if test='$FlagDateCol = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата забора</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Местоположение пациента</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Врач</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagCatPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Катег.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagPayment = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Плательщик</Data>
    </Cell>
         </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Результаты</Data>
    </Cell>
  </Row>
    <xsl:for-each select="OGr">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="MRN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="FIO" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Sex" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DB" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Epis" />
      </Data>
    </Cell>
           <xsl:if test='$FlagDateCol = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DateCol" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Location" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagDocPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Doctor" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagCatPat = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Categ" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagPayment = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Payment" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:for-each select="OGrResult" > [ <xsl:value-of select="TS" /> ] <xsl:value-of select="Res" /> </xsl:for-each >
      </Data>
    </Cell>
  </Row>
    </xsl:for-each> 
</xsl:if >
<!-- ........................... 3 - Результаты наборов тестов / 4 - Результаты тестов .................................-->  
 <xsl:if test='$FlagReport > 2' >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Регистр.№</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ФИО пациента</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Пол</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата рожд.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Лаб. номер</Data>
    </Cell>
         <xsl:if test='$FlagDateCol = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата забора</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Местоположение пациента</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Врач</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagCatPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Катег.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagPayment = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Плательщик</Data>
    </Cell>
         </xsl:if >
         <xsl:for-each select="OCol" >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
         </xsl:for-each >
  </Row>
    <xsl:for-each select="OGr">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="MRN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="FIO" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Sex" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DB" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Epis" />
      </Data>
    </Cell>
           <xsl:if test='$FlagDateCol = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DateCol" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Location" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagDocPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Doctor" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagCatPat = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Categ" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagPayment = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Payment" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:for-each select="OCol" >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select='Result' />
      </Data>
    </Cell>
           </xsl:for-each >
  </Row>
    </xsl:for-each> 
</xsl:if >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
 <!-- подвал -->
  <Row ss:StyleID="Default" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
 <!-- флаг 1/0 Выводить ошибки -->
 <xsl:if test='$FlagError = 1' >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >Список ошибок</Data>
    </Cell>
  </Row>
    <xsl:for-each select="OERROR">	
    <Row >
  <Cell ss:StyleID="Default" ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="Er" /></Data>
    </Cell>
  </Row>
    </xsl:for-each>      
</xsl:if >
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
