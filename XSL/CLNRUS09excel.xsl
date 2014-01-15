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
<xsl:variable name="pass" >
</xsl:variable >
<xsl:template match="baseO/OUser" >
  <xsl:variable name="FlagReport" >
      <xsl:value-of select="FlagReport" />
  </xsl:variable >
  <xsl:variable name="FlagTypeLoc" >
      <xsl:value-of select="FlagTypeLoc" />
  </xsl:variable >
  <xsl:variable name="FlagTurnRound" >
      <xsl:value-of select="FlagTurnRound" />
  </xsl:variable >
  <xsl:variable name="FlagSystem" >
      <xsl:value-of select="FlagSystem" />
  </xsl:variable >
  <xsl:variable name="FlagTimeTS" >
      <xsl:value-of select="FlagTimeTS" />
  </xsl:variable >
  <xsl:variable name="FlagCITO" >
      <xsl:value-of select="FlagCITO" />
  </xsl:variable >
  <xsl:variable name="FlagNOCITO" >
      <xsl:value-of select="FlagNOCITO" />
  </xsl:variable >
<Worksheet ss:Name="     ������������ ����������� (�� ��������������� ���������)" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">	
	<!-- ..............................................................................................
     I ������� COLUMNS
     ............................................................................................. -->
<xsl:if test='$FlagTurnRound = 0' >
 <xsl:if test='$FlagReport = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
<xsl:if test='$FlagSystem = 0' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<xsl:if test='$FlagSystem = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<xsl:if test='$FlagSystem = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<xsl:if test='$FlagSystem = 0' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<xsl:if test='$FlagSystem = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
	<xsl:if test='ColIN1 > 0' >
		<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
	</xsl:if>
	<xsl:if test='ColOUT1 > 0'  >
		<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
	</xsl:if>
<xsl:if test='ColOTHER1 > 0' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<xsl:if test='$FlagTimeTS = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<xsl:if test='$FlagTimeTS = 1' >
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
</xsl:if>
</xsl:if>
	<!-- ..............................................................................................
     II ������� COLUMNS
     ............................................................................................. -->
<xsl:if test='$FlagTurnRound = 0'>
<xsl:if test='$FlagReport != 1'>	
		<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
	<xsl:if test='$FlagSystem = 0' >
		<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
	</xsl:if>
	<xsl:if test='$FlagSystem = 1' >
		<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
	</xsl:if>
	<xsl:if test='$FlagSystem = 1' >
		<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
	</xsl:if>
	<xsl:if test='$FlagSystem = 0' >
		<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
	</xsl:if>
	<xsl:if test='$FlagSystem = 1' >
		<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
	</xsl:if>
	<xsl:if test='ColIN1 >0' >
		<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
	</xsl:if>
	<xsl:if test='ColOUT1 >0' >
		<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
	</xsl:if>
	<xsl:if test='ColOTHER1 >0' >
		<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
	</xsl:if>
	<xsl:if test='$FlagTimeTS = 1' >
		<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
	</xsl:if>
	<xsl:if test='$FlagTimeTS = 1' >
		<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
	</xsl:if>
</xsl:if>
</xsl:if>
	<!-- ..............................................................................................
     III ������� COLUMNS
     ............................................................................................. -->
<xsl:if test='$FlagTurnRound = 1'>
		<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="300"/>
		<xsl:if test='$FlagSystem = 0' >
			<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
		</xsl:if>
		<xsl:if test='$FlagSystem = 1' >
			<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
			<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
			<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
		</xsl:if>
</xsl:if>	
	<!-- ..............................................................................................
     I ������� =>  ������ ������� (������ - ������; ������������ ������� - ��������������)
                   ������� ����� �� ������� (��� �������� �� ������� ������)
     ............................................................................................. -->	
