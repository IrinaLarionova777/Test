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
 <!-- ���� 1/0 "����������� �� ������� ������" -->
  <xsl:variable name="FlagTS" >
      <xsl:value-of select="FlagTS" />
  </xsl:variable >
  <!-- ���� 1/0 "����������� �� �������������" -->
  <xsl:variable name="FlagUser" >
      <xsl:value-of select="FlagUser" />
  </xsl:variable >
 <!-- ���� 1/0 "����������� �� ������������" -->
  <xsl:variable name="FlagPayment" >
      <xsl:value-of select="FlagPayment" />
  </xsl:variable >
 <!-- ���� 1/0 "����������� �� ���������" -->
  <xsl:variable name="FlagEpisode" >
      <xsl:value-of select="FlagEpisode" />
  </xsl:variable >
 <!-- "��� ������������ ������" 1-�� ���� ����������"; 2-�� ���� ���������� -->
  <xsl:variable name="FlagReport" >
      <xsl:value-of select="FlagReport" />
  </xsl:variable >
 <!-- ���� 1/0 "������� �������������� ��������" -->
  <xsl:variable name="FlagLocPat" >
      <xsl:value-of select="FlagLocPat" />
  </xsl:variable >
 <!-- ���� 1/0 "������� ����������/����� ��������" -->
  <xsl:variable name="FlagPayPat" >
      <xsl:value-of select="FlagPayPat" />
  </xsl:variable >
 <!-- ���� 1/0 "������� � �� ��������" -->
  <xsl:variable name="FlagMRNPat" >
      <xsl:value-of select="FlagMRNPat" />
  </xsl:variable >
 <!-- ���� 1/0 "������� ������� ��������� ��������" -->
  <xsl:variable name="FlagCategPat" >
      <xsl:value-of select="FlagCategPat" />
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
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
<xsl:if test='$FlagTS = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
</xsl:if>
<xsl:if test='$FlagReport = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagReport = 2' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>

 <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" ss:Height="40" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ����� � ���������� <xsl:value-of select="TypeReport" /> ������������ �� ������������ �� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ����������: <xsl:value-of select="Payment" /> / �����: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > � �/�</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
    <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����� ������</Data>
    </Cell>
    </xsl:if >
    <xsl:if test='$FlagReport = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-��</Data>
    </Cell>
    </xsl:if >
    <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-�� ���������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-�� ���������</Data>
    </Cell>
    </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���������</Data>
    </Cell>
  </Row>
  <xsl:for-each select="OGr">	
     <xsl:if test='$FlagTS = 0' >
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
           <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
      </xsl:if >
      <xsl:if test='$FlagTS = 1' >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
           <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
     </xsl:if>   
     <xsl:if test='$FlagTS = 1' >
      <!-- ����������� �� ������� ������ -->
      <xsl:for-each select="OGrTS">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
            <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
            </xsl:if >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
       </xsl:for-each >
           <!-- ��� ������� ������ -->
     </xsl:if >
   </xsl:for-each >
       <!-- ��� ������� -->
  <!--����� ���� -->
    <Row >
       <xsl:if test='$FlagTS = 0' >
  <Cell ss:StyleID="DefaultTableLineBackground" ss:MergeAcross="1" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
       </xsl:if >
       <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground" ss:MergeAcross="2" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
       <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS-Exec" />
      </Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTSAmount" />
      </Data>
    </Cell>
  </Row>
 <!-- *****************    "����������� �� ������������"     ************************ -->  
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" >
         <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
