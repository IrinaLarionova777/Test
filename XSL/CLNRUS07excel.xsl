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
  <xsl:variable name="FlagSortFIO" >
      <xsl:value-of select="FlagSortFIO" />
  </xsl:variable >
  <xsl:variable name="FlagAdress" >
      <xsl:value-of select="FlagAdress" />
  </xsl:variable >
  <xsl:variable name="FlagLocPat" >
      <xsl:value-of select="FlagLocPat" />
  </xsl:variable >
  <xsl:variable name="FlagDocPat" >
      <xsl:value-of select="FlagDocPat" />
  </xsl:variable >
  <xsl:variable name="FlagPayment" >
      <xsl:value-of select="FlagPayment" />
  </xsl:variable >
  <xsl:variable name="FlagTS" >
      <xsl:value-of select="FlagTS" />
  </xsl:variable >
  <xsl:variable name="FlagCategPat" >
      <xsl:value-of select="FlagCategPat" />
  </xsl:variable >
  <xsl:variable name="FlagSpec" >
      <xsl:value-of select="FlagSpec" />
  </xsl:variable >
  <xsl:variable name="FlagAge" >
      <xsl:value-of select="FlagAge" />
  </xsl:variable >
  <xsl:variable name="FlagPregn" >
      <xsl:value-of select="FlagPregn" />
  </xsl:variable >
  <xsl:variable name="FlagError" >
      <xsl:value-of select="FlagError" />
  </xsl:variable >
  <xsl:variable name="FlagTable" >
      <xsl:value-of select="FlagTable" />
  </xsl:variable >
    <xsl:variable name="Date1" >
		<xsl:value-of select="Date1" />
    </xsl:variable >
    <xsl:variable name="Date2" >
		<xsl:value-of select="Date2" />
   	</xsl:variable >
	<xsl:variable name="PatLocation" >
		<xsl:value-of select="PatLocation" />
	</xsl:variable >
	<xsl:variable name="UnionConditions" >
		<xsl:value-of select="UnionConditions" />
	</xsl:variable >
	<xsl:variable name="NameLaboratoty" >
		<xsl:value-of select="NameLaboratoty" />
	</xsl:variable >
	<xsl:variable name="Footer" >
		<xsl:value-of select="Footer" />
	</xsl:variable >
	<!--Sheet 1 Main -->
	<Worksheet ss:Name="Данные" >
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
				<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="70"/>
				<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
				<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
				<xsl:if test='$FlagAge = 1' >
					<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
				</xsl:if>
				<xsl:if test='$FlagPregn = 1' >
					<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
				</xsl:if>
				<xsl:if test='$FlagAdress = 1' >
					<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
				</xsl:if>
				<xsl:if test='$FlagAdress = 1' >
					<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
				</xsl:if>
				<xsl:if test='$FlagLocPat = 1' >
					<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
				</xsl:if>
				<xsl:if test='$FlagDocPat = 1' >
					<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
				</xsl:if>
				<xsl:if test='$FlagPayment = 1' >
					<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
				</xsl:if>
				<xsl:if test='$FlagCategPat = 1' >
					<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
				</xsl:if>
				<xsl:if test='$FlagCategPat = 1' >
					<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
				</xsl:if>
				<xsl:if test='$FlagTS = 1' >
					<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="300"/>
				</xsl:if>
				<xsl:if test='$FlagSpec = 1' >
					<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
				</xsl:if>
				<xsl:if test='$FlagSpec = 1' >
					<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="300"/>
				</xsl:if>
				<xsl:if test='$FlagSpec = 1' >
					<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
				</xsl:if>
				<Row ss:StyleID="DefaultTitle">
					<Cell ss:MergeAcross="5">
						<Data ss:Type="String">
								<xsl:value-of select="$NameLaboratoty" />
						</Data>
					</Cell>
				</Row>
				<Row ss:StyleID="DefaultTitle">
					<Cell ss:MergeAcross="5">
						<Data ss:Type="String">Отчет о результатах исследований тестов за период c <xsl:value-of select="$Date1" /> по <xsl:value-of select="$Date2" /></Data>
					</Cell>
				</Row>
				<Row ss:StyleID="DefaultTitle">
					<Cell ss:MergeAcross="5">
						<Data ss:Type="String">Местоположение: <xsl:value-of select="$PatLocation" /></Data>
					</Cell>
				</Row>
				<Row ss:StyleID="DefaultTitle">
					<Cell ss:MergeAcross="5">
						<Data ss:Type="String">Условие: <xsl:value-of select="$UnionConditions" /></Data>
					</Cell>
				</Row>
			<xsl:for-each select="OGr">
				<xsl:if test='$FlagTable = 1'>
					<Row></Row>
					<Row ss:StyleID="DefaultTitle">
					<Cell ss:MergeAcross="5">
						<Data ss:Type="String">
							<xsl:value-of select="NN" />) Условие для теста: <xsl:value-of select="Тест" />= >Оператор "<xsl:value-of select="Оператор" />"<xsl:if test='Значение != ""' >
								<xsl:value-of select="Значение" />
							</xsl:if >
						</Data>
					</Cell>
				</Row>
				</xsl:if>
				<Row></Row>
			    <Row>
					<Cell ss:StyleID="DefaultHeaderTable" >
						<Data ss:Type="String">
							№ п/п
						</Data>
					</Cell>
					<Cell ss:StyleID="DefaultHeaderTable" >
						<Data ss:Type="String">
							Лаб. номер
						</Data>
					</Cell>
					<Cell ss:StyleID="DefaultHeaderTable" >
						<Data ss:Type="String">
							<b >Фамилия И.О.</b >
						</Data>
					</Cell>
					<Cell ss:StyleID="DefaultHeaderTable" >
						<Data ss:Type="String">
							<b >Пол</b >
						</Data>
					</Cell>
					<xsl:if test='$FlagAge = 1' >
						<Cell ss:StyleID="DefaultHeaderTable" >
							<Data ss:Type="String">
								<b >Возр.</b >
							</Data>
						</Cell>
					</xsl:if>
					<xsl:if test='$FlagPregn = 1' >
						<Cell ss:StyleID="DefaultHeaderTable" >
							<Data ss:Type="String">
								<b >Берем. (неделя)</b >
							</Data>
						</Cell>
					</xsl:if>
					<xsl:if test='$FlagAdress = 1' >
						<Cell ss:StyleID="DefaultHeaderTable" >
							<Data ss:Type="String">
								<b >Адрес</b >
							</Data>
						</Cell>
					</xsl:if>
					<xsl:if test='$FlagAdress = 1' >
						<Cell ss:StyleID="DefaultHeaderTable" >
							<Data ss:Type="String">
								<b >№ МК</b >
							</Data>
						</Cell>
					</xsl:if>
					<xsl:if test='$FlagLocPat = 1' >
						<Cell ss:StyleID="DefaultHeaderTable" >
							<Data ss:Type="String">
								<b >Местоположение пациента</b >
							</Data>
						</Cell>
					</xsl:if>
					<xsl:if test='$FlagDocPat = 1' >
						<Cell ss:StyleID="DefaultHeaderTable" >
							<Data ss:Type="String">
								<b >Врач</b >
							</Data>
						</Cell>
					</xsl:if>
					<xsl:if test='$FlagPayment = 1' >
						<Cell ss:StyleID="DefaultHeaderTable" >
							<Data ss:Type="String">
								<b >Плательщик</b >
							</Data>
						</Cell>
					</xsl:if>
					<xsl:if test='$FlagCategPat = 1' >
						<Cell ss:StyleID="DefaultHeaderTable" >
							<Data ss:Type="String">
								<b >Категория пациента</b >
							</Data>
						</Cell>
					</xsl:if>
					<xsl:if test='$FlagCategPat = 1' >
						<Cell ss:StyleID="DefaultHeaderTable" >
							<Data ss:Type="String">
								<b >Дата забора</b >
							</Data>
						</Cell>
					</xsl:if>
					<xsl:if test='$FlagTS = 1' >
						<Cell ss:StyleID="DefaultHeaderTable" >
							<Data ss:Type="String">
								<b >Набор тестов</b >
							</Data>
						</Cell>
					</xsl:if>
					<xsl:if test='$FlagSpec = 1' >
						<Cell ss:StyleID="DefaultHeaderTable" >
							<Data ss:Type="String">
								<b >Тип образца</b >
							</Data>
						</Cell>
					</xsl:if>
					<xsl:if test='$FlagSpec = 1' >
						<Cell ss:StyleID="DefaultHeaderTable" >
							<Data ss:Type="String">
								<b >Тест</b >
							</Data>
						</Cell>
					</xsl:if>
					<xsl:if test='$FlagSpec = 1' >
						<Cell ss:StyleID="DefaultHeaderTable" >
							<Data ss:Type="String">
								<b >Результат</b >
							</Data>
						</Cell>
					</xsl:if>
				</Row>
				<xsl:for-each select="OGrTEST">
					<Row>
						<Cell ss:StyleID="DefaultLeft">
							<Data ss:Type="String">
								<xsl:value-of select="NGr" />
							</Data>
						</Cell>
						<Cell ss:StyleID="DefaultLeft">
							<Data ss:Type="String">
								<b >
									<xsl:value-of select="Epis" />
								</b >
							</Data>
						</Cell>
						<Cell ss:StyleID="DefaultLeft">
							<Data ss:Type="String">
								<xsl:value-of select="Name" />
							</Data>
						</Cell>
						<Cell ss:StyleID="DefaultLeft">
							<Data ss:Type="String">
								<xsl:value-of select="Sex" />
							</Data>
						</Cell>
						<xsl:if test='$FlagAge = 1' >
							<Cell ss:StyleID="DefaultLeft">
								<Data ss:Type="String">
									<xsl:value-of select="Age" />
								</Data>
							</Cell>
						</xsl:if>
						<xsl:if test='$FlagPregn = 1' >
							<Cell ss:StyleID="DefaultLeft">
								<Data ss:Type="String">
									<xsl:value-of select="PregnWeek" />
								</Data>
							</Cell>
						</xsl:if>
						<xsl:if test='$FlagAdress = 1' >
							<Cell ss:StyleID="DefaultLeft">
								<Data ss:Type="String">
									<xsl:value-of select="Adress" />
								</Data>
							</Cell>
						</xsl:if>
						<xsl:if test='$FlagAdress = 1' >
							<Cell ss:StyleID="DefaultLeft">
								<Data ss:Type="String">
									<xsl:value-of select="MRN" />
								</Data>
							</Cell>
						</xsl:if>
						<xsl:if test='$FlagLocPat = 1' >
							<Cell ss:StyleID="DefaultLeft">
								<Data ss:Type="String">
									<xsl:value-of select="Location" />
								</Data>
							</Cell>
						</xsl:if>
						<xsl:if test='$FlagDocPat = 1' >
							<Cell ss:StyleID="DefaultLeft">
								<Data ss:Type="String">
									<xsl:value-of select="Doctor" />
								</Data>
							</Cell>
						</xsl:if>
						<xsl:if test='$FlagPayment = 1' >
							<Cell ss:StyleID="DefaultLeft">
								<Data ss:Type="String">
									<xsl:value-of select="Payment" />
								</Data>
							</Cell>
						</xsl:if>
						<xsl:if test='$FlagCategPat = 1' >
							<Cell ss:StyleID="DefaultLeft">
								<Data ss:Type="String">
									<xsl:value-of select="CategPat" />
								</Data>
							</Cell>
						</xsl:if>
						<xsl:if test='$FlagCategPat = 1' >
							<Cell ss:StyleID="DefaultLeft">
								<Data ss:Type="String">
									<xsl:value-of select="DateCol" />
								</Data>
							</Cell>
						</xsl:if>
						<xsl:if test='$FlagTS = 1' >
							<Cell ss:StyleID="DefaultLeft">
								<Data ss:Type="String">
									<xsl:value-of select="NameTS" />
								</Data>
							</Cell>
						</xsl:if>
						<xsl:if test='$FlagSpec = 1' >
							<Cell ss:StyleID="DefaultLeft">
								<Data ss:Type="String">
									<xsl:value-of select="SpecTS" />
								</Data>
							</Cell>
						</xsl:if>
						<xsl:if test='$FlagSpec = 1' >
							<Cell ss:StyleID="DefaultLeft">
								<Data ss:Type="String">
									<xsl:value-of select="NameTC" />
								</Data>
							</Cell>
						</xsl:if>
						<xsl:if test='$FlagSpec = 1' >
							<Cell ss:StyleID="DefaultLeft">
								<Data ss:Type="String">
									<xsl:value-of select="Result" />
								</Data>
							</Cell>
						</xsl:if>
					</Row>
				</xsl:for-each>
			</xsl:for-each>
				<Row></Row>
				<Row ss:StyleID="Default">
					<Cell ss:MergeAcross="5">
						<Data ss:Type="String">Условие: <xsl:value-of select="$Footer" />
						</Data>
					</Cell>
				</Row>
			</Table>
		
