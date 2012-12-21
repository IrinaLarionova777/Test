echo on

rem del %1\install.src

rem read path to cache
:loop1
set pathCache=""
set /P pathCache=Type path to Cache folder (format:c:\dir\...\dir): %=%
if %pathCache%=="" goto loop1
echo "Path to Cache folder: = %pathCache%"

rem read Cache name configuration 
:loop2
set nameconfig=""
set /P nameconfig=Type Cache name configuration (Control portal-right-up corner): %=%
if %nameconfig%=="" goto loop2
echo "Cache name configuration: = %nameconfig%" 

rem read namespace
:loop3
set ns=""
set /P ns=Type Namespace Cache: %=%
if %ns%=="" goto loop3
echo "Namespace: = %ns%" 

rem %pathCache%\bin\cterm /console=cn_ap:%nameconfig%[%ns%]:##class(JasperWrap.ReportStartJasper).install("%1","%ns%")
rem %pathCache%\bin\cterm /console=cn_ap:%nameconfig%[%ns%]:$$classmethod("JasperWrap.ReportStartJasper","install","%1","%ns%")
%pathCache%\bin\cterm /console=cn_ap:%nameconfig%[%ns%]:$system.OBJ.Load("%1\prginstall.xml","c")