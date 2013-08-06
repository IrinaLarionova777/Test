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
 <!-- ���� 1/0 "�������� ������ �������� ������ ������" -->
 <xsl:variable name="FlagActiveTS"><xsl:value-of select="FlagActiveTS"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ������" -->
 <xsl:variable name="FlagSect"><xsl:value-of select="FlagSect"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� �������" -->
 <xsl:variable name="FlagSpec"><xsl:value-of select="FlagSpec"/></xsl:variable>
 <xsl:variable name="FlagCont"><xsl:value-of select="FlagCont"/></xsl:variable>
 <!-- ���� 1/0 "������� �������  Word-������" -->
 <xsl:variable name="FlagWord"><xsl:value-of select="FlagWord"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ������� ����" -->
 <xsl:variable name="FlagWS"><xsl:value-of select="FlagWS"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ����������" -->
 <xsl:variable name="FlagMIF"><xsl:value-of select="FlagMIF"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� �������������/���������" -->
 <xsl:variable name="FlagSum"><xsl:value-of select="FlagSum"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ����� ��������.������ �� �����" -->
 <xsl:variable name="FlagNP1"><xsl:value-of select="FlagNP1"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ����� ��������.������ ��� ������" -->
 <xsl:variable name="FlagNP2"><xsl:value-of select="FlagNP2"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ������������ ������ ��� ������" -->
 <xsl:variable name="FlagRepName"><xsl:value-of select="FlagRepName"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ���� "�� ��������� ��� ������" -->
 <xsl:variable name="FlagSTS"><xsl:value-of select="FlagSTS"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ��� ������ ��� �����/��������������" -->
 <xsl:variable name="FlagDRP"><xsl:value-of select="FlagDRP"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ����� ����������" -->
 <xsl:variable name="FlagTime"><xsl:value-of select="FlagTime"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ������ �� ������ (��/���)" -->
 <xsl:variable name="FlagTSL1"><xsl:value-of select="FlagTSL1"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ���-�� ����� � ��������" -->
 <xsl:variable name="FlagTSL2"><xsl:value-of select="FlagTSL2"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ���� �� ������������ ���� � ������� (��/���)" -->
 <xsl:variable name="FlagTSL3"><xsl:value-of select="FlagTSL3"/></xsl:variable>
 <!-- ���� 1/0 "������� ������� ������������ ��� ������ " -->
 <xsl:variable name="FlagNTC"><xsl:value-of select="FlagNTC"/></xsl:variable>
 <xsl:variable name="FlagNTCdesc"><xsl:value-of select="FlagNTCdesc"/></xsl:variable>
 
  <title>������ ������� ������</title>
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
    <p class="Cur14" align="center"><b>������ ������� ������ ��� ������: <xsl:value-of select="Department"/></b></p>
    <br/>
    <table class="Cur10" border="1" sellspacing="1" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-center: 2px; padding-right: 2px">
      <tr>
        <td width="5%" align="center"><b>��� ������</b></td>
        <td width="20%" align="center"><b>������������ ������</b></td>
        <td width="10%" align="center"><b>�������</b></td>     
        <xsl:if test='$FlagActiveTS = 0'><td width="5%" align="center"><b>���.</b></td></xsl:if>
        <xsl:if test='$FlagNP1= 1'><td width="5%" align="center"><b>N �/�</b></td></xsl:if>
        <xsl:if test='$FlagSect = 1'><td width="15%" align="center"><b>������</b></td></xsl:if>
        <xsl:if test='$FlagNP2 = 1'><td width="5%" align="center"><b>N ����.<br/>������</b></td></xsl:if>
        <xsl:if test='$FlagRepName = 1'><td width="10%" align="center"><b>������������ ������</b></td></xsl:if>
        <xsl:if test='$FlagSTS = 1'><td width="5%" align="center"><b>�� ���������<br/>��� ������</b></td></xsl:if>
        <xsl:if test='$FlagDRP = 1'>
            <td width="5%" align="center"><b>��� ������<br/>��� �����</b></td>
            <td width="5%" align="center"><b>��� ������<br/>��� ����������.</b></td>
        </xsl:if>
        <xsl:if test='$FlagTime = 1'><td width="5%" align="center"><b>�����<br/>����������</b></td></xsl:if>
        <xsl:if test='$FlagSpec = 1'><td width="20%" align="center"><b>�������</b></td></xsl:if>
        <xsl:if test='$FlagCont = 1'><td width="20%" align="center"><b>��������� (�������)</b></td></xsl:if>
        <xsl:if test='$FlagWord = 1'><td width="5%" align="center"><b>Word-������</b></td></xsl:if>
        <xsl:if test='$FlagWS = 1'><td width="10%" align="center"><b>������� ����</b></td></xsl:if>
        <xsl:if test='$FlagMIF = 1'><td width="10%" align="center"><b>����������</b></td></xsl:if>
        <xsl:if test='$FlagSum = 1'>
            <td width="10%" align="center"><b>�������������</b></td>
            <td width="10%" align="center"><b>���������</b></td>
        </xsl:if>
        <xsl:if test='$FlagTSL1 = 1'><td width="5%" align="center"><b>������<br/>������</b></td></xsl:if>
        <xsl:if test='$FlagTSL2 = 1'><td width="5%" align="center"><b>���-��<br/>����� � �.</b></td></xsl:if>
        <xsl:if test='$FlagTSL3 = 1'><td width="5%" align="center"><b>������.<br/>���� � �.</b></td></xsl:if>                
        <xsl:if test='$FlagNTC = 1'><td width="5%" align="center"><b>���.���</b></td></xsl:if>        
        <xsl:if test='$FlagNTCdesc = 1'>
            <td width="10%" align="center"><b>������������ ������<br/>������������ ������</b></td>
            <td width="5%" align="center"><b>���.<br/>�������</b></td>
        </xsl:if>        
      </tr>
      <xsl:for-each select="ONext">	
         <tr>
          <td align="center"><xsl:value-of select="Code"/></td>
          <td align="left"><xsl:value-of select="Desc"/></td>
          <td align="center"><xsl:value-of select="Synon"/></td>
          <xsl:if test='$FlagActiveTS = 0'><td align="center"><xsl:value-of select="FlagActive"/></td></xsl:if>
          <xsl:if test='$FlagNP1 = 1'><td align="center"><xsl:value-of select="DisplaySeq"/></td></xsl:if>
          <xsl:if test='$FlagSect = 1'><td align="center"><xsl:value-of select="Section"/></td></xsl:if>
          <xsl:if test='$FlagNP2 = 1'><td align="center"><xsl:value-of select="PrintSeq"/></td></xsl:if>
          <xsl:if test='$FlagRepName = 1'><td align="center"><xsl:value-of select="ReportName"/></td></xsl:if>
          <xsl:if test='$FlagSTS = 1'><td align="center"><xsl:value-of select="StopTestSplitting"/></td></xsl:if>
          <xsl:if test='$FlagDRP = 1'>
                <td align="center"><xsl:value-of select="PageDoctor"/></td>
                <td align="center"><xsl:value-of select="PageHospital"/></td>
          </xsl:if>
          <xsl:if test='$FlagTime = 1'><td align="center"><xsl:value-of select="TimeExecute"/></td></xsl:if>
          <xsl:if test='$FlagSpec = 1'><td align="center"><xsl:value-of select="Specimens"/></td></xsl:if>   
          <xsl:if test='$FlagCont = 1'><td align="center"><xsl:value-of select="Container"/></td></xsl:if>   
          <xsl:if test='$FlagWord = 1'><td align="center"><xsl:value-of select="Word"/></td></xsl:if>          
          <xsl:if test='$FlagWS = 1'><td align="left"><xsl:value-of select="WorkSheet"/></td></xsl:if>          
          <xsl:if test='$FlagMIF = 1'><td align="left"><xsl:value-of select="Machine"/></td></xsl:if>    
          <xsl:if test='$FlagSum = 1'>
              <td align="center"><xsl:value-of select="Cost"/></td>
              <td align="center"><xsl:value-of select="Price"/></td>
          </xsl:if>          
          <xsl:if test='$FlagTSL1 = 1'><td align="center"><xsl:value-of select="TSL-Create"/></td></xsl:if>    
          <xsl:if test='$FlagTSL2 = 1'><td align="center"><xsl:value-of select="TSL-Count"/></td></xsl:if>    
          <xsl:if test='$FlagTSL3 = 1'><td align="center"><xsl:value-of select="TSL-Mandatory"/></td></xsl:if>
          <xsl:if test='$FlagNTC = 1'><td align="center"><xsl:value-of select="NationalNumber"/></td></xsl:if>      
          <xsl:if test='$FlagNTCdesc = 1'>
              <td align="center"><xsl:value-of select="NationalNameLong"/></td>
              <td align="center"><xsl:value-of select="NationalNameShort"/></td>
          </xsl:if>                  
         </tr>
      </xsl:for-each>
   </table> 
 <!-- ������ -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
