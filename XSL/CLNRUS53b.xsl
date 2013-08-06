<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="Windows-1251" omit-xml-declaration="no"/>
 <xsl:variable name="pass">
</xsl:variable>

	<xsl:template match="baseO/OUser">
 <html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w="urn:schemas-microsoft-com:office:word">
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=windows-1251"/>
   <meta name="ProgId" content="Word.Document"/>
   <meta name="Generator" content="Microsoft Word 10"/>
   <meta name="Originator" content="Microsoft Word 10"/>

   <xsl:variable name="DateStart"><xsl:value-of select="DateStart"/></xsl:variable>
   <xsl:variable name="TimeStart"><xsl:value-of select="TimeStart"/></xsl:variable>
   <xsl:variable name="DateStop"><xsl:value-of select="DateStop"/></xsl:variable>
   <xsl:variable name="TimeStop"><xsl:value-of select="TimeStop"/></xsl:variable>


  <title>����� �� ����������� �������� (�� �������������)</title>
  <style type="text/css">
     body {font-family: Times New Roman ;}
     .Cur9  { 	font-size : 9pt; }
     .Cur10  { 	font-size : 10pt; }
     .Cur11  { 	font-size : 11pt;  }
     .Cur12  { 	font-size : 12pt;  }
     .Cur14 { font-size : 14pt; }
     .Cur16 { font-size : 16pt; }
     p{margin:0;padding:0;}
     @page Section1{  mso-page-orientation:landscape;
                      size:210mm 297mm;
                      margin:10mm 10mm 10mm 10mm; }
     div.Section1{page:Section1;}
  </style> 
 </head>
 <body>
 <div class="Section1">
    <p class="Cur14" align="left">
	  <b>
		 ����� �� ����������� �������� (�� �������������) �� ������ � <xsl:value-of select="$DateStart"/> , <xsl:value-of select="$TimeStart"/> �� <xsl:value-of select="$DateStop"/> , <xsl:value-of select="$TimeStop"/>
	  </b>
    </p>
    <br/>
    <table class="Cur12" border="1" width="100%" sellspacing="0" bordercolor="#000000" 
           style="border-collapse: collapse; padding-left: 10px; padding-right: 10px; border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt; padding:0cm 5.4pt 0cm 5.4pt'">  

         <thead> <!-- ��������� ��������� ������� �� ������ ��������  -->
            <tr>
             <td width="15%" align="center"  VALIGN="TOP"><b>����</b></td>
             <td width="15%" align="center" VALIGN="TOP"><b>�����</b></td>
             <td width="20%" align="center" VALIGN="TOP"><b>������������</b></td>
             <td width="20%" align="center" VALIGN="TOP"><b>��� ������������</b></td>
             <td width="20%" align="center" VALIGN="TOP"><b>���������</b></td>
             <td width="20%" align="center" VALIGN="TOP"><b>���� � ����� �����</b></td>
            </tr>
         </thead>
          <xsl:for-each select="OData">
               <xsl:variable name="Odd"><xsl:value-of select="Odd"/></xsl:variable>	
       
               <xsl:if test='$Odd = "1"'>
                 <tr style='background:#D9D9D9'>
                  <td align="left" VALIGN="TOP"><xsl:value-of select="Date"/></td>
                  <td align="left" VALIGN="TOP"><xsl:value-of select="Time"/></td>
	          <td align="right" VALIGN="TOP"><xsl:value-of select="User"/></td>
                  <td align="right" VALIGN="TOP"><xsl:value-of select="UserName"/></td>
	          <td align="right" VALIGN="TOP"><xsl:value-of select="Comp"/></td>
	          <td align="right" VALIGN="TOP"><xsl:value-of select="DateTimeEnter"/></td>
	         </tr>
               </xsl:if>
               <xsl:if test='$Odd = "0"'>
                <tr>
                  <td align="left" VALIGN="TOP"><xsl:value-of select="Date"/></td>
                  <td align="left" VALIGN="TOP"><xsl:value-of select="Time"/></td>
	          <td align="right" VALIGN="TOP"><xsl:value-of select="User"/></td>
                  <td align="right" VALIGN="TOP"><xsl:value-of select="UserName"/></td>
	          <td align="right" VALIGN="TOP"><xsl:value-of select="Comp"/></td>
	          <td align="right" VALIGN="TOP"><xsl:value-of select="DateTimeEnter"/></td>
                </tr>
               </xsl:if>
          </xsl:for-each>
    </table>

 
   <!-- ������ -->
  <p class="Cur12"><br/><xsl:value-of select="Footer"/><br/></p>

 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
