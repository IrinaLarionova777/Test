
 ��������� �������� ��� ������������� Jasperreports � Trak �� �������

1. ��������� ��������� ���������� ������ C:\jasper\distr\TrakJasper.exe (��� ������ ����� ����������� � ��������� ���� ��� ��������� ����� folder)
2. ��������� � Cache ���� ������ -> ����������� -> ������������� �������� - ������� ������ ����� C:\jasper\distr\prginstall.xml (��� ��� � ������� �������, �������� "BION")  
3. ��������� � Cache ���� �������� - ������� � ������� ������� (�������� zn "BION"), ��������� do ##class(Report.ReportStartJasper).install(folder,"BION")
4. ����������� ���� C:\jasper\distr\PRTCLNRUS.dll � �����, ����, ��� ���������� Trak\ActiveX, ����� ��������� � ���� ����� TrakFiles.exe 

 ��������� �� �������

1. ���������������� dll ���������� PRTCLNRUS.dll : regsvr32 C:\WINDOWS\system32\PRTCLNRUS.dll