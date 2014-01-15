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
 <!-- Флаг 1/0 "Статистическая форма № 4 (стандартный вид отчета)" -->
  <xsl:variable name="FlagStatForma" >
      <xsl:value-of select="FlagStatForma" />
  </xsl:variable >
  <xsl:variable name="FlagTypeLoc" >
      <xsl:value-of select="FlagTypeLoc" />
  </xsl:variable >
 <!-- флаг 1/0 Выводить ошибки -->
  <xsl:variable name="FlagError" >
      <xsl:value-of select="FlagError" />
  </xsl:variable >
<Worksheet ss:Name="Стат.форма №4" >
<x:WorksheetOptions>
<x:PageSetup>
 <xsl:choose>
  <xsl:when test='$FlagStatForma = 0' >
   <x:Layout x:Orientation="Portrait"/>
  </xsl:when>
  <xsl:otherwise>
   <x:Layout x:Orientation="Landscape"/>
  </xsl:otherwise>
 </xsl:choose>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<xsl:if test='$FlagStatForma = 0'>    
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="160"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagStatForma = 1'>    
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="160"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<!-- ................... произвольный вид отчета ..................-->
<xsl:if test='$FlagStatForma = 0'>    
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="6" >
      <Data ss:Type="String" >Сведения о результатах исследования крови по кодам контингентов c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Группа наборов тестов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="GroupTS" />
      </Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > Наборы тестов, входящие в данную группу</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:for-each select="ODetali" > <xsl:value-of select="Code" /> - <xsl:value-of select="Desc" /> </xsl:for-each >
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row ss:Height="40" >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > Контингент обследованных</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > Код</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > Всего обследовано пациентов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1" >
      <Data ss:Type="String" > в том числе</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > Проведено анализов</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > Выявлено положи-тельных рез-тов</Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultHeaderTable" ss:Index="4" >
      <Data ss:Type="String" >Дети (0-14)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >Подростки (15-17)</Data>
    </Cell>
  </Row>
      <xsl:for-each select="OGr">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolMRN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolMRN-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolMRN-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-H" />
      </Data>
    </Cell>
  </Row>
        <xsl:if test='$FlagTypeLoc = 1' >
           <xsl:for-each select="OTypeLoc">	
  <Row>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <i > - <xsl:value-of select="Name" /> </i >
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolMRN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolMRN-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolMRN-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-H" />
      </Data>
    </Cell>
  </Row>
           </xsl:for-each >
        </xsl:if >
      </xsl:for-each >
  <Row>
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > ИТОГО</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolMRN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolMRN-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolMRN-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolTS-H" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
   <!-- подвал -->
  <Row ss:StyleID="Default" >
    <Cell ss:MergeAcross="6" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</xsl:if >
