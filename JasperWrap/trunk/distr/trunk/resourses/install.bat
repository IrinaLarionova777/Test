echo on

* %1 - cacheDir
* %2 - workDirJasper
* %3 - configuration name
* %4 - namespace

%1\bin\ccontrol.exe console %3 Load^^%%apiOBJ(\"%2\prginstall.xml\",\"c\") %4

pause

%1\bin\ccontrol.exe console %3 start^^JasperWrap.install(\"%2\",\"%4\") %4