<xsl:if test='$FlagTurnRound = 0' >
 <xsl:if test='$FlagReport = 1' >
 <Row ss:StyleID="DefaultTitle">
    <Cell ss:MergeAcross="10"><Data ss:Type="String"><xsl:value-of select="NameLaboratoty" /></Data></Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle">
    <Cell ss:MergeAcross="10"><Data ss:Type="String">����� � ���������� ����������� ������������ �� ��������������� ����������� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" /></Data></Cell>
  </Row>
	<Row></Row>
  <Row ss:StyleID="Default">
    <Cell ss:MergeAcross="10"><Data ss:Type="String">�����:<xsl:value-of select="Department" />/ �������������� ��������:<xsl:value-of select="PatLocation" /></Data></Cell>
  </Row>
	<Row ss:StyleID="Default">
		<Cell ss:MergeAcross="10">
			<Data ss:Type="String">��� ������: ������� ����� �� ������� (��� �������� �� ������� ������)</Data>
		</Cell>
	</Row>
	<Row></Row>
  <Row ss:StyleID="DefaultHeaderTable">
    <Cell ss:MergeDown="1">
      <Data ss:Type="String">�����</Data>
    </Cell>
    <xsl:if test='$FlagSystem = 0' >
       <Cell ss:MergeDown='1'>
          <Data ss:Type="String">����� ���-�� ������. ������� ������</Data>
       </Cell>
    </xsl:if>
    <xsl:if test='$FlagSystem = 1' >
       <Cell ss:MergeAcross='2'>
         <Data ss:Type="String">���-�� ������. ������� ������</Data>
       </Cell>
    </xsl:if>
    <xsl:if test='$FlagSystem = 1' >
       <Cell ss:MergeAcross='{ColOTHER1}'>
         <Data ss:Type="String">��������������</Data>
       </Cell>
    </xsl:if>
	  <xsl:if test='$FlagTypeLoc = 1'>     
         <xsl:if test='$FlagSystem = 0' >
            <Cell ss:MergeAcross='2'><Data ss:Type="String">���������� ������. ������� ������</Data></Cell>
         </xsl:if>
         <xsl:if test='$FlagSystem = 1' >
            <Cell ss:MergeAcross='5'><Data ss:Type="String">���������� ������. ������� ������</Data></Cell>
         </xsl:if>
         <xsl:if test='ColIN1 > 0' >
            <Cell ss:MergeAcross='{ColIN1}'><Data ss:Type="String">���������</Data></Cell>
         </xsl:if>
         <xsl:if test='ColOUT1 > 0'  >
            <Cell ss:MergeAcross='{ColOUT1}'><Data ss:Type="String">�����������</Data></Cell>
         </xsl:if>
         <xsl:if test='ColOTHER1 > 0'  >
            <Cell ss:MergeAcross='{ColOTHER1}'><Data ss:Type="String">������</Data></Cell>
         </xsl:if>
	  </xsl:if>
      <xsl:if test='$FlagTimeTS = 1' >
		  <Cell ss:MergeDown='1'><Data ss:Type="String">����� ���������� (���)</Data></Cell>
		  <Cell ss:MergeDown='1'><Data ss:Type="String">����� ����� ���������� (���)</Data></Cell>
      </xsl:if>
  </Row>
	<!--  ������ ������ ����� -->
  <Row>
	  <xsl:if test='$FlagTypeLoc = 0'>
		  <xsl:if test='$FlagSystem = 1'>
              <Cell ss:StyleID="DefaultLeftBold" ss:Index="2" ><Data ss:Type="String">�����</Data></Cell>
              <Cell ss:StyleID="DefaultLeftBold"><Data ss:Type="String">MT</Data></Cell>
              <Cell ss:StyleID="DefaultLeftBold"><Data ss:Type="String">LT</Data></Cell>
          </xsl:if>
	  </xsl:if>
	  <!-- c����� ����� ��� ���.������ �� ����� ��������������  -->
	  <xsl:if test='$FlagTypeLoc = 1'>
		  <Cell ss:StyleID="DefaultLeft">
			  <Data ss:Type="String">
				  �����
			  </Data>
		  </Cell>
		  <xsl:if test='$FlagSystem = 1'>
			  <Cell ss:StyleID="DefaultLeftBold">
				  <Data ss:Type="String">
					  MT
				  </Data>
			  </Cell>
			  <Cell ss:StyleID="DefaultLeftBold">
				  <Data ss:Type="String">
					  LT
				  </Data>
			  </Cell>
		  </xsl:if>
		  <Cell></Cell>
		  <Cell ss:StyleID="DefaultLeftBold">
			  <Data ss:Type="String">����.</Data>
		  </Cell>
		  <Cell ss:StyleID="DefaultLeftBold">
			  <Data ss:Type="String">�����.</Data>
		  </Cell>
		  <Cell ss:StyleID="DefaultLeftBold">
			  <Data ss:Type="String">������</Data>
		  </Cell>
	  </xsl:if>
	  <xsl:for-each select="OColumnIN">
		  <Cell ss:StyleID="DefaultLeft">
			  <Data ss:Type="String">
				  <xsl:value-of select="Desc" />
			  </Data>
		  </Cell>
	  </xsl:for-each>
	  <xsl:for-each select="OColumnOUT">
		  <Cell ss:StyleID="DefaultLeft">
			  <Data ss:Type="String">
				  <xsl:value-of select="Desc" />
			  </Data>
		  </Cell>
	  </xsl:for-each>
	  <xsl:for-each select="OColumnOTHER">
		  <Cell ss:StyleID="DefaultLeft">
			  <Data ss:Type="String">
				  <xsl:value-of select="Desc" />
			  </Data>
		  </Cell>
	  </xsl:for-each>
  </Row>
	<!--  1 ������: ����� ����� "�����"  -->
  <Row >
    <Cell ss:StyleID="DefaultTableLineBackgroundBold">
      <Data ss:Type="String">�����</Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS" /></Data>
    </Cell>
<xsl:if test='$FlagSystem = 1' >
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-MT" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-LT" /></Data>
    </Cell>
