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
 
 <!-- ����  1 = "������� �� ������� (��� �������� �� ������� ������)"
            2 = "����������� �� ������� ������"; 3 = "����������� �� ������"; 4 = "����������� �� ������� ������� ������"  -->
 <xsl:variable name="FlagReport"><xsl:value-of select="FlagReport"/></xsl:variable>
 <!-- ���� 1/0 ���������� ������� -->
 <xsl:variable name="FlagTurnRound"><xsl:value-of select="FlagTurnRound"/></xsl:variable>
 
  <title>������������ ����������� (�� ������������ ������)</title>
  <xsl:value-of select="$pass" disable-output-escaping="yes"/>
  <style type="text/css">
     body {font-family: Times New Roman ;}
     .Cur9   { 	font-size : 9pt;  }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt; }
     .Cur12  { 	font-size : 12pt; }
     .Cur14  { font-size : 14pt;  }
     .Cur16 { font-size : 16pt; }
     .xl47	{ mso-style-parent:style0;
            	text-align:center;
	            vertical-align:middle;
	            border-top:.5pt solid black;
	            border-right:.5pt solid black;
	            border-bottom:none;
	            border-left:.5pt solid black;
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
    <p class="Cur14" align="left"><b>����� � ���������� ����������� ������������ �� ������������ ������
       <br/>�� ������ c <xsl:value-of select="Date1"/> �� <xsl:value-of select="Date2"/></b></p>
    <p class="Cur12" align="left">
      <br/>�����: <xsl:value-of select="Department"/> / ����: <xsl:value-of select="Doctor"/>
      <br/>��� ������: 
        <xsl:if test='$FlagReport = 1'>������� ����� �� ������� (��� �������� �� ������� ������)</xsl:if>
        <xsl:if test='$FlagReport = 2'>����������� �� ������� ������</xsl:if>
        <xsl:if test='$FlagReport = 3'>����������� �� ������
              <xsl:if test='FlagNotCalcul = 1'> (��� ����� ��������� ������)</xsl:if>
        </xsl:if>
        <xsl:if test='$FlagReport = 4'>����������� �� ������� ������� ������</xsl:if>
    </p>
    <br/>
<!-- ..............................................................................................
     I ������� =>  ������ ������� (������ - ������; ������������ ������� - �����)
                   ������� ����� �� ������� (��� �������� �� ������� ������)
     ............................................................................................. -->
<xsl:if test='$FlagTurnRound = 0'>
 <xsl:if test='$FlagReport = 1'>
  <table class="Cur11" border="1" sellspacing="0" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
   <tr class="xl47">
     <td width="100pt"><b>�����</b></td>
     <td width="60pt"><b>����� ���-�� ������. ������� ������</b></td>
     <xsl:for-each select="OColumn">	
        <td align="center" style='mso-rotate:90'><xsl:value-of select="Desc"/></td>
     </xsl:for-each>         
   </tr>
   <!--  1 ������: ����� ����� "�����"  -->
   <tr style='background:#D9D9D9'>
     <td><b>�����</b></td>
     <td align="right"><b><xsl:value-of select="ItogoTS"/></b></td>
     <xsl:for-each select="OItogoCol">	
        <td align="right"><b><xsl:value-of select="Kol"/></b></td>
     </xsl:for-each>               
   </tr>
   <!--  2 ������: ������ -->
   <tr>
     <td><b>�� ���:</b></td>
     <td></td>
   </tr>   
   <!--  ���� �� �������   -->   
   <xsl:for-each select="OGr">	
     <tr>
       <td align="left"><xsl:value-of select="Code"/></td>
       <td style='background:#D9D9D0' align="right"><b><xsl:value-of select="Kol"/></b></td>
       <xsl:for-each select="OCol">	
            <td align="right"><xsl:value-of select="Kol"/></td>
       </xsl:for-each>              
     </tr>   
   </xsl:for-each>
  </table>
 </xsl:if> <!-- ��� FlagReport=1 -->
 
 <!-- ..............................................................................................
     II ������� =>  ������ ������� (������ - ������; ������������ ������� - �����)
                   ����������� ����� � ��������� �� ������� ������/�� ������)
     ............................................................................................. -->
 <xsl:if test='$FlagReport != 1'>
  <table class="Cur11" border="1" sellspacing="0" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
   <tr class="xl47">
     <xsl:if test='$FlagReport = 2'>
       <td width="15%"><b>����� / ����� ������</b></td>
     </xsl:if>
     <xsl:if test='$FlagReport = 3'>
       <td width="15%"><b>����� / �����</b></td>
     </xsl:if>
     <xsl:if test='$FlagReport = 4'>
       <td width="15%"><b>������ ������� ������ / ����� ������</b></td>
     </xsl:if>     
     <td width="60pt"><b>����� ���-�� ������. ������������</b></td>
     <xsl:for-each select="OColumn">	
          <td align="center" style='mso-rotate:90'><xsl:value-of select="Desc"/></td>
     </xsl:for-each>
   </tr>
   <!--  1 ������: ����� ����� "�����"   -->
   <tr style='background:#D9D9D9'>
     <td><b>�����</b></td>
     <td align="right"><b><xsl:value-of select="ItogoTS"/></b></td>
     <xsl:for-each select="OItogoCol">	
        <td align="right"><b><xsl:value-of select="Kol"/></b></td>
     </xsl:for-each>               
   </tr>
   <!--  2 ������: ������ -->
   <tr>
     <td><b>�� ���:</b></td>
     <td></td>
   </tr>   
   <!--  ���� �� �������   -->   
   <xsl:for-each select="OGr">	
    <tr style='background:#D9D9D0'>
      <td><b><xsl:value-of select="Code"/></b></td>
      <td align="right"><b><xsl:value-of select="Kol"/></b></td>
      <xsl:for-each select="OCol">	
            <td align="right"><xsl:value-of select="Kol"/></td>
      </xsl:for-each>              
    </tr>
   <!--  ���� �� ������� ������   -->         
    <xsl:for-each select="OTS">	
       <tr class="Cur10">
          <td align="left"><xsl:value-of select="Code"/></td>
          <td style='background:#D9D9D0' align="right"><b><xsl:value-of select="Kol"/></b></td>
          <xsl:for-each select="OCol">	
             <td align="right"><xsl:value-of select="Kol"/></td>
         </xsl:for-each>              
       </tr>
      </xsl:for-each>
  </xsl:for-each>
 </table>
 </xsl:if> <!-- ��� FlagSummary=0 -->
