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
  <xsl:variable name="FlagHospMRN" >
      <xsl:value-of select="FlagHospMRN" />
  </xsl:variable >
  <xsl:variable name="FlagHospEpis" >
      <xsl:value-of select="FlagHospEpis" />
  </xsl:variable >
  <xsl:variable name="FlagStorage" >
      <xsl:value-of select="FlagStorage" />
  </xsl:variable >
  <xsl:variable name="FlagDayLabNum" >
      <xsl:value-of select="FlagDayLabNum" />
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
  <xsl:variable name="FlagWaiting" >
      <xsl:value-of select="FlagWaiting" />
  </xsl:variable >
<Worksheet ss:Name="Список Назначенных исслед" >
<x:WorksheetOptions>
<x:PageSetup>
 <xsl:choose>
  <xsl:when test='$FlagMRN = 1 or $FlagDOB = 1 or $FlagAddress = 1 or $FlagDiagn = 1 or $FlagDateCol = 1 or $FlagSpec = 1 or $FlagCategPat = 1 or $FlagLocPat = 1' >
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
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagSort2 = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagSort3 = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagEpis = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagFIO = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
</xsl:if>
<xsl:if test='$FlagMRN = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="70"/>
</xsl:if>
<xsl:if test='$FlagHospMRN = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
</xsl:if>
<xsl:if test='$FlagHospEpis = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
</xsl:if>
<xsl:if test='$FlagSex = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
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
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
</xsl:if>
<xsl:if test='$FlagSpec = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
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
<xsl:if test='$FlagStorage = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagDayLabNum = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="240"/>
<xsl:if test='$FlagWaiting = 0' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
</xsl:if>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > Назначенные исследований за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > Отдел: <xsl:value-of select="Отдел" /> <xsl:if test='ГруппаНаборовТестов != ""' > / Группа наборов тестов: <xsl:value-of select="ГруппаНаборовТестов" /> </xsl:if > Сортировка данных: <xsl:if test='$FlagSort1 = 1' > 1 - <xsl:value-of select="NameSort1" /> </xsl:if > <xsl:if test='$FlagSort2 = 1' > / 2 - <xsl:value-of select="NameSort2" /> </xsl:if > <xsl:if test='$FlagSort3 = 1' > / 3 - <xsl:value-of select="NameSort3" /> </xsl:if >
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
      <Data ss:Type="String" > № МК</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagHospMRN = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Больнич.№ МК</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagHospEpis = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Больнич.№ Эпизода</Data>
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
      <Data ss:Type="String" > Время заб.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagSpec = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Тип образца</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagCategPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Катег.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Местополож. пациента</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Врач</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagPayPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Плательщик</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagStorage = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Место хранения</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDayLabNum = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Ежедн. номер</Data>
    </Cell>
         </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Список наборов тестов</Data>
    </Cell>
        <xsl:if test='$FlagWaiting = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во назнач.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во вып.</Data>
    </Cell>
        </xsl:if >
  </Row>
    <xsl:for-each select="ONext" >
  <Row>
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
           <xsl:if test='$FlagHospMRN = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="HospMRN" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagHospEpis = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="HospEpis" />
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
  <Cell ss:StyleID="DefaultLeft" >
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
           <xsl:if test='$FlagStorage = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Storage" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagDayLabNum = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="DayLabNum" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="ListTS" />
      </Data>
    </Cell>
          <xsl:if test='$FlagWaiting = 0' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="CountA" />
      </Data>
    </Cell>
          </xsl:if> 
  </Row>
    </xsl:for-each> 
    <!--общий итог -->
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >Всего за заданный период поступило образцов = <xsl:value-of select="Itog-KolEpis" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >Количество назначенных исследований (наборов тестов) = <xsl:value-of select="Itog-KolTS" />
      </Data>
    </Cell>
  </Row>
<xsl:if test='$FlagWaiting = 0'>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > Выполнено = <xsl:value-of select="Itog-KolTS-A" /> 
      </Data>
    </Cell>
  </Row>
</xsl:if>
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