</xsl:if>
	  <xsl:if test='$FlagTypeLoc = 1'>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-IN" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-IN-MT" />/<xsl:value-of select="Itogo-IN-LT" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-OUT" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-OUT-MT" />/<xsl:value-of select="Itogo-OUT-LT" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-OTHER" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-OTHER-MT" />/<xsl:value-of select="Itogo-OTHER-LT" />)</xsl:if ></Data>
    </Cell>
</xsl:if>
	  <xsl:for-each select="OItogoCol">
		  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-MT" />/<xsl:value-of select="Kol-LT" />)</xsl:if ></Data>
    </Cell>
     </xsl:for-each>
<xsl:if test='$FlagTimeTS = 1' >
	<Cell ss:StyleID="DefaultTableLineBackgroundLeft">
		<Data ss:Type="String"></Data>
	</Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTimeExec" /></Data>
    </Cell>
</xsl:if>
  </Row>
	<!--  2 ������: ����� ����� "�����" ���� -->
<xsl:if test='$FlagNOCITO = 1'>
  <Row>
    <Cell ss:StyleID="DefaultTableLineBackgroundBold">
      <Data ss:Type="String">� �.�. ����.</Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTSnocito" /></Data>
    </Cell>
<xsl:if test='$FlagSystem = 1' >
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-MTnocito" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-LTnocito" /></Data>
    </Cell>
</xsl:if>
 <xsl:if test='$FlagTypeLoc = 1'>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-INnocito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-IN-MTnocito" />/<xsl:value-of select="Itogo-IN-LTnocito" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-OUTnocito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-OUT-MTnocito" />/<xsl:value-of select="Itogo-OUT-LTnocito" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-OTHERnocito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-OTHER-MTnocito" />/<xsl:value-of select="Itogo-OTHER-LTnocito" />)</xsl:if ></Data>
    </Cell>
</xsl:if>
	  <xsl:for-each select="OItogoColnocito">
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-MT" />/<xsl:value-of select="Kol-LT" />)</xsl:if ></Data>
    </Cell>
</xsl:for-each>
	  <xsl:if test='$FlagTimeTS = 1' >
    <Cell ss:StyleID="DefaultTableLineBackgroundBold">
      <Data ss:Type="String"></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTimeExecnocito" /></Data>
    </Cell>
</xsl:if>
  </Row>
</xsl:if>
	<!--  3 ������: ����� ����� "�����" CITO -->
<xsl:if test='$FlagCITO = 1'>
  <Row>
    <Cell ss:StyleID="DefaultTableLineBackgroundBold">
      <Data ss:Type="String">� �.�. CITO</Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTScito" /></Data>
    </Cell>
<xsl:if test='$FlagSystem = 1' >
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-MTcito" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-LTcito" /></Data>
    </Cell>
</xsl:if>
  <xsl:if test='$FlagTypeLoc = 1'>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-INcito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-IN-MTcito" />/<xsl:value-of select="Itogo-IN-LTcito" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-OUTcito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-OUT-MTcito" />/<xsl:value-of select="Itogo-OUT-LTcito" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-OTHERcito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-OTHER-MTcito" />/<xsl:value-of select="Itogo-OTHER-LTcito" />)</xsl:if ></Data>
    </Cell>
</xsl:if>
<xsl:for-each select="OItogoColcito">  
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-MT" />/<xsl:value-of select="Kol-LT" />)</xsl:if ></Data>
    </Cell>
</xsl:for-each>
<xsl:if test='$FlagTimeTS = 1'>
		  <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String"></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTimeExeccito" /></Data>
    </Cell>
</xsl:if>
  </Row>
</xsl:if>
	<!--  4 ������: ������ -->
	<Row>
		<Cell ss:StyleID="DefaultTableLineBackgroundBold">
			<Data ss:Type="String">�� ���:</Data>
		</Cell>
	</Row>
	<!--������ �� ������� -->
	<!--  ���� �� �������   -->
<xsl:for-each select="OGr">
<Row>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Code" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRight">
      <Data ss:Type="String"><xsl:value-of select="Kol" /></Data>
    </Cell>
<xsl:if test='$FlagSystem = 1' >
    <Cell ss:StyleID="DefaultTableLineBackground">
      <Data ss:Type="String"><xsl:value-of select="Kol-MT" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackground">
      <Data ss:Type="String"><xsl:value-of select="Kol-LT" /></Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagTypeLoc = 1'>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-IN" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-IN-MT" />/<xsl:value-of select="Kol-IN-LT" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-OUT" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-OUT-MT" />/<xsl:value-of select="Kol-OUT-LT" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-OTHER" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-OTHER-MT" />/<xsl:value-of select="Kol-OTHER-LT" />)</xsl:if ></Data>
    </Cell>
</xsl:if>
	<!--  ���� �� ���������������  -->
<xsl:for-each select="OCol">
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="Kol" /><xsl:if test='Kol  >0' ><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-MT" />/<xsl:value-of select="Kol-LT" />)</xsl:if ></xsl:if></Data>
    </Cell>
