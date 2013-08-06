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
   
 <!-- ДОПОЛНИТЕЛЬНАЯ настройка для вывода полей таблицы (cdtltybz j gfwbtynt) -->
 <xsl:variable name="FlagSexAgePat"><xsl:value-of select="FlagSexAgePat"/></xsl:variable>
 <xsl:variable name="FlagMRNPat"><xsl:value-of select="FlagMRNPat"/></xsl:variable>
 <xsl:variable name="FlagCategPat"><xsl:value-of select="FlagCategPat"/></xsl:variable>
 <xsl:variable name="FlagLocPat"><xsl:value-of select="FlagLocPat"/></xsl:variable> 
 <xsl:variable name="FlagPayPat"><xsl:value-of select="FlagPayPat"/></xsl:variable> 
 <xsl:variable name="FlagColDT"><xsl:value-of select="FlagColDT"/></xsl:variable>
 <xsl:variable name="FlagAddress"><xsl:value-of select="FlagAddress"/></xsl:variable> 
 <!-- доп.настройка для вывода результатов -->
 <xsl:variable name="FlagUnits"><xsl:value-of select="FlagUnits"/></xsl:variable>
 <xsl:variable name="FlagRange"><xsl:value-of select="FlagRange"/></xsl:variable>
 <xsl:variable name="FlagComment"><xsl:value-of select="FlagComment"/></xsl:variable>
 <xsl:variable name="FlagStatTS"><xsl:value-of select="FlagStatTS"/></xsl:variable>
 <xsl:variable name="FlagNewStrTS"><xsl:value-of select="FlagNewStrTS"/></xsl:variable>
 <xsl:variable name="FlagNewStrTC"><xsl:value-of select="FlagNewStrTC"/></xsl:variable>  
 <xsl:variable name="FlagDepHead"><xsl:value-of select="FlagDepHead"/></xsl:variable>
 <xsl:variable name="FlagTSHead"><xsl:value-of select="FlagTSHead"/></xsl:variable>
   
  <title>Журнал выполненных исследований</title>
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
    <p class="Cur14" align="center"><b>Журнал выполненных исследований c <xsl:value-of select="Date1"/> по <xsl:value-of select="Date2"/></b>
    </p>
    <p class="Cur12" align="center">Плательщик: <xsl:value-of select="Payment"/> / Отдел: <xsl:value-of select="Department"/></p>
  <br/>
  <table class="Cur9" border="1" sellspacing="0" width="100%" bordercolor="#000000" style="border-collapse: collapse; padding-left: 2px; padding-right: 2px">  
    <tr>
        <td width="3%" align="center">№ п/п</td>
        <td width="25%" align="center">ФИО пациента</td>
        <xsl:if test='$FlagAddress = 1'><td width="10%" align="center">Адрес</td></xsl:if>    
        <td width="5%" align="center">Лаб.<br/>№</td>
        <td width="65%" align="center">Результаты исследований</td>
    </tr>
    <xsl:for-each select="OEpis">	
        <tr>
          <td align="left" valign="top"><xsl:value-of select="NGr"/></td>
          <td align="left" class="Cur10" valign="top">
             <b><xsl:value-of select="FIO"/></b>
             <xsl:if test='$FlagSexAgePat = 1'> <br/>Пол/Возр.: <xsl:value-of select="Sex"/> / <xsl:value-of select="Age"/></xsl:if> 
             <xsl:if test='$FlagMRNPat = 1'><xsl:if test='MRN != ""'><br/>МК № <xsl:value-of select="MRN"/></xsl:if></xsl:if>  
             <xsl:if test='$FlagCategPat = 1'><xsl:if test='Categ != ""'><br/>Кат.:<xsl:value-of select="Categ"/></xsl:if></xsl:if>    
             <xsl:if test='$FlagLocPat = 1'><xsl:if test='LocPat != ""'><br/>Отд: <xsl:value-of select="LocPat"/></xsl:if></xsl:if>    
             <xsl:if test='$FlagPayPat = 1'><xsl:if test='Payment != ""'><br/>Плат.: <xsl:value-of select="Payment"/></xsl:if></xsl:if>
          </td>
          <xsl:if test='$FlagAddress = 1'>
              <td align="left" valign="top">
                  <xsl:if test='Address2 != ""'><xsl:value-of select="Address2"/><br/></xsl:if>
                  <xsl:value-of select="Address"/>
              </td>
          </xsl:if>          
          <td align="center" style="mso-number-format:'\@'" valign="top"><b><xsl:value-of select="Epis"/></b></td>
          <!-- результаты исследований -->
          <td align="left">
              <xsl:if test='$FlagColDT = 1'>
                  Дата/время забора: <xsl:value-of select="DateCol"/> &#160;&#160; <xsl:value-of select="TimeCol"/><br/><br/>
              </xsl:if>
              <!-- отдел -->
              <xsl:for-each select="ODep">
                 <xsl:if test='$FlagDepHead = 1'>
                      <xsl:if test='Desc != ""'><b><i>&#160;&#160;&#160;&#160;<xsl:value-of select="Desc"/></i></b><br/></xsl:if>
                 </xsl:if>
                 <!--  набор тестов -->
                 <xsl:for-each select="OTS">
                   <xsl:if test='$FlagTSHead = 1'>
                          <xsl:if test='Desc != ""'>
                              &#160;&#160;<b><xsl:value-of select="Desc"/></b>
                              <xsl:if test='$FlagNewStrTS = 0'>: &#160;&#160;</xsl:if> 
                              <xsl:if test='$FlagNewStrTS = 1'><br/></xsl:if>     
                          </xsl:if>
                   </xsl:if>     
                   <!-- тест -->
                   <xsl:for-each select="OTEST">
                       <xsl:value-of select="N0"/>:&#160;&#160;<xsl:value-of select="N1"/>
                       <xsl:if test='$FlagUnits = 1'><xsl:if test='N2 != ""'>&#160;&#160;<xsl:value-of select="N2"/></xsl:if></xsl:if> 
                       <xsl:if test='$FlagRange = 1'><xsl:if test='N3 != ""'>&#160;&#160;(<xsl:value-of select="N3"/>)</xsl:if></xsl:if> 
                       <xsl:if test='$FlagComment = 1'> 
                          &#160;&#160;<xsl:for-each select="OComment"><xsl:value-of select="Desc"/>&#160;</xsl:for-each>
                       </xsl:if>
                       <xsl:if test='$FlagNewStrTC = 0'>; &#160;</xsl:if>   
                       <xsl:if test='$FlagNewStrTC = 1'><br/></xsl:if>                            
                   </xsl:for-each>   <!-- для TEST -->     
                   <xsl:if test='$FlagNewStrTS = 1'><br/></xsl:if>
                 </xsl:for-each>  <!-- для TS-->   
                 <xsl:if test='$FlagDepHead = 1'><br/></xsl:if>     	
              </xsl:for-each> <!-- для Dep -->
              
              <!-- доп.сведений о наборах тестов, ктр. были выполнены ранее или еще не выполнены -->
              <xsl:if test='$FlagStatTS = 1'>
                  <br/>
                  <xsl:for-each select="OStatST">
                      <u><xsl:value-of select="Status"/></u>
                      <xsl:for-each select="OData">
                          <xsl:value-of select="data"/> &#160;
                          <xsl:for-each select="OTS"><xsl:value-of select="code"/>; &#160;</xsl:for-each>
                      </xsl:for-each>
                      <br/> 
                  </xsl:for-each>
              </xsl:if>  
          </td>
        </tr> 
    </xsl:for-each> 
  </table>
  <!--общий итог -->
  <p class="CurGroup">
      <br/><br/>
      <b>Итого за период с <xsl:value-of select="Date1"/> по <xsl:value-of select="Date2"/> обработано:
      <br/>&#160;&#160;&#160;&#160; пациентов = <xsl:value-of select="KolPat"/> ; образцов = <xsl:value-of select="KolEpis"/> ; наборов тестов = <xsl:value-of select="KolTS"/>
  </b></p>  
  <!-- подвал -->
  <br/><br/>
  <p class="Cur12"><xsl:value-of select="Footer"/><br/></p>
 </div>
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>
