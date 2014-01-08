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
 <!-- ���� 1/2/3 "��� ������": 1 - C����� ��������� / 2 - C����� ����������� / 3 - ���������� ������� ������ / 4 - ���������� ������ -->
  <xsl:variable name="FlagReport" >
      <xsl:value-of select="FlagReport" />
  </xsl:variable >
 <!-- ���� 1/0 "������� �������������� ��������" -->
  <xsl:variable name="FlagLocPat" >
      <xsl:value-of select="FlagLocPat" />
  </xsl:variable >
 <!-- ���� 1/0 "������� �������� ����� ��������" -->
  <xsl:variable name="FlagDocPat" >
      <xsl:value-of select="FlagDocPat" />
  </xsl:variable >
 <!-- ���� 1/0 "������� ��������� ��������" -->
  <xsl:variable name="FlagCatPat" >
      <xsl:value-of select="FlagCatPat" />
  </xsl:variable >
 <!-- ���� 1/0 "������� �����������" -->
  <xsl:variable name="FlagPayment" >
      <xsl:value-of select="FlagPayment" />
  </xsl:variable >
 <!-- ���� 1/0 �������� ������ -->
  <xsl:variable name="FlagError" >
      <xsl:value-of select="FlagError" />
  </xsl:variable >
 <!-- ���� 1/0 ������� ���� ������ �������" -->
  <xsl:variable name="FlagDateCol" >
      <xsl:value-of select="FlagDateCol" />
  </xsl:variable >
<Worksheet ss:Name="���������� �� ����������" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
<xsl:if test='$FlagDateCol = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagLocPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagDocPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagCatPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
</xsl:if>
<xsl:if test='$FlagPayment = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="120"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="160"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
</xsl:if>
<xsl:if test='$FlagReport = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagReport = 2' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
</xsl:if>
<xsl:if test='$FlagReport > 2' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >���������� ����������� ������� ������ �� ���������� ��������� <xsl:value-of select="TC" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >�� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >�����: <xsl:value-of select="Department" /> / ��������� ��������: <xsl:value-of select="PatCategor" /> ��� ������: <xsl:if test='$FlagReport = 1' > 1 - C����� ��������� </xsl:if > <xsl:if test='$FlagReport = 2' > 2 - C����� ����������� </xsl:if > <xsl:if test='$FlagReport = 3' > 3 - ���������� ������� ������ </xsl:if > <xsl:if test='$FlagReport = 4' > 4 - ���������� ������ </xsl:if >
      </Data>
    </Cell>
  </Row>
<!-- .........................  1 - C����� ���������  ..................................-->  
<xsl:if test='$FlagReport = 1' >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �������.�</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ��� ��������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���� ����.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���. �����</Data>
    </Cell>
         <xsl:if test='$FlagDateCol = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���� ������</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �������������� ��������</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagCatPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �����.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagPayment = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����������</Data>
    </Cell>
         </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����� ������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-��</Data>
    </Cell>
  </Row>
    <xsl:for-each select="OGr">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="MRN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="FIO" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Sex" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DB" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Epis" />
      </Data>
    </Cell>
           <xsl:if test='$FlagDateCol = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DateCol" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Location" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagDocPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Doctor" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagCatPat = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Categ" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagPayment = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Payment" />
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
  </Row>
    </xsl:for-each> 
</xsl:if >
<!-- ...........................  2 - C����� �����������  ..............................-->  
<xsl:if test='$FlagReport = 2' >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �������.�</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ��� ��������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���� ����.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���. �����</Data>
    </Cell>
         <xsl:if test='$FlagDateCol = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���� ������</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �������������� ��������</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagCatPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �����.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagPayment = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����������</Data>
    </Cell>
         </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����������</Data>
    </Cell>
  </Row>
    <xsl:for-each select="OGr">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="MRN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="FIO" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Sex" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DB" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Epis" />
      </Data>
    </Cell>
           <xsl:if test='$FlagDateCol = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DateCol" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Location" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagDocPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Doctor" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagCatPat = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Categ" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagPayment = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Payment" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:for-each select="OGrResult" > [ <xsl:value-of select="TS" /> ] <xsl:value-of select="Res" /> </xsl:for-each >
      </Data>
    </Cell>
  </Row>
    </xsl:for-each> 
</xsl:if >
<!-- ........................... 3 - ���������� ������� ������ / 4 - ���������� ������ .................................-->  
 <xsl:if test='$FlagReport > 2' >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �������.�</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ��� ��������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���� ����.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���. �����</Data>
    </Cell>
         <xsl:if test='$FlagDateCol = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���� ������</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �������������� ��������</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagDocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagCatPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �����.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagPayment = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����������</Data>
    </Cell>
         </xsl:if >
         <xsl:for-each select="OCol" >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
         </xsl:for-each >
  </Row>
    <xsl:for-each select="OGr">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="MRN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="FIO" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Sex" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DB" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Epis" />
      </Data>
    </Cell>
           <xsl:if test='$FlagDateCol = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DateCol" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Location" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagDocPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Doctor" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagCatPat = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Categ" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagPayment = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Payment" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:for-each select="OCol" >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select='Result' />
      </Data>
    </Cell>
           </xsl:for-each >
  </Row>
    </xsl:for-each> 
</xsl:if >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
 <!-- ������ -->
  <Row ss:StyleID="Default" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
 <!-- ���� 1/0 �������� ������ -->
 <xsl:if test='$FlagError = 1' >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >������ ������</Data>
    </Cell>
  </Row>
    <xsl:for-each select="OERROR">	
    <Row >
  <Cell ss:StyleID="Default" ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="Er" /></Data>
    </Cell>
  </Row>
    </xsl:for-each>      
</xsl:if >
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
