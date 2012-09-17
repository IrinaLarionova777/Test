@echo off

set JAVA_HOME=C:\Apl\Java\jdk\1.6\32\
set JAR=%JAVA_HOME%\bin\jar.exe

echo on

"%JAR%" -cvf %1 -C %2 %3
