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
 <!-- ���� 1/2 "��� ������" -->
  <xsl:variable name="FlagReport" >
      <xsl:value-of select="FlagReport" />
  </xsl:variable >
 <!-- ���� 1/0 "�������� ������ �������� ������" -->
  <xsl:variable name="FlagActive" >
      <xsl:value-of select="FlagActive" />
  </xsl:variable >
 <!-- ���� 1/0 "��� ���������� ������ -->
  <xsl:variable name="FlagSort" >
      <xsl:value-of select="FlagSort" />
  </xsl:variable >
 <!-- ���� 1/0 "����� ������������������" -->
  <xsl:variable name="FlagNpp" >
      <xsl:value-of select="FlagNpp" />
  </xsl:variable >
 <!-- ���� 1/0 "���.����� + ������������� + ���.� �����"   -->
  <xsl:variable name="FlagDop" >
      <xsl:value-of select="FlagDop" />
  </xsl:variable >
 <!-- ���� 1/0 "�������� � ������������" -->
  <xsl:variable name="FlagMIF" >
      <xsl:value-of select="FlagMIF" />
  </xsl:variable >
<Worksheet ss:Name="������ ���������������" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Portrait"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
<xsl:if test='$FlagNpp = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
<xsl:if test='$FlagActive = 0' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
</xsl:if>
<xsl:if test='$FlagMIF = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="50"/>
</xsl:if>
 <!-- ��� ������ 1 = ������ ������������  -->
 <xsl:if test='$FlagReport = 1'>    
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="2" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="2" >
      <Data ss:Type="String" >������ ������������</Data>
    </Cell>
  </Row>
           <!-- ��������� ��������� ������� �� ������ ��������  -->
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������������ �����������</Data>
    </Cell>
         <xsl:if test='$FlagNpp = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > � ����.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagActive = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���.</Data>
    </Cell>
         </xsl:if >
        <xsl:if test='$FlagMIF = 1' >
             <xsl:for-each select="OCol" >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
             </xsl:for-each >
        </xsl:if >
  </Row>
      <xsl:for-each select="ONext">	
        <xsl:sort order="ascending" select="Desc[$FlagSort='2']" />
        <xsl:sort order="ascending" select="Sequence[$FlagSort='3']" />
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
           <xsl:if test='$FlagNpp = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Sequence" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagActive = 0' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="FlagActive" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagMIF = 1' >
               <xsl:for-each select="OCol" >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="MIF" />
      </Data>
    </Cell>
               </xsl:for-each >
          </xsl:if >
  </Row>
      </xsl:for-each >
 </xsl:if> 
 <!-- ��� ������ 2 = ������ ���������������  -->
 <xsl:if test='$FlagReport = 2'>    
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ������ ��������������� ��� <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
           <!-- ��������� ��������� ������� �� ������ ��������  -->
  <Row><Cell ss:MergeAcross="4" ><Data ss:Type="String" ></Data></Cell></Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������������ ��������������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �������</Data>
    </Cell>
         <xsl:if test='$FlagNpp = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > � ����.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagActive = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���.</Data>
    </Cell>
         </xsl:if >
        <xsl:if test='$FlagDop = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���. �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������- �������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���.� �����</Data>
    </Cell>
        </xsl:if >
        <xsl:if test='$FlagMIF = 1' >
             <xsl:for-each select="OCol" >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
             </xsl:for-each >
        </xsl:if >
  </Row>
      <xsl:for-each select="ONext">	
         <xsl:sort order="ascending" select="Desc[$FlagSort='2']"/>     
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Code" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Desc" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Synon" />
      </Data>
    </Cell>
           <xsl:if test='$FlagNpp = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Sequence" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagActive = 0' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="FlagActive" />
      </Data>
    </Cell>
           </xsl:if >
          <xsl:if test='$FlagDop = 1' >
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="NatID" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="Class" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultCenter" >
      <Data ss:Type="String" > <xsl:value-of select="FlagRep" />
      </Data>
    </Cell>
          </xsl:if>        
          <xsl:if test='$FlagMIF = 1' >
             <xsl:for-each select="OCol" >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="MIF" />
      </Data>
    </Cell>
             </xsl:for-each >
          </xsl:if >
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
