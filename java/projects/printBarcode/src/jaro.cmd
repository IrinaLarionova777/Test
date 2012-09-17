@echo off

set JAVA_HOME=C:\Apl\Java\jdk\1.6\32\
set JAR=%JAVA_HOME%\bin\jar.exe

echo on

"%JAR%" -cvf testWriteFile.jar testWriteFile.class testWriteFile$1.class testWriteFile$2.class

rem C:\Apl\Java\jdk\1.6\32\bin\keytool -genkey -keyalg rsa -alias mysert

C:\Apl\Java\jdk\1.6\32\bin\jarsigner testWriteFile.jar mycert

C:\Apl\Java\jdk\1.6\32\bin\jarsigner -verify -verbose -certs testWriteFile.jar