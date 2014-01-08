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
 <!-- флаг 1/0 "Выводить только активные РЛ" -->
  <xsl:variable name="FlagActiveWS" >
      <xsl:value-of select="FlagActiveWS" />
  </xsl:variable >
 <!-- флаг 1/0 Доп.вывод реквизитов РЛ -->
  <xsl:variable name="FlagManual" >
      <xsl:value-of select="FlagManual" />
  </xsl:variable >
  <xsl:variable name="FlagMaxVisits" >
      <xsl:value-of select="FlagMaxVisits" />
  </xsl:variable >
  <xsl:variable name="FlagColumn" >
      <xsl:value-of select="FlagColumn" />
  </xsl:variable >
  <xsl:variable name="FlagCalculate" >
      <xsl:value-of select="FlagCalculate" />
  </xsl:variable >
  <xsl:variable name="FlagDoc" >
      <xsl:value-of select="FlagDoc" />
  </xsl:variable >
  <xsl:variable name="FlagPrevResult" >
      <xsl:value-of select="FlagPrevResult" />
  </xsl:variable >
  <xsl:variable name="FlagRearrange" >
      <xsl:value-of select="FlagRearrange" />
  </xsl:variable >
  <xsl:variable name="FlagPAP" >
      <xsl:value-of select="FlagPAP" />
  </xsl:variable >
  <xsl:variable name="FlagClose" >
      <xsl:value-of select="FlagClose" />
  </xsl:variable >
  <xsl:variable name="FlagClinNotes" >
      <xsl:value-of select="FlagClinNotes" />
  </xsl:variable >
  <xsl:variable name="FlagSynonym" >
      <xsl:value-of select="FlagSynonym" />
  </xsl:variable >
  <xsl:variable name="FlagPending" >
      <xsl:value-of select="FlagPending" />
  </xsl:variable >
  <xsl:variable name="FlagIndicator" >
      <xsl:value-of select="FlagIndicator" />
  </xsl:variable >
  <xsl:variable name="FlagPrintOnlyTS" >
      <xsl:value-of select="FlagPrintOnlyTS" />
  </xsl:variable >
  <xsl:variable name="FlagDirect" >
      <xsl:value-of select="FlagDirect" />
  </xsl:variable >
  <xsl:variable name="FlagFont" >
      <xsl:value-of select="FlagFont" />
  </xsl:variable >
  <xsl:variable name="FlagComments" >
      <xsl:value-of select="FlagComments" />
  </xsl:variable >
  <xsl:variable name="FlagLastPrint" >
      <xsl:value-of select="FlagLastPrint" />
  </xsl:variable >
  <xsl:variable name="FlagLastNum" >
      <xsl:value-of select="FlagLastNum" />
  </xsl:variable >
 <!-- флаг 1/0 "Отдел/Наборы тестов/Контроль качества" -->
  <xsl:variable name="FlagDep" >
      <xsl:value-of select="FlagDep" />
  </xsl:variable >
  <xsl:variable name="FlagTS" >
      <xsl:value-of select="FlagTS" />
  </xsl:variable >
  <xsl:variable name="FlagQC" >
      <xsl:value-of select="FlagQC" />
  </xsl:variable >
<Worksheet ss:Name="Список рабочих листов" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="160"/>
<xsl:if test='$FlagActiveWS = 0' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagManual = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagMaxVisits = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagColumn = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagColumn = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagCalculate = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagDoc = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagPrevResult = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagRearrange = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagPAP = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagClose = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagClinNotes = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagSynonym = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagSynonym = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagPending = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagIndicator = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagIndicator = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagPrintOnlyTS = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagDirect = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagFont = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagComments = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="120"/>
</xsl:if>
<xsl:if test='$FlagDep = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagTS = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="120"/>
</xsl:if>
<xsl:if test='$FlagQC = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="120"/>
</xsl:if>
<xsl:if test='$FlagLastPrint = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
<xsl:if test='$FlagLastNum = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > Список рабочих листов для отдела: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
           <!-- повторять заголовок таблицы на каждой странице  -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Код</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Наименование РЛ</Data>
    </Cell>
         <xsl:if test='$FlagActiveWS = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Акт.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagManual = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Ручное создание</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagMaxVisits = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > MAX кол-во образцов</Data>
    </Cell>
         </xsl:if >
        <xsl:if test='$FlagColumn = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Размер столб. для печати</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Размер столб. для ввода</Data>
    </Cell>
        </xsl:if >
         <xsl:if test='$FlagCalculate = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Вычисл. тесты</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDoc = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Врач</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagPrevResult = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Пред. рез-ты</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagRearrange = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Перестр. при печ.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagPAP = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Печать разреш.пац.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagClose = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Закрыть после печати</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagClinNotes = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Клинич. примеч.</Data>
    </Cell>
         </xsl:if >
        <xsl:if test='$FlagSynonym = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Синоним для теста</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Синоним для набора</Data>
    </Cell>
        </xsl:if >
         <xsl:if test='$FlagPending = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Перемест.ждущ. пац.в тек.РЛ</Data>
    </Cell>
         </xsl:if >
        <xsl:if test='$FlagIndicator = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Индикатор рез-тов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Индикатор статусов</Data>
    </Cell>
        </xsl:if >
         <xsl:if test='$FlagPrintOnlyTS = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Наб.тестов без разб.по тестам</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDirect = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Расположение листа</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagFont = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Шрифт</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagComments = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Комментарий</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDep = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Отдел</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Наборы тестов</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagQC = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Контроль Качества</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagLastPrint = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата/время последней печати</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagLastNum = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Последний № РЛ</Data>
    </Cell>
         </xsl:if >
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
           <xsl:if test='$FlagActiveWS = 0' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="FlagActive" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagManual = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ManualCreation" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagMaxVisits = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="MaxVisits" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagColumn = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ColumnPrinting" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ColumnEntry" />
      </Data>
    </Cell>
          </xsl:if >
           <xsl:if test='$FlagCalculate = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="PrintCalculatedFields" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagDoc = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="PrintDoctor" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagPrevResult = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="PreviousResults" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagRearrange = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="RearrangeWhenPrinting" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagPAP = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="PrintAuthorisedPatients" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagClose = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="CloseAfterPrinting" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagClinNotes = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ClinicalNotes" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagSynonym = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="UseSynonymsForTI" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="UseSynonymsForTS" />
      </Data>
    </Cell>
          </xsl:if >
           <xsl:if test='$FlagPending = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="PendingToCurrent" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagIndicator = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ResultIndicators" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="StatusIndicators" />
      </Data>
    </Cell>
          </xsl:if >
           <xsl:if test='$FlagPrintOnlyTS = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="PrintOnlyTS" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagDirect = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="PrintDirection" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagFont = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Font" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagComments = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:for-each select="OComments" > <xsl:value-of select="Desc" /> </xsl:for-each >
      </Data>
    </Cell>
          </xsl:if >
           <xsl:if test='$FlagDep = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Department" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:for-each select="OTS" > <xsl:value-of select="TestSet" /> </xsl:for-each >
      </Data>
    </Cell>
          </xsl:if >
          <xsl:if test='$FlagQC = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:for-each select="OQC" > <xsl:value-of select="Desc" /> </xsl:for-each >
      </Data>
    </Cell>
          </xsl:if >
           <xsl:if test='$FlagLastPrint = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DateTimeLastPrint" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagLastNum = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="LastNum" />
      </Data>
    </Cell>
           </xsl:if >
  </Row>
      </xsl:for-each >
  <!-- подвал -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