</xsl:for-each>
<xsl:if test='$FlagTimeTS = 1' >
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="TimeExec" /></Data>
    </Cell>
</xsl:if>
  </Row>
</xsl:for-each>
</xsl:if >
</xsl:if >

	<!-- ..............................................................................................
	II ������� =>  ������ ������� (������ - ������; ������������ ������� - ��������������)
	����������� ����� � ��������� �� ������� ������/�� ������)
	............................................................................................. -->
<xsl:if test='$FlagTurnRound = 0'>
	<xsl:if test='$FlagReport != 1'>	
  <Row ss:StyleID="DefaultTitle">
    <Cell ss:MergeAcross="10"><Data ss:Type="String"><xsl:value-of select="NameLaboratoty" /></Data></Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle">
    <Cell ss:MergeAcross="10"><Data ss:Type="String">����� � ���������� ����������� ������������ �� ��������������� ����������� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" /></Data></Cell>
  </Row>
  <Row></Row>
  <Row ss:StyleID="Default">
    <Cell ss:MergeAcross="10"><Data ss:Type="String">�����:<xsl:value-of select="Department" />/ �������������� ��������:<xsl:value-of select="PatLocation" /></Data></Cell>
  </Row>
	<Row ss:StyleID="Default">
		<Cell ss:MergeAcross="10">
			<Data ss:Type="String">��� ������:<xsl:if test='$FlagReport = 1' >������� ����� �� ������� (��� �������� �� ������� ������)</xsl:if ><xsl:if test='$FlagReport = 2' >����������� �� ������� ������</xsl:if >
				<xsl:if test='$FlagReport = 3'>����������� �� ������<xsl:if test='FlagNotCalcul = 1' >(��� ����� ��������� ������)</xsl:if >
				</xsl:if ><xsl:if test='$FlagReport = 4' >����������� �� ������� ������� ������</xsl:if >
			</Data>
		</Cell>
</Row>
<Row></Row>
<Row ss:StyleID="DefaultHeaderTable">
<xsl:if test='$FlagReport = 2' >
	<Cell ss:MergeDown="1" >
		<Data ss:Type="String">
			����� / ����� ������
		</Data>
	</Cell>
</xsl:if>
<xsl:if test='$FlagReport = 3' >
	<Cell ss:MergeDown="1" >
      <Data ss:Type="String">����� / �����</Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagReport = 4' >
	<Cell ss:MergeDown="1" >
      <Data ss:Type="String">������ ������� ������ / ����� ������</Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagTypeLoc = 0'>	  
<xsl:if test='$FlagSystem = 0' >
	<Cell ss:MergeDown="1" >
      <Data ss:Type="String">����� ���-�� ������. ������������</Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagSystem = 1' >
	<Cell ss:MergeAcross="2" >
      <Data ss:Type="String">���-�� ������. ������������</Data>
    </Cell>
</xsl:if>
    <Cell>
      <Data ss:Type="String">��������������</Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagTypeLoc = 1'>	  
<xsl:if test='$FlagSystem = 0' >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String">���������� ������. ������������</Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagSystem = 1' >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String">���������� ������. ������������</Data>
    </Cell>
</xsl:if>
<xsl:if test='ColIN1 > 0' >
    <Cell ss:MergeAcross="{ColIN1}" >
      <Data ss:Type="String">���������</Data>
    </Cell>
</xsl:if>
<xsl:if test='ColOUT1 > 0' >
    <Cell ss:MergeAcross="{ColOUT1}">
      <Data ss:Type="String">�����������</Data>
    </Cell>
</xsl:if>
<xsl:if test='ColOTHER1 > 0' >
    <Cell ss:MergeAcross="{ColOTHER1}">
      <Data ss:Type="String">������</Data>
    </Cell>
</xsl:if>
</xsl:if>
<xsl:if test='$FlagTimeTS = 1' >
    <Cell ss:MergeAcross="1" >
      <Data ss:Type="String">����� ���������� (���)</Data>
    </Cell>
    <Cell ss:MergeAcross="1" >
      <Data ss:Type="String">����� ����� ���������� (���)</Data>
    </Cell>
</xsl:if>
  </Row>
	<!--  ������ ������ ����� -->
  <Row>
  <xsl:if test='$FlagTypeLoc = 0'>
	<xsl:if test='$FlagSystem = 1'>
    <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String">�����</Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String">MT</Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String">LT</Data>
    </Cell>
	</xsl:if>
  </xsl:if>
	  <!-- ������ ����� ��� ���.������ �� ����� ��������������  -->
  <xsl:if test='$FlagTypeLoc = 1'>	  
    <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String">�����</Data>
    </Cell>
    <xsl:if test='$FlagSystem = 1' >
       <Cell ss:StyleID="DefaultLeftBold">
         <Data ss:Type="String">MT</Data>
       </Cell>
       <Cell ss:StyleID="DefaultLeftBold">
         <Data ss:Type="String">LT</Data>
       </Cell>
    </xsl:if>
    <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String">����.</Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String">�����.</Data>
    </Cell>
    <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String">������</Data>
    </Cell>
  </xsl:if>
  <xsl:for-each select="OColumnIN">
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Desc" /></Data>
    </Cell>
  </xsl:for-each>
  <xsl:for-each select="OColumnOUT">
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Desc" /></Data>
    </Cell>
  </xsl:for-each>
  <xsl:for-each select="OColumnOTHER">
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Desc" /></Data>
    </Cell>
  </xsl:for-each>
