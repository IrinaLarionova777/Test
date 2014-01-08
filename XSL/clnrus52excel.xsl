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
    <xsl:variable name="DateFrom" >
        <xsl:value-of select="DateFrom" />
    </xsl:variable >
    <xsl:variable name="DateTo" >
        <xsl:value-of select="DateTo" />
    </xsl:variable >
    <xsl:variable name="FlagDetailsForTests" >
        <xsl:value-of select="FlagDetailsForTests" />
    </xsl:variable >
<Worksheet ss:Name="Отчет для анализа работы" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="70"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
 <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
 <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>

  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="8" >
      <Data ss:Type="String" > Отчет для анализа работы приборов за период с <xsl:value-of select="$DateFrom" /> по <xsl:value-of select="$DateTo" /> <xsl:if test='$FlagDetailsForTests = 1' > (с детализацией по тестам) </xsl:if>
      </Data>
    </Cell>
  </Row>
      <xsl:for-each select="OGRDevice">	
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="8" >
      <Data ss:Type="String" > Анализотор <xsl:value-of select="Device" />
      </Data>
    </Cell>
  </Row>
  <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Номер эпизода</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Тесты</Data>
    </Cell>
             <xsl:if test='$FlagDetailsForTests != 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата и время регистрации эпизода</Data>
    </Cell>
             </xsl:if >
             <xsl:if test='$FlagDetailsForTests = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата и время регистрации эпизода или теста</Data>
    </Cell>
             </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата и время отправки задания на прибор</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата и время получения результатов с прибора</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата и время авторизации результатов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Срочность</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Время между регистрацией и авторизацией (мин)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Время между отправкой задания на прибор и получения результатов с прибора (мин)</Data>
    </Cell>
  </Row>
  <xsl:for-each select="OGrEpis" >
      <xsl:variable name="Episode" >
         <xsl:value-of select="Episode" />
      </xsl:variable >
      <Row >
          <xsl:if test='$Episode = "Average"' >
            <Cell ss:StyleID="DefaultTableLineBackground" ss:MergeAcross="2" >
               <Data ss:Type="String" > Средние значения по эпизодам</Data>
            </Cell>
            <Cell ss:StyleID="DefaultTableLineBackground" >
               <Data ss:Type="String" > <xsl:value-of select="DateTimeSet" /></Data>
            </Cell>
            <Cell ss:StyleID="DefaultTableLineBackground" >
                <Data ss:Type="String" > <xsl:value-of select="DateTimeGet" />
                </Data>
            </Cell>
            <Cell ss:StyleID="DefaultTableLineBackground" >
                <Data ss:Type="String" > <xsl:value-of select="DateTimeAuth" />
                </Data>
            </Cell>
            <Cell ss:StyleID="DefaultTableLineBackground" >
                <Data ss:Type="String" > <xsl:value-of select="Cito" />
                </Data>
            </Cell>
            <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
                <Data ss:Type="String" > <xsl:value-of select="DiffEntryAuth" />
                </Data>
            </Cell>
            <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
                <Data ss:Type="String" > <xsl:value-of select="DiffSetGet" />
                </Data>
            </Cell>
         </xsl:if >
         <xsl:if test='$Episode != "Average"' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Episode" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Tests" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="DateTimeEntry" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="DateTimeSet" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="DateTimeGet" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="DateTimeAuth" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Cito" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="DiffEntryAuth" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="DiffSetGet" />
      </Data>
    </Cell>
    </xsl:if >
   </Row> 
 </xsl:for-each >
</xsl:for-each >

<xsl:if test='$FlagDetailsForTests = 1'> 
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > Средние величины по тестам</Data>
    </Cell>
  </Row>
      <xsl:for-each select="OGRDeviceAvg">	
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="5" >
      <Data ss:Type="String" > Анализотор <xsl:value-of select="Device" />
      </Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="3" >
      <Data ss:Type="String" > Тест</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Время между регистрацией и авторизацией (мин)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Время между отправкой задания на прибор и получения результатов с прибора (мин)</Data>
    </Cell>
  </Row>
            <xsl:for-each select="OGrTestAvg" >
  <Row>
  <Cell ss:StyleID="DefaultLeft" ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:value-of select="Test" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="DiffEntryAuth" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="DiffSetGet" />
      </Data>
    </Cell>
  </Row>
            </xsl:for-each >
      </xsl:for-each >
   </xsl:if>    
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
