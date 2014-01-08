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
 <!-- флаг 1/0 "Расшифровка по наборам тестов" -->
  <xsl:variable name="FlagTS" >
      <xsl:value-of select="FlagTS" />
  </xsl:variable >
  <!-- флаг 1/0 "Расшифровка по пользователям" -->
  <xsl:variable name="FlagUser" >
      <xsl:value-of select="FlagUser" />
  </xsl:variable >
 <!-- флаг 1/0 "Расшифровка по плательщикам" -->
  <xsl:variable name="FlagPayment" >
      <xsl:value-of select="FlagPayment" />
  </xsl:variable >
 <!-- флаг 1/0 "Расшифровка по пациентам" -->
  <xsl:variable name="FlagEpisode" >
      <xsl:value-of select="FlagEpisode" />
  </xsl:variable >
 <!-- "Тип формирования отчета" 1-по дате выполнения"; 2-по дате назначения -->
  <xsl:variable name="FlagReport" >
      <xsl:value-of select="FlagReport" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести местоположение пациента" -->
  <xsl:variable name="FlagLocPat" >
      <xsl:value-of select="FlagLocPat" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести плательщик/полис пациента" -->
  <xsl:variable name="FlagPayPat" >
      <xsl:value-of select="FlagPayPat" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести № МК пациента" -->
  <xsl:variable name="FlagMRNPat" >
      <xsl:value-of select="FlagMRNPat" />
  </xsl:variable >
 <!-- флаг 1/0 "Вывести столбец Категория пациента" -->
  <xsl:variable name="FlagCategPat" >
      <xsl:value-of select="FlagCategPat" />
  </xsl:variable >
<Worksheet ss:Name="Деятельность лаборатории" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Portrait"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
<xsl:if test='$FlagTS = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
</xsl:if>
<xsl:if test='$FlagReport = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagReport = 2' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>

 <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" ss:Height="40" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Отчет о количестве <xsl:value-of select="TypeReport" /> исследований по плательщикам за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Плательщик: <xsl:value-of select="Payment" /> / Отдел: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > № п/п</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Отдел</Data>
    </Cell>
    <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Набор тестов</Data>
    </Cell>
    </xsl:if >
    <xsl:if test='$FlagReport = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во</Data>
    </Cell>
    </xsl:if >
    <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во назначено</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во выполнено</Data>
    </Cell>
    </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Стоимость</Data>
    </Cell>
  </Row>
  <xsl:for-each select="OGr">	
     <xsl:if test='$FlagTS = 0' >
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
           <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
      </xsl:if >
      <xsl:if test='$FlagTS = 1' >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
           <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
     </xsl:if>   
     <xsl:if test='$FlagTS = 1' >
      <!-- расшифровка по наборам тестов -->
      <xsl:for-each select="OGrTS">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
            <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
            </xsl:if >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
       </xsl:for-each >
           <!-- для наборов тестов -->
     </xsl:if >
   </xsl:for-each >
       <!-- для отделов -->
  <!--общий итог -->
    <Row >
       <xsl:if test='$FlagTS = 0' >
  <Cell ss:StyleID="DefaultTableLineBackground" ss:MergeAcross="1" >
      <Data ss:Type="String" > Итого</Data>
    </Cell>
       </xsl:if >
       <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground" ss:MergeAcross="2" >
      <Data ss:Type="String" > Итого</Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
       <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS-Exec" />
      </Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTSAmount" />
      </Data>
    </Cell>
  </Row>
 <!-- *****************    "Расшифровка по плательщикам"     ************************ -->  
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" >
         <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
<!-- NextWorkSheet starttitle Расшифровка по плательщикам endtitle -->
<xsl:if test='$FlagPayment = 1' >
<Worksheet ss:Name="Расшифровка по плательщикам" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
<xsl:if test='$FlagTS = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
</xsl:if>
<xsl:if test='$FlagReport = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagReport = 2' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" ss:Height="40" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Отчет о количестве <xsl:value-of select="TypeReport" /> исследований по плательщикам за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Плательщик: <xsl:value-of select="Payment" /> / Отдел: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Расшифровка по плательщикам:</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > № п/п</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Плательщик</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Отдел</Data>
    </Cell>
        <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Набор тестов</Data>
    </Cell>
        </xsl:if >
        <xsl:if test='$FlagReport = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во</Data>
    </Cell>
        </xsl:if >
        <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во назначено</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во выполнено</Data>
    </Cell>
        </xsl:if>        
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Стоимость</Data>
    </Cell>
  </Row>
    <xsl:for-each select="OGrPayment">	
      <xsl:if test='$FlagTS = 0' >
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeftBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
           <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
      </xsl:if >
      <xsl:if test='$FlagTS = 1' >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="2" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
           <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
      </xsl:if>   
      <!-- подсчеты по отделам -->		
      <xsl:for-each select="OGrDep">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
          <xsl:if test='$FlagTS = 0' >
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > <xsl:value-of select="NameDep" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
          </xsl:if >
          <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultLeftBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="NameDep" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
             <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
             </xsl:if >
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
          </xsl:if> 
  </Row>
        <!-- расшифровка по наборам тестов -->
        <xsl:if test='$FlagTS = 1' >
          <xsl:for-each select="OGrTS">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
                 <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
                 </xsl:if >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
           </xsl:for-each >
               <!-- для наборов тестов -->
        </xsl:if >
       </xsl:for-each >
           <!-- для отделов -->
     </xsl:for-each >
         <!-- для плательщиков -->
    <!--общий итог -->
    <Row >
       <xsl:if test='$FlagTS = 0' >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="2" >
      <Data ss:Type="String" > Итого</Data>
    </Cell>
       </xsl:if >
       <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="3" >
      <Data ss:Type="String" > Итого</Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
       <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS-Exec" />
      </Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTSAmount" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" >
         <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:if >
 <!-- *****************    "Расшифровка по пациентам"     ************************ -->  
