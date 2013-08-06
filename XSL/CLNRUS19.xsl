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
 
 <!-- ���� 1/0 "�������������� ����� � 4 (����������� ��� ������)" -->
 <xsl:variable name="FlagStatForma"><xsl:value-of select="FlagStatForma"/></xsl:variable>
 <xsl:variable name="FlagTypeLoc"><xsl:value-of select="FlagTypeLoc"/></xsl:variable>
 <!-- ���� 1/0 �������� ������ -->
 <xsl:variable name="FlagError"><xsl:value-of select="FlagError"/></xsl:variable>
 
  <title>����.����� �4</title>
  <xsl:value-of select="$pass" disable-output-escaping="yes"/>
  <style type="text/css">
     body {font-family: Times New Roman ;}
     .Cur7  { 	font-size : 7pt; }
     .Cur8  { 	font-size : 8pt; }
     .Cur9  { 	font-size : 9pt; }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt;  }
     .Cur12  { 	font-size : 12pt;  }
     .Cur14  { 	font-size : 14pt;  }
     .Cur16  { 	font-size : 16pt;  }
     p{margin:0;padding:0;}
     <xsl:if test='$FlagStatForma = 0'>    
        @page Section1{  mso-page-orientation:portrait;
                         size:210mm 297mm;
                         margin:10mm 10mm 10mm 10mm; }
     </xsl:if>
     <xsl:if test='$FlagStatForma = 1'>  
         @page Section1{  mso-page-orientation:landscape;
                          size:297mm 210mm;
                          margin:10mm 10mm 10mm 10mm; }
     </xsl:if>
table {
	border-collapse: collapse;
	padding-left: 2px;
	padding-right: 2px border-bottom: solid windowtext 1.5pt;
	border-right: solid windowtext 0.5pt;
	border-left: solid windowtext 0.5pt;
	border-top: solid windowtext 0.5pt;
	border-bottom: solid windowtext 0.5pt;
	layout-grid: line;
	padding: 1.5pt 5.0pt 1.5pt 5.0pt;
	border-color: black;
	width:100%;
	font-size: 13px;
}
table.nullBorder{
  border-collapse: collapse;
	padding-left: 2px;
	padding-right: 2px border-bottom: solid windowtext 1.5pt;
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom: none;
	layout-grid: line;
	padding: 1.5pt 5.0pt 1.5pt 5.0pt;
	border-color: black;
	width:100%;
	font-size: 13px;
}
td.nullBorder{
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom: none;
}
td.nulladnleft{
	border-collapse: collapse;
	border-left: solid windowtext 0.5pt;
	border-right: none;
	border-top: none;
	border-bottom: none;
}
td{
  border-collapse: collapse;
	border-left: solid windowtext 0.5pt;
	border-top: solid windowtext 0.5pt;
}
td.bottom{
	border-collapse: collapse;
	border-bottom: solid windowtext 0.5pt;
}
td.leftTop {
	border-collapse: collapse;
	border-left: solid windowtext 0.5pt;
	border-top: solid windowtext 0.5pt;
}
td.borderLeft {	border-collapse: collapse;
	              border-left: solid windowtext 0.5pt; }
p.c10 {	font-family: Times New Roman;
	      font-size: 9px; }
b.big {	font-family: Times New Roman;
	      font-size: 24px; }
div.Section1{page:Section1;} 

  </style> 
 </head>
 <body>
 <div class="Section1">
