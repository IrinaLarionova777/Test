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
  <!-- ���� 1/0 "�������� ������ �������� ������" -->
  <xsl:variable name="FlagActive" >
      <xsl:value-of select="FlagActive" />
  </xsl:variable >
 <!-- ���� 1/0 "������ ������ + ���-�� �����" -->
  <xsl:variable name="FlagFR" >
      <xsl:value-of select="FlagFR" />
  </xsl:variable >
 <!-- ���� 1/0 "������" -->
  <xsl:variable name="FlagCour" >
      <xsl:value-of select="FlagCour" />
  </xsl:variable >
 <!-- ���� 1/0 "�������������" -->
  <xsl:variable name="FlagSpec" >
      <xsl:value-of select="FlagSpec" />
  </xsl:variable >
 <!-- ���� 1/0 "������" -->
  <xsl:variable name="FlagClient" >
      <xsl:value-of select="FlagClient" />
  </xsl:variable >
 <!-- ���� 1/0 "����" -->
  <xsl:variable name="FlagLang" >
      <xsl:value-of select="FlagLang" />
  </xsl:variable >
<Worksheet ss:Name="������ ������" >
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
<xsl:if test='$FlagActive = 0' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="18"/>
</xsl:if>
<xsl:if test='$FlagFR = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<xsl:if test='$FlagFR = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="18"/>
</xsl:if>
<xsl:if test='$FlagCour = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="80"/>
</xsl:if>
<xsl:if test='$FlagSpec = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagClient = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
<xsl:if test='$FlagLang = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="2" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="2" >
      <Data ss:Type="String" > ������ ������</Data>
    </Cell>
  </Row>
           <!-- ��������� ��������� ������� �� ������ ��������  -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������� ��� �������� �����</Data>
    </Cell>
         <xsl:if test='$FlagActive = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���.</Data>
    </Cell>
         </xsl:if >
        <xsl:if test='$FlagFR = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������ ������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-�� �����</Data>
    </Cell>
        </xsl:if >
         <xsl:if test='$FlagCour = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagSpec = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �������������</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagClient = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagLang = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����</Data>
    </Cell>
         </xsl:if >
  </Row>
      <xsl:for-each select="ONext">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
           <xsl:if test='$FlagActive = 0' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="FlagActive" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagFR = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="PrintFormat" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="NoCopies" />
      </Data>
    </Cell>
          </xsl:if >
           <xsl:if test='$FlagCour = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Courier" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagSpec = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Spec" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagClient = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Client" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagLang = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Lang" />
      </Data>
    </Cell>
           </xsl:if >
  </Row>
      </xsl:for-each >
  <!-- ������ -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
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
