; -- test.iss --
;
; This script shows how to insert custom wizard pages into Setup and how to handle
; these pages. Furthermore it shows how to 'communicate' between the [Code] section
; and the regular Inno Setup sections using {code:...} constants. Finally it shows
; how to customize the settings text on the 'Ready To Install' page.

#define MyAppName "TrakJasper"
#define MyAppVersion "1.0"
#define MyAppPublisher "isc"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{64CF01F8-9DC4-4AC3-9895-BFC322456645}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=C:\work\jasperdistr\1
OutputBaseFilename=TrakJasper
Compression=lzma
SolidCompression=yes

[Languages]
;Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"


[Files]
Source: "C:\work\jasperdistr\isc\*"; DestDir: "{app}\isc"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\work\jasperdistr\jar\*"; DestDir: "{app}\jar"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\work\jasperdistr\fop-1.0\*"; DestDir: "c:\fop-1.0"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\work\jasperdistr\genJasperReport.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\jasperdistr\install.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\jasperdistr\isc.jasper.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\jasperdistr\java.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\jasperdistr\PRTCLNRUS.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\jasperdistr\prginstall.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\jasperdistr\zendop.xml"; DestDir: "{app}"; Flags: ignoreversion
;Source: "C:\work\jasperdistr\reports.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\jasperdistr\elementsTemplate.jasper"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\jasperdistr\elementsTemplate.jrxml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\jasperdistr\initdll.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\jasperdistr\readme.txt"; DestDir: "{app}"; Flags: ignoreversion

Source: "C:\work\jasperdistr\report18.jrxml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\work\jasperdistr\report18.jasper"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Dirs]
Name: {code:GetCacheDir}; Flags: uninsneveruninstall

[Run]
;Filename: "{code:GetCacheDir}\bin\ccontrol.exe"; Parameters: "console ensemble Load^%apiOBJ(\""{app}\prginstall.xml\"",\""c\"") {code:GetNamespace}"
;Filename: "{code:GetCacheDir}\bin\ccontrol.exe"; Parameters: "console ensemble startInstallJasper^Report.Jasper.install(\""{app}\"",\""{code:GetNamespace}\"") {code:GetNamespace}"
Filename: "{app}\install.bat"; Parameters: "{code:GetCacheDir} {app} {code:GetConfigurationCacheName} {code:GetNamespace}"

[Code]
var
  CacheDirPage: TInputDirWizardPage;
  CacheInfoPage: TInputQueryWizardPage;
    
procedure InitializeWizard;
begin
  { Create the pages }

  CacheDirPage := CreateInputDirPage(wpWelcome,
    'Каталог, где установлен Cache/Ensemble', '',
    'Пожалуйста, введите каталог, где установлен Cache/Ensemble. (Например, C:\InterSystems\Ensemble )',
    False, '');
  CacheDirPage.Add('');

  CacheInfoPage := CreateInputQueryPage(CacheDirPage.ID,
    'Информация о Cache/Ensemble', '',
    'Пожалуйста, введите имя конфигураци Cache/Ensemble и имя рабочей области (namespace). ');
  CacheInfoPage.Add('ConfigurationCacheName:', False);
  CacheInfoPage.Add('Namespace:', False);

   { Set default values, using settings that were stored last time if possible }

  CacheDirPage.Values[0] := GetPreviousData('CacheDir', 'C:\InterSystems\Ensemble');
  CacheInfoPage.Values[0] := GetPreviousData('ConfigurationCacheName', 'ensemble');
  CacheInfoPage.Values[1] := GetPreviousData('Namespace', ExpandConstant('{sysuserinfoorg}'));
 
  
end;

procedure RegisterPreviousData(PreviousDataKey: Integer);
begin
  { Store the settings so we can restore them next time }
  SetPreviousData(PreviousDataKey, 'CacheDir', CacheDirPage.Values[0]);
  SetPreviousData(PreviousDataKey, 'ConfigurationCacheName', CacheInfoPage.Values[0]);
  SetPreviousData(PreviousDataKey, 'Namespace', CacheInfoPage.Values[1]);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  { Validate certain pages before allowing the user to proceed }
  Log('NextButtonClick(' + IntToStr(CurPageID) + ') called');
  if CurPageID = CacheDirPage.ID then begin
    if CacheDirPage.Values[0] = '' then begin
       MsgBox('Вы должны ввести путь к папке, где установлен Cache(Ensamble).', mbError, MB_OK);
       Result := False;
    end else begin
       Result := True;
    end;
  end else if CurPageID = CacheInfoPage.ID then begin
    if (CacheInfoPage.Values[0] = '') or (CacheInfoPage.Values[1] = '') then begin
      MsgBox('Вы должны ввести область (namespace) cache/ensemble.', mbError, MB_OK);
      Result := False;
    end else begin
       Result := True;
    end;
  end else
      Result := True;
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo,
  MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  S: String;
begin
  { Fill the 'Ready Memo' with the normal settings and the custom settings }
  S := '';  
  S := S + 'Каталог, где установлен cache/ensemble:' + NewLine;
  S := S + Space + CacheDirPage.Values[0] + NewLine;
  S := S + 'Конфигурация cache/ensemble:' + NewLine;
  S := S + Space + CacheInfoPage.Values[0] + NewLine;
  S := S + 'Рабочая область (namespace) в cache/ensemble:' + NewLine;
  S := S + Space + CacheInfoPage.Values[1] + NewLine;
  S := S + NewLine + NewLine;
  S := S + MemoDirInfo + NewLine;

  Result := S;
end;

function GetCacheDir(Param: String): String;
begin
  { Return the selected CacheDir }
  Result := CacheDirPage.Values[0];
end;

function GetConfigurationCacheName(Param: String): String;
begin
   Result := CacheInfoPage.Values[0]
end;

function GetNamespace(Param: String): String;
begin
   Result := CacheInfoPage.Values[1]
end;









