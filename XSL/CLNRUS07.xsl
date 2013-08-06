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
 <!-- ���� 1/0 ���.����� ���������� -->
 <xsl:variable name="FlagSortFIO"><xsl:value-of select="FlagSortFIO"/></xsl:variable>
 <xsl:variable name="FlagAdress"><xsl:value-of select="FlagAdress"/></xsl:variable>
 <xsl:variable name="FlagLocPat"><xsl:value-of select="FlagLocPat"/></xsl:variable>
 <xsl:variable name="FlagDocPat"><xsl:value-of select="FlagDocPat"/></xsl:variable>
 <xsl:variable name="FlagPayment"><xsl:value-of select="FlagPayment"/></xsl:variable>
 <xsl:variable name="FlagTS"><xsl:value-of select="FlagTS"/></xsl:variable>
 <xsl:variable name="FlagCategPat"><xsl:value-of select="FlagCategPat"/></xsl:variable>
 <xsl:variable name="FlagSpec"><xsl:value-of select="FlagSpec"/></xsl:variable> 
 <xsl:variable name="FlagAge"><xsl:value-of select="FlagAge"/></xsl:variable> 
 <xsl:variable name="FlagPregn"><xsl:value-of select="FlagPregn"/></xsl:variable> 
 <!-- ���� 1/0 ������� ������" -->
 <xsl:variable name="FlagError"><xsl:value-of select="FlagError"/></xsl:variable>
 <!-- ���� 1/0 ������������ ��������� ������� �� ������� ������� -->
 <xsl:variable name="FlagTable"><xsl:value-of select="FlagTable"/></xsl:variable>

 <title>����� � ����������� ������������ ������ (� ����������� ���������)</title>
  <xsl:value-of select="$pass" disable-output-escaping="yes"/>
  <style type="text/css">
     body {font-family: Times New Roman ;}
     .Cur14  { 	font-size : 14pt; }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt;  }
     .Cur12  { 	font-size : 12pt;  }
     .Cur16 { font-size : 16pt; }
     .CurGroup { font-size : 11pt; }
     .xl43	{   mso-style-parent:style0;
	          font-family:"Times New Roman", serif;
	          mso-font-charset:204;
	          mso-number-format:"\@";
	          text-align:center;
	          border:.5pt solid black;
	          white-space:normal;}
     p{margin:0;padding:0;}
     @page Section1{
          mso-page-orientation:landscape;
          size:297mm 210mm;
          margin:10mm 10mm 10mm 10mm; }
          div.Section1{page:Section1;}
  </style> 
 </head>
 <body>
 <div class="Section1">
  <p class="Cur16" align="center"><b><xsl:value-of select="NameLaboratoty"/></b></p>
  <p class="Cur14" align="center"><b>����� � ����������� ������������ ������ �� ������ c <xsl:value-of select="Date1"/> �� <xsl:value-of select="Date2"/></b></p>
  <p class="Cur12" align="center">��������������: <xsl:value-of select="PatLocation"/></p>
  <br/>
  <p class="Cur11" align="left"> �������: <xsl:value-of select="UnionConditions"/>
    <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px">
      <tr>
         <td width="5%" align="center"><b>N �/�</b></td>
         <td width="40%" align="center"><b>����</b></td>
         <td width="25%" align="center"><b>��������</b></td>
         <td width="15%" align="center"><b>��������</b></td>
         <td width="15%" align="center"><b>����������</b></td>
      </tr>
     <xsl:for-each select="OCONDITION">	
       <tr>
         <td> <xsl:value-of select="NN"/></td>
         <td> <xsl:value-of select="����"/></td>
         <td> <xsl:value-of select="��������"/></td>
         <td> <xsl:value-of select="��������"/></td>
         <td align="right"> <xsl:value-of select="����������"/></td>
       </tr>
     </xsl:for-each>
    </table>
    <!-- ���������� ��������� ��� ������ ������ -->
    <xsl:value-of select="QPatients"/>
  </p>