<!-- ................... "Статистическая форма № 4 (стандартный вид отчета)"..................-->
<xsl:if test='$FlagStatForma = 1'>    
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="9" >
      <Data ss:Type="String" >ФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ СТАТИСТИЧЕСКОЕ НАБЛЮДЕНИЕ</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="9" >
      <Data ss:Type="String" >КОНФИДЕНЦИАЛЬНОСТЬ ГАРАНТИРУЕТСЯ ПОЛУЧАТЕЛЕМ ИНФОРМАЦИИ</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="9" >
      <Data ss:Type="String" >Непредставление или нарушение сроков представления информации, а также ее искажение влечет ответственность, установленную Законом Российской Федерации «Об ответственности за нарушение порядка представления государственной статистической отчетности» от 13.05.92 г. № 2761-1</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="9" >
      <Data ss:Type="String" >СВЕДЕНИЯ О РЕЗУЛЬТАТАХ ИССЛЕДОВАНИЯ КРОВИ НА <xsl:value-of select="GroupTS" /> с <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" />
      </Data>
  </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="4" >
      <Data ss:Type="String" > Представляют:</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="2" >
      <Data ss:Type="String" > Сроки представления</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1" >
      <Data ss:Type="String" > Форма № 4</Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultLeft" ss:MergeAcross="4" >
      <Data ss:Type="String" > Учреждения здравоохранения, имеющие лаборатории, проводящие исследования на ВИЧ - месячную форму: - центру по профилактике и борьбе со СПИДом республики, края, области, автономной области, автономного округа, г.г.Москвы, Санкт-Петербурга Центры по профилактике и борьбе со СПИДом республики, края, области, автономной области, автономного округа, г.г.Москвы, Санкт-Петербурга месячную и годовую формы - Российскому научно-методическому центру по профилактике и борьбе со СПИДом годовую - органу управления здравоохранением республики, края, области, автономной области, автономного округа, г.г.Москвы, Санкт-Петербурга Российский научно-методический центр по профилактике и борьбе со СПИДом - годовой отчет в целом по России и в разрезе субъектов Российской Федерации - Минздраву России Минздрав России годовой отчет в целом по России и в разрезе субъектов Российской Федерации - Госкомстату России</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" ss:MergeAcross="2" >
      <Data ss:Type="String" > 5 января в установленные последним сроки в установленные последним сроки 25 марта</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" ss:MergeAcross="1" >
      <Data ss:Type="String" > Утверждена Постановлением Госкомстата России от  05.05.1999 № 30 Месячная, годовая</Data>
    </Cell>
  </Row>
  <Row><Cell ss:MergeAcross="1" ><Data ss:Type="String" ></Data></Cell></Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="9" >
      <Data ss:Type="String" >Наименование отчитывающейся организации: <i > <xsl:value-of select="НаименованиеОрганизации" /> </i >
      </Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultLeftBold" ss:MergeAcross="9" >
      <Data ss:Type="String" > Почтовый адрес: <i > <xsl:value-of select="АдресОрганизации" /> </i >
      </Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultLeftBold" ss:MergeDown="1" >
      <Data ss:Type="String" > Код формы по ОКУД</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" ss:MergeAcross="7" >
      <Data ss:Type="String" > Код (проставляет отчитывающаяся организация)</Data>
    </Cell>
  </Row>
    <Row >
  <Cell ss:StyleID="DefaultCenter" ss:Index="2">
      <Data ss:Type="String" > отчитывающейся организации по ОКПО</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > вида деятельности по ОКДП</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > отрасли по ОКОНХ</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > территории по ОКАТО</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > министерства (ведомства), органа управления по ОКОГУ</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > организационно-правовой формы по ОКОПФ</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > формы собственности по ОКФС</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" ss:MergeAcross="1" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
    <Row >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 1</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 2</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 3</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 4</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 5</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 6</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 7</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 8</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" ss:MergeAcross="1" >
      <Data ss:Type="String" > 9</Data>
    </Cell>
  </Row>
    <Row >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 0609374</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" ss:MergeAcross="1" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
  <!-- разрыв страницы принудительный -->
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="1" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > (1000)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" ss:MergeAcross="8" >
      <Data ss:Type="String" > Код по ОКЕИ: человек-792</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > Контингент обследованных</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > № стро- ки</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > Код контингентов обследованных</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > Всего обследовано</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1" >
      <Data ss:Type="String" > в том числе</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > Обследовано анонимно (из гр.4)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > Проведено анализов обследованным (из гр.4)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1" >
      <Data ss:Type="String" > Выявлено положительных результатов у обследованных (из гр.4)</Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultCenterBold" ss:Index="5" >
      <Data ss:Type="String" > Дети (0-14)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" >
      <Data ss:Type="String" > Подростки (15-17)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:Index="9" >
      <Data ss:Type="String" > в ИФА</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" >
      <Data ss:Type="String" > в ИБ</Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 1</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 2</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 3</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 4</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 5</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 6</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 7</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 8</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 9</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > 10</Data>
    </Cell>
  </Row>
      <xsl:for-each select="OGr">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:if test="NameZ != ''" > <xsl:value-of select="NameZ" /> <xsl:if test="Name != ''" > </xsl:if > </xsl:if > <xsl:value-of select="Name"/> <xsl:if test="Name2 != ''" > <xsl:value-of select="Name2" /> </xsl:if >
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Num" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolMRN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolMRN-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolMRN-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-H" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
        <xsl:if test='$FlagTypeLoc = 1' >
           <xsl:for-each select="OTypeLoc">	
  <Row>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <i > - <xsl:value-of select="Name" /> </i >
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolMRN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolMRN-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolMRN-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS-H" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
           </xsl:for-each >
        </xsl:if >
      </xsl:for-each >
  <Row>
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > ИТОГО (сумма строк 01+14)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" >
      <Data ss:Type="String" > 15</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolMRN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolMRN-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolMRN-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itog-KolTS-H" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="Default" ss:MergeAcross="1" >
      <Data ss:Type="String" > Руководитель организации</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="2" ss:Index="4" >
      <Data ss:Type="String" > ________________________________ (Ф.И.О.)</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="1" >
      <Data ss:Type="String" > ________________________________ (подпись)</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="1" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
    <Row >
  <Cell ss:StyleID="Default" ss:MergeAcross="1" >
      <Data ss:Type="String" > Должностное лицо, ответственное за составление формы</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="2" ss:Index="4" >
      <Data ss:Type="String" > ________________________________ (должность)</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="1" >
      <Data ss:Type="String" > ________________________________ (Ф.И.О.)</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="1" >
      <Data ss:Type="String" > ________________________________ (подпись)</Data>
    </Cell>
  </Row>
    <Row >
  <Cell ss:StyleID="Default" ss:MergeAcross="1"  >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="2" ss:Index="4"  >
      <Data ss:Type="String" > _____________________________________</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="1"  >
      <Data ss:Type="String" > <xsl:value-of select="DatePrint" />
      </Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="1"  >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
    <Row >
  <Cell ss:StyleID="Default" ss:MergeAcross="1"  >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="2" ss:Index="4" >
      <Data ss:Type="String" > (номер контактного телефона)</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="1"  >
      <Data ss:Type="String" > (дата составления документа)</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="1"  >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
</xsl:if >
 <!-- ....................................................... -->         
 <!-- вывод ошибок -->
 <xsl:if test='$FlagError = 1' >
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="1" >
      <Data ss:Type="String" > Список ошибок:</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > N п/п</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Номер МК</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Лаб.номер</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ФИО пациента</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > Код контингента</Data>
    </Cell>
  </Row>
      <xsl:for-each select="OError">	
  <Row>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="NN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="mrn" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="epis" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="fio" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="CodePat" />
      </Data>
    </Cell>
  </Row>
      </xsl:for-each >
 </xsl:if>       
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