<!-- NextWorkSheet starttitle Расшифровка по пациентам endtitle -->
<xsl:if test='$FlagEpisode = 1' >
<Worksheet ss:Name="Расшифровка по пациентам" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="20"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
<xsl:if test='$FlagMRNPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
<xsl:if test='$FlagPayPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
</xsl:if>
<xsl:if test='$FlagCategPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
<xsl:if test='$FlagLocPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
<xsl:if test='$FlagReport = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagReport = 2' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>  
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="6" >
      <Data ss:Type="String" > Отчет о количестве <xsl:value-of select="TypeReport" /> исследований по плательщикам за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Плательщик: <xsl:value-of select="Payment" /> / Отдел: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="13" >
      <Data ss:Type="String" > Расшифровка по пациентам</Data>
    </Cell>
  </Row>
  <Row><Cell ss:MergeAcross="13" ><Data ss:Type="String" ></Data></Cell></Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > № п/п</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Лаб. номер</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ФИО пациента</Data>
    </Cell>
         <xsl:if test='$FlagMRNPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > № МК</Data>
    </Cell>
         </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Дата забора</Data>
    </Cell>
        <xsl:if test='$FlagPayPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Плательщик</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Полис</Data>
    </Cell>
        </xsl:if>    
         <xsl:if test='$FlagCategPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Катег.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Местополож. пациента</Data>
    </Cell>
         </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Набор тестов</Data>
    </Cell>
         <xsl:if test='$FlagReport = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во</Data>
    </Cell>
         </xsl:if >
        <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во назн.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во выполн.</Data>
    </Cell>
        </xsl:if>          
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Стоимость</Data>
    </Cell>
  </Row>
    <xsl:for-each select="OGrEpis">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Epis" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="FIO" />
      </Data>
    </Cell>
           <xsl:if test='$FlagMRNPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="MRN" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="DateCol" />
      </Data>
    </Cell>
          <xsl:if test='$FlagPayPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Payment" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Polic" />
      </Data>
    </Cell>
          </xsl:if >
           <xsl:if test='$FlagCategPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Categ" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="LocPat" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="TS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
           <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
     </xsl:for-each >
         <!-- для пациентов -->
    <!--общий итог -->
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" ss:MergeAcross="4" >
      <Data ss:Type="String" > Итого</Data>
    </Cell>
       <xsl:if test='$FlagMRNPat = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" ></Data>
    </Cell>
       </xsl:if >
       <xsl:if test='$FlagPayPat = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" ></Data>
    </Cell>
       </xsl:if >
       <xsl:if test='$FlagCategPat = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" ></Data>
    </Cell>
       </xsl:if >
       <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" ></Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
       <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS-Exec" />
      </Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTSAmount" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" >
         <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:if >
 <!-- *****************    "Расшифровка по пользователям"     ************************ -->  
<!-- NextWorkSheet starttitle Расшифровка по пользователям endtitle -->
<xsl:if test='$FlagUser = 1' >
<Worksheet ss:Name="Расшифровка по пользователям" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
<xsl:if test='$FlagTS = 0' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
</xsl:if>
<xsl:if test='$FlagTS = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>

  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" ss:Height="40" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Отчет о количестве <xsl:value-of select="TypeReport" /> исследований по плательщикам за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Плательщик: <xsl:value-of select="Payment" /> / Отдел: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > Расшифровка по пользователям</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > № п/п</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Пользователь</Data>
    </Cell>
        <xsl:if test='$FlagTS = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Плательщик</Data>
    </Cell>
        </xsl:if >
        <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Плательщик</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Набор тестов</Data>
    </Cell>
        </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Кол-во</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Стоимость</Data>
    </Cell>
  </Row>
    <xsl:for-each select="OGrUser">	
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
           <xsl:if test='$FlagTS = 0' >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="2" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
        <!-- расшифровка по плательщикам -->
        <xsl:for-each select="OGrPay">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
               <xsl:if test='$FlagTS = 0' >
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
               </xsl:if >
               <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultLeftBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
               </xsl:if >
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
           <!-- расшифровка по наборам тестов -->
           <xsl:if test='$FlagTS = 1' >
              <xsl:for-each select="OGrTS">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
               </xsl:for-each >
                   <!-- для наборов тестов -->
           </xsl:if >
         </xsl:for-each >
             <!-- для плательщиков -->
     </xsl:for-each >
         <!-- для пользователей -->
    <!--общий итог -->
    <Row >
       <xsl:if test='$FlagTS = 0' >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="2" >
      <Data ss:Type="String" > Итого</Data>
    </Cell>
       </xsl:if >
       <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="3" >
      <Data ss:Type="String" > Итого</Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTSAmount" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
 <!-- подвал -->
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:if >
</xsl:template >
</xsl:stylesheet >