</Worksheet>
	<!-- Sheet 2 Conditions -->
	<Worksheet ss:Name="Условия выборки" >
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
			<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
			<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
			<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
			<Row ss:StyleID="DefaultTitle">
				<Cell ss:MergeAcross="4">
					<Data ss:Type="String"><xsl:value-of select="$NameLaboratoty" /></Data>
				</Cell>
			</Row>
			<Row ss:StyleID="DefaultTitle">
				<Cell ss:MergeAcross="4">
					<Data ss:Type="String">Условия для отчета о результатах исследований тестов за период c <xsl:value-of select="Date1" /> по <xsl:value-of select="Date2" /></Data>
				</Cell>
			</Row>
			<Row ss:StyleID="DefaultTitle">
				<Cell ss:MergeAcross="4">
					<Data ss:Type="String">Местоположение:<xsl:value-of select="$PatLocation" /></Data>
				</Cell>
			</Row>
			<Row ss:StyleID="DefaultTitle">
				<Cell ss:MergeAcross="4">
					<Data ss:Type="String">Условие:<xsl:value-of select="$UnionConditions" /></Data>
				</Cell>
			</Row>
			<Row></Row>
			<Row>
				<Cell ss:StyleID="DefaultHeaderTable" >
					<Data ss:Type="String">N п/п</Data>
				</Cell>
				<Cell ss:StyleID="DefaultHeaderTable" >
					<Data ss:Type="String">Тест</Data>
				</Cell>
				<Cell ss:StyleID="DefaultHeaderTable" >
					<Data ss:Type="String">Оператор</Data>
				</Cell>
				<Cell ss:StyleID="DefaultHeaderTable" >
					<Data ss:Type="String">Значение</Data>
				</Cell>
				<Cell ss:StyleID="DefaultHeaderTable" >
					<Data ss:Type="String">Количество</Data>
				</Cell>
			</Row>
			<xsl:for-each select="OCONDITION">
				<Row>
					<Cell ss:StyleID="DefaultLeft">
						<Data ss:Type="String">
							<xsl:value-of select="NN" />
						</Data>
					</Cell>
					<Cell ss:StyleID="DefaultLeft">
						<Data ss:Type="String">
							<xsl:value-of select="Тест" />
						</Data>
					</Cell>
					<Cell ss:StyleID="DefaultLeft">
						<Data ss:Type="String">
							<xsl:value-of select="Оператор" />
						</Data>
					</Cell>
					<Cell ss:StyleID="DefaultLeft">
						<Data ss:Type="String">
							<xsl:value-of select="Значение" />
						</Data>
					</Cell>
					<Cell ss:StyleID="DefaultLeft">
						<Data ss:Type="String">
							<xsl:value-of select="Количество" />
						</Data>
					</Cell>
				</Row>
			</xsl:for-each>
			<Row>
				<Cell  ss:MergeAcross="4">
					<Data ss:Type="String">
						<xsl:value-of select="QPatients" />
					</Data>
				</Cell>
			</Row>
			<Row></Row>
			<Row ss:StyleID="Default">
				<Cell ss:MergeAcross="4">
					<Data ss:Type="String">Условие: <xsl:value-of select="$Footer" /></Data>
				</Cell>
			</Row>
		</Table>
	</Worksheet>
	<!-- Sheet 3 Errors-->
