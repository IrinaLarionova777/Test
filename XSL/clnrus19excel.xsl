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
 <!-- ���� 1/0 "�������������� ����� � 4 (����������� ��� ������)" -->
  <xsl:variable name="FlagStatForma" >
      <xsl:value-of select="FlagStatForma" />
  </xsl:variable >
  <xsl:variable name="FlagTypeLoc" >
      <xsl:value-of select="FlagTypeLoc" />
  </xsl:variable >
 <!-- ���� 1/0 �������� ������ -->
  <xsl:variable name="FlagError" >
      <xsl:value-of select="FlagError" />
  </xsl:variable >
<Worksheet ss:Name="����.����� �4" >
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
<!-- ................... ������������ ��� ������ ..................-->
<xsl:if test='$FlagStatForma = 0'>    
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="6" >
      <Data ss:Type="String" >�������� � ����������� ������������ ����� �� ����� ������������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������ ������� ������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="GroupTS" />
      </Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > ������ ������, �������� � ������ ������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:for-each select="ODetali" > <xsl:value-of select="Code" /> - <xsl:value-of select="Desc" /> </xsl:for-each >
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row ss:Height="40" >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ���������� �������������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ����� ����������� ���������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1" >
      <Data ss:Type="String" > � ��� �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ��������� ��������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > �������� ������-������� ���-���</Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultHeaderTable" ss:Index="4" >
      <Data ss:Type="String" >���� (0-14)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >��������� (15-17)</Data>
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
      <Data ss:Type="String" > �����</Data>
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
   <!-- ������ -->
  <Row ss:StyleID="Default" >
    <Cell ss:MergeAcross="6" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</xsl:if >
<!-- ................... "�������������� ����� � 4 (����������� ��� ������)"..................-->
<xsl:if test='$FlagStatForma = 1'>    
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="9" >
      <Data ss:Type="String" >����������� ��������������� �������������� ����������</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="9" >
      <Data ss:Type="String" >������������������ ������������� ����������� ����������</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="9" >
      <Data ss:Type="String" >��������������� ��� ��������� ������ ������������� ����������, � ����� �� ��������� ������ ���������������, ������������� ������� ���������� ��������� ��� ��������������� �� ��������� ������� ������������� ��������������� �������������� ���������� �� 13.05.92 �. � 2761-1</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="9" >
      <Data ss:Type="String" >�������� � ����������� ������������ ����� �� <xsl:value-of select="GroupTS" /> � <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" />
      </Data>
  </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="4" >
      <Data ss:Type="String" > ������������:</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="2" >
      <Data ss:Type="String" > ����� �������������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1" >
      <Data ss:Type="String" > ����� � 4</Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultLeft" ss:MergeAcross="4" >
      <Data ss:Type="String" > ���������� ���������������, ������� �����������, ���������� ������������ �� ��� - �������� �����: - ������ �� ������������ � ������ �� ������ ����������, ����, �������, ���������� �������, ����������� ������, �.�.������, �����-���������� ������ �� ������������ � ������ �� ������ ����������, ����, �������, ���������� �������, ����������� ������, �.�.������, �����-���������� �������� � ������� ����� - ����������� ������-������������� ������ �� ������������ � ������ �� ������ ������� - ������ ���������� ���������������� ����������, ����, �������, ���������� �������, ����������� ������, �.�.������, �����-���������� ���������� ������-������������ ����� �� ������������ � ������ �� ������ - ������� ����� � ����� �� ������ � � ������� ��������� ���������� ��������� - ��������� ������ �������� ������ ������� ����� � ����� �� ������ � � ������� ��������� ���������� ��������� - ����������� ������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" ss:MergeAcross="2" >
      <Data ss:Type="String" > 5 ������ � ������������� ��������� ����� � ������������� ��������� ����� 25 �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" ss:MergeAcross="1" >
      <Data ss:Type="String" > ���������� �������������� ����������� ������ ��  05.05.1999 � 30 ��������, �������</Data>
    </Cell>
  </Row>
  <Row><Cell ss:MergeAcross="1" ><Data ss:Type="String" ></Data></Cell></Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="9" >
      <Data ss:Type="String" >������������ �������������� �����������: <i > <xsl:value-of select="�����������������������" /> </i >
      </Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultLeftBold" ss:MergeAcross="9" >
      <Data ss:Type="String" > �������� �����: <i > <xsl:value-of select="����������������" /> </i >
      </Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultLeftBold" ss:MergeDown="1" >
      <Data ss:Type="String" > ��� ����� �� ����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" ss:MergeAcross="7" >
      <Data ss:Type="String" > ��� (����������� �������������� �����������)</Data>
    </Cell>
  </Row>
    <Row >
  <Cell ss:StyleID="DefaultCenter" ss:Index="2">
      <Data ss:Type="String" > �������������� ����������� �� ����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > ���� ������������ �� ����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > ������� �� �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > ���������� �� �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > ������������ (���������), ������ ���������� �� �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > ��������������-�������� ����� �� �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > ����� ������������� �� ����</Data>
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
  <!-- ������ �������� �������������� -->
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
      <Data ss:Type="String" > ��� �� ����: �������-792</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ���������� �������������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > � ����- ��</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ��� ������������ �������������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ����� �����������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1" >
      <Data ss:Type="String" > � ��� �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ����������� �������� (�� ��.4)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ��������� �������� ������������� (�� ��.4)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1" >
      <Data ss:Type="String" > �������� ������������� ����������� � ������������� (�� ��.4)</Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultCenterBold" ss:Index="5" >
      <Data ss:Type="String" > ���� (0-14)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" >
      <Data ss:Type="String" > ��������� (15-17)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:Index="9" >
      <Data ss:Type="String" > � ���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" >
      <Data ss:Type="String" > � ��</Data>
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
      <Data ss:Type="String" > ����� (����� ����� 01+14)</Data>
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
      <Data ss:Type="String" > ������������ �����������</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="2" ss:Index="4" >
      <Data ss:Type="String" > ________________________________ (�.�.�.)</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="1" >
      <Data ss:Type="String" > ________________________________ (�������)</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="1" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
    <Row >
  <Cell ss:StyleID="Default" ss:MergeAcross="1" >
      <Data ss:Type="String" > ����������� ����, ������������� �� ����������� �����</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="2" ss:Index="4" >
      <Data ss:Type="String" > ________________________________ (���������)</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="1" >
      <Data ss:Type="String" > ________________________________ (�.�.�.)</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="1" >
      <Data ss:Type="String" > ________________________________ (�������)</Data>
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
      <Data ss:Type="String" > (����� ����������� ��������)</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="1"  >
      <Data ss:Type="String" > (���� ����������� ���������)</Data>
    </Cell>
  <Cell ss:StyleID="Default" ss:MergeAcross="1"  >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
</xsl:if >
 <!-- ....................................................... -->         
 <!-- ����� ������ -->
 <xsl:if test='$FlagError = 1' >
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="1" >
      <Data ss:Type="String" > ������ ������:</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > N �/�</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����� ��</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���.�����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ��� ��������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ��� �����������</Data>
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
