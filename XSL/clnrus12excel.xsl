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
 <!-- ���� 1/0 "����������� �� ������� ������� ������" -->
  <xsl:variable name="FlagDetailsGR" >
      <xsl:value-of select="FlagDetailsGR" />
  </xsl:variable >
 <!-- ���� 1/0 "����������� �� ������� ������" -->
  <xsl:variable name="FlagDetailsTS" >
      <xsl:value-of select="FlagDetailsTS" />
  </xsl:variable >
 <!-- ���� 1/0 ���.���� �� ����������� ������� ������ (�����/���������) -->
  <xsl:variable name="FlagNorm" >
      <xsl:value-of select="FlagNorm" />
  </xsl:variable >
 <!-- ���� 1/0 "����������� �� ������" -->
  <xsl:variable name="FlagDetailsTC" >
      <xsl:value-of select="FlagDetailsTC" />
  </xsl:variable >
 <!-- ���� 1/0 "���������� ������, ��� ���. ��� �������� �������� ��������" -->   
  <xsl:variable name="FlagQC" >
      <xsl:value-of select="FlagQC" />
  </xsl:variable >
 <!-- ���� 1/0 "���������� ���������/���.�������/��������" -->
  <xsl:variable name="FlagEpis" >
      <xsl:value-of select="FlagEpis" />
  </xsl:variable >
 <!-- ���� 1/0 "����������� �� ���������� �������� (���������)" -->   
  <xsl:variable name="FlagSpecimen" >
      <xsl:value-of select="FlagSpecimen" />
  </xsl:variable >
 <!-- ���� 1/0 "���-�� ���.������� ���������.����� Medtak/Labtrak" -->   
  <xsl:variable name="FlagSystem" >
      <xsl:value-of select="FlagSystem" />
  </xsl:variable >
 <!-- ���� 1/0 "���.���� �� cito (������� ����������)" -->   
  <xsl:variable name="FlagCito" >
      <xsl:value-of select="FlagCito" />
  </xsl:variable >
<Worksheet ss:Name="������������ �����������" >
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="275"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ������������ ��������� �� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ����� �����������: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell ss:MergeAcross="4" ><Data ss:Type="String"></Data></Cell></Row>
  <xsl:if test='$FlagEpis = 0'> 
  <Row ss:Height="60" ss:StyleID="DefaultHeaderTable">
  <Cell>
      <Data ss:Type="String" > � �/�</Data>
    </Cell>
  <Cell>
      <Data ss:Type="String" > ������������</Data>
    </Cell>
  <Cell>
      <Data ss:Type="String" > ��������� �������</Data>
    </Cell>
  <Cell>
      <Data ss:Type="String" > ��������� ������</Data>
    </Cell>
  </Row>
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
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
  </xsl:if >
  <xsl:if test='$FlagEpis = 1'> 
  <Row ss:Height="40" >
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > � �/�</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > ������������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > ��������� �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > ��������� ������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > ���-�� ���������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > ���-�� ���.N</Data>
    </Cell>
     <xsl:if test='$FlagSystem = 1' >
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > �� ���</Data>
    </Cell>
     </xsl:if >
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > ���-�� ��������</Data>
    </Cell>
  </Row>
  <Row>
     <xsl:if test='$FlagSystem = 1' >
  <Cell ss:StyleID="DefaultCenterBold" ss:Index="7" >
      <Data ss:Type="String" > ��</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:Index="8" >
      <Data ss:Type="String" > LT</Data>
    </Cell>
     </xsl:if >
  </Row>
   </xsl:if >
  <Row>
  <Cell  ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTC" />
      </Data>
    </Cell>
     <xsl:if test='$FlagEpis = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoPat" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoEpis" />
      </Data>
    </Cell>
        <xsl:if test='$FlagSystem = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoEpisMT" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoEpisLT" />
      </Data>
    </Cell>
         </xsl:if>   
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoSpecimen" />
      </Data>
    </Cell>
     </xsl:if >
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > �� ���:</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
   <xsl:for-each select="ODep">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
       <xsl:if test='$FlagEpis = 1' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolPat" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolEpis" />
      </Data>
    </Cell>
          <xsl:if test='$FlagSystem = 1' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolEpisMT" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolEpisLT" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolSpecimen" />
      </Data>
    </Cell>
       </xsl:if >
  </Row>
   </xsl:for-each >
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" >
         <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>

<x:WorksheetOptions>
  <x:PageSetup>
     <x:Layout x:Orientation="Landscape"/>
     <x:Header x:Margin="0.3"/>
     <x:Footer x:Margin="0.3"/>
     <x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
  </x:PageSetup>
</x:WorksheetOptions>

</Worksheet>
<!-- NextWorkSheet starttitle ����������� �� ������� ������� ������ endtitle -->
<!--  "����������� �� ������� ������� ������" -->
<xsl:if test='$FlagDetailsGR = 1' >
<Worksheet ss:Name="�� ������� ������� ������" >
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="300"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > ������������ ��������� �� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > ����� �����������: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > ����������� �� ������� ������� ������</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������������ ������ ������� ������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ��������� �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ��������� ������</Data>
    </Cell>
  </Row>
   <xsl:for-each select="OGroup">	
    <xsl:if test='$FlagDetailsTS = 0' >
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
  </Row>
    </xsl:if >
    <!--  "����������� �� ������� ������ ��� ������ �������" -->
    <xsl:if test='$FlagDetailsTS = 1' >
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
  </Row>
      <xsl:for-each select="OTS">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
  </Row>
       </xsl:for-each >
    </xsl:if>       
   </xsl:for-each >
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" >
      <Data ss:Type="String" > ����� ��������� :</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoGRTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoGRTC" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" >
         <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>

