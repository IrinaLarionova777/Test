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
<Worksheet ss:Name="Отчет о времени выполнени" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Portrait"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="120"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="120"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="120"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="120"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="120"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="120"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="NameReport" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >за период c <xsl:value-of select="DateFrom" /> по <xsl:value-of select="DateTo" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="NameGroup" /> <xsl:text > </xsl:text > <xsl:value-of select="StringGroup" /> <xsl:if test='PatLocation != ""' > Местоположение пациента: <xsl:text > </xsl:text > <xsl:value-of select="PatLocation" /> </xsl:if >
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Всего групп</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Среднее (мин)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Медиана (мин)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > 75% центиль (мин)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > 90% центиль (мин)</Data>
    </Cell>
  </Row>
    <xsl:for-each select="ONext" >
  <Row>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DateAuth" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="TotalCount" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Mean" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Median" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Percentile75" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Percentile90" />
      </Data>
    </Cell>
  </Row>
    </xsl:for-each> 
    <!--общий итог -->
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundCenter" >
      <Data ss:Type="String" > Итого</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Itog_TotalCount" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Itog_Mean" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Itog_Median" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Itog_Percentile75" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Itog_Percentile90" />
      </Data>
    </Cell>
  </Row>
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
