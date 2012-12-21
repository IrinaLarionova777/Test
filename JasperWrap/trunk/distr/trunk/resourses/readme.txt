
 Установка программ для использования Jasperreports с Trak на сервере

1. Запустить программу инсталяции файлов C:\jasper\distr\TrakJasper.exe (Все нужные файлы скопируются в указанную вами при инталяции папку folder)
2. Запустить в Cache кубе Студия -> Инструменты -> Импортировать локально - сделать импорт файла C:\jasper\distr\prginstall.xml (все это в рабочей области, например "BION")  
3. Запустить в Cache кубе Терминал - перейти в рабочую область (например zn "BION"), запустить do ##class(Report.ReportStartJasper).install(folder,"BION")
4. Скопировать файл C:\jasper\distr\PRTCLNRUS.dll в папку, путь, где установлен Trak\ActiveX, затем запустить в этой папке TrakFiles.exe 

 Установка на клиенте

1. Зарегистрировать dll библиотеку PRTCLNRUS.dll : regsvr32 C:\WINDOWS\system32\PRTCLNRUS.dll