<!-- NextWorkSheet starttitle ����������� �� ������������ endtitle -->
<xsl:if test='$FlagPayment = 1' >
<Worksheet ss:Name="����������� �� ������������" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
<xsl:if test='$FlagTS = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
</xsl:if>
<xsl:if test='$FlagReport = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagReport = 2' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" ss:Height="40" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ����� � ���������� <xsl:value-of select="TypeReport" /> ������������ �� ������������ �� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ����������: <xsl:value-of select="Payment" /> / �����: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ����������� �� ������������:</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > � �/�</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
        <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����� ������</Data>
    </Cell>
        </xsl:if >
        <xsl:if test='$FlagReport = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-��</Data>
    </Cell>
        </xsl:if >
        <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-�� ���������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-�� ���������</Data>
    </Cell>
        </xsl:if>        
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���������</Data>
    </Cell>
  </Row>
    <xsl:for-each select="OGrPayment">	
      <xsl:if test='$FlagTS = 0' >
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeftBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
           <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
      </xsl:if >
      <xsl:if test='$FlagTS = 1' >
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="2" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
           <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
      </xsl:if>   
      <!-- �������� �� ������� -->		
      <xsl:for-each select="OGrDep">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
          <xsl:if test='$FlagTS = 0' >
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > <xsl:value-of select="NameDep" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
          </xsl:if >
          <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultLeftBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="NameDep" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
             <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
             </xsl:if >
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
          </xsl:if> 
  </Row>
        <!-- ����������� �� ������� ������ -->
        <xsl:if test='$FlagTS = 1' >
          <xsl:for-each select="OGrTS">	
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
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
                 <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
                 </xsl:if >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
           </xsl:for-each >
               <!-- ��� ������� ������ -->
        </xsl:if >
       </xsl:for-each >
           <!-- ��� ������� -->
     </xsl:for-each >
         <!-- ��� ������������ -->
    <!--����� ���� -->
    <Row >
       <xsl:if test='$FlagTS = 0' >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="2" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
       </xsl:if >
       <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="3" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
       <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS-Exec" />
      </Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTSAmount" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" >
         <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:if >
 <!-- *****************    "����������� �� ���������"     ************************ -->  
<!-- NextWorkSheet starttitle ����������� �� ��������� endtitle -->
<xsl:if test='$FlagEpisode = 1' >
<Worksheet ss:Name="����������� �� ���������" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="20"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
<xsl:if test='$FlagMRNPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
<xsl:if test='$FlagPayPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="40"/>
</xsl:if>
<xsl:if test='$FlagCategPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="30"/>
</xsl:if>
<xsl:if test='$FlagLocPat = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="100"/>
<xsl:if test='$FlagReport = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<xsl:if test='$FlagReport = 2' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>  
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="6" >
      <Data ss:Type="String" > ����� � ���������� <xsl:value-of select="TypeReport" /> ������������ �� ������������ �� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ����������: <xsl:value-of select="Payment" /> / �����: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="13" >
      <Data ss:Type="String" > ����������� �� ���������</Data>
    </Cell>
  </Row>
  <Row><Cell ss:MergeAcross="13" ><Data ss:Type="String" ></Data></Cell></Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > � �/�</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���. �����</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ��� ��������</Data>
    </Cell>
         <xsl:if test='$FlagMRNPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > � ��</Data>
    </Cell>
         </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���� ������</Data>
    </Cell>
        <xsl:if test='$FlagPayPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
        </xsl:if>    
         <xsl:if test='$FlagCategPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > �����.</Data>
    </Cell>
         </xsl:if >
         <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����������. ��������</Data>
    </Cell>
         </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����� ������</Data>
    </Cell>
         <xsl:if test='$FlagReport = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-��</Data>
    </Cell>
         </xsl:if >
        <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-�� ����.</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-�� ������.</Data>
    </Cell>
        </xsl:if>          
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���������</Data>
    </Cell>
  </Row>
    <xsl:for-each select="OGrEpis">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Epis" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="FIO" />
      </Data>
    </Cell>
           <xsl:if test='$FlagMRNPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="MRN" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="DateCol" />
      </Data>
    </Cell>
          <xsl:if test='$FlagPayPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Payment" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Polic" />
      </Data>
    </Cell>
          </xsl:if >
           <xsl:if test='$FlagCategPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="Categ" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" > <xsl:value-of select="LocPat" />
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
           <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count-Exec" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
     </xsl:for-each >
         <!-- ��� ��������� -->
    <!--����� ���� -->
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" ss:MergeAcross="4" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
       <xsl:if test='$FlagMRNPat = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" ></Data>
    </Cell>
       </xsl:if >
       <xsl:if test='$FlagPayPat = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" ></Data>
    </Cell>
       </xsl:if >
       <xsl:if test='$FlagCategPat = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" ></Data>
    </Cell>
       </xsl:if >
       <xsl:if test='$FlagLocPat = 1' >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" ></Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
       <xsl:if test='$FlagReport = 2' >
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS-Exec" />
      </Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRight" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTSAmount" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" >
         <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:if >
 <!-- *****************    "����������� �� �������������"     ************************ -->  
