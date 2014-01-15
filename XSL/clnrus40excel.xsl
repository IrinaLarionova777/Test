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
 <!-- ДОПОЛНИТЕЛЬНАЯ настройка для вывода полей таблицы (cdtltybz j gfwbtynt) -->
  <xsl:variable name="FlagSexAgePat" >
      <xsl:value-of select="FlagSexAgePat" />
  </xsl:variable >
  <xsl:variable name="FlagMRNPat" >
      <xsl:value-of select="FlagMRNPat" />
  </xsl:variable >
  <xsl:variable name="FlagCategPat" >
      <xsl:value-of select="FlagCategPat" />
  </xsl:variable >
  <xsl:variable name="FlagLocPat" >
      <xsl:value-of select="FlagLocPat" />
  </xsl:variable >
  <xsl:variable name="FlagPayPat" >
      <xsl:value-of select="FlagPayPat" />
  </xsl:variable >
  <xsl:variable name="FlagColDT" >
      <xsl:value-of select="FlagColDT" />
  </xsl:variable >
  <xsl:variable name="FlagAddress" >
      <xsl:value-of select="FlagAddress" />
  </xsl:variable >
 <!-- доп.настройка для вывода результатов -->
  <xsl:variable name="FlagUnits" >
      <xsl:value-of select="FlagUnits" />
  </xsl:variable >
  <xsl:variable name="FlagRange" >
      <xsl:value-of select="FlagRange" />
  </xsl:variable >
  <xsl:variable name="FlagComment" >
      <xsl:value-of select="FlagComment" />
  </xsl:variable >
  <xsl:variable name="FlagStatTS" >
      <xsl:value-of select="FlagStatTS" />
  </xsl:variable >
  <xsl:variable name="FlagNewStrTS" >
      <xsl:value-of select="FlagNewStrTS" />
  </xsl:variable >
  <xsl:variable name="FlagNewStrTC" >
      <xsl:value-of select="FlagNewStrTC" />
  </xsl:variable >
  <xsl:variable name="FlagDepHead" >
      <xsl:value-of select="FlagDepHead" />
  </xsl:variable >
  <xsl:variable name="FlagTSHead" >
      <xsl:value-of select="FlagTSHead" />
  </xsl:variable >
<Worksheet ss:Name="Журнал выполненных исслед" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
<xsl:if test='$FlagAddress = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="420"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" >Журнал выполненных исследований c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" >Плательщик: <xsl:value-of select="Payment" /> / Отдел: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > № п/п</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ФИО пациента</Data>
    </Cell>
         <xsl:if test='$FlagAddress = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Адрес</Data>
    </Cell>
         </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Лаб. №</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Результаты исследований</Data>
    </Cell>
  </Row>
    <xsl:for-each select="OEpis">	
    <Row >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="FIO" /> <xsl:if test='$FlagSexAgePat = 1' > Пол/Возр.: <xsl:value-of select="Sex" /> / <xsl:value-of select="Age" /> </xsl:if > <xsl:if test='$FlagMRNPat = 1' > <xsl:if test='MRN != ""' > МК № <xsl:value-of select="MRN" /> </xsl:if > </xsl:if > <xsl:if test='$FlagCategPat = 1' > <xsl:if test='Categ != ""' > Кат.: <xsl:value-of select="Categ" /> </xsl:if > </xsl:if > <xsl:if test='$FlagLocPat = 1' > <xsl:if test='LocPat != ""' > Отд: <xsl:value-of select="LocPat" /> </xsl:if > </xsl:if > <xsl:if test='$FlagPayPat = 1' > <xsl:if test='Payment != ""' > Плат.: <xsl:value-of select="Payment" /> </xsl:if > </xsl:if >
      </Data>
    </Cell>
          <xsl:if test='$FlagAddress = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:if test='Address2 != ""' > <xsl:value-of select="Address2" /> </xsl:if > <xsl:value-of select="Address" />
      </Data>
    </Cell>
          </xsl:if>          
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Epis" />
      </Data>
    </Cell>
          <!-- результаты исследований -->
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:if test='$FlagColDT = 1' > Дата/время забора: <xsl:value-of select="DateCol" /> &#160;&#160; <xsl:value-of select="TimeCol" /> </xsl:if > <!-- отдел --> <xsl:for-each select="ODep" > <xsl:if test='$FlagDepHead = 1' > <xsl:if test='Desc != ""' > <i > &#160;&#160;&#160;&#160; <xsl:value-of select="Desc" /> </i > </xsl:if > </xsl:if > <!--  набор тестов --> <xsl:for-each select="OTS" > <xsl:if test='$FlagTSHead = 1' > <xsl:if test='Desc != ""' > &#160;&#160; <xsl:value-of select="Desc" /> <xsl:if test='$FlagNewStrTS = 0' > : &#160;&#160; </xsl:if > <xsl:if test='$FlagNewStrTS = 1' > </xsl:if > </xsl:if > </xsl:if> <!-- тест --> <xsl:for-each select="OTEST" > <xsl:value-of select="N0" /> :&#160;&#160; <xsl:value-of select="N1" /> <xsl:if test='$FlagUnits = 1' > <xsl:if test='N2 != ""' > &#160;&#160; <xsl:value-of select="N2" /> </xsl:if > </xsl:if > <xsl:if test='$FlagRange = 1' > <xsl:if test='N3 != ""' > &#160;&#160;( <xsl:value-of select="N3" /> ) </xsl:if > </xsl:if > <xsl:if test='$FlagComment = 1'> &#160;&#160; <xsl:for-each select="OComment" > <xsl:value-of select="Desc" /> &#160; </xsl:for-each > </xsl:if > <xsl:if test='$FlagNewStrTC = 0' > ; &#160; </xsl:if > <xsl:if test='$FlagNewStrTC = 1' > </xsl:if > </xsl:for-each > <!-- для TEST --> <xsl:if test='$FlagNewStrTS = 1' > </xsl:if > </xsl:for-each > <!-- для TS--> <xsl:if test='$FlagDepHead = 1' > </xsl:if > </xsl:for-each > <!-- для Dep --> <!-- доп.сведений о наборах тестов, ктр. были выполнены ранее или еще не выполнены --> <xsl:if test='$FlagStatTS = 1' > <xsl:for-each select="OStatST" > <u > <xsl:value-of select="Status" /> </u > <xsl:for-each select="OData" > <xsl:value-of select="data"/> &#160; <xsl:for-each select="OTS" > <xsl:value-of select="code" /> ; &#160; </xsl:for-each > </xsl:for-each > </xsl:for-each > </xsl:if>
      </Data>
    </Cell>
  </Row>
    </xsl:for-each> 
  <!--общий итог -->
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" >Итого за период с <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" /> обработано: &#160;&#160;&#160;&#160; пациентов = <xsl:value-of select="KolPat" /> ; образцов = <xsl:value-of select="KolEpis" /> ; наборов тестов = <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  </Row>
  <!-- подвал -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="Default" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
