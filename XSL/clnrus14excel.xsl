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
  <!-- ���� 1/0 "������� ���.������� "Z-Score"" -->
  <xsl:variable name="FlagZScore" >
      <xsl:value-of select="FlagZScore" />
  </xsl:variable >
  <!-- ���� 1/0 "������� ������� ������ �� ����� (������.��., SD � �.�.)" -->
  <xsl:variable name="FlagDetailTC" >
      <xsl:value-of select="FlagDetailTC" />
  </xsl:variable >
<Worksheet ss:Name="������ �������� ��������" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<xsl:if test='$FlagZScore = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<xsl:if test='$FlagZScore = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<xsl:if test='$FlagZScore = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="6" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="6" >
      <Data ss:Type="String" > ������ �������� �������� �� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" /> �����: <xsl:value-of select="�����" />
      </Data>
    </Cell>
  </Row>
 <!-- ����������� ��������-->
 <xsl:for-each select="OGr">	
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="3" >
      <Data ss:Type="String" > ����������� ��������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="2" >
      <Data ss:Type="String" > ��� �</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="2" >
      <Data ss:Type="String" > ���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���� ��������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���� ���������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���� ��������</Data>
    </Cell>
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultLeft" ss:MergeAcross="3" >
      <Data ss:Type="String" > <xsl:value-of select="QC" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" ss:MergeAcross="2" >
      <Data ss:Type="String" > <xsl:value-of select="QCLot" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" ss:MergeAcross="2" >
      <Data ss:Type="String" > <xsl:value-of select="QCType" /> ( <xsl:value-of select="QCWM" /> )</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="QCLevelDesc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="OpeningDate" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="ExpiryDate" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="CloseDate" />
      </Data>
    </Cell>
  </Row>
 <!-- ........................................................................................ -->  
 <!-- ................... ������� ��� ����� � ����� ������� .................................. -->    
 <xsl:if test='$FlagDetailTC = 0' >
  <Row><Cell ss:MergeAcross="6" ><Data ss:Type="String" ></Data></Cell></Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ����</Data>
    </Cell>
     <xsl:if test='$FlagZScore = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="2" >
      <Data ss:Type="String" > 1 �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="2" >
      <Data ss:Type="String" > 2 �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="2" >
      <Data ss:Type="String" > 3 �������</Data>
    </Cell>
     </xsl:if >
     <xsl:if test='$FlagZScore = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="3" >
      <Data ss:Type="String" > 1 �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="3" >
      <Data ss:Type="String" > 2 �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="3" >
      <Data ss:Type="String" > 3 �������</Data>
    </Cell>
     </xsl:if >
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultLeft" ss:Index="3" >
      <Data ss:Type="String" > ���������</Data>
    </Cell>
      <xsl:if test='$FlagZScore = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > Z_Score</Data>
    </Cell>
      </xsl:if >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > ����.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > ���������</Data>
    </Cell>
      <xsl:if test='$FlagZScore = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > Z_Score</Data>
    </Cell>
      </xsl:if >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > ����.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > ���������</Data>
    </Cell>
      <xsl:if test='$FlagZScore = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > Z_Score</Data>
    </Cell>
      </xsl:if >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > ����.</Data>
    </Cell>
  </Row>
     <xsl:for-each select="OTest">	
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="13" >
      <Data ss:Type="String" > <xsl:value-of select="TestCode" /> - <xsl:value-of select="TestDesc" />
      </Data>
    </Cell>
  </Row>
       <xsl:for-each select="OData">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Date" />
      </Data>
    </Cell>
             <!-- 1 ������� -->
             <xsl:variable name="background1" >
                <xsl:value-of select="RuleColor-1" />
             </xsl:variable >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Value-1" />
      </Data>
    </Cell>
              <xsl:if test='$FlagZScore = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ZScore-1" />
      </Data>
    </Cell>
              </xsl:if >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Rule-1" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Exclude-1" />
      </Data>
    </Cell>
             <!-- 2 ������� -->
             <xsl:variable name="background2" >
                <xsl:value-of select="RuleColor-2" />
             </xsl:variable >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Value-2" />
      </Data>
    </Cell>
              <xsl:if test='$FlagZScore = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ZScore-2" />
      </Data>
    </Cell>
              </xsl:if >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Rule-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Exclude-2" />
      </Data>
    </Cell>
             <!-- 3 ������� -->
             <xsl:variable name="background3" >
                <xsl:value-of select="RuleColor-3" />
             </xsl:variable >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Value-3" />
      </Data>
    </Cell>
              <xsl:if test='$FlagZScore = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ZScore-3" />
      </Data>
    </Cell>
              </xsl:if >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Rule-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Exclude-3" />
      </Data>
    </Cell>
  </Row>
        </xsl:for-each >
            <!-- ��� Data -->
      </xsl:for-each >
          <!-- ��� Test -->
   <xsl:if test="not(last()=position())" >
   </xsl:if >
  </xsl:if >
      <!-- ��� FlagDetailTC=0 -->
 <!-- ........................................................................................ --> 
 <!-- ������� ������ ���� ��������� �������� + ������� ������ �� ����� (������.��., SD � �.�.)--> 
 <xsl:if test='$FlagDetailTC = 1' >
  <xsl:for-each select="OTest" >
 <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="6" >
      <Data ss:Type="String" > <u > <xsl:value-of select="TestCode" /> - <xsl:value-of select="TestDesc" /> </u >
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="6" >
      <Data ss:Type="String" > <i > ������� ������ </i >
      </Data>
    </Cell>
  </Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������.�������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������.SD</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����.�������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����.SD</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����.��������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-��_�����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="1" >
      <Data ss:Type="String" > ���</Data>
    </Cell>
  </Row>
      <xsl:for-each select="OLevel" >
  <Row>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="DescLevel" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="FixedMean" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="FixedSD" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="FloatingMean" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="FloatingSD" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="CV" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="CalcType" />
      </Data>
    </Cell>
  </Row>
      </xsl:for-each>  
    <!-- ����������� �������� �� ���� -->  
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="6" >
      <Data ss:Type="String" > <i > ����������� �� ���� </i >
      </Data>
    </Cell>
  </Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeDown="1" >
      <Data ss:Type="String" > ����</Data>
    </Cell>
          <xsl:if test='$FlagZScore = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="2" >
      <Data ss:Type="String" > 1 �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="2" >
      <Data ss:Type="String" > 2 �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="2" >
      <Data ss:Type="String" > 3 �������</Data>
    </Cell>
          </xsl:if >
          <xsl:if test='$FlagZScore = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="3" >
      <Data ss:Type="String" > 1 �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="3" >
      <Data ss:Type="String" > 2 �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" ss:MergeAcross="3" >
      <Data ss:Type="String" > 3 �������</Data>
    </Cell>
          </xsl:if >
  </Row>
  <Row>
  <Cell ss:StyleID="DefaultLeftBold" ss:Index="2" >
      <Data ss:Type="String" > ���������</Data>
    </Cell>
           <xsl:if test='$FlagZScore = 1' >
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > Z_Score</Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > ����.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > ���������</Data>
    </Cell>
           <xsl:if test='$FlagZScore = 1' >
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > Z_Score</Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > ����.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > ���������</Data>
    </Cell>
           <xsl:if test='$FlagZScore = 1' >
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > Z_Score</Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > ����.</Data>
    </Cell>
  </Row>
       <xsl:for-each select="OData">	
  <Row>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Date" />
      </Data>
    </Cell>
             <!-- 1 ������� -->
             <xsl:variable name="background1" >
                <xsl:value-of select="RuleColor-1" />
             </xsl:variable >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Value-1" />
      </Data>
    </Cell>
              <xsl:if test='$FlagZScore = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ZScore-1" />
      </Data>
    </Cell>
              </xsl:if >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Rule-1" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Exclude-1" />
      </Data>
    </Cell>
             <!-- 2 ������� -->
             <xsl:variable name="background2" >
                <xsl:value-of select="RuleColor-2" />
             </xsl:variable >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Value-2" />
      </Data>
    </Cell>
              <xsl:if test='$FlagZScore = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ZScore-2" />
      </Data>
    </Cell>
              </xsl:if >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Rule-2" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Exclude-2" />
      </Data>
    </Cell>
             <!-- 3 ������� -->
             <xsl:variable name="background3" >
                <xsl:value-of select="RuleColor-3" />
             </xsl:variable >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Value-3" />
      </Data>
    </Cell>
              <xsl:if test='$FlagZScore = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="ZScore-3" />
      </Data>
    </Cell>
              </xsl:if >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Rule-3" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Exclude-3" />
      </Data>
    </Cell>
  </Row>
        </xsl:for-each >
            <!-- ��� Data -->
   </xsl:for-each >
       <!-- ��� Test -->
   <xsl:if test="not(last()=position())" >
   </xsl:if >
  </xsl:if >
      <!-- ��� FlagDetailTC=1 -->
  </xsl:for-each >
      <!--  ��� Gr -->
 <!-- ������ -->
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="6" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:template >
</xsl:stylesheet >