<!-- ................... ������������ ��� ������ ..................-->
<xsl:if test='$FlagStatForma = 0'>    
    <p class="Cur16" align="center"><b><xsl:value-of select="NameLaboratoty"/></b></p>
    <p class="Cur14" align="center"><b>�������� � ����������� ������������ ����� �� ����� ������������
        <br/>c <xsl:value-of select="Date1"/> �� <xsl:value-of select="Date2"/></b>
    </p>
    <br/>
    <table class="Cur11" border="1" sellspacing="0" width="70%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px">  
      <tr>
        <td width="20%" align="left"><b>������ ������� ������</b></td>
        <td width="50%" align="left"><b><xsl:value-of select="GroupTS"/></b></td>
      </tr>
      <tr>
        <td width="20%" align="left">������ ������, <br/>�������� � ������ ������</td>
        <td width="50%" align="left">
            <xsl:for-each select="ODetali">
            	<xsl:value-of select="Code"/> - <xsl:value-of select="Desc"/><br/>
            </xsl:for-each>
        </td>
      </tr>
    </table>  
    <br/>
    <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
      <thead>
      <tr>
        <td width="30%" align="center" rowspan="2"><b>���������� �������������</b></td>
        <td width="5%" align="center" rowspan="2"><b>���</b></td>
        <td width="10%" align="center" rowspan="2"><b>����� ����������� ���������</b></td>
        <td width="20%" align="center" colspan="2"><b>� ��� �����</b></td>
        <td width="10%" align="center" rowspan="2"><b>��������� ��������</b></td>
        <td width="15%" align="center" rowspan="2"><b>�������� ������-������� ���-���</b></td>
      </tr>
      <tr>
        <td width="10%" align="center"><b>����<br/>(0-14)</b></td>
        <td width="10%" align="center"><b>���������<br/>(15-17)</b></td>
      </tr>
      </thead>
      <xsl:for-each select="OGr">	
        <tr>
          <td align="left"><xsl:value-of select="Name"/></td>
          <td align="center"><b><xsl:value-of select="Code"/></b></td>
          <td align="right"><xsl:value-of select="KolMRN"/></td>
          <td align="right"><xsl:value-of select="KolMRN-2"/></td>
          <td align="right"><xsl:value-of select="KolMRN-3"/></td>
          <td align="right"><xsl:value-of select="KolTS"/></td>
          <td align="right"><xsl:value-of select="KolTS-H"/></td>
        </tr>  
        <xsl:if test='$FlagTypeLoc = 1'>
           <xsl:for-each select="OTypeLoc">	
             <tr>
                <td align="right"><i> - <xsl:value-of select="Name"/></i></td>
                <td align="right"></td>
                <td align="right"><xsl:value-of select="KolMRN"/></td>
                <td align="right"><xsl:value-of select="KolMRN-2"/></td>
                <td align="right"><xsl:value-of select="KolMRN-3"/></td>
                <td align="right"><xsl:value-of select="KolTS"/></td>
                <td align="right"><xsl:value-of select="KolTS-H"/></td>
             </tr>  
           </xsl:for-each>
        </xsl:if>
      </xsl:for-each>
      <tr>
          <td><b>�����</b></td>
          <td></td>
          <td align="right"><b><xsl:value-of select="Itog-KolMRN"/></b></td>
          <td align="right"><b><xsl:value-of select="Itog-KolMRN-2"/></b></td>
          <td align="right"><b><xsl:value-of select="Itog-KolMRN-3"/></b></td>
          <td align="right"><b><xsl:value-of select="Itog-KolTS"/></b></td>
          <td align="right"><b><xsl:value-of select="Itog-KolTS-H"/></b></td>
      </tr>
    </table>
   <!-- ������ -->
   <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
  
</xsl:if>

