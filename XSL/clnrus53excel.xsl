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
    <xsl:variable name="DateStart" >
        <xsl:value-of select="DateStart" />
    </xsl:variable >
<Worksheet ss:Name="Отчет по мониторингу лице" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="120"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="120"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="160"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="160"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="160"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > Отчет по мониторингу лицензий с <xsl:value-of select="$DateStart" />
      </Data>
    </Cell>
  </Row>
              <!-- повторять заголовок таблицы на каждой странице  -->
   <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Время</Data>
    </Cell>
             <!-- 
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Количество занятых лицензий Cache</Data>
    </Cell>
                              -->
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Количество пользователей</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Количество приборов</Data>
    </Cell>
  </Row>
          <xsl:for-each select="OData" >
                <xsl:variable name="Odd" >
                    <xsl:value-of select="Odd" />
                </xsl:variable >
               <xsl:if test='$Odd = "1"' >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="Date" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="Time" />
      </Data>
    </Cell>
 <!--       
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="CacheLicense" />
      </Data>
    </Cell>
                                -->
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Users" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Devices" />
      </Data>
    </Cell>
  </Row>
               </xsl:if >
               <xsl:if test='$Odd = "0"' >
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Date" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Time" />
      </Data>
    </Cell>
 <!--      
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="CacheLicense" />
      </Data>
    </Cell>
                         -->
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Users" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Devices" />
      </Data>
    </Cell>
  </Row>
               </xsl:if >
          </xsl:for-each >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Максимальные значения по дням</Data>
    </Cell>
  </Row>
        
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата</Data>
    </Cell>
         <!--     
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Количество занятых лицензий Cache</Data>
    </Cell>
                             -->
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Количество пользователей</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Количество приборов</Data>
    </Cell>
  </Row>
          <xsl:for-each select="OMaxForDate" >
                <xsl:variable name="Odd" >
                    <xsl:value-of select="Odd" />
                </xsl:variable >
               <xsl:if test='$Odd = "1"' >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="Date" />
      </Data>
    </Cell>
        <!--       
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="CacheLicense" />
      </Data>
    </Cell>
                                          -->
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Users" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Devices" />
      </Data>
    </Cell>
  </Row>
               </xsl:if >
               <xsl:if test='$Odd = "0"' >
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Date" />
      </Data>
    </Cell>
 <!--        
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="CacheLicense" />
      </Data>
    </Cell>
               -->
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Users" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Devices" />
      </Data>
    </Cell>
  </Row>
               </xsl:if >
          </xsl:for-each >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Максимальные значения за все время мониторинга</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
          <!--    
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Количество занятых лицензий Cache</Data>
    </Cell>
                              -->
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Количество пользователей</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Количество приборов</Data>
    </Cell>
  </Row>
          <xsl:for-each select="OMax" >
    <Row >
           <!--    
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="CacheLicense" />
      </Data>
    </Cell>
                                         -->
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Users" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Devices" />
      </Data>
    </Cell>
  </Row>
          </xsl:for-each >
   <!-- подвал -->
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
