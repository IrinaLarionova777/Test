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
 <xsl:variable name="FlagLocPat"><xsl:value-of select="FlagLocPat"/></xsl:variable>
 <xsl:variable name="FlagDocPat"><xsl:value-of select="FlagDocPat"/></xsl:variable>
 <xsl:variable name="FlagPayment"><xsl:value-of select="FlagPayment"/></xsl:variable>
 <xsl:variable name="FlagReason"><xsl:value-of select="FlagReason"/></xsl:variable>

  <title>������ ������������� ���������� �� �������</title>
  <xsl:value-of select="$pass" disable-output-escaping="yes"/>
  <style type="text/css">
     body {font-family: Times New Rom ;}
     .Cur14  { 	font-size : 14pt; }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt;  }
     .Cur12  { 	font-size : 12pt;  }
     .Cur16 { font-size : 16pt; }
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
    <p class="Cur14" align="center"><b>������ ������������� ���������� �� ������ c <xsl:value-of select="Date1"/> �� <xsl:value-of select="Date2"/></b></p>
    <br/>
    <p class="Cur12" align="center"><b>������� ������������: <xsl:value-of select="Reason"/> / �����: <xsl:value-of select="Department"/></b></p>
    <br/>
    <table class="Cur11" border="1" sellspacing="1" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-center: 2px; padding-right: 2px">
      <tr>
        <td width="3%" align="center"><b>�<br/>�/�</b></td>
        <td width="5%" align="center"><b>����<br/>�������</b></td>
        <td width="5%" align="center"><b>���.�����</b></td>
        <td width="15%" align="center"><b>��� ��������</b></td>
        <td width="5%" align="center"><b>���-��<br/>�����</b></td>
        <td width="15%" align="center"><b>������ ����������</b></td>
        <td width="5%" align="center"><b>����<br/>������.</b></td>
        <xsl:if test='$FlagLocPat = 1'><td width="15%" align="center"><b>��������������<br/>��������</b></td></xsl:if>
        <xsl:if test='$FlagDocPat = 1'><td width="10%" align="center"><b>����</b></td></xsl:if>        
        <xsl:if test='$FlagPayment = 1'><td width="10%" align="center"><b>����������</b></td></xsl:if>
        <xsl:if test='$FlagReason = 1'><td width="15%" align="center"><b>�������<br/>������������</b></td></xsl:if>                          
      </tr>
      <xsl:for-each select="OGr">	
         <tr class="Cur12" style='background:#D9D9D0'>
            <td colspan="4" align="left"><b><xsl:value-of select="Name"/></b></td>
            <td align="center"><b><xsl:value-of select="KolTS"/></b></td>
            <td></td>
            <td></td>
            <xsl:if test='$FlagLocPat = 1'><td></td></xsl:if>
            <xsl:if test='$FlagDocPat = 1'><td></td></xsl:if>
            <xsl:if test='$FlagPayment = 1'><td></td></xsl:if>
            <xsl:if test='$FlagReason = 1'><td></td></xsl:if>
         </tr>
         <xsl:for-each select="OGr2">	
            <tr>
              <td align="center"><xsl:value-of select="NGr"/></td>
              <td align="center"><xsl:value-of select="�����������"/></td>
              <td class="xl43" align="center" style="mso-number-format:'\@'"><xsl:value-of select="������"/></td>
              <td align="left"><xsl:value-of select="���"/></td>
              <td align="center"><xsl:value-of select="KolTS"/></td>
              <td align="left"><xsl:value-of select="����������������"/></td>
              <td align="left"><xsl:value-of select="��������������"/></td>
              <xsl:if test='$FlagLocPat = 1'><td align="left"><xsl:value-of select="��������������"/></td></xsl:if>
              <xsl:if test='$FlagDocPat = 1'><td align="left"><xsl:value-of select="����"/></td></xsl:if>        
              <xsl:if test='$FlagPayment = 1'><td align="left"><xsl:value-of select="����������"/></td></xsl:if>     
              <xsl:if test='$FlagReason = 1'><td align="left"><xsl:value-of select="�������"/></td></xsl:if>
            </tr>
          </xsl:for-each>
      </xsl:for-each>  
      <tr style='background:#D9D9D0'>
        <td></td>
        <td colspan="3"><b>�����</b></td>
        <td align="center"><b><xsl:value-of select="Itogo"/></b></td>
        <td></td>
        <td></td>
        <xsl:if test='$FlagLocPat = 1'><td></td></xsl:if>
        <xsl:if test='$FlagDocPat = 1'><td></td></xsl:if>
        <xsl:if test='$FlagPayment = 1'><td></td></xsl:if>
        <xsl:if test='$FlagReason = 1'><td></td></xsl:if>
      </tr>
   </table> 
 <!-- ������ -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
