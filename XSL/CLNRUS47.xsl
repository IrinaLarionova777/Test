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
 <!-- ���� 1/0 "����������� �� ������� ������" -->
 <xsl:variable name="FlagTS"><xsl:value-of select="FlagTS"/></xsl:variable>
  <!-- ���� 1/0 "����������� �� �������������" -->
 <xsl:variable name="FlagUser"><xsl:value-of select="FlagUser"/></xsl:variable> 
 <!-- ���� 1/0 "����������� �� ������������" -->
 <xsl:variable name="FlagPayment"><xsl:value-of select="FlagPayment"/></xsl:variable> 
 <!-- ���� 1/0 "����������� �� ���������" -->
 <xsl:variable name="FlagEpisode"><xsl:value-of select="FlagEpisode"/></xsl:variable> 
 <!-- "��� ������������ ������" 1-�� ���� ����������"; 2-�� ���� ���������� -->
 <xsl:variable name="FlagReport"><xsl:value-of select="FlagReport"/></xsl:variable> 
 <!-- ���� 1/0 "������� �������������� ��������" -->
 <xsl:variable name="FlagLocPat"><xsl:value-of select="FlagLocPat"/></xsl:variable> 
 <!-- ���� 1/0 "������� ����������/����� ��������" -->
 <xsl:variable name="FlagPayPat"><xsl:value-of select="FlagPayPat"/></xsl:variable> 
 <!-- ���� 1/0 "������� � �� ��������" -->
 <xsl:variable name="FlagMRNPat"><xsl:value-of select="FlagMRNPat"/></xsl:variable> 
 <!-- ���� 1/0 "������� ������� ��������� ��������" -->
 <xsl:variable name="FlagCategPat"><xsl:value-of select="FlagCategPat"/></xsl:variable> 
  <title>������������ ����������� (�� ������������)</title>
  <xsl:value-of select="$pass" disable-output-escaping="yes"/>
  <style type="text/css">
     body {font-family: Times New Roman ;}
     .Cur9  { 	font-size : 9pt; }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt;  }
     .Cur12  { 	font-size : 12pt;  }
     .Cur14  { 	font-size : 14pt;  }
     .Cur16 { font-size : 16pt; }
     .CurGroup { font-size : 12pt; }
     .xl43	{   mso-style-parent:style0;
	          font-family:"Times New Roman", serif;
	          mso-font-charset:204;
	          mso-number-format:"\@";
	          text-align:center;
	          border:.5pt solid black;
	          white-space:normal;}
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
    <p class="Cur14" align="center"><b>����� � ���������� <xsl:value-of select="TypeReport"/> ������������ �� ������������</b>
       <br/>�� ������ c <xsl:value-of select="Date1"/> �� <xsl:value-of select="Date2"/>
    </p>
    <p class="Cur12" align="center">����������: <xsl:value-of select="Payment"/> / �����: <xsl:value-of select="Department"/></p>
  <br/>
 <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
  <thead>
  <tr>
    <td width="5%" align="center"><b>� �/�</b></td>
    <td width="20%" align="center"><b>�����</b></td>
    <xsl:if test='$FlagTS = 1'>
      <td width="50%" align="center"><b>����� ������</b></td>
    </xsl:if>
    <xsl:if test='$FlagReport = 1'>
      <td width="10%" align="center"><b>���-��</b></td>
    </xsl:if>
    <xsl:if test='$FlagReport = 2'>
      <td width="10%" align="center"><b>���-�� ���������</b></td>
      <td width="10%" align="center"><b>���-�� ���������</b></td>
    </xsl:if>
  </tr>
  </thead>
  <xsl:for-each select="OGr">	
     <xsl:if test='$FlagTS = 0'>
        <tr>
          <td class="CurGroup" align="left"><xsl:value-of select="NGr"/></td>
          <td class="CurGroup" align="left"><xsl:value-of select="Name"/></td>
          <td class="CurGroup" align="right"><xsl:value-of select="Count"/></td>   
          <xsl:if test='$FlagReport = 2'><td class="CurGroup" align="right"><xsl:value-of select="Count-Exec"/></td></xsl:if>              
        </tr>
      </xsl:if>
      <xsl:if test='$FlagTS = 1'>
        <tr style='background:#D9D9D9'>
          <td class="CurGroup" align="left"><b><xsl:value-of select="NGr"/></b></td>
          <td class="CurGroup" colspan="2" align="left"><b><xsl:value-of select="Name"/></b></td>
          <td class="CurGroup" align="right"><b><xsl:value-of select="Count"/></b></td>     
          <xsl:if test='$FlagReport = 2'><td class="CurGroup" align="right"><xsl:value-of select="Count-Exec"/></td></xsl:if>            
        </tr>
     </xsl:if>   
     <xsl:if test='$FlagTS = 1'>
      <!-- ����������� �� ������� ������ -->
      <xsl:for-each select="OGrTS">	
         <tr class="Cur10">
           <td></td>
           <td></td>
           <td><xsl:value-of select="Name"/> </td>
           <td align="right"><xsl:value-of select="Count"/></td>
           <xsl:if test='$FlagReport = 2'><td align="right"><xsl:value-of select="Count-Exec"/></td></xsl:if>              
         </tr>
      </xsl:for-each>   <!-- ��� ������� ������ -->
     </xsl:if>
  </xsl:for-each>  <!-- ��� ������� -->
  <!--����� ���� -->
  <tr style='background:#D9D9D9' class="CurGroup">
      <xsl:if test='$FlagTS = 0'><td colspan="2"><b>����� ���-�� <xsl:value-of select="TypeReport"/> ������������</b></td></xsl:if>
      <xsl:if test='$FlagTS = 1'><td colspan="3"><b>����� ���-�� <xsl:value-of select="TypeReport"/> ������������</b></td></xsl:if>
      <td align="right"><b><xsl:value-of select="ItogoTS"/></b></td>
      <xsl:if test='$FlagReport = 2'><td align="right"><xsl:value-of select="ItogoTS-Exec"/></td></xsl:if>      
  </tr>
 </table>
 
 <!-- *****************    "����������� �� ������������"     ************************ -->  
