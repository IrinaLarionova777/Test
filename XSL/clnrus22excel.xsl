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
 <!-- ���� 1/0 "�������� ������ �������� �����" -->
  <xsl:variable name="FlagActiveTC" >
      <xsl:value-of select="FlagActiveTC" />
  </xsl:variable >
 <!-- ���� 1/0 "������� ������� ������ ���������� + ����� + �������.�����" -->
  <xsl:variable name="FlagFR" >
      <xsl:value-of select="FlagFR" />
  </xsl:variable >
 <!-- ���� 1/0 "������� ������� ������ ������" -->
  <xsl:variable name="FlagTS" >
      <xsl:value-of select="FlagTS" />
  </xsl:variable >
 <!-- ���� 1/0 "������� ������� ������� ����" -->
  <xsl:variable name="FlagWS" >
      <xsl:value-of select="FlagWS" />
  </xsl:variable >
 <!-- ���� 1/0 "������� ������� ����������" -->
  <xsl:variable name="FlagMIF" >
      <xsl:value-of select="FlagMIF" />
  </xsl:variable >
 <!-- ���� 1/0  "������� ��������� ������ ������, ���. �������� � ������� ������� ������ �� ������ �������"  -->
  <xsl:variable name="FlagDifDep" >
      <xsl:value-of select="FlagDifDep" />
  </xsl:variable >
 <!-- ���� 1/0  "������� ������� ���������� ��� �����"  -->
  <xsl:variable name="FlagCAL" >
      <xsl:value-of select="FlagCAL" />
  </xsl:variable >
<!-- ���� "����������� �������"-->
  <xsl:variable name="FlagRanges" >
      <xsl:value-of select="FlagRanges" />
  </xsl:variable >
 <!-- ���� 1/0  "������� ���. �����"  -->
  <xsl:variable name="FlagNationNum" >
      <xsl:value-of select="FlagNationNum" />
  </xsl:variable >
<!-- ��������� ���������� ��� ����������� ������-->
<Worksheet ss:Name="������ ������" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
<xsl:if test='$FlagActiveTC = 0' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="24"/>
</xsl:if>
<xsl:if test='$FlagFR = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
<xsl:if test='$FlagTS = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
<xsl:if test='$FlagWS = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
<xsl:if test='$FlagMIF = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
<xsl:if test='$FlagCAL = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
<xsl:if test='$FlagNationNum = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" >������ ������ ��� ������: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
           <!-- ��������� ��������� ������� �� ������ ��������  -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >��� �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >������������ �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >�������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1" >
      <Data ss:Type="String">��.���.</Data>
    </Cell>
         <xsl:if test='$FlagActiveTC = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >���.</Data>
    </Cell>
         </xsl:if >
        <xsl:if test='$FlagFR = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >������ ���-��</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >�����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >���. �����</Data>
    </Cell>
        </xsl:if >
         <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="6" >
      <Data ss:Type="String" >������ ������</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagWS = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1" >
      <Data ss:Type="String" >������� ���� [��� ������]</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagMIF = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1" >
      <Data ss:Type="String" >���������� [ID]</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagCAL = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="3" >
      <Data ss:Type="String" >����� ������ [�������]</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagNationNum = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1" >
      <Data ss:Type="String" >���. �����</Data>
    </Cell>
         </xsl:if >
  </Row>
<xsl:for-each select="ONext" >
       <xsl:if test='$FlagRanges=0' >
  <Row>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Synon" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" ss:MergeAcross="1">
      <Data ss:Type="String" > <xsl:value-of select="Units" />
      </Data>
    </Cell>
           <xsl:if test='$FlagActiveTC = 0' >
  <Cell ss:StyleID="DefaultCenter">
      <Data ss:Type="String" > <xsl:value-of select="FlagActive" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagFR = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ResultFormat" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ResultLength" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ResultDec" />
      </Data>
    </Cell>
          </xsl:if >
           <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultLeft" ss:MergeAcross="6" >
      <Data ss:Type="String" > <xsl:value-of select="TestSet" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagWS = 1' >
  <Cell ss:StyleID="DefaultLeft" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="WorkSheet" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagMIF = 1' >
  <Cell ss:StyleID="DefaultLeft" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Machine" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagCAL = 1' >
  <Cell ss:StyleID="DefaultLeft" ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:for-each select="OCalculate"> <xsl:value-of select="CodeTS" /> [ <xsl:value-of select="Formula" /> ] [ <xsl:value-of select="Flag" /> ] </xsl:for-each >
      </Data>
    </Cell>
          </xsl:if> 
           <xsl:if test='$FlagNationNum = 1' >
  <Cell ss:StyleID="DefaultLeft" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="NationNum" />
      </Data>
    </Cell>
           </xsl:if >
  </Row>
</xsl:if >
<xsl:if test='$FlagRanges=1' >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Synon" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundCenter"  ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Units" />
      </Data>
    </Cell>
           <xsl:if test='$FlagActiveTC = 0' >
  <Cell ss:StyleID="DefaultTableLineBackgroundCenter" >
      <Data ss:Type="String" > <xsl:value-of select="FlagActive" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagFR = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ResultFormat" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ResultLength" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ResultDec" />
      </Data>
    </Cell>
          </xsl:if >
           <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground"  ss:MergeAcross="6" >
      <Data ss:Type="String" > <xsl:value-of select="TestSet" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagWS = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="WorkSheet" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagMIF = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Machine" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagCAL = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground" ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:for-each select="OCalculate"> <xsl:value-of select="CodeTS" /> [ <xsl:value-of select="Formula" /> ] [ <xsl:value-of select="Flag" /> ] </xsl:for-each >
      </Data>
    </Cell>
          </xsl:if> 
           <xsl:if test='$FlagNationNum = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="NationNum" />
      </Data>
    </Cell>
           </xsl:if >
  </Row>
      </xsl:if >
<xsl:if test='NormsExist = 1' >
 <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >�������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >������. �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >���. ��.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >���. ��.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >�� �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >�� �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >�� �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >�� �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >�� ����� �����.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >�� ����� �����.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >�� ����.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >�� ����.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >�� ����. �����.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" >�� ����. �����.</Data>
    </Cell>
  </Row>
         <xsl:for-each select="ONorms" >
  <Row>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Sex" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Age" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="CLC" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Low" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="High" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="LowPregnant" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="HighPregnant" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="LowBad" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="HighBad" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="LowBadPregnant" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="HighBadPregnant" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="LowPanic" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="HighPanic" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="LowPanicPregnant" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="HighPanicPregnant" />
      </Data>
    </Cell>
  </Row>
 </xsl:for-each >
</xsl:if> 
      </xsl:for-each >
 <!-- ���� 1/0  "������� ��������� ������ ������, ���. �������� � ������� ������� ������ �� ������ �������"  -->
 <xsl:if test='$FlagDifDep = 1' >
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="12" >
      <Data ss:Type="String" > ������ ������, ���. �������� � ������� ������� ������ �� ������ �������</Data>
    </Cell>
  </Row>
           <!-- ��������� ��������� ������� �� ������ ��������  -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > � �/�</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ��� �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="3" >
      <Data ss:Type="String" > ������������ �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="2" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
  </Row>
      <xsl:for-each select="ODifDep">	
  <Row>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="NN" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" ss:MergeAcross="2" >
      <Data ss:Type="String" > <xsl:value-of select="Dep" />
      </Data>
    </Cell>
  </Row>
      </xsl:for-each >
 </xsl:if>    
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
