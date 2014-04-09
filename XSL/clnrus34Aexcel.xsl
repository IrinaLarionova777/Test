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
 <!-- флаг 1/0 Доп.вывод реквизитов -->
  <xsl:variable name="FlagMRN" >
      <xsl:value-of select="FlagMRN" />
  </xsl:variable >
  <xsl:variable name="FlagFIO" >
      <xsl:value-of select="FlagFIO" />
  </xsl:variable >
  <xsl:variable name="FlagSex" >
      <xsl:value-of select="FlagSex" />
  </xsl:variable >
  <xsl:variable name="FlagDOB" >
      <xsl:value-of select="FlagDOB" />
  </xsl:variable >
  <xsl:variable name="FlagAge" >
      <xsl:value-of select="FlagAge" />
  </xsl:variable >
  <xsl:variable name="FlagPregn" >
      <xsl:value-of select="FlagPregn" />
  </xsl:variable >
  <xsl:variable name="FlagAddress" >
      <xsl:value-of select="FlagAddress" />
  </xsl:variable >
  <xsl:variable name="FlagDiagn" >
      <xsl:value-of select="FlagDiagn" />
  </xsl:variable >
  <xsl:variable name="FlagDateCol" >
      <xsl:value-of select="FlagDateCol" />
  </xsl:variable >
  <xsl:variable name="FlagTimeCol" >
      <xsl:value-of select="FlagTimeCol" />
  </xsl:variable >
  <xsl:variable name="FlagSpec" >
      <xsl:value-of select="FlagSpec" />
  </xsl:variable >
  <xsl:variable name="FlagCategPat" >
      <xsl:value-of select="FlagCategPat" />
  </xsl:variable >
  <xsl:variable name="FlagLocPat" >
      <xsl:value-of select="FlagLocPat" />
  </xsl:variable >
  <xsl:variable name="FlagDocPat" >
      <xsl:value-of select="FlagDocPat" />
  </xsl:variable >
  <xsl:variable name="FlagPayPat" >
      <xsl:value-of select="FlagPayPat" />
  </xsl:variable >
  <xsl:variable name="FlagEpis" >
      <xsl:value-of select="FlagEpis" />
  </xsl:variable >
  <xsl:variable name="FlagTS" >
      <xsl:value-of select="FlagTS" />
  </xsl:variable >
  <xsl:variable name="FlagDateExec" >
      <xsl:value-of select="FlagDateExec" />
  </xsl:variable >
  <xsl:variable name="FlagTimeExec" >
      <xsl:value-of select="FlagTimeExec" />
  </xsl:variable >
  <xsl:variable name="FlagSNOMED" >
      <xsl:value-of select="FlagSNOMED" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести единицы измерения для теста" -->
  <xsl:variable name="FlagUnits" >
      <xsl:value-of select="FlagUnits" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести Цветовую палитру строк в соответствии с Флагом результата" -->
  <xsl:variable name="FlagColor" >
      <xsl:value-of select="FlagColor" />
  </xsl:variable >
 <!-- флаг 1/0 "Сортировка данных" -->
  <xsl:variable name="FlagSort1" >
      <xsl:value-of select="FlagSort1" />
  </xsl:variable >
  <xsl:variable name="FlagSort2" >
      <xsl:value-of select="FlagSort2" />
  </xsl:variable >
  <xsl:variable name="FlagSort3" >
      <xsl:value-of select="FlagSort3" />
  </xsl:variable >
<Worksheet ss:Name="Рез-ты исследований набор" >
<x:WorksheetOptions>
<x:PageSetup>
 <xsl:choose>
  <xsl:when test='$FlagFIO = 1 or $FlagMRN = 1 or $FlagDOB = 1 or $FlagAddress = 1 or $FlagDiagn = 1 or $FlagDateCol = 1 or $FlagSpec = 1 or $FlagCategPat = 1 or $FlagLocPat = 1' >
   <x:Layout x:Orientation="Landscape"/>
  </xsl:when>
  <xsl:otherwise>
   <x:Layout x:Orientation="Portrait"/>
  </xsl:otherwise>
 </xsl:choose>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
