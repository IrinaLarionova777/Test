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
 <!-- флаг 1/0 "Вывести список лаб.номеров с патологическими результатами" -->
  <xsl:variable name="FlagListPat" >
      <xsl:value-of select="FlagListPat" />
  </xsl:variable >
 <!-- флаг 1/0 "Расшифровка по наборам тестов" -->
  <xsl:variable name="FlagTS" >
      <xsl:value-of select="FlagTS" />
  </xsl:variable >
 <!-- флаг 1/0 "Расшифровка по тестам" -->
  <xsl:variable name="FlagTC" >
      <xsl:value-of select="FlagTC" />
  </xsl:variable >
  <!-- флаг 1/0 "Расшифровка по наборам ->
     тестам" -->
  <xsl:variable name="FlagTSTC" >
      <xsl:value-of select="FlagTSTC" />
  </xsl:variable >
  <!-- флаг 1/0 "Расшифровка по тестам ->
     наборам" -->
  <xsl:variable name="FlagTCTS" >
      <xsl:value-of select="FlagTCTS" />
  </xsl:variable >
 <!-- флаг 1/0 "ПОСЧИТАТЬ только общеее кол-во (без разбивки по возрастам и паталогии)" -->
  <xsl:variable name="FlagOnlyCount" >
      <xsl:value-of select="FlagOnlyCount" />
  </xsl:variable >
<Worksheet ss:Name="Статистика по группам наб" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<!--
<xsl:if test='$FlagTSTC = 0' >
 <xsl:if test='$FlagTCTS = 0' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="230"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="70"/>
 </xsl:if>
</xsl:if>
<xsl:if test='$FlagTSTC = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
</xsl:if>
<xsl:if test='$FlagTCTS = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
</xsl:if>
-->
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="230"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="70"/>
<xsl:if test='$FlagOnlyCount = 0' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="8" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="8" >
      <Data ss:Type="String" >Сведения о результатах исследований за период с <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Группа наборов тестов <xsl:if test='$FlagTS = 1' > / Набор тестов </xsl:if > <xsl:if test='$FlagTC = 1' > / Тест </xsl:if >
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Всего</Data>
    </Cell>
<xsl:if test='$FlagOnlyCount = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Взрослые</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дети (0-17]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дети (15-17]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дети (0-14]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дети (0-1]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дети (1-2]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дети (3-6]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > из них патологи- ческих</Data>
    </Cell>
 </xsl:if>         
  </Row>
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > <xsl:value-of select="GroupTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolTS" />
      </Data>
    </Cell>
          <xsl:if test='$FlagOnlyCount = 0' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolTS-1" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolTS-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolTS-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolTS-4" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolTS-5" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolTS-6" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolTS-7" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolTS-H" />
      </Data>
    </Cell>
          </xsl:if>  
  </Row>
      <xsl:if test='$FlagTS = 1'>  
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <i > Расшифровка по наборам тестов: </i >
      </Data>
    </Cell>
<xsl:if test='$FlagOnlyCount = 0' >
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
</xsl:if>
 
 </Row>
        <xsl:for-each select="OGrTS">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" /> - <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
            <xsl:if test='$FlagOnlyCount = 0' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-1" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-4" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-5" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-6" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-7" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-H" />
      </Data>
    </Cell>
            </xsl:if>  
  </Row>
        </xsl:for-each >
      </xsl:if>   
      <xsl:if test='$FlagTC = 1'>  
  <Row>
  <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String" > <i > Расшифровка по тестам: </i >
      </Data>
    </Cell>
<xsl:if test='$FlagOnlyCount = 0' >
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
  <Cell ss:StyleID="DefaultLeft" ><Data ss:Type="String" ></Data></Cell>
</xsl:if>
  </Row>
        <xsl:for-each select="OGrTC">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" /> - <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
            <xsl:if test='$FlagOnlyCount = 0' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-1" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-4" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-5" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-6" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-7" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-H" />
      </Data>
    </Cell>
            </xsl:if>  
  </Row>
        </xsl:for-each>  
      </xsl:if>         
     <!-- ................  Расшифровка по наборам ->
        тестам ...................... -->
    <xsl:if test='$FlagTSTC = 1'>  
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="8" >
      <Data ss:Type="String" >Расшифровка по наборам тестов -> тестам</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Наборов тестов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Тест</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Всего</Data>
    </Cell>
          <xsl:if test='$FlagOnlyCount = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Взрослые</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Дети (0-17]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Дети (15-17]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Дети (0-14]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Дети (0-1]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Дети (1-2]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Дети (3-6]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >из них патологических</Data>
    </Cell>
          </xsl:if>  
  </Row>
        <xsl:for-each select="OGrTSTC">	
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Code" /> - <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
            <xsl:if test='$FlagOnlyCount = 0' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-1" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-4" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-5" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-6" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-7" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-H" />
      </Data>
    </Cell>
            </xsl:if>  
  </Row>
          <xsl:for-each select="OGrTC">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" /> - <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
              <xsl:if test='$FlagOnlyCount = 0' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-1" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-4" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-5" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-6" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-7" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-H" />
      </Data>
    </Cell>
              </xsl:if>  
  </Row>
          </xsl:for-each>  
        </xsl:for-each>  
    </xsl:if>         
      <!-- ................  Расшифровка по тестам ->
         наборам  ...................... -->
    <xsl:if test='$FlagTCTS = 1'>  
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="8" >
      <Data ss:Type="String" > <i > Расшифровка по тестам -> наборам тестов </i >
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Тест</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Наборов тестов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Всего</Data>
    </Cell>
          <xsl:if test='$FlagOnlyCount = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Взрослые</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дети (0-17]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дети (15-17]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дети (0-14]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дети (0-1]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дети (1-2]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дети (3-6]</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > из них патологи- ческих</Data>
    </Cell>
          </xsl:if>  
  </Row>
        <xsl:for-each select="OGrTCTS">	
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Code" /> - <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
            <xsl:if test='$FlagOnlyCount = 0' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-1" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-4" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-5" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-6" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-7" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC-H" />
      </Data>
    </Cell>
            </xsl:if>  
  </Row>
          <xsl:for-each select="OGrTS">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" /> - <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
              <xsl:if test='$FlagOnlyCount = 0' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-1" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-4" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-5" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-6" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-7" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-H" />
      </Data>
    </Cell>
              </xsl:if>  
  </Row>
          </xsl:for-each>  
        </xsl:for-each>  
    </xsl:if>         
 <!-- .................  "Вывести список пациентов с патологическими результатами"    .................... -->
 <xsl:if test='$FlagListPat = 1'>  
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="8" >
      <Data ss:Type="String" > <i >Список пациентов с патологическими результатами </i >
      </Data>
    </Cell>
  </Row>
        style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > № п/п</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Лаб. номер</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Фамилия И.О.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Пол</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Возр.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > № МК</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата забора</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Набор тестов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Патологические результаты тестов</Data>
    </Cell>
  </Row>
     <xsl:for-each select="OListPat">	
  <Row>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Epis" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Sex" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Age" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="MRN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DateCol" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="NameTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="ResultTS" />
      </Data>
    </Cell>
  </Row>
     </xsl:for-each >
 </xsl:if> 
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>  
 <!-- подвал -->
  <Row ss:StyleID="Default" >
    <Cell ss:MergeAcross="8" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