<!-- .......................................... -->
<xsl:for-each select="OGr">	
  <br/><br/>
  <xsl:if test='$FlagTable = 1'>    
    <p class="Cur12"><xsl:value-of select="NN"/>) ������� ��� �����: <xsl:value-of select="����"/> => �������� "<xsl:value-of select="��������"/>"
      <xsl:if test='�������� != ""'> <xsl:value-of select="��������"/> </xsl:if> 
    </p>    
    <br/>
  </xsl:if>    
  <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" 
        style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
               border-bottom:solid windowtext 0.5pt;border-right:solid windowtext 0.5pt; padding:0cm 3.5pt 0cm 3.5pt'"> 
  <tr>
   <td width="3%" align="center"><b>�<br/>�/�</b></td>
   <td width="5%" align="center"><b>���. �����</b></td>
   <td width="20%" align="center"><b>������� �.�.</b></td>
   <td width="2%" align="center"><b>���</b></td>
   <xsl:if test='$FlagAge = 1'><td width="3%" align="center"><b>����.</b></td></xsl:if> 
   <xsl:if test='$FlagPregn = 1'><td width="3%" align="center"><b>�����. (������)</b></td></xsl:if>
   <xsl:if test='$FlagAdress = 1'><td width="15%" align="center"><b>�����</b></td></xsl:if>   
   <td width="5%" align="center"><b>� ��</b></td>
   <xsl:if test='$FlagLocPat = 1'><td width="10%" align="center"><b>��������������<br/>��������</b></td></xsl:if>
   <xsl:if test='$FlagDocPat = 1'><td width="10%" align="center"><b>����</b></td></xsl:if>        
   <xsl:if test='$FlagPayment = 1'><td width="10%" align="center"><b>����������</b></td></xsl:if>   
   <xsl:if test='$FlagCategPat = 1'><td width="5%" align="center"><b>���������<br/>��������</b></td></xsl:if>        
   <td width="5%" align="center"><b>����<br/>������</b></td>
   <xsl:if test='$FlagTS = 1'><td width="20%" align="center"><b>����� ������</b></td></xsl:if>
   <xsl:if test='$FlagSpec = 1'><td width="10%" align="center"><b>��� �������</b></td></xsl:if>
   <td width="15%" align="center"><b>����</b></td>
   <td width="20%" align="center"><b>���������</b></td>
  </tr>
  <!-- ���������� � �������� (�� �������) -->		
  <xsl:for-each select="OGrTEST">	
    <tr>
      <td align="center"><xsl:value-of select="NGr"/></td>
      <td class="x143" align="center"><b><xsl:value-of select="Epis"/></b></td>
      <td class="CurGroup" align="left"><xsl:value-of select="Name"/></td>
      <td align="center"><xsl:value-of select="Sex"/></td>
      <xsl:if test='$FlagAge = 1'><td align="center"><xsl:value-of select="Age"/></td></xsl:if>        
      <xsl:if test='$FlagPregn = 1'><td align="center"><xsl:value-of select="PregnWeek"/></td></xsl:if>
      <xsl:if test='$FlagAdress = 1'><td align="center"><xsl:value-of select="Adress"/></td></xsl:if>        
      <td align="center"><xsl:value-of select="MRN"/></td>
      <xsl:if test='$FlagLocPat = 1'><td align="center"><xsl:value-of select="Location"/></td></xsl:if>
      <xsl:if test='$FlagDocPat = 1'><td align="center"><xsl:value-of select="Doctor"/></td></xsl:if>        
      <xsl:if test='$FlagPayment = 1'><td align="left"><xsl:value-of select="Payment"/></td></xsl:if>      
      <xsl:if test='$FlagCategPat = 1'><td align="center"><xsl:value-of select="CategPat"/></td></xsl:if>        
      <td align="center"><xsl:value-of select="DateCol"/></td>
      <xsl:if test='$FlagTS = 1'><td align="left"><xsl:value-of select="NameTS"/></td></xsl:if>    
      <xsl:if test='$FlagSpec = 1'><td align="center"><xsl:value-of select="SpecTS"/></td></xsl:if>
      <td align="left"><xsl:value-of select="NameTC"/></td>
      <td align="left"><xsl:value-of select="Result"/></td>
    </tr>
  </xsl:for-each>
 </table>
</xsl:for-each>
 <!-- ������ -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
  <!-- ����� ������ -->
  <xsl:if test='$FlagError = 1'>
   <br/><br/>
   <table class="Cur11" border="0" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px">
    <xsl:for-each select="OEr">	
      <tr style='background:#FF0000'>
        <td> <xsl:value-of select="Er"/></td>
      </tr>
    </xsl:for-each>
   </table>
  </xsl:if>    
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