<xsl:if test='$FlagPayment = 1'>
 <br/><br/>
 <p class="Cur12" align="left"><b>����������� �� ������������:</b></p>
 <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
    <thead>
    <tr>
        <td width="5%" align="center"><b>� �/�</b></td>
        <td width="35%" align="center"><b>����������</b></td>
        <td width="10%" align="center"><b>�����</b></td>
        <xsl:if test='$FlagTS = 1'>
            <td width="40%" align="center"><b>����� ������</b></td>
        </xsl:if>
        <xsl:if test='$FlagReport = 1'>
            <td width="10%" align="center"><b>���-��</b></td>
        </xsl:if>
        <xsl:if test='$FlagReport = 2'>
            <td width="10%" align="center"><b>���-�� ���������</b></td>
            <td width="10%" align="center"><b>���-�� ���������</b></td>
        </xsl:if>        
    </tr>
    </thead>
    <xsl:for-each select="OGrPayment">	
      <xsl:if test='$FlagTS = 0'>
        <tr>
          <td class="CurGroup" align="left"><xsl:value-of select="NGr"/></td>
          <td class="CurGroup" colspan="2" align="left"><xsl:value-of select="Name"/></td>
          <td class="CurGroup" align="right"><xsl:value-of select="Count"/></td>
          <xsl:if test='$FlagReport = 2'><td class="CurGroup" align="right"><xsl:value-of select="Count-Exec"/></td></xsl:if>              
        </tr>
      </xsl:if>
      <xsl:if test='$FlagTS = 1'>
        <tr style='background:#D9D9D9'>
          <td class="CurGroup" align="left"><b><xsl:value-of select="NGr"/></b></td>
          <td class="CurGroup" colspan="3" align="left"><b><xsl:value-of select="Name"/></b></td>
          <td class="CurGroup" align="right"><b><xsl:value-of select="Count"/></b></td>  
          <xsl:if test='$FlagReport = 2'><td class="CurGroup" align="right"><xsl:value-of select="Count-Exec"/></td></xsl:if>            
        </tr>
      </xsl:if>   
      <!-- �������� �� ������� -->		
      <xsl:for-each select="OGrDep">	
        <tr>
          <td></td>
          <td></td>
          <xsl:if test='$FlagTS = 0'>
            <td align="left"><xsl:value-of select="NameDep"/></td>
            <td align="right"><xsl:value-of select="Count"/></td>
          </xsl:if>
          <xsl:if test='$FlagTS = 1'>
            <td align="left" colspan="2"><b><xsl:value-of select="NameDep"/></b></td>
            <td align="right"><b><xsl:value-of select="Count"/></b></td>
            <xsl:if test='$FlagReport = 2'><td align="right"><xsl:value-of select="Count-Exec"/></td></xsl:if>       
          </xsl:if> 
        </tr>
        <!-- ����������� �� ������� ������ -->
        <xsl:if test='$FlagTS = 1'>
          <xsl:for-each select="OGrTS">	
             <tr class="Cur10">
                <td></td>
                <td></td>
                <td></td>
                <td><xsl:value-of select="Name"/> </td>
                <td align="right"><xsl:value-of select="Count"/></td>
                <xsl:if test='$FlagReport = 2'><td align="right"><xsl:value-of select="Count-Exec"/></td></xsl:if>       
             </tr>
          </xsl:for-each>   <!-- ��� ������� ������ -->
        </xsl:if>
      </xsl:for-each>   <!-- ��� ������� -->
    </xsl:for-each>  <!-- ��� ������������ -->
    <!--����� ���� -->
    <tr style='background:#D9D9D9' class="CurGroup">
      <xsl:if test='$FlagTS = 0'><td colspan="3"><b>����� ���-�� <xsl:value-of select="TypeReport"/> ������������</b></td></xsl:if>
      <xsl:if test='$FlagTS = 1'><td colspan="4"><b>����� ���-�� <xsl:value-of select="TypeReport"/> ������������</b></td></xsl:if>
      <td align="right"><b><xsl:value-of select="ItogoTS"/></b></td>
      <xsl:if test='$FlagReport = 2'><td align="right"><xsl:value-of select="ItogoTS-Exec"/></td></xsl:if>       
    </tr>
 </table>