<Worksheet ss:Name="Ошибки">
		   <xsl:if test='$FlagError = 1' >
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="600"/>
  <Row ss:StyleID="DefaultTitle">
    <Cell><Data ss:Type="String"><xsl:value-of select="$NameLaboratoty" /></Data></Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle">
    <Cell><Data ss:Type="String">Отчет о результатах исследований тестов за период c <xsl:value-of select="$Date1" /> по <xsl:value-of select="$Date2" /></Data></Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle">
    <Cell><Data ss:Type="String">Местоположение:<xsl:value-of select="$PatLocation" /></Data></Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle">
    <Cell><Data ss:Type="String">Условие:<xsl:value-of select="$UnionConditions" /></Data></Cell>
  </Row>
	<!--
  <Row ss:StyleID="DefaultTitle">
    <Cell><Data ss:Type="String"><xsl:value-of select="NN" />) Условие для теста:<xsl:value-of select="Тест" />= >Оператор "<xsl:value-of select="Оператор" />"<xsl:if test='Значение != ""' ><xsl:value-of select="Значение" /></xsl:if ></Data></Cell>
  </Row>
  -->
<xsl:for-each select="OEr">
  <Row ss:StyleID="Default">
    <Cell>
      <Data ss:Type="String"><xsl:value-of select="Er" /></Data>
    </Cell>
  </Row>
</xsl:for-each>
	<Row ss:StyleID="Default">
		<Cell>
			<Data ss:Type="String"><xsl:value-of select="$Footer" /></Data>
		</Cell>
	</Row>
</Table>
  </xsl:if>    
</Worksheet>
</xsl:template >
</xsl:stylesheet >
