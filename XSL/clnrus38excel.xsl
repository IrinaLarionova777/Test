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
  <!-- ����  1 = "������� �� ������� (��� �������� �� ������� ������)"
            2 = "����������� �� ������� ������"; 3 = "����������� �� ������"; 4 = "����������� �� ������� ������� ������"  -->
  <xsl:variable name="FlagReport" >
      <xsl:value-of select="FlagReport" />
  </xsl:variable >
 <!-- ���� 1/0 ���������� ������� -->
  <xsl:variable name="FlagTurnRound" >
      <xsl:value-of select="FlagTurnRound" />
  </xsl:variable >
<Worksheet ss:Name="������������ �����������" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Portrait"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="70"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >����� � ���������� ����������� ������������ �� ������������ ������ �� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" >�����: <xsl:value-of select="Department" /> / ����: <xsl:value-of select="Doctor" /> <xsl:if test='$FlagReport = 1' > ������� ����� �� ������� (��� �������� �� ������� ������) </xsl:if > <xsl:if test='$FlagReport = 2' > ����������� �� ������� ������ </xsl:if > <xsl:if test='$FlagReport = 3'>����������� �� ������ <xsl:if test='FlagNotCalcul = 1' > (��� ����� ��������� ������) </xsl:if > </xsl:if > <xsl:if test='$FlagReport = 4' > ����������� �� ������� ������� ������ </xsl:if >
      </Data>
    </Cell>
  </Row>
 <!-- ..............................................................................................
     I ������� =>  ������ ������� (������ - ������; ������������ ������� - �����)
                   ������� ����� �� ������� (��� �������� �� ������� ������)
     ............................................................................................. -->
<xsl:if test='$FlagTurnRound = 0' >
 <xsl:if test='$FlagReport = 1' >
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����� ���-�� ������. ������� ������</Data>
    </Cell>
     <xsl:for-each select="OColumn">	
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
     </xsl:for-each>         
  </Row>
   <!--  1 ������: ����� ����� "�����"  -->
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
     <xsl:for-each select="OItogoCol">	
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
     </xsl:for-each>               
  </Row>
   <!--  2 ������: ������ -->
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > �� ���:</Data>
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
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
   <!--  ���� �� �������   -->   
   <xsl:for-each select="OGr">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
       <xsl:for-each select="OCol">	
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
       </xsl:for-each>              
  </Row>
   </xsl:for-each >
  </xsl:if >
      <!-- ��� FlagReport=1 -->
  <!-- ..............................................................................................
     II ������� =>  ������ ������� (������ - ������; ������������ ������� - �����)
                   ����������� ����� � ��������� �� ������� ������/�� ������)
     ............................................................................................. -->
 <xsl:if test='$FlagReport != 1' >
  <Row><Cell ss:MergeAcross="2" ><Data ss:Type="String" ></Data></Cell></Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
     <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����� / ����� ������</Data>
    </Cell>
     </xsl:if >
     <xsl:if test='$FlagReport = 3' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����� / �����</Data>
    </Cell>
     </xsl:if >
     <xsl:if test='$FlagReport = 4' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������ ������� ������ / ����� ������</Data>
    </Cell>
     </xsl:if>     
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����� ���-�� ������. ������������</Data>
    </Cell>
     <xsl:for-each select="OColumn">	
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
     </xsl:for-each >
  </Row>
   <!--  1 ������: ����� ����� "�����"   -->
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
     <xsl:for-each select="OItogoCol">	
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
     </xsl:for-each>               
  </Row>
   <!--  2 ������: ������ -->
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > �� ���:</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
   <!--  ���� �� �������   -->   
   <xsl:for-each select="OGr">	
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
      <xsl:for-each select="OCol">	
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
      </xsl:for-each>              
  </Row>
   <!--  ���� �� ������� ������   -->         
    <xsl:for-each select="OTS">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
          <xsl:for-each select="OCol">	
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
         </xsl:for-each>              
  </Row>
      </xsl:for-each >
  </xsl:for-each >
  </xsl:if >
      <!-- ��� FlagSummary=0 -->
 </xsl:if >
     <!-- ��� FlagTurnRound=0 -->
 <!-- ..............................................................................................
     III ������� =>  ������������� ������� (������ - �����; ������������ ������� - ������) 
                     ������� ����� �� ������� (��� �������� �� ������� ������)
     ............................................................................................. -->
<xsl:if test='$FlagTurnRound = 1'> 
  <Row><Cell ss:MergeAcross="2" ><Data ss:Type="String" ></Data></Cell></Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������������ ����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����� ���-�� ������. ������� ������</Data>
    </Cell>
     <xsl:for-each select="OColumn">	
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
     </xsl:for-each >
  </Row>
   <!--  1 ������: ����� ����� "�����" -->
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
     <xsl:for-each select="OItogoCol">	
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
     </xsl:for-each>               
  </Row>
   <!--  2 ������: ������ -->
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > �� ���:</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  </Row>
   <!--  ���� �� ������ -->   
   <xsl:for-each select="OGr">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
          <xsl:for-each select="OCol">	
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Kol" />
      </Data>
    </Cell>
          </xsl:for-each>              
  </Row>
   </xsl:for-each >
 </xsl:if >
     <!-- ��� FlagTurnRound=1 -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
 <!-- ������ -->
  <Row ss:StyleID="Default" >
    <Cell ss:MergeAcross="5" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
