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
<Worksheet ss:Name="Журнал учета рабочего вре" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Portrait"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameReport" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" >за период c <xsl:value-of select="DateFrom" /> по <xsl:value-of select="DateTo" />
      </Data>
    </Cell>
  </Row>
  <xsl:for-each select="OGrAnalyzer" >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="Analyzer" />
      </Data>
    </Cell>
  </Row>
	  <Row>
		  <Cell ss:StyleID="DefaultCenter" >
			  <Data ss:Type="String" > Дата</Data>
		  </Cell>
		  <Cell ss:StyleID="DefaultCenter" >
			  <Data ss:Type="String" > Время первого исследования</Data>
		  </Cell>
		  <Cell ss:StyleID="DefaultCenter" >
			  <Data ss:Type="String" > Время последнего исследования</Data>
		  </Cell>
		  <Cell ss:StyleID="DefaultCenter" >
			  <Data ss:Type="String" > Время работы (мин.)</Data>
		  </Cell>
		  <Cell ss:StyleID="DefaultCenter" >
			  <Data ss:Type="String" > Время работы (час.мин)</Data>
		  </Cell>
	  </Row>
            <xsl:for-each select="OGrDay" >
    <Row >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Date" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Min" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Max" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Ras" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="RasHour" />
      </Data>
    </Cell>
  </Row>
            </xsl:for-each >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="2" >
      <Data ss:Type="String" > Всего <xsl:value-of select="Analyzer" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Ras" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="RasHour" />
      </Data>
    </Cell>
  </Row>
</xsl:for-each >
  <Row>
  <Cell ss:StyleID="DefaultLeftBold" ss:MergeAcross="4" >
      <Data ss:Type="String" >Итого время работы <xsl:value-of select="RasO" /> мин. ( <xsl:value-of select="RasHourO" /> час <xsl:value-of select="RasMinutO" /> мин.)</Data>
    </Cell>
  </Row>
    <!--общий итог -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
 <!-- подвал -->
  <Row ss:StyleID="Default" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
