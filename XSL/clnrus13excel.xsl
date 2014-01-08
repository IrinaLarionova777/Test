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
 <!-- ���� 1/0 ����������� �� ������� ������ -->
  <xsl:variable name="FlagDetailsTS" >
      <xsl:value-of select="FlagDetailsTS" />
  </xsl:variable >
 <!-- ���� 1/0 ����������� �� ������� -->
  <xsl:variable name="FlagSect" >
      <xsl:value-of select="FlagSect" />
  </xsl:variable >
 <!-- ���� 1/2/3 ��� �����������/ ����������� �� ����������/ ����������� �� ������� -->
  <xsl:variable name="FlagGr" >
      <xsl:value-of select="FlagGr" />
  </xsl:variable >
<Worksheet ss:Name="������� ���������� �������" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
  <Column ss:AutoFitWidth="0" ss:Width="160"/>
  <Column ss:AutoFitWidth="0" ss:Width="50"/>
  <Column ss:AutoFitWidth="0" ss:Width="80"/>
  <Column ss:AutoFitWidth="0" ss:Width="1"/>
 <xsl:for-each select="OCol" >
  <Column ss:AutoFitWidth="0" ss:Width="50"/>
  <Column ss:AutoFitWidth="0" ss:Width="80"/>
 </xsl:for-each>

  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >������� ���������� ����������� ������������ (������� ������)</Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >�� <xsl:value-of select="TypeReport" /> �� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" ss:Height="40" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > ����������: <xsl:value-of select="Payment" /> / �����: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
<xsl:choose >
  <xsl:when test='$FlagGr = 1' >
<xsl:choose >
	<xsl:when test='$FlagSect = 1' >
	<!--  ����������� ����� � ��������� �� ������� -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ����� / ������ <xsl:if test='$FlagDetailsTS = 1' > / ����� ������ </xsl:if >
      </Data>
    </Cell>
		 <xsl:call-template name="tabhead1" />
  </Row>
	   <xsl:call-template name="tabhead2" />
	   <xsl:for-each select="OGr" >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
			<xsl:call-template name="periodData" />
  </Row>
		  <xsl:for-each select="OSC" >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > <i > <xsl:value-of select="Code" /> <xsl:value-of select="Name" /> </i >
      </Data>
    </Cell>
				<xsl:call-template name="periodData" />
  </Row>
			 <xsl:if test='$FlagDetailsTS = 1' >
				<xsl:call-template name="testSets" />
			 </xsl:if >
		   </xsl:for-each >
	   </xsl:for-each >
	</xsl:when >
	<xsl:when test='$FlagDetailsTS = 1' >
	<!--  ����������� ����� � ��������� �� ������� ������ -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ����� / ����� ������</Data>
    </Cell>
		 <xsl:call-template name="tabhead1" />
  </Row>
	   <xsl:call-template name="tabhead2" />
	   <xsl:for-each select="OGr">	
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
			<xsl:call-template name="periodData" />
  </Row>
		 <xsl:call-template name="testSets" />
 </xsl:for-each >
     <!--  ��� Gr -->
	</xsl:when >
	<xsl:otherwise >
<!--  ������� ����� �� ������� (��� �������� �� ������� ������ � �������) -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
     <xsl:call-template name="tabhead1" />
  </Row>
   <xsl:call-template name="tabhead2" />
   <xsl:for-each select="OGr" >
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
       <xsl:call-template name="periodData" />
  </Row>
   </xsl:for-each >
	</xsl:otherwise >
</xsl:choose >
  </xsl:when >
  <xsl:when test='$FlagGr = 2' >
