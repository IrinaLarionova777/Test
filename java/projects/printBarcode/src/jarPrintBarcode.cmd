@echo off

set JAVA_HOME=C:\Apl\Java\jdk\1.6\64\
set JAR=%JAVA_HOME%\bin\jar.exe

echo on

"%JAR%" -cvf printBarcode.jar printBarcode0.class printBarcode0.java printBarcode.class printBarcode.java printBarcodeInit.class printBarcodeInit.java printBarcodeInit2.class printBarcodeInit2.java 

rem C:\Apl\Java\jdk\1.6\32\bin\keytool -genkey -keyalg rsa -alias mysert

C:\Apl\Java\jdk\1.6\32\bin\jarsigner printBarcode.jar mycert

C:\Apl\Java\jdk\1.6\32\bin\jarsigner -verify -verbose -certs printBarcode.jar