<!-- ................... "�������������� ����� � 4 (����������� ��� ������)"..................-->
<xsl:if test='$FlagStatForma = 1'>    
 <TABLE class="XCur10" BORDER="1" CELLPADDING="" CELLSPACING="0" WIDTH="100%" bordercolor="Black">
    <TR>
        <td align="center"><b>����������� ��������������� �������������� ����������</b></td>
    </TR>
  </TABLE>
  <br/>
  <TABLE class="XCur10" BORDER="1" CELLPADDING="" CELLSPACING="0" WIDTH="100%" bordercolor="Black">
    <TR>
      <td align="center">������������������ ������������� ����������� ����������</td>
    </TR>
  </TABLE>
  <br/>
  
  <TABLE class="XCur10" BORDER="1" CELLPADDING="" CELLSPACING="0" 
         style='margin-left:2px; margin-rigth:2px; border-collapse:collapse;mso-table-layout-alt:fixed; border:none;mso-border-alt:solid windowtext 1.5pt;mso-padding-alt:0cm 5.35pt 0cm 5.35pt'>
    <TR style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>
      <td width="623" valign="top" align="center" style='text-align:center; width:467.45pt; border:solid windowtext 1.5pt; background:#F2F2F2;mso-shading:windowtext;mso-pattern:gray-5 auto;padding:0cm 5.35pt 0cm 5.35pt'>
          ��������������� ��� ��������� ������ ������������� ����������, � ����� �� ��������� ������<br/>
          ���������������, ������������� ������� ���������� ��������� ��� ��������������� �� ���������<br/>
          ������� ������������� ��������������� �������������� ���������� �� 13.05.92 �. � 2761-1
      </td>  
    </TR>
  </TABLE>
  
  <br/><br/><br/>
  <TABLE class="XCur10" BORDER="0" CELLPADDING="" CELLSPACING="0" 
         style='margin-left:2px; border-collapse:collapse;mso-table-layout-alt:fixed; mso-padding-alt:0cm 3.55pt 0cm 3.55pt'>
    <TR tyle='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>
      <td width="179" valign="top" style='width:134.55pt;padding:0cm 3.55pt 0cm 3.55pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'></td>
      <td width="623" valign="top" align="center" style='text-align:center;width:467.45pt;border:solid windowtext 1.5pt; background:#F2F2F2;mso-shading:windowtext;mso-pattern:gray-5 auto;padding:0cm 3.55pt 0cm 3.55pt'>
          �������� � ����������� ������������ ����� �� <b><xsl:value-of select="GroupTS"/><br/>� <xsl:value-of select="Date1"/> �� <xsl:value-of select="Date2"/></b><br/>
      </td> 
      <td width="152" valign="top" style='width:113.7pt;padding:0cm 3.55pt 0cm 3.55pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'></td>
    </TR>
  </TABLE>
   
  <br/><br/>
  <TABLE class="XCur10" BORDER="1" CELLPADDING="" CELLSPACING="0" width="100%" bordercolor="Black"
         style="border-collapse: collapse; padding-left: 2px; padding-right: 2px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
         padding:0cm 7.4pt 0cm 7.4pt'">
    <TR>
      <td width="9.75 ��" align="center">������������:</td>
      <td width="3.5" align="center">����� �������������</td>
      <td width="0.29" align="center"></td>
      <td width="3.96" align="center" style='border:solid windowtext 1.5pt;'><b>����� � 4</b></td>     
    </TR>
    <TR>    
      <td>���������� ���������������, ������� �����������, ���������� ������������ �� ��� - �������� �����:<br/>
        - ������ �� ������������ � ������ �� ������ ����������, ����, �������, ���������� �������, ����������� ������, �.�.������, �����-����������<br/>
      ������ �� ������������ � ������ �� ������ ����������, ����, �������, ���������� �������, ����������� ������, �.�.������, �����-����������<br/>
       �������� � ������� �����<br/>    
        - ����������� ������-������������� ������ �� ������������ � ������ �� ������<br/>
       �������<br/>
        - ������ ���������� ���������������� ����������, ����, �������, ���������� �������, ����������� ������, �.�.������, �����-����������<br/>
      ���������� ������-������������ ����� �� ������������ � ������ �� ������ - ������� ����� � ����� �� ������ � � ������� ��������� ���������� ���������<br/>    
        - ��������� ������<br/>
      �������� ������ ������� ����� � ����� �� ������ � � ������� ��������� ���������� ���������<br/>
        - ����������� ������<br/>
      </td>
      <td align="center">5 ������<br/><br/>� ������������� ��������� �����<br/><br/><br/>� ������������� ��������� �����<br/><br/><br/><br/><br/><br/>25 �����
      </td>
      <td align="center"></td>
      <td align="center">����������<br/>��������������<br/>����������� ������<br/>��  05.05.1999 � 30<br/><br/><br/><b>��������, �������</b>
      </td>     
    </TR>
  </TABLE>
  <br/>
  <TABLE class="XCur10" BORDER="1" CELLPADDING="" CELLSPACING="0" WIDTH="100%" bordercolor="Black">
    <TR>
      <td align="left" COLSPAN="9"><b>������������ �������������� �����������:  </b> <i><xsl:value-of select="�����������������������"/></i><br/>
      </td>
    </TR>
    <TR>
      <td align="left" COLSPAN="9"><b>�������� �����:  </b> <i><xsl:value-of select="����������������"/></i><br/>
      </td>
    </TR>
    <TR>  
      <td width="11%" align="center" rowspan="2">��� �����<br/>�� ����</td>  
      <td width="89%" align="center" colspan="8">��� (����������� �������������� �����������)</td>     
    </TR>
    <TR align="center">
      <td width="11%">�������������� ����������� �� ����</td>
      <td width="11%">���� ������������ �� ����</td>
      <td width="11%">������� �� �����</td>
      <td width="11%">���������� �� �����</td>
      <td width="13%">������������ (���������), ������ ���������� �� �����</td>
      <td width="11%">��������������-�������� ����� �� �����</td>
      <td width="11%">����� ������������� �� ����</td>
      <td width="11%"></td>
    </TR>
    <TR align="center">
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
      <td>8</td>
      <td>9</td>
    </TR>
    <TR align="center">
      <td>0609374</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </TR>
  </TABLE>
  <br/>
  <!-- ������ �������� �������������� -->
  <p style='font-size:1pt;'><o:p/></p><span><br clear='all' style='page-break-before:always'/></span>

    <table class="Cur10" border="0" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px">
      <tr>
          <td class="Cur9" width="10%" align="left" style='border-bottom:0; border-right:0; border-left:0; border-top:0;'><b>(1000)</b></td>
          <td class="Cur9" align="right" style='border-bottom:0; border-right:0; border-left:0; border-top:0;'><b>��� �� ����: �������-792</b></td>
      </tr>
    </table>
    <br/>
    <table class="Cur10" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
      <thead>
      <tr>
        <td width="30%" align="center" rowspan="2"><b>���������� �������������</b></td>
        <td width="5%" align="center" rowspan="2"><b>�<br/>����-<br/>��</b></td>
        <td width="5%" align="center" rowspan="2"><b>���<br/>������������<br/>�������������</b></td>
        <td width="10%" align="center" rowspan="2"><b>����� �����������</b></td>
        <td width="20%" align="center" colspan="2"><b>� ��� �����</b></td>
        <td width="10%" align="center" rowspan="2"><b>����������� ��������<br/>(�� ��.4)</b></td>
        <td width="10%" align="center" rowspan="2"><b>��������� �������� �������������<br/>(�� ��.4)</b></td>
        <td width="15%" align="center" colspan="2"><b>�������� ������������� ����������� � �������������<br/>(�� ��.4)</b></td>
      </tr>
      <tr>
        <td width="10%" align="center"><b>����<br/>(0-14)</b></td>
        <td width="10%" align="center"><b>���������<br/>(15-17)</b></td>
        <td align="center"><b>� ���</b></td>
        <td align="center"><b>� ��</b></td>        
      </tr>
      <tr>
        <td align="center"><b>1</b></td>
        <td align="center"><b>2</b></td>
        <td align="center"><b>3</b></td>
        <td align="center"><b>4</b></td>
        <td align="center"><b>5</b></td>
        <td align="center"><b>6</b></td>
        <td align="center"><b>7</b></td>
        <td align="center"><b>8</b></td>
        <td align="center"><b>9</b></td>
        <td align="center"><b>10</b></td>
      </tr>
      </thead>
      <xsl:for-each select="OGr">	
        <tr>
          <td align="left">
            <xsl:if test="NameZ != ''"><b><xsl:value-of select="NameZ"/></b><xsl:if test="Name != ''"><br/></xsl:if></xsl:if>  
            <xsl:value-of select="Name"/>  
            <xsl:if test="Name2 != ''"><br/><xsl:value-of select="Name2"/></xsl:if> 
          </td>
          <td align="center"><xsl:value-of select="Num"/></td>
          <td align="center"><b><xsl:value-of select="Code"/></b></td>
          <td align="right"><xsl:value-of select="KolMRN"/></td>
          <td align="right"><xsl:value-of select="KolMRN-2"/></td>
          <td align="right"><xsl:value-of select="KolMRN-3"/></td>
          <td></td>
          <td align="right"><xsl:value-of select="KolTS"/></td>
          <td align="right"><xsl:value-of select="KolTS-H"/></td>
          <td></td>
        </tr>  
        <xsl:if test='$FlagTypeLoc = 1'>
           <xsl:for-each select="OTypeLoc">	
             <tr>
                <td align="right"><i> - <xsl:value-of select="Name"/></i></td>
                <td></td>
                <td></td>
                <td align="right"><xsl:value-of select="KolMRN"/></td>
                <td align="right"><xsl:value-of select="KolMRN-2"/></td>
                <td align="right"><xsl:value-of select="KolMRN-3"/></td>
                <td></td>
                <td align="right"><xsl:value-of select="KolTS"/></td>
                <td align="right"><xsl:value-of select="KolTS-H"/></td>
                <td></td>
             </tr>  
           </xsl:for-each>
        </xsl:if>
      </xsl:for-each>
      <tr>
          <td align="left"><b>����� (����� ����� 01+14)</b></td>
          <td align="center">15</td>
          <td></td>
          <td align="right"><b><xsl:value-of select="Itog-KolMRN"/></b></td>
          <td align="right"><b><xsl:value-of select="Itog-KolMRN-2"/></b></td>
          <td align="right"><b><xsl:value-of select="Itog-KolMRN-3"/></b></td>
          <td></td>
          <td align="right"><b><xsl:value-of select="Itog-KolTS"/></b></td>
          <td align="right"><b><xsl:value-of select="Itog-KolTS-H"/></b></td>
          <td></td>
      </tr>
    </table>
    <br/>  
   <table class="Cur7" border="0" cellpadding="0" cellspacing="0" width="100%" align="center" style='border-bottom:0; border-right:0; border-left:0; border-top:0;'>
      <tr align="center">
        <td width="30%" align="left" style='font-size:10.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'>������������ �����������</td>
        <td width="20%" style='font-size:7.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'> _____________________________________<br/>(�.�.�.)</td>
        <td width="20%" style='font-size:7.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'> _____________________________________<br/>(�������)</td>
        <td width="30%" style='font-size:7.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'></td>
      </tr>
      <tr align="center">
        <td align="left" style='font-size:10.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'>����������� ����, <br/>������������� �� ����������� �����</td>
        <td style='font-size:7.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'> _____________________________________<br/>(���������)</td>
        <td style='font-size:7.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'> _____________________________________<br/>(�.�.�.)</td>
        <td style='font-size:7.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'> _____________________________________<br/>(�������)</td>
      </tr>
      <tr align="center">
        <td style='font-size:7.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'></td>
        <td style='font-size:7.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'> _____________________________________</td>
        <td style='font-size:7.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'> <xsl:value-of select="DatePrint"/></td>
        <td style='font-size:7.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'></td>
      </tr>
      <tr align="center">
        <td style='font-size:7.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'></td>
        <td style='font-size:7.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'>(����� ����������� ��������)</td>
        <td style='font-size:7.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'>(���� ����������� ���������)</td>
        <td style='font-size:7.0pt; border-bottom:0; border-right:0; border-left:0; border-top:0;'></td>
      </tr>
    </table>  
    <br/>
</xsl:if>
 <!-- ....................................................... -->         
 <!-- ����� ������ -->
 <xsl:if test='$FlagError = 1'>
    <br/>
    <p class="Cur10"><b>������ ������:</b></p>
    <table class="Cur10" border="1" sellspacing="0" width="60%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px">
      <tr>
        <td width="5%" align="center"><b>N �/�</b></td>
        <td width="10%" align="center"><b>����� ��</b></td>
        <td width="10%" align="center"><b>���.�����</b></td>
        <td width="25%" align="center"><b>��� ��������</b></td>
        <td width="10%" align="center"><b>��� �����������</b></td>
      </tr>
      <xsl:for-each select="OError">	
        <tr>
          <td align="center"><xsl:value-of select="NN"/></td>
          <td align="center"><xsl:value-of select="mrn"/></td>
          <td align="center"><xsl:value-of select="epis"/></td>
          <td align="left"><xsl:value-of select="fio"/></td>
          <td align="center"><xsl:value-of select="CodePat"/></td>
        </tr>
      </xsl:for-each>
    </table>
 </xsl:if>       
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
