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
    <xsl:variable name="DateStart" >
        <xsl:value-of select="DateStart" />
    </xsl:variable >
    <xsl:variable name="TimeStart" >
        <xsl:value-of select="TimeStart" />
    </xsl:variable >
    <xsl:variable name="DateStop" >
        <xsl:value-of select="DateStop" />
    </xsl:variable >
    <xsl:variable name="TimeStop" >
        <xsl:value-of select="TimeStop" />
    </xsl:variable >
<Worksheet ss:Name="     ����� �� �������������" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:AutoFitWidth="0" ss:Width="60"/>
<Column ss:AutoFitWidth="0" ss:Width="60"/>
<Column ss:AutoFitWidth="0" ss:Width="100"/>
<Column ss:AutoFitWidth="0" ss:Width="200"/>
<Column ss:AutoFitWidth="0" ss:Width="100"/>
<Column ss:AutoFitWidth="0" ss:Width="100"/>
  <Row ss:StyleID="DefaultTitle">
    <Cell ss:MergeAcross="5"><Data ss:Type="String">����� �� ����������� �������� (�� �������������) �� ������ � <xsl:value-of select="$DateStart" />,<xsl:value-of select="$TimeStart" /> �� <xsl:value-of select="$DateStop" />,<xsl:value-of select="$TimeStop" /></Data></Cell>
  </Row>
  <Row>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >����</b ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >�����</b ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >������������</b ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >��� ������������</b ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >���������</b ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String"><b >���� � ����� �����</b ></Data>
    </Cell>
  </Row>
<xsl:for-each select="OData" >
	<xsl:variable name="Odd">
		<xsl:value-of select="Odd"/>
	</xsl:variable>

<xsl:if test='$Odd = "1"'>
  <Row>
    <Cell  ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String"><xsl:value-of select="Date" /></Data>
    </Cell>
    <Cell  ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String"><xsl:value-of select="Time" /></Data>
    </Cell>
    <Cell  ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String"><xsl:value-of select="User" /></Data>
    </Cell>
    <Cell  ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String"><xsl:value-of select="UserName" /></Data>
    </Cell>
    <Cell  ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String"><xsl:value-of select="Comp" /></Data>
    </Cell>
    <Cell  ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String"><xsl:value-of select="DateTimeEnter" /></Data>
    </Cell>
  </Row>
</xsl:if>
<xsl:if test='$Odd = "0"'>	
  <Row>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Date" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Time" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="User" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="UserName" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Comp" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="DateTimeEnter" /></Data>
    </Cell>
  </Row>
</xsl:if>
</xsl:for-each>
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