</xsl:if> <!-- ��� FlagTurnRound=0 -->

<!-- ..............................................................................................
     III ������� =>  ������������� ������� (������ - �����; ������������ ������� - ������) 
                     ������� ����� �� ������� (��� �������� �� ������� ������)
     ............................................................................................. -->
<xsl:if test='$FlagTurnRound = 1'> 
  <table class="Cur11" border="1" sellspacing="0" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
   <tr class="xl47">
     <td width="150pt"><b>������������ ����</b></td>
     <td width="10pt"><b>����� ���-�� ������. ������� ������</b></td>
     <xsl:for-each select="OColumn">	
          <td align="center" style='mso-rotate:90'><xsl:value-of select="Desc"/></td>
     </xsl:for-each>
   </tr>
   <!--  1 ������: ����� ����� "�����" -->
   <tr style='background:#D9D9D9'>
     <td><b>�����</b></td>
     <td align="right"><b><xsl:value-of select="ItogoTS"/></b></td>
     <xsl:for-each select="OItogoCol">	
        <td align="right"><b><xsl:value-of select="Kol"/></b></td>
     </xsl:for-each>               
   </tr>
   <!--  2 ������: ������ -->
   <tr>
     <td><b>�� ���:</b></td>
     <td></td>
   </tr>   
   <!--  ���� �� ������ -->   
   <xsl:for-each select="OGr">	
       <tr>	
          <td align="left"><xsl:value-of select="Code"/></td>
          <td style='background:#D9D9D0' align="right"><b><xsl:value-of select="Kol"/></b></td>          
          <xsl:for-each select="OCol">	
              <td align="right"><xsl:value-of select="Kol"/></td>
          </xsl:for-each>              
       </tr>
   </xsl:for-each>
  </table>
</xsl:if> <!-- ��� FlagTurnRound=1 -->
 <!-- ������ -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