</Row>
	<!--  1 ������: ����� ����� "�����"   -->
  <Row ss:StyleID="DefaultTableLineBackground" >
    <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String">�����</Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS" /></Data>
    </Cell>
<xsl:if test='$FlagSystem = 1'>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-MT" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-LT" /></Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagTypeLoc = 1'>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-IN" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-IN-MT" />/<xsl:value-of select="Itogo-IN-LT" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-OUT" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-OUT-MT" />/<xsl:value-of select="Itogo-OUT-LT" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-OTHER" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-OTHER-MT" />/<xsl:value-of select="Itogo-OTHER-LT" />)</xsl:if ></Data>
    </Cell>
</xsl:if>
<xsl:for-each select="OItogoCol">
		<Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-MT" />/<xsl:value-of select="Kol-LT" />)</xsl:if ></Data>
    </Cell>
</xsl:for-each>
<xsl:if test='$FlagTimeTS = 1'>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTimeExec" /></Data>
    </Cell>
</xsl:if>
</Row>
<!--  2 dop ������: ����� ����� "����� ����."   -->
<xsl:if test='$FlagNOCITO = 1'>	
  <Row ss:StyleID="DefaultTableLineBackground" >
    <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String">� �.�. ����.</Data>
    </Cell>
<xsl:if test='$FlagSystem = 1'>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTSnocito" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-MTnocito" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-LTnocito" /></Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagTypeLoc = 1'>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-INnocito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-IN-MTnocito" />/<xsl:value-of select="Itogo-IN-LTnocito" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-OUTnocito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-OUT-MTnocito" />/<xsl:value-of select="Itogo-OUT-LTnocito" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-OTHERnocito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-OTHER-MTnocito" />/<xsl:value-of select="Itogo-OTHER-LTnocito" />)</xsl:if ></Data>
    </Cell>
</xsl:if>
<xsl:for-each select="OItogoColnocito">
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="Kolnocito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-MTnocito" />/<xsl:value-of select="Kol-LTnocito" />)</xsl:if ></Data>
    </Cell>
</xsl:for-each>
<xsl:if test='$FlagTimeTS = 1'>
	 <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTimeExecnocito" /></Data>
    </Cell>
</xsl:if>
</Row>
</xsl:if>	
<!--  3 dop ������: ����� ����� "����� CITO"   -->
<xsl:if test='$FlagCITO = 1'>	
  <Row ss:StyleID="DefaultTableLineBackground" >
    <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String">� �.�. CITO</Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTScito" /></Data>
    </Cell>
<xsl:if test='$FlagSystem = 1'>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-MTcito" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-LTcito" /></Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagTypeLoc = 1'>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-INcito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-IN-MTcito" />/<xsl:value-of select="Itogo-IN-LTcito" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-OUTcito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-OUT-MTcito" />/<xsl:value-of select="Itogo-OUT-LTcito" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Itogo-OTHERcito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Itogo-OTHER-MTcito" />/<xsl:value-of select="Itogo-OTHER-LTcito" />)</xsl:if ></Data>
    </Cell>
</xsl:if>
<xsl:for-each select="OItogoColcito">
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kolcito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-MTcito" />/<xsl:value-of select="Kol-LTcito" />)</xsl:if ></Data>
    </Cell>
</xsl:for-each>
<xsl:if test='$FlagTimeTS = 1' >
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTimeExeccito" /></Data>
    </Cell>
</xsl:if>
</Row>
</xsl:if>
	<!--  2 ������: ������ -->
	<Row>
		<Cell ss:StyleID="DefaultLeftBold">
			<Data ss:Type="String">�� ���:</Data>
		</Cell>
	</Row>
	<!--  ���� �� �������   -->
<xsl:for-each select="OGr">
<Row ss:StyleID="DefaultTableLineBackground" >
    <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String"><xsl:value-of select="Code" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol" /></Data>
    </Cell>
<xsl:if test='$FlagSystem = 1'>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-MT" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-LT" /></Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagTypeLoc = 1'>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-IN" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-IN-MT" />/<xsl:value-of select="Kol-IN-LT" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-OUT" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-OUT-MT" />/<xsl:value-of select="Kol-OUT-LT" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-OTHER" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-OTHER-MT" />/<xsl:value-of select="Kol-OTHER-LT" />)</xsl:if ></Data>
    </Cell>
