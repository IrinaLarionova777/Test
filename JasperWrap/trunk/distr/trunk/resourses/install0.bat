echo off

rem C:\isc\ensembe\2010.2.5.902\bin\cterm /console=cn_ap:E201025B902:##class(JasperWrap.ReportStartJasper).install("c:\temp\test","DATA")

del %1\install.src

rem read path to cache
:loop1
set pathCache=""
set /P pathCache=Type path to Cache folder (format:c:\dir\...\dir): %=%
if %pathCache%=="" goto loop1
echo "Path to Cache folder: = %pathCache%"

rem read port superserver
set port=""
echo (Control portal-Configuration-Start and Memory)
set /P port=Type port number Cache superserver (1972): %=%
if %port%=="" set port=1972
echo "Number port: = %port%" 

rem read namespace
:loop3
set ns=""
set /P ns=Type Namespace Cache: %=%
if %ns%=="" goto loop3
echo "Namespace: = %ns%" 

rem create install.src
echo %1\install.src
echo connect/"127.0.0.1[%port%]" >> %1\install.src
echo send:zn "%ns%" >> %1\install.src
echo send:do ^$system.OBJ.Load("%1\prginstall.xml","c")^<cr^> >> %1\install.src
echo send:do ##class(JasperWrap.ReportStartJasper).install("%1","%ns%")^<cr^> >> %1\install.src
rem echo display: "Press ENTER for continue" >> %1\install.src
rem echo disconnect >> %1\install.src

%pathCache%\bin\cterm /console=cn_iptcp:127.0.0.1 install.src