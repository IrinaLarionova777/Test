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
  <xsl:variable name="FlagLocPat" >
      <xsl:value-of select="FlagLocPat" />
  </xsl:variable >
  <xsl:variable name="FlagDocPat" >
      <xsl:value-of select="FlagDocPat" />
  </xsl:variable >
  <xsl:variable name="FlagPayment" >
      <xsl:value-of select="FlagPayment" />
  </xsl:variable >
  <xsl:variable name="FlagReason" >
      <xsl:value-of select="FlagReason" />
  </xsl:variable >
<Worksheet ss:Name="Невыполн. назнач. по ПРИЧИНЕ" >
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
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="70"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="70"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="70"/>
<xsl:if test='$FlagLocPat = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
</xsl:if>
<xsl:if test='$FlagDocPat = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
</xsl:if>
<xsl:if test='$FlagPayment = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
</xsl:if>
<xsl:if test='$FlagReason = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
</xsl:if>
  <Row ss:StyleID="DefaultTitle">
    <Cell ss:MergeAcross="6"><Data ss:Type="String"><xsl:value-of select="NameLaboratoty" /></Data></Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle">
    <Cell ss:MergeAcross="6"><Data ss:Type="String">Список невыполненных назначений за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" /></Data></Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle">
    <Cell ss:MergeAcross="6"><Data ss:Type="String">Причина невыполнения:<xsl:value-of select="Reason" />/ Отдел:<xsl:value-of select="Department" /></Data></Cell>
  </Row>
  <Row>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String">№ п/п</Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String">Дата причины</Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String">Лаб.номер</Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String">ФИО пациента</Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String">Кол-во всего</Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String">Список назначений</Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String">Дата назнач.</Data>
    </Cell>
<xsl:if test='$FlagLocPat = 1' >
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String">Местоположение пациента</Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagDocPat = 1' >
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String">Врач</Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagPayment = 1' >
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String">Плательщик</Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagReason = 1' >
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String">Причина невыполнения</Data>
    </Cell>
</xsl:if>
  </Row>
<xsl:for-each select="OGr">
  <Row>
    <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="3">
      <Data ss:Type="String"><xsl:value-of select="Name" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundCenterBold" >
      <Data ss:Type="String"><xsl:value-of select="KolTS" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundCenterBold" >
      <Data ss:Type="String"></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundCenterBold" >
      <Data ss:Type="String"></Data>
    </Cell>
    <xsl:if test='$FlagLocPat = 1' >
       <Cell ss:StyleID="DefaultTableLineBackgroundCenterBold" >
          <Data ss:Type="String"></Data>
       </Cell>
    </xsl:if>
    <xsl:if test='$FlagDocPat = 1' >
        <Cell ss:StyleID="DefaultTableLineBackgroundCenterBold" >
           <Data ss:Type="String"></Data>
        </Cell>
    </xsl:if>
    <xsl:if test='$FlagPayment = 1' >
       <Cell ss:StyleID="DefaultTableLineBackgroundCenterBold" >
         <Data ss:Type="String"></Data>
       </Cell>
    </xsl:if>
    <xsl:if test='$FlagReason = 1' >
       <Cell ss:StyleID="DefaultTableLineBackgroundCenterBold" >
          <Data ss:Type="String"></Data>
       </Cell>
    </xsl:if>
  </Row>
  <xsl:for-each select="OGr2">
  <Row>
    <Cell ss:StyleID="DefaultCenter">
      <Data ss:Type="String"><xsl:value-of select="NGr" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultCenter">
      <Data ss:Type="String"><xsl:value-of select="ДатаПричины" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultCenter">
      <Data ss:Type="String"><xsl:value-of select="Эпизод" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="ФИО" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultCenter">
      <Data ss:Type="String"><xsl:value-of select="KolTS" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="СписокНазначений" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="ДатаНазначения" /></Data>
    </Cell>
<xsl:if test='$FlagLocPat = 1' >
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Местоположение" /></Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagDocPat = 1' >
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Врач" /></Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagPayment = 1' >
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Плательщик" /></Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagReason = 1' >
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Причина" /></Data>
    </Cell>
</xsl:if>
  </Row>
 </xsl:for-each>
</xsl:for-each>
  <Row>
    <Cell ss:MergeAcross="3" ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String">ИТОГО</Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundCenterBold" >
      <Data ss:Type="String"><xsl:value-of select="Itogo" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundBold">
      <Data ss:Type="String"></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundBold">
      <Data ss:Type="String"></Data>
    </Cell>
    
<xsl:if test='$FlagLocPat = 1' >
    <Cell ss:StyleID="DefaultTableLineBackgroundBold">
      <Data ss:Type="String"></Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagDocPat = 1' >
    <Cell ss:StyleID="DefaultTableLineBackgroundBold">
      <Data ss:Type="String"></Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagPayment = 1' >
    <Cell ss:StyleID="DefaultTableLineBackgroundBold">
      <Data ss:Type="String"></Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagReason = 1' >
    <Cell ss:StyleID="DefaultTableLineBackgroundBold">
      <Data ss:Type="String"></Data>
    </Cell>
</xsl:if>
  </Row>
  <Row>
  </Row>
  <Row ss:StyleID="Default">
    <Cell ss:MergeAcross="6" ><Data ss:Type="String"><xsl:value-of select="Footer" /></Data></Cell>
  </Row>
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