</xsl:if>
<xsl:for-each select="OCol">
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol" /><xsl:if test='Kol  >0' ><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-MT" />/<xsl:value-of select="Kol-LT" />)</xsl:if ></xsl:if ></Data>
    </Cell>
</xsl:for-each>
<xsl:if test='$FlagTimeTS = 1'>
		<Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="TimeExec" /></Data>
    </Cell>
</xsl:if>
</Row>

	<!-- ������ �� ����  -->
  <Row ss:StyleID="DefaultTableLineBackground" >
    <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String"><xsl:value-of select="Codenocito" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kolnocito" /></Data>
    </Cell>
<xsl:if test='$FlagSystem = 1'>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-MTnocito" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-LTnocito" /></Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagTypeLoc = 1'>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-INnocito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-IN-MTnocito" />/<xsl:value-of select="Kol-IN-LTnocito" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-OUTnocito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-OUT-MTnocito" />/<xsl:value-of select="Kol-OUT-LTnocito" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-OTHERnocito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-OTHER-MTnocito" />/<xsl:value-of select="Kol-OTHER-LTnocito" />)</xsl:if ></Data>
    </Cell>
</xsl:if>
<xsl:for-each select="OColnocito">
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kolnocito" /><xsl:if test='Kolcito  >0' ><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-MTnocito" />/<xsl:value-of select="Kol-LTnocito" />)</xsl:if ></xsl:if ></Data>
    </Cell>
</xsl:for-each>
<xsl:if test='$FlagTimeTS = 1'>
	<Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="TimeExecnocito" /></Data>
    </Cell>
</xsl:if>
</Row>
	<!-- ������ �� CITO  -->
  <Row ss:StyleID="DefaultTableLineBackground" >
    <Cell ss:StyleID="DefaultLeftBold">
      <Data ss:Type="String"><xsl:value-of select="Codecito" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kolcito" /></Data>
    </Cell>
<xsl:if test='$FlagTypeLoc = 1'>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-MTcito" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-LTcito" /></Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagSystem = 1' >
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-INcito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-IN-MTcito" />/<xsl:value-of select="Kol-IN-LTcito" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-OUTcito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-OUT-MTcito" />/<xsl:value-of select="Kol-OUT-LTcito" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-OTHERcito" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-OTHER-MTcito" />/<xsl:value-of select="Kol-OTHER-LTcito" />)</xsl:if ></Data>
    </Cell>
</xsl:if>
<xsl:for-each select="OColcito">
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kolcito" /><xsl:if test='Kolcito  >0' ><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-MTcito" />/<xsl:value-of select="Kol-LTcito" />)</xsl:if ></xsl:if ></Data>
    </Cell>
</xsl:for-each>
<xsl:if test='$FlagTimeTS = 1'>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="TimeExeccito" /></Data>
    </Cell>
</xsl:if>
</Row>
	<!--  ���� �� ������� ������   -->
<xsl:for-each select="OTS">
<Row>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Code" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="Kol" /></Data>
    </Cell>
<xsl:if test='$FlagSystem = 1'>
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="Kol-MT" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="Kol-LT" /></Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagTypeLoc = 1'>
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="Kol-IN" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-IN-MT" />/<xsl:value-of select="Kol-IN-LT" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="Kol-OUT" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-OUT-MT" />/<xsl:value-of select="Kol-OUT-LT" />)</xsl:if ></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="Kol-OTHER" /><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-OTHER-MT" />/<xsl:value-of select="Kol-OTHER-LT" />)</xsl:if ></Data>
    </Cell>
</xsl:if>
<xsl:for-each select="OCol">
		<Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="Kol" /><xsl:if test='Kol  >0' ><xsl:if test='$FlagSystem = 1' >(<xsl:value-of select="Kol-MT" />/<xsl:value-of select="Kol-LT" />)</xsl:if ></xsl:if ></Data>
    </Cell>
</xsl:for-each>
<xsl:if test='$FlagTimeTS = 1'>
		<Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="Time" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="TimeExec" /></Data>
    </Cell>
</xsl:if>
</Row>
</xsl:for-each>
</xsl:for-each>
</xsl:if>	<!-- ��� FlagSummary=0 -->
</xsl:if>   <!-- ��� FlagTurnRound=0 -->
		<!-- ..............................................................................................
     III ������� =>  ������������� ������� (������ - ��������������; ������������ ������� - ������) 
                     ������� ����� �� ������� (��� �������� �� ������� ������)
     ............................................................................................. -->
