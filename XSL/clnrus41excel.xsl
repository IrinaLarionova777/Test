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
 <!-- флаг 1/0 Доп.вывод реквизитов анализаторов -->
  <xsl:variable name="FlagCOM" >
      <xsl:value-of select="FlagCOM" />
  </xsl:variable >
  <xsl:variable name="FlagDirect" >
      <xsl:value-of select="FlagDirect" />
  </xsl:variable >
  <xsl:variable name="FlagPRG" >
      <xsl:value-of select="FlagPRG" />
  </xsl:variable >
  <xsl:variable name="FlagDep" >
      <xsl:value-of select="FlagDep" />
  </xsl:variable >
  <xsl:variable name="FlagTS" >
      <xsl:value-of select="FlagTS" />
  </xsl:variable >
  <xsl:variable name="FlagTC" >
      <xsl:value-of select="FlagTC" />
  </xsl:variable >
  <xsl:variable name="FlagQC" >
      <xsl:value-of select="FlagQC" />
  </xsl:variable >
<Worksheet ss:Name="Список анализаторов" >
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
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
<xsl:if test='$FlagCOM = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<xsl:if test='$FlagDirect = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagPRG = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagDep = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagTS = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
</xsl:if>
<xsl:if test='$FlagTC = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="400"/>
</xsl:if>
<xsl:if test='$FlagQC = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
</xsl:if>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" >Список анализаторов для отдела: <xsl:value-of select="Department" />
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
      <Data ss:Type="String" > Наименование анализатора</Data>
    </Cell>
         <xsl:if test='$FlagCOM = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > COM-порт</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDirect = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Режим работы</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagPRG = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Программа</Data>
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
         <xsl:if test='$FlagTC = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Тесты</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagQC = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Контроль Качества</Data>
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
           <xsl:if test='$FlagCOM = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="COM" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagDirect = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Direct" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagPRG = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Programm" />
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
          <xsl:if test='$FlagTC = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:for-each select="OTC" > <xsl:value-of select="Test" /> = <xsl:value-of select="TestID" /> ( <xsl:value-of select="Direction" /> ) <xsl:value-of select="Divider" /> <xsl:value-of select="Suffix" /> </xsl:for-each >
      </Data>
    </Cell>
          </xsl:if >
          <xsl:if test='$FlagQC = 1' >
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > <xsl:for-each select="OQC" > <xsl:value-of select="Desc" /> </xsl:for-each >
      </Data>
    </Cell>
          </xsl:if >
  </Row>
      </xsl:for-each >
  <!-- подвал -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
