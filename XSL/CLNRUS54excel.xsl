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
 <xsl:variable name="pass" >
</xsl:variable >
	<xsl:template match="baseO/OUser" >
    <xsl:variable name="DateFrom" >
        <xsl:value-of select="DateFrom" />
    </xsl:variable >
    <xsl:variable name="DateTo" >
        <xsl:value-of select="DateTo" />
    </xsl:variable >
<Worksheet ss:Name="Отчет по контролю качества" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:AutoFitWidth="0" ss:Width="150"/>
<Column ss:AutoFitWidth="0" ss:Width="200"/>
<Column ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:AutoFitWidth="0" ss:Width="150"/>
<Column ss:AutoFitWidth="0" ss:Width="30"/>
<Column ss:AutoFitWidth="0" ss:Width="150"/>
<Column ss:AutoFitWidth="0" ss:Width="30"/>
<Column ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:AutoFitWidth="0" ss:Width="150"/>
<Column ss:AutoFitWidth="0" ss:Width="80"/>
  <Row ss:StyleID="DefaultTitle">
    <Cell ss:MergeAcross="3"><Data ss:Type="String"><b >Отчет по результатам контроля качества за период с <xsl:value-of select="$DateFrom" /> по <xsl:value-of select="$DateTo" /></b ></Data></Cell>
  </Row>
  <Row>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >Название прибора</b ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >Название теста</b ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >Код теста на приборе</b ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >Название контрольного материала (КМ)</b ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >Код лота КМ</b ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >Название лота КМ</b ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >Номер уровня КМ</b ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >Описание уровня КМ</b ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >Дата и время получения результата по КК</b ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >Результат КК</b ></Data>
    </Cell>
  </Row>
<xsl:for-each select="OQC" >
		<xsl:variable name="Odd" >
			<xsl:value-of select="Odd" />
		</xsl:variable >
		<xsl:if test='$Odd = "1"'>	
  <Row >
    <Cell ss:StyleID="DefaultTableLineBackground">
      <Data ss:Type="String"><xsl:value-of select="Device" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackground">
      <Data ss:Type="String"><xsl:value-of select="TestName" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackground">
      <Data ss:Type="String"><xsl:value-of select="TestCode" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackground">
      <Data ss:Type="String"><xsl:value-of select="Material" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackground">
      <Data ss:Type="String"><xsl:value-of select="LotCode" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackground">
      <Data ss:Type="String"><xsl:value-of select="LotName" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackground">
      <Data ss:Type="String"><xsl:value-of select="Level" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackground">
      <Data ss:Type="String"><xsl:value-of select="LevalName" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackground">
      <Data ss:Type="String"><xsl:value-of select="DateTime" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRight">
      <Data ss:Type="String"><xsl:value-of select="Result" /></Data>
    </Cell>
  </Row>
</xsl:if>
<xsl:if test='$Odd = "0"'>	
  <Row>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Device" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="TestName" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="TestCode" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Material" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="LotCode" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="LotName" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Level" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="LevalName" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="DateTime" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="Result" /></Data>
    </Cell>
  </Row>
</xsl:if>	
</xsl:for-each>
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