<xsl:if test='$FlagTurnRound = 1'>
 <Row ss:StyleID="DefaultTitle">
    <Cell ss:MergeAcross="10"><Data ss:Type="String"><xsl:value-of select="NameLaboratoty" /></Data></Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle">
    <Cell ss:MergeAcross="10"><Data ss:Type="String">����� � ���������� ����������� ������������ �� ��������������� ����������� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" /></Data></Cell>
  </Row>
	<Row></Row>
  <Row ss:StyleID="Default">
    <Cell ss:MergeAcross="10"><Data ss:Type="String">�����:<xsl:value-of select="Department" />/ �������������� ��������:<xsl:value-of select="PatLocation" /></Data></Cell>
  </Row>
  <Row ss:StyleID="Default">
		<Cell ss:MergeAcross="10">
			<Data ss:Type="String">��� ������:<xsl:if test='$FlagReport = 1' >������� ����� �� ������� (��� �������� �� ������� ������)</xsl:if ><xsl:if test='$FlagReport = 2' >����������� �� ������� ������</xsl:if >
				<xsl:if test='$FlagReport = 3'>����������� �� ������<xsl:if test='FlagNotCalcul = 1' >(��� ����� ��������� ������)</xsl:if >
				</xsl:if ><xsl:if test='$FlagReport = 4' >����������� �� ������� ������� ������</xsl:if >
			</Data>
		</Cell>
	</Row>
  <Row ss:StyleID="DefaultHeaderTable">
    <Cell ss:MergeDown="1">
      <Data ss:Type="String">�������������� ���������</Data>
    </Cell>
<xsl:if test='$FlagSystem = 0' >
	<Cell ss:MergeDown="1">
      <Data ss:Type="String">���������� ������. ������� ������</Data>
    </Cell>
	
</xsl:if>
<xsl:if test='$FlagSystem = 1' >
	<Cell ss:MergeAcross="2">
      <Data ss:Type="String">���������� ������. ������� ������</Data>
    </Cell>
	
</xsl:if>
	  <Cell ss:MergeAcross="{ColDEP1}">
      <Data ss:Type="String">������ �����������</Data>
    </Cell>
  </Row>
	!--  ������ ������ ����� -->
<Row ss:Height="30" >
<xsl:if test='$FlagSystem = 1'>
    <Cell ss:StyleID="DefaultHeaderTable" ss:Index="2" >
      <Data ss:Type="String">�����</Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String">MT</Data>
    </Cell>
    <Cell ss:StyleID="DefaultHeaderTable">
      <Data ss:Type="String">LT</Data>
    </Cell>
</xsl:if>
<xsl:if test='$FlagSystem = 0'>
		<Cell></Cell>
		<Cell></Cell>
</xsl:if>
	<xsl:for-each select="OColumn">
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Desc" /></Data>
    </Cell>
    </xsl:for-each>
  </Row>
	<!--  1 ������: ����� ����� "�����" -->
  <Row>
    <Cell ss:StyleID="DefaultTableLineBackgroundBold">
      <Data ss:Type="String">�����</Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS" /></Data>
    </Cell>
<xsl:if test='$FlagSystem = 1' >
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-MT" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-LT" /></Data>
    </Cell>
</xsl:if>
<xsl:for-each select="OItogoCol">
	<Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
		<Data ss:Type="String">
			<xsl:value-of select="Kol" />
			<xsl:if test='Kol  >0' >
				<xsl:if test='$FlagSystem = 1' >
					(<xsl:value-of select="Kol-MT" />/<xsl:value-of select="Kol-LT" />)
				</xsl:if >
			</xsl:if >
		</Data>
	</Cell>
</xsl:for-each>
</Row>
	<!--  2 ������: ����� ����� "�����" ����. -->
<xsl:if test='$FlagNOCITO = 1'>	
  <Row>
    <Cell ss:StyleID="DefaultTableLineBackground">
      <Data ss:Type="String">� �.�. ����.</Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTSnocito" /></Data>
    </Cell>
<xsl:if test='$FlagSystem = 1' >
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-MTnocito" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="ItogoTS-LTnocito" /></Data>
    </Cell>
</xsl:if>
	  <xsl:for-each select="OItogoColnocito">
		  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
			  <Data ss:Type="String">
				  <xsl:value-of select="Kolnocito" />
				  <xsl:if test='Kol  >0' >
					  <xsl:if test='$FlagSystem = 1' >
						  (<xsl:value-of select="Kol-MTnocito" />/<xsl:value-of select="Kol-LTnocito" />)
					  </xsl:if >
				  </xsl:if >
			  </Data>
		  </Cell>
	  </xsl:for-each>
  </Row>
</xsl:if>
	<!--  3 ������: ����� ����� "�����" CITO -->
	<xsl:if test='$FlagNOCITO = 1'>
		<Row>
			<Cell ss:StyleID="DefaultTableLineBackground">
				<Data ss:Type="String">� �.�. CITO</Data>
			</Cell>
			<Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
				<Data ss:Type="String">
					<xsl:value-of select="ItogoTScito" />
				</Data>
			</Cell>
			<xsl:if test='$FlagSystem = 1' >
				<Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
					<Data ss:Type="String">
						<xsl:value-of select="ItogoTS-MTcito" />
					</Data>
				</Cell>
				<Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
					<Data ss:Type="String">
						<xsl:value-of select="ItogoTS-LTcito" />
					</Data>
				</Cell>
			</xsl:if>
			<xsl:for-each select="OItogoColcito">
				<Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
					<Data ss:Type="String">
						<xsl:value-of select="Kolcito" />
						<xsl:if test='Kol  >0' >
							<xsl:if test='$FlagSystem = 1' >
								(<xsl:value-of select="Kol-MTcito" />/<xsl:value-of select="Kol-LTcito" />)
							</xsl:if >
						</xsl:if >
					</Data>
				</Cell>
			</xsl:for-each>
		</Row>
	</xsl:if>
	<!--  4 ������: ������ -->
	<Row>
		<Cell ss:StyleID="Default">
			<Data ss:Type="String">�� ���:</Data>
		</Cell>
	</Row>
	<!--  ���� �� ����� �������������� (������������/������������/������) -->