</xsl:if>

 <!-- *****************    "����������� �� ���������"     ************************ -->  
<xsl:if test='$FlagEpisode = 1'>
 <br/><br/>
 <p class="Cur12" align="left"><b>����������� �� ���������:</b></p>
 <table class="Cur9" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px">  
    <thead>
    <tr>
        <td width="3%" align="center"><b>� �/�</b></td>
        <td width="5%" align="center"><b>���.<br/>�����</b></td>
        <td width="25%" align="center"><b>��� ��������</b></td>
        <xsl:if test='$FlagMRNPat = 1'><td width="5%" align="center"><b>� ��</b></td></xsl:if> 
        <td width="3%" align="center"><b>����<br/>������</b></td>
        <xsl:if test='$FlagPayPat = 1'>
            <td width="15%" align="center"><b>����������</b></td>
            <td width="5%" align="center"><b>�����</b></td>
        </xsl:if>    
        <xsl:if test='$FlagCategPat = 1'><td width="5%" align="center"><b>�����.</b></td></xsl:if>    
        <xsl:if test='$FlagLocPat = 1'><td width="10%" align="center"><b>����������.<br/>��������</b></td></xsl:if>    
        <td width="20%" align="center"><b>����� ������</b></td>
        <xsl:if test='$FlagReport = 1'><td width="5%" align="center"><b>���-��</b></td></xsl:if>
        <xsl:if test='$FlagReport = 2'>
            <td width="5%" align="center"><b>���-�� ����.</b></td>
            <td width="5%" align="center"><b>���-�� ������.</b></td>
        </xsl:if>          
    </tr>
    </thead>
    <xsl:for-each select="OGrEpis">	
        <tr>
          <td align="left"><xsl:value-of select="NGr"/></td>
          <td align="left" style="mso-number-format:'\@'"><b><xsl:value-of select="Epis"/></b></td>
          <td align="left"><xsl:value-of select="FIO"/></td>
          <xsl:if test='$FlagMRNPat = 1'><td class="x143" align="left"><xsl:value-of select="MRN"/></td></xsl:if>
          <td align="left"><xsl:value-of select="DateCol"/></td>
          <xsl:if test='$FlagPayPat = 1'>
              <td align="left"><xsl:value-of select="Payment"/></td>
              <td align="left"><xsl:value-of select="Polic"/></td>
          </xsl:if>
          <xsl:if test='$FlagCategPat = 1'><td align="left"><xsl:value-of select="Categ"/></td></xsl:if>
          <xsl:if test='$FlagLocPat = 1'><td align="left"><xsl:value-of select="LocPat"/></td></xsl:if>
          <td align="left"><xsl:value-of select="TS"/></td>
          <td align="right"><b><xsl:value-of select="Count"/></b></td> 
          <xsl:if test='$FlagReport = 2'><td align="right"><xsl:value-of select="Count-Exec"/></td></xsl:if>             
        </tr> 
    </xsl:for-each>  <!-- ��� ��������� -->
    <!--����� ���� -->
    <tr style='background:#D9D9D9' class="CurGroup">
      <td colspan="5"><b>����� ���-�� <xsl:value-of select="TypeReport"/> ������������</b></td>
      <xsl:if test='$FlagMRNPat = 1'><td></td></xsl:if>
      <xsl:if test='$FlagPayPat = 1'><td></td></xsl:if>
      <xsl:if test='$FlagCategPat = 1'><td></td></xsl:if>
      <xsl:if test='$FlagLocPat = 1'><td></td></xsl:if>
      <td align="right"><b><xsl:value-of select="ItogoTS"/></b></td>
      <xsl:if test='$FlagReport = 2'><td align="right"><xsl:value-of select="ItogoTS-Exec"/></td></xsl:if>      
    </tr>
 </table>