<xsl:if test='$FlagSort1 = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="55"/>
</xsl:if>
<xsl:if test='$FlagSort2 = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="35"/>
</xsl:if>
<xsl:if test='$FlagSort3 = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagTS = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
</xsl:if>
<xsl:if test='$FlagDateExec = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="55"/>
</xsl:if>
<!--
<xsl:if test='$FlagTimeExec = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
-->
<xsl:if test='$FlagEpis = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="70"/>
</xsl:if>
<xsl:if test='$FlagFIO = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
</xsl:if>
<xsl:if test='$FlagMRN = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagSex = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="10"/>
</xsl:if>
<xsl:if test='$FlagDOB = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="55"/>
</xsl:if>
<xsl:if test='$FlagAge = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagPregn = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagAddress = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagDiagn = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagDateCol = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="55"/>
</xsl:if>
<xsl:if test='$FlagTimeCol = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<xsl:if test='$FlagSpec = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagCategPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
</xsl:if>
<xsl:if test='$FlagLocPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagDocPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagPayPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagSNOMED = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="15"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > Результаты исследований за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > Набор тестов: <xsl:value-of select="TestSet" /> <xsl:if test='PatLocation != ""' > Местоположение пациента: <xsl:value-of select="PatLocation" /> </xsl:if > <xsl:if test='FlagSort != 0' > Сортировка данных: <xsl:if test='$FlagSort1 = 1' > 1 - <xsl:value-of select="NameSort1" /> </xsl:if > <xsl:if test='$FlagSort2 = 1' > / 2 - <xsl:value-of select="NameSort2" /> </xsl:if > <xsl:if test='$FlagSort3 = 1' > / 3 - <xsl:value-of select="NameSort3" /> </xsl:if > </xsl:if>
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > № п/п</Data>
    </Cell>
         <xsl:if test='$FlagSort1 = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > <xsl:value-of select="NameSort1" />
      </Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagSort2 = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > <xsl:value-of select="NameSort2" />
      </Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagSort3 = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > <xsl:value-of select="NameSort3" />
      </Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Набор тестов</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDateExec = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата выполн.</Data>
    </Cell>
         </xsl:if >
         <!--
           <xsl:if test='$FlagTimeExec = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Время вып.</Data>
    </Cell>
           </xsl:if >
                                 -->
         <xsl:if test='$FlagEpis = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Лаб.номер</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagFIO = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ФИО пациента</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagMRN = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Номер МК</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagSex = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Пол</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDOB = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата рожд.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagAge = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Возр.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagPregn = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Берем</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagAddress = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Адрес пациента</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDiagn = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Клинич.анамнез</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDateCol = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата забора</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagTimeCol = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Время забора</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagSpec = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Тип образца</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagCategPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Катег.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Местополож. пациента</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Врач</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagPayPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Плательщик</Data>
    </Cell>
         </xsl:if >
 <xsl:if test='$FlagSNOMED = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >SNOMED</Data>
    </Cell>
  </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Результат</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Флаг</Data>
    </Cell>
  </Row>
    <xsl:for-each select="ONext" >
  <Row>
           <xsl:variable name="BackgroundFlag" >
               <xsl:value-of select="BackColour" />
           </xsl:variable >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="NN" />
      </Data>
    </Cell>
           <xsl:if test='$FlagSort1 = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Sort1" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagSort2 = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Sort2" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagSort3 = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Sort3" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="TestSet" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagDateExec = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="DateExec" />
      </Data>
    </Cell>
           </xsl:if >
           <!--
             <xsl:if test='$FlagTimeExec = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="TimeExec" />
      </Data>
    </Cell>
             </xsl:if >
                               -->
           <xsl:if test='$FlagEpis = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Epis" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagFIO = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="FIO" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagMRN = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="MRN" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagSex = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Sex" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagDOB = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DOB" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagAge = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Age" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagPregn = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="PregnWeek" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagAddress = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Address" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagDiagn = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Diagn" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagDateCol = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DateCol" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagTimeCol = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="TimeCol" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagSpec = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Specimen" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagCategPat = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:if test='Categ != ""' > " <xsl:value-of select="Categ" /> " </xsl:if >
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
 <xsl:if test='$FlagPayPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Payment" />
      </Data>
  </Cell>
 </xsl:if >
 <xsl:if test='$FlagSNOMED = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="SNOMED" />
      </Data>
  </Cell>
 </xsl:if >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:for-each select="OResult"> <xsl:value-of select="TC" /> ( <xsl:value-of select="Desc" /> ) = <xsl:value-of select="Res" /> <xsl:if test='Flag != "N"' > &#160; * &#160; </xsl:if > <xsl:if test='$FlagUnits = 1' > &#160; <xsl:value-of select="Units" /> </xsl:if > </xsl:for-each> <xsl:for-each select="OComment" > <i > <xsl:value-of select="Res" /> </i > </xsl:for-each >
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Flag" />
      </Data>
    </Cell>
  </Row>
    </xsl:for-each> 
    <!--общий итог -->
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > Общее число выполненных исследований за заданный период = <xsl:value-of select="Itog-KolTS" /> ; из них "патологических" результатов = <xsl:value-of select="Itog-KolTS-H" />
      </Data>
    </Cell>
  </Row>
 <!-- подвал -->
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
