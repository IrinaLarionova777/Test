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
  <!-- флаг 1/0 "Выводить только активных врачей" -->
  <xsl:variable name="FlagActive" >
      <xsl:value-of select="FlagActive" />
  </xsl:variable >
 <!-- флаг 1/0 "Формат печати + Кол-во копий" -->
  <xsl:variable name="FlagFR" >
      <xsl:value-of select="FlagFR" />
  </xsl:variable >
 <!-- флаг 1/0 "Курьер" -->
  <xsl:variable name="FlagCour" >
      <xsl:value-of select="FlagCour" />
  </xsl:variable >
 <!-- флаг 1/0 "Специальность" -->
  <xsl:variable name="FlagSpec" >
      <xsl:value-of select="FlagSpec" />
  </xsl:variable >
 <!-- флаг 1/0 "Клиент" -->
  <xsl:variable name="FlagClient" >
      <xsl:value-of select="FlagClient" />
  </xsl:variable >
 <!-- флаг 1/0 "Язык" -->
  <xsl:variable name="FlagLang" >
      <xsl:value-of select="FlagLang" />
  </xsl:variable >
<Worksheet ss:Name="Список врачей" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Portrait"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
<xsl:if test='$FlagActive = 0' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="18"/>
</xsl:if>
<xsl:if test='$FlagFR = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<xsl:if test='$FlagFR = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="18"/>
</xsl:if>
<xsl:if test='$FlagCour = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagSpec = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagClient = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
<xsl:if test='$FlagLang = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="2" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="2" >
      <Data ss:Type="String" > Список врачей</Data>
    </Cell>
  </Row>
           <!-- повторять заголовок таблицы на каждой странице  -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Код</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Фамилия Имя Отчество врача</Data>
    </Cell>
         <xsl:if test='$FlagActive = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Акт.</Data>
    </Cell>
         </xsl:if >
        <xsl:if test='$FlagFR = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Формат печати</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во копий</Data>
    </Cell>
        </xsl:if >
         <xsl:if test='$FlagCour = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Курьер</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagSpec = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Специальность</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagClient = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Клиент</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagLang = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Язык</Data>
    </Cell>
         </xsl:if >
  </Row>
      <xsl:for-each select="ONext">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
           <xsl:if test='$FlagActive = 0' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="FlagActive" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagFR = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="PrintFormat" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="NoCopies" />
      </Data>
    </Cell>
          </xsl:if >
           <xsl:if test='$FlagCour = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Courier" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagSpec = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Spec" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagClient = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Client" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagLang = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Lang" />
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
