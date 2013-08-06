<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="Windows-1251" omit-xml-declaration="no"/>
 <xsl:variable name="pass">
 <![CDATA[
  <!--[if gte mso 9]><xml>
   <w:WordDocument>
    <w:View>Print</w:View>
    <w:Zoom>100</w:Zoom>
    <w:DoNotOptimizeForBrowser/>
    <w:DoNotShowRevisions/>
   </w:WordDocument>
  </xml><![endif]-->
 ]]>
</xsl:variable> 
<xsl:template match="baseO/OUser">
 <html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w="urn:schemas-microsoft-com:office:word">
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=windows-1251"/>
   <meta name="ProgId" content="Word.Document"/>
   <meta name="Generator" content="Microsoft Word 10"/>
   <meta name="Originator" content="Microsoft Word 10"/>
 
 <!-- ���� 1/0 "�������� ������ �������� �����" -->
 <xsl:variable name="FlagActiveTC"><xsl:value-of select="FlagActiveTC"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ������ ���������� + ����� + �������.�����" -->
 <xsl:variable name="FlagFR"><xsl:value-of select="FlagFR"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ������ ������" -->
 <xsl:variable name="FlagTS"><xsl:value-of select="FlagTS"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ������� ����" -->
 <xsl:variable name="FlagWS"><xsl:value-of select="FlagWS"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ����������" -->
 <xsl:variable name="FlagMIF"><xsl:value-of select="FlagMIF"/></xsl:variable>
 <!-- ���� 1/0  "������� ��������� ������ ������, ���. �������� � ������� ������� ������ �� ������ �������"  -->
 <xsl:variable name="FlagDifDep"><xsl:value-of select="FlagDifDep"/></xsl:variable>
 <!-- ���� 1/0  "������� ������� ���������� ��� �����"  -->
 <xsl:variable name="FlagCAL"><xsl:value-of select="FlagCAL"/></xsl:variable>

  <title>������ ������</title>
  <xsl:value-of select="$pass" disable-output-escaping="yes"/>
  <style type="text/css">
     body {font-family: Times New Roman ;}
     .Cur9  { 	font-size : 9pt; }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt;  }
     .Cur12  { 	font-size : 12pt;  }
     .Cur14 { font-size : 14pt; }
     .Cur16 { font-size : 16pt; }
     p{margin:0;padding:0;}
     @page Section1{
     mso-page-orientation:portrait;
     size:210mm 297mm;
     margin:10mm 10mm 10mm 10mm; }
     div.Section1{page:Section1;}
  </style> 
 </head>
 <body>
 <div class="Section1">
    <p class="Cur16" align="center"><b><xsl:value-of select="NameLaboratoty"/></b></p>
    <p class="Cur14" align="center"><b>������ ������ ��� ������: <xsl:value-of select="Department"/></b></p>
    <br/>
    <table class="Cur10" border="1" sellspacing="0" width="100%" bordercolor="#000000" 
           style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 5.4pt 0cm 5.4pt'">  
      <thead> <!-- ��������� ��������� ������� �� ������ ��������  -->
      <tr>
        <td width="5%" align="center"><b>��� �����</b></td>
        <td width="20%" align="center"><b>������������ �����</b></td>
        <td width="5%" align="center"><b>�������</b></td>
        <td width="5%" align="center"><b>��.���.</b></td>     
        <xsl:if test='$FlagActiveTC = 0'><td width="3%" align="center"><b>���.</b></td></xsl:if>
        <xsl:if test='$FlagFR = 1'>
            <td width="5%" align="center"><b>������<br/>���-��</b></td>
            <td width="5%" align="center"><b>�����</b></td>
            <td width="5%" align="center"><b>���.<br/>�����</b></td>
        </xsl:if>
        <xsl:if test='$FlagTS = 1'><td width="15%" align="center"><b>������ ������</b></td></xsl:if>
        <xsl:if test='$FlagWS = 1'><td width="10%" align="center"><b>������� ���� [��� ������]</b></td></xsl:if>
        <xsl:if test='$FlagMIF = 1'><td width="10%" align="center"><b>���������� [ID]</b></td></xsl:if>
        <xsl:if test='$FlagCAL = 1'><td width="10%" align="center"><b>����� ������ [�������]</b></td></xsl:if>
      </tr>
      </thead>      
      <xsl:for-each select="ONext">	
         <tr>
          <td align="center"><xsl:value-of select="Code"/></td>
          <td align="left"><xsl:value-of select="Desc"/></td>
          <td align="center"><xsl:value-of select="Synon"/></td>
          <td align="center"><xsl:value-of select="Units"/></td>
          <xsl:if test='$FlagActiveTC = 0'><td align="center"><xsl:value-of select="FlagActive"/></td></xsl:if>
          <xsl:if test='$FlagFR = 1'>
              <td align="center"><xsl:value-of select="ResultFormat"/></td>
              <td align="center"><xsl:value-of select="ResultLength"/></td>
              <td align="center"><xsl:value-of select="ResultDec"/></td>
          </xsl:if>
          <xsl:if test='$FlagTS = 1'><td align="left"><xsl:value-of select="TestSet"/></td></xsl:if>          
          <xsl:if test='$FlagWS = 1'><td align="left"><xsl:value-of select="WorkSheet"/></td></xsl:if>          
          <xsl:if test='$FlagMIF = 1'><td align="left"><xsl:value-of select="Machine"/></td></xsl:if>    
          <xsl:if test='$FlagCAL = 1'>
              <td align="left">
                  <xsl:for-each select="OCalculate">	
                     <b><xsl:value-of select="CodeTS"/></b> [ <xsl:value-of select="Formula"/> ] [<xsl:value-of select="Flag"/>]<br/>
                  </xsl:for-each>
              </td>
          </xsl:if>    
         </tr>
      </xsl:for-each>
   </table> 
 <!-- ���� 1/0  "������� ��������� ������ ������, ���. �������� � ������� ������� ������ �� ������ �������"  -->
 <xsl:if test='$FlagDifDep = 1'>
    <br/>
    <p class="Cur14" align="center"><b>������ ������, ���. �������� � ������� ������� ������ �� ������ �������</b></p>
    <br/>
    <table class="Cur10" border="1" sellspacing="0" width="100%" bordercolor="#000000" 
           style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 5.4pt 0cm 5.4pt'">  
      <thead> <!-- ��������� ��������� ������� �� ������ ��������  -->
      <tr>
        <td width="5%" align="center"><b>� �/�</b></td>
        <td width="5%" align="center"><b>��� �����</b></td>
        <td width="20%" align="center"><b>������������ �����</b></td>
        <td width="5%" align="center"><b>�����</b></td>
      </tr>
      </thead>      
      <xsl:for-each select="ODifDep">	
         <tr>
          <td align="center"><xsl:value-of select="NN"/></td>
          <td align="center"><xsl:value-of select="Code"/></td>
          <td align="left"><xsl:value-of select="Desc"/></td>
          <td align="center"><xsl:value-of select="Dep"/></td>
         </tr>
      </xsl:for-each>
    </table> 
 </xsl:if>    
  <!-- ������ -->
  <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
