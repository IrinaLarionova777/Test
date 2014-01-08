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
 <!-- флаг 1/0 "Выводить только активные наборы тестов" -->
  <xsl:variable name="FlagActiveTS" >
      <xsl:value-of select="FlagActiveTS" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Секция" -->
  <xsl:variable name="FlagSect" >
      <xsl:value-of select="FlagSect" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Образцы" -->
  <xsl:variable name="FlagSpec" >
      <xsl:value-of select="FlagSpec" />
  </xsl:variable >
  <xsl:variable name="FlagCont" >
      <xsl:value-of select="FlagCont" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец  Word-шаблон" -->
  <xsl:variable name="FlagWord" >
      <xsl:value-of select="FlagWord" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Рабочий лист" -->
  <xsl:variable name="FlagWS" >
      <xsl:value-of select="FlagWS" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Анализатор" -->
  <xsl:variable name="FlagMIF" >
      <xsl:value-of select="FlagMIF" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Себестоимость/стоимость" -->
  <xsl:variable name="FlagSum" >
      <xsl:value-of select="FlagSum" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Номер последов.вывода на экран" -->
  <xsl:variable name="FlagNP1" >
      <xsl:value-of select="FlagNP1" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Номер последов.вывода при печати" -->
  <xsl:variable name="FlagNP2" >
      <xsl:value-of select="FlagNP2" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Наименование отчета при печати" -->
  <xsl:variable name="FlagRepName" >
      <xsl:value-of select="FlagRepName" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Флаг "Не разбивать при печати" -->
  <xsl:variable name="FlagSTS" >
      <xsl:value-of select="FlagSTS" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Тип отчета для врача/местоположения" -->
  <xsl:variable name="FlagDRP" >
      <xsl:value-of select="FlagDRP" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Время выполнения" -->
  <xsl:variable name="FlagTime" >
      <xsl:value-of select="FlagTime" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Создан ли Шаблон (Да/Нет)" -->
  <xsl:variable name="FlagTSL1" >
      <xsl:value-of select="FlagTSL1" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Кол-во строк в шаблонеь" -->
  <xsl:variable name="FlagTSL2" >
      <xsl:value-of select="FlagTSL2" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Есть ли Обязательные поля в Шаблоне (Да/Нет)" -->
  <xsl:variable name="FlagTSL3" >
      <xsl:value-of select="FlagTSL3" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Национальный код услуги " -->
  <xsl:variable name="FlagNTC" >
      <xsl:value-of select="FlagNTC" />
  </xsl:variable >
  <xsl:variable name="FlagNTCdesc" >
      <xsl:value-of select="FlagNTCdesc" />
  </xsl:variable >
<Worksheet ss:Name="Список наборов тестов" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
<xsl:if test='$FlagActiveTS = 0' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
<xsl:if test='$FlagNP1= 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
<xsl:if test='$FlagSect = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="75"/>
</xsl:if>
<xsl:if test='$FlagNP2 = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
</xsl:if>
<xsl:if test='$FlagRepName = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<xsl:if test='$FlagSTS = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
<xsl:if test='$FlagDRP = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
</xsl:if>
<xsl:if test='$FlagTime = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
</xsl:if>
<xsl:if test='$FlagSpec = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
</xsl:if>
<xsl:if test='$FlagCont = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
</xsl:if>
<xsl:if test='$FlagWord = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
</xsl:if>
<xsl:if test='$FlagWS = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagMIF = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagSum = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<xsl:if test='$FlagTSL1 = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
</xsl:if>
<xsl:if test='$FlagTSL2 = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
</xsl:if>
<xsl:if test='$FlagTSL3 = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
</xsl:if>
<xsl:if test='$FlagNTC = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
</xsl:if>
<xsl:if test='$FlagNTCdesc = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
</xsl:if>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="24" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="2" >
      <Data ss:Type="String" > Список наборов тестов для отдела: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Код набора</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Наименование набора</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Синоним</Data>
    </Cell>
<xsl:if test='$FlagActiveTS = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Акт.</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagNP1= 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > N п/п</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagSect = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Секция</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagNP2 = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > N посл. печати</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagRepName = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Наименование отчета</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagSTS = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Не разбивать при печати</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagDRP = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Тип отчета для врача</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Тип отчета для местополож.</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagTime = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Время выполнения</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagSpec = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Образец</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagCont = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Контейнер (образец)</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagWord = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Word-шаблон</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagWS = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Рабочий лист</Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagMIF = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Анализатор</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagSum = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Себестоимость</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Стоимость</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagTSL1 = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Создан шаблон</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagTSL2 = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во строк в Ш.</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagTSL3 = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Обязат. поля в Ш.</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagNTC = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Нац.код</Data>
    </Cell>
</xsl:if >
<xsl:if test='$FlagNTCdesc = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Национальное полное наименование услуги</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Нац. синоним</Data>
    </Cell>
</xsl:if>        
  </Row>
      <xsl:for-each select="ONext">	
  <Row>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Synon" />
      </Data>
    </Cell>
           <xsl:if test='$FlagActiveTS = 0' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="FlagActive" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagNP1 = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DisplaySeq" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagSect = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Section" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagNP2 = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="PrintSeq" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagRepName = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ReportName" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagSTS = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="StopTestSplitting" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagDRP = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="PageDoctor" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="PageHospital" />
      </Data>
    </Cell>
          </xsl:if >
           <xsl:if test='$FlagTime = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="TimeExecute" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagSpec = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Specimens" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagCont = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Container" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagWord = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Word" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagWS = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="WorkSheet" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagMIF = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Machine" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagSum = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Cost" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Price" />
      </Data>
    </Cell>
          </xsl:if>          
           <xsl:if test='$FlagTSL1 = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="TSL-Create" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagTSL2 = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="TSL-Count" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagTSL3 = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="TSL-Mandatory" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagNTC = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="NationalNumber" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagNTCdesc = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="NationalNameLong" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="NationalNameShort" />
      </Data>
    </Cell>
          </xsl:if>                  
  </Row>
      </xsl:for-each >
 <!-- подвал -->
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="24" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