</xsl:if>

 <!-- *****************    "����������� �� �������������"     ************************ -->  
<xsl:if test='$FlagUser = 1'>
 <br/><br/>
 <p class="Cur12" align="left"><b>����������� �� �������������:</b></p>
 <table class="Cur11" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px
        border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 7.4pt 0cm 7.4pt'">  
    <thead>
    <tr>
        <td width="5%" align="center"><b>� �/�</b></td>
        <td width="30%" align="center"><b>������������</b></td>
        <xsl:if test='$FlagTS = 0'>
            <td width="55%" align="center"><b>����������</b></td>
        </xsl:if>
        <xsl:if test='$FlagTS = 1'>
            <td width="10%" align="center"><b>����������</b></td>
            <td width="40%" align="center"><b>����� ������</b></td>
        </xsl:if>
        <td width="10%" align="center"><b>���-��</b></td>
    </tr>
    </thead>
    <xsl:for-each select="OGrUser">	
        <tr style='background:#D9D9D9'>
          <td class="CurGroup" align="left"><xsl:value-of select="NGr"/></td>
          <xsl:if test='$FlagTS = 0'><td class="CurGroup" align="left" colspan="2"><b><xsl:value-of select="Name"/></b></td></xsl:if>
          <xsl:if test='$FlagTS = 1'><td class="CurGroup" align="left" colspan="3"><b><xsl:value-of select="Name"/></b></td></xsl:if>
          <td class="CurGroup" align="right"><b><xsl:value-of select="Count"/></b></td>       
        </tr>
        <!-- ����������� �� ������������ -->
        <xsl:for-each select="OGrPay">	
           <tr>
              <td></td>
              <td></td>
              <xsl:if test='$FlagTS = 0'><td><xsl:value-of select="Name"/></td></xsl:if>
              <xsl:if test='$FlagTS = 1'><td colspan="2"><b><xsl:value-of select="Name"/></b></td></xsl:if>
              <td align="right"><b><xsl:value-of select="Count"/></b></td>
           </tr>
           <!-- ����������� �� ������� ������ -->
           <xsl:if test='$FlagTS = 1'>
              <xsl:for-each select="OGrTS">	
                  <tr class="Cur10">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><xsl:value-of select="Name"/> </td>
                    <td align="right"><xsl:value-of select="Count"/></td>
                  </tr>
              </xsl:for-each>   <!-- ��� ������� ������ -->
           </xsl:if>
        </xsl:for-each>   <!-- ��� ������������ -->
    </xsl:for-each>  <!-- ��� ������������� -->
    <!--����� ���� -->
    <tr style='background:#D9D9D9' class="CurGroup">
      <xsl:if test='$FlagTS = 0'><td colspan="3"><b>����� ���-�� <xsl:value-of select="TypeReport"/> ������������</b></td></xsl:if>
      <xsl:if test='$FlagTS = 1'><td colspan="4"><b>����� ���-�� <xsl:value-of select="TypeReport"/> ������������</b></td></xsl:if>
      <td align="right"><b><xsl:value-of select="ItogoTS"/></b></td>
    </tr>
 </table>
</xsl:if>
 <!-- ������ -->
 <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
