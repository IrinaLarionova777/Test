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
</xsl:variable>  
<xsl:template match="baseO/OUser" >
<Worksheet ss:Name="    Отчет по контейнерам" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Portrait"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="300"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
  <Row ss:StyleID="DefaultTitle">
    <Cell ss:MergeAcross="1"><Data ss:Type="String">Отчет по контейнерам за период с <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" /></Data></Cell>
  </Row>
<xsl:for-each select="OGr">
  <Row >
    <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1">
		  <Data ss:Type="String">Плательщик <xsl:value-of select="Payment"  />(<xsl:value-of select="PaymentCode"  />)
	  </Data>
    </Cell>
    <Cell>
    </Cell>
  </Row>
  <Row>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"> Контейнер</Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"> Количество</Data>
    </Cell>
  </Row>
<xsl:for-each select="OCol" >
  <Row>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="ContName"  /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="ContCount"  /></Data>
    </Cell>
  </Row>
</xsl:for-each>
</xsl:for-each>	
  <Row>
    <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String"> Итого</Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Total"  /></Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