<xsl:choose >
	<xsl:when test='$FlagSect = 1' >
	<!--  ����������� ����� � ��������� �� ������� -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > �������� / ����� <xsl:if test='$FlagDetailsTS = 1' > / ����� ������ </xsl:if >
      </Data>
    </Cell>
		 <xsl:call-template name="tabhead1" />
  </Row>
	   <xsl:call-template name="tabhead2" />
	   <xsl:for-each select="OGr" >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
			<xsl:call-template name="periodData" />
  </Row>
		  <xsl:for-each select="OGrDep" >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > <i > <xsl:value-of select="Code" /> </i >
      </Data>
    </Cell>
				<xsl:call-template name="periodData" />
  </Row>
			  <xsl:for-each select="OSC" >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > <i > <xsl:value-of select="Code" /> <xsl:value-of select="Name" /> </i >
      </Data>
    </Cell>
					<xsl:call-template name="periodData" />
  </Row>
				 <xsl:if test='$FlagDetailsTS = 1' >
					<xsl:call-template name="testSets" />
				 </xsl:if >
			   </xsl:for-each >
		   </xsl:for-each >
	   </xsl:for-each >
	</xsl:when >
	<xsl:when test='$FlagDetailsTS = 1' >
	<!--  ����������� ����� � ��������� �� ������� ������ -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > �������� / ����� / ����� ������</Data>
    </Cell>
		 <xsl:call-template name="tabhead1" />
  </Row>
	   <xsl:call-template name="tabhead2" />
	   <xsl:for-each select="OGr">	
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
			<xsl:call-template name="periodData" />
  </Row>
		  <xsl:for-each select="OGrDep" >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > <i > <xsl:value-of select="Code" /> </i >
      </Data>
    </Cell>
				<xsl:call-template name="periodData" />
  </Row>
			<xsl:call-template name="testSets" />
		   </xsl:for-each >
 </xsl:for-each >
     <!--  ��� Gr -->
	</xsl:when >
	<xsl:otherwise >
<!--  ������� ����� �� ������� (��� �������� �� ������� ������ � �������) -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > �������� / ����� ������</Data>
    </Cell>
     <xsl:call-template name="tabhead1" />
  </Row>
   <xsl:call-template name="tabhead2" />
   <xsl:for-each select="OGr" >
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
       <xsl:call-template name="periodData" />
  </Row>
	  <xsl:for-each select="OGrDep" >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > <i > <xsl:value-of select="Code" /> </i >
      </Data>
    </Cell>
			<xsl:call-template name="periodData" />
  </Row>
	   </xsl:for-each >
   </xsl:for-each >
	</xsl:otherwise >
</xsl:choose >
  <!-- ����� ����������� �� ���������� -->
  </xsl:when >
  <xsl:when test='$FlagGr = 3' >
<!--  ������� ����� �� ������� (��� �������� �� ������� ������ � �������) -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ������ / ��������</Data>
    </Cell>
     <xsl:call-template name="tabhead1" />
  </Row>
   <xsl:call-template name="tabhead2" />
   <xsl:for-each select="OGr" >
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
       <xsl:call-template name="periodData" />
  </Row>
	  <xsl:for-each select="OGrDep" >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > <i > <xsl:value-of select="Code" /> </i >
      </Data>
    </Cell>
			<xsl:call-template name="periodData" />
  </Row>
	   </xsl:for-each >
   </xsl:for-each >
  <!-- ����� ����������� �� ������� -->
  </xsl:when >
</xsl:choose >
 <!-- ������ -->
<Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:template >
<xsl:template name="tabhead1" >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ����� ���-��</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ����� �����</Data>
    </Cell>
<Cell ss:Index="4"><Data ss:Type="String"></Data></Cell>
  <xsl:for-each select="OCol" >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  </xsl:for-each >
</xsl:template >
<xsl:template name="tabhead2" >
    <Row >
  <Cell ss:Index="4"><Data ss:Type="String"></Data></Cell>
 <xsl:for-each select="OCol" >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-�� �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���������</Data>
    </Cell>
 </xsl:for-each >
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > ����� ���������� ������� ������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itogo-Kol" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Itogo-Amt" />
      </Data>
    </Cell>
<Cell ss:Index="4"><Data ss:Type="String"></Data></Cell>
        <xsl:for-each select="OItogoCol" >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amt" />
      </Data>
    </Cell>
        </xsl:for-each >
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <i > � ��� ����� �� �������: </i >
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
        <xsl:for-each select="OItogoCol" >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
        </xsl:for-each >
  </Row>
</xsl:template >
<xsl:template name="testSets" >
 <xsl:for-each select="OTS" >
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Amt" />
      </Data>
    </Cell>
<Cell ss:Index="4"><Data ss:Type="String"></Data></Cell>
 <xsl:for-each select="OCol" >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Amt" />
      </Data>
    </Cell>
 </xsl:for-each >
  </Row>
  </xsl:for-each >
      <!-- ��� TS -->
</xsl:template >
<xsl:template name="periodData" >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amt" />
      </Data>
    </Cell>
<Cell ss:Index="4"><Data ss:Type="String"></Data></Cell>
 <xsl:for-each select="OCol" >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Amt" />
      </Data>
    </Cell>
 </xsl:for-each >
</xsl:template >
</xsl:stylesheet >