<xsl:for-each select="OGr">
<xsl:if test='$FlagTypeLoc = 1'>	
  <Row>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Code" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol" /></Data>
    </Cell>
<xsl:if test='$FlagSystem = 1' >
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-MT" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-LT" /></Data>
    </Cell>
</xsl:if>
	  <xsl:for-each select="OCol">
		  <Cell ss:StyleID="DefaultRightBold">
			  <Data ss:Type="String">
				  <xsl:value-of select="Kol" />
				  <xsl:if test='Kol  >0' >
					  <xsl:if test='$FlagSystem = 1' >
						  (<xsl:value-of select="Kol-MT" />/<xsl:value-of select="Kol-LT" />)
					  </xsl:if >
				  </xsl:if >
			  </Data>
		  </Cell>
	  </xsl:for-each>  
</Row>
	<!-- ������ �� ���� -->
  <Row>
    <Cell ss:StyleID="DefaultTableLineBackground">
      <Data ss:Type="String"><xsl:value-of select="Codenocito" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kolnocito" /></Data>
    </Cell>
<xsl:if test='$FlagSystem = 1' >
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-MTnocito" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
      <Data ss:Type="String"><xsl:value-of select="Kol-LTnocito" /></Data>
    </Cell>
</xsl:if>
	  <xsl:for-each select="OColnocito">
		  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
			  <Data ss:Type="String">
				  <xsl:value-of select="Kolnocito" />
				  <xsl:if test='Kol  >0' >
					  <xsl:if test='$FlagSystem = 1' >
						  (<xsl:value-of select="Kol-MTnocito" />/<xsl:value-of select="Kol-LTnocito" />)
					  </xsl:if >
				  </xsl:if >
			  </Data>
		  </Cell>
	  </xsl:for-each>
  </Row>
	<!-- ������ �� CITO -->
	<Row>
		<Cell ss:StyleID="DefaultTableLineBackground">
			<Data ss:Type="String">
				<xsl:value-of select="Codecito" />
			</Data>
		</Cell>
		<Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
			<Data ss:Type="String">
				<xsl:value-of select="Kolcito" />
			</Data>
		</Cell>
		<xsl:if test='$FlagSystem = 1' >
			<Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
				<Data ss:Type="String">
					<xsl:value-of select="Kol-MTcito" />
				</Data>
			</Cell>
			<Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
				<Data ss:Type="String">
					<xsl:value-of select="Kol-LTcito" />
				</Data>
			</Cell>
		</xsl:if>
		<xsl:for-each select="OColnocito">
			<Cell ss:StyleID="DefaultTableLineBackgroundRightBold">
				<Data ss:Type="String">
					<xsl:value-of select="Kolcito" />
					<xsl:if test='Kol  >0' >
						<xsl:if test='$FlagSystem = 1' >
							(<xsl:value-of select="Kol-MTcito" />/<xsl:value-of select="Kol-LTcito" />)
						</xsl:if >
					</xsl:if >
				</Data>
			</Cell>
		</xsl:for-each>
	</Row>
</xsl:if>	
	<!-- ���� �� ���������������  -->
<xsl:for-each select="OGr2">
  <Row>
    <Cell ss:StyleID="DefaultLeft">
      <Data ss:Type="String"><xsl:value-of select="Code" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="Kol" /></Data>
    </Cell>
<xsl:if test='$FlagSystem = 1' >
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="Kol-MT" /></Data>
    </Cell>
    <Cell ss:StyleID="DefaultRight">
      <Data ss:Type="String"><xsl:value-of select="Kol-LT" /></Data>
    </Cell>
</xsl:if>
	  <xsl:for-each select="OCol">
		  <Cell ss:StyleID="DefaultRight">
			  <Data ss:Type="String">
				  <xsl:value-of select="Kol" />
				  <xsl:if test='Kol  >0' >
					  <xsl:if test='$FlagSystem = 1' >
						  (<xsl:value-of select="Kol-MT" />/<xsl:value-of select="Kol-LT" />)
					  </xsl:if >
				  </xsl:if >
			  </Data>
		  </Cell>
	  </xsl:for-each>
  </Row>
</xsl:for-each>
</xsl:for-each>
</xsl:if>  <!-- ��� FlagTurnRound=1 -->	
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