<x:WorksheetOptions>
  <x:PageSetup>
     <x:Layout x:Orientation="Portrait"/>
     <x:Header x:Margin="0.3"/>
     <x:Footer x:Margin="0.3"/>
     <x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
  </x:PageSetup>
</x:WorksheetOptions>

</Worksheet>
</xsl:if >
<!-- NextWorkSheet starttitle ����������� �� ������� ������ endtitle -->
 <!--  "����������� �� ������� ������" -->
 <xsl:if test='$FlagDetailsTS = 1' >
<Worksheet ss:Name="�� ������� ������ " >
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="350"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > ������������ ��������� �� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > ����� �����������: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > ����������� �� ����������� ������� ������</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
   <xsl:if test='$FlagNorm = 0' >
  <Row>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������������ ������ ������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ��������� �������</Data>
    </Cell>
         <xsl:if test='$FlagNorm = 1' >
  <Cell ss:MergeAcross="1"  ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �� ���</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagCito = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > � �.�. �� "Cito"</Data>
    </Cell>
         </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ��������� ������</Data>
    </Cell>
  </Row>
   </xsl:if >
   <xsl:if test='$FlagNorm = 1' >
  <Row>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > ���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > ������������ ������ ������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > ��������� �������</Data>
    </Cell>
         <xsl:if test='$FlagNorm = 1' >
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > �� ���</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagCito = 1' >
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > � �.�. �� "Cito"</Data>
    </Cell>
         </xsl:if >
  <Cell ss:StyleID="DefaultCenterBold" ss:MergeDown="1" >
      <Data ss:Type="String" > ��������� ������</Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultCenterBold"  ss:Index="4" >
      <Data ss:Type="String" > � �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenterBold"  ss:Index="5" >
      <Data ss:Type="String" > ������- ��������</Data>
    </Cell>
  </Row>
   </xsl:if >
   <xsl:for-each select="ODep">	
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
      <xsl:if test='$FlagNorm = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolFlagN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolFlagA" />
      </Data>
    </Cell>
      </xsl:if >
       <xsl:if test='$FlagCito = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolCito" />
      </Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
  </Row>
    <xsl:for-each select="OTS">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
          <xsl:if test='$FlagNorm = 1' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolFlagN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolFlagA" />
      </Data>
    </Cell>
          </xsl:if >
           <xsl:if test='$FlagCito = 1' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolCito" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
  </Row>
      </xsl:for-each >
   </xsl:for-each >
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > ����� ��������� ������� ������:</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
     <xsl:if test='$FlagNorm = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoFlagN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoFlagA" />
      </Data>
    </Cell>
     </xsl:if >
      <xsl:if test='$FlagCito = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoCito" />
      </Data>
    </Cell>
      </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTC" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" >
         <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>

<x:WorksheetOptions>
  <x:PageSetup>
     <x:Layout x:Orientation="Landscape"/>
     <x:Header x:Margin="0.3"/>
     <x:Footer x:Margin="0.3"/>
     <x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
  </x:PageSetup>
</x:WorksheetOptions>

</Worksheet>
 </xsl:if >
<!-- NextWorkSheet starttitle ����������� �� ������ endtitle -->
<!--  "����������� �� ������" -->
<xsl:if test='$FlagDetailsTC = 1' >
<Worksheet ss:Name="�� ������ " >
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="350"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > ������������ ��������� �� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > ����� �����������: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > ����������� �� ���������� ������</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������������ �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ��������� ������</Data>
    </Cell>
     <xsl:if test='$FlagQC = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �������� ��������</Data>
    </Cell>
     </xsl:if >
  </Row>
   <xsl:for-each select="ODep">	
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolTC" />
      </Data>
    </Cell>
      <xsl:if test='$FlagQC = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="KolQC" />
      </Data>
    </Cell>
      </xsl:if>      
  </Row>
    <xsl:for-each select="OTC">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
          <xsl:if test='$FlagQC = 1' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolQC" />
      </Data>
    </Cell>
          </xsl:if >
  </Row>
      </xsl:for-each >
   </xsl:for-each >
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > ����� ��������� ������:</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTC" />
      </Data>
    </Cell>
     <xsl:if test='$FlagQC = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoQC" />
      </Data>
    </Cell>
     </xsl:if>  
  </Row>
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" >
         <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>

<x:WorksheetOptions>
  <x:PageSetup>
     <x:Layout x:Orientation="Portrait"/>
     <x:Header x:Margin="0.3"/>
     <x:Footer x:Margin="0.3"/>
     <x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
  </x:PageSetup>
</x:WorksheetOptions>

</Worksheet>
</xsl:if >
<!-- NextWorkSheet starttitle ����������� �� ���������� �������� (���������) endtitle -->
<!--  "����������� �� ���������� �������� (���������)" -->
<xsl:if test='$FlagSpecimen = 1' >
<Worksheet ss:Name="�� �������� (���������)" >
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="300"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ������������ ��������� �� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ����� �����������: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ����������� �� ���������� ��������:</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������������ �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-�� �������� (��������)</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ��������� ���.������</Data>
    </Cell>
  </Row>
   <xsl:for-each select="OSpecimen">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolSpecimen" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="KolTS" />
      </Data>
    </Cell>
  </Row>
   </xsl:for-each >
  <Row>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > ����� :</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoSpecimen" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
  </Row>
 <!-- ������ -->
  <Row><Cell><Data ss:Type="String"></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>

<x:WorksheetOptions>
  <x:PageSetup>
     <x:Layout x:Orientation="Portrait"/>
     <x:Header x:Margin="0.3"/>
     <x:Footer x:Margin="0.3"/>
     <x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
  </x:PageSetup>
</x:WorksheetOptions>

</Worksheet>
</xsl:if >
</xsl:template >
</xsl:stylesheet >