<!-- NextWorkSheet starttitle ����������� �� ������������� endtitle -->
<xsl:if test='$FlagUser = 1' >
<Worksheet ss:Name="����������� �� �������������" >
<x:WorksheetOptions>
<x:PageSetup>
<x:Layout x:Orientation="Landscape"/>
<x:Header x:Margin="0.3"/>
<x:Footer x:Margin="0.3"/>
<x:PageMargins x:Bottom="0.75" x:Left="0.25" x:Right="0.25" x:Top="0.75"/>
</x:PageSetup>
</x:WorksheetOptions>
<Table x:FullColumns="1" x:FullRows="1">
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="25"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
<xsl:if test='$FlagTS = 0' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="200"/>
</xsl:if>
<xsl:if test='$FlagTS = 1' >
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
  <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
</xsl:if>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
<Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>

  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="NameLaboratoty" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" ss:Height="40" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ����� � ���������� <xsl:value-of select="TypeReport" /> ������������ �� ������������ �� ������ c <xsl:value-of select="Date1" /> �� <xsl:value-of select="Date2" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ����������: <xsl:value-of select="Payment" /> / �����: <xsl:value-of select="Department" />
      </Data>
    </Cell>
  </Row>
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > ����������� �� �������������</Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
    <Row >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > � �/�</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ������������</Data>
    </Cell>
        <xsl:if test='$FlagTS = 0' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����������</Data>
    </Cell>
        </xsl:if >
        <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����������</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ����� ������</Data>
    </Cell>
        </xsl:if >
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���-��</Data>
    </Cell>
  <Cell ss:StyleID="DefaultHeaderTable" >
      <Data ss:Type="String" > ���������</Data>
    </Cell>
  </Row>
    <xsl:for-each select="OGrUser">	
    <Row >
  <Cell ss:StyleID="DefaultTableLineBackground" >
      <Data ss:Type="String" > <xsl:value-of select="NGr" />
      </Data>
    </Cell>
           <xsl:if test='$FlagTS = 0' >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
           </xsl:if >
           <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="2" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
           </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
        <!-- ����������� �� ������������ -->
        <xsl:for-each select="OGrPay">	
  <Row>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
  <Cell ss:StyleID="DefaultLeft" >
      <Data ss:Type="String" ></Data>
    </Cell>
               <xsl:if test='$FlagTS = 0' >
  <Cell ss:StyleID="DefaultLeftBold" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
               </xsl:if >
               <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultLeftBold" ss:MergeAcross="1" >
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
               </xsl:if >
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
           <!-- ����������� �� ������� ������ -->
           <xsl:if test='$FlagTS = 1' >
              <xsl:for-each select="OGrTS">	
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
      <Data ss:Type="String" > <xsl:value-of select="Name" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Count" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultRight" >
      <Data ss:Type="String" > <xsl:value-of select="Amount" />
      </Data>
    </Cell>
  </Row>
               </xsl:for-each >
                   <!-- ��� ������� ������ -->
           </xsl:if >
         </xsl:for-each >
             <!-- ��� ������������ -->
     </xsl:for-each >
         <!-- ��� ������������� -->
    <!--����� ���� -->
    <Row >
       <xsl:if test='$FlagTS = 0' >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="2" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
       </xsl:if >
       <xsl:if test='$FlagTS = 1' >
  <Cell ss:StyleID="DefaultTableLineBackgroundBold" ss:MergeAcross="3" >
      <Data ss:Type="String" > �����</Data>
    </Cell>
       </xsl:if >
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTS" />
      </Data>
    </Cell>
  <Cell ss:StyleID="DefaultTableLineBackgroundRightBold" >
      <Data ss:Type="String" > <xsl:value-of select="ItogoTSAmount" />
      </Data>
    </Cell>
  </Row>
  <Row><Cell><Data ss:Type="String" ></Data></Cell></Row>
 <!-- ������ -->
  <Row ss:StyleID="DefaultTitle" >
    <Cell ss:MergeAcross="4" >
      <Data ss:Type="String" > <xsl:value-of select="Footer" />
      </Data>
    </Cell>
  </Row>
</Table>
</Worksheet>
</xsl:if >
</xsl:template >
</xsl:stylesheet >
