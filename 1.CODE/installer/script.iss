; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "multiutility"
#define MyAppVersion "1.5"
#define MyAppPublisher "karan,harjot"
#define MyAppURL "http://www.example.com/"
#define MyAppExeName "multiutility.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{AF8B1DEE-79E3-4B2F-81B7-89A41E4C55CA}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir=C:\Users\IMAC\Desktop\installer
OutputBaseFilename=setup-mua
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\IMAC\Desktop\installer\multiutility.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "H:\jre-7u60-windows-i586.exe"; DestDir: "{app}"; Flags: deleteafterinstall
Source: "C:\Users\IMAC\Desktop\eclipse\khj\USB20\Downloads\Multiutility(Karanpartap,Harjot)\todolist.sql"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\IMAC\Desktop\eclipse\khj\USB20\Downloads\Multiutility(Karanpartap,Harjot)\project karan.docx"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
Filename: "{app}\jre-7u60-windows-i586.exe"; WorkingDir: {app}; StatusMsg: Checking Java Runtime Environment... Please Wait...;Check:JREVerifyInstall

[Code]
#define MinJRE "1.6"

Function JREVerifyInstall:Boolean;
var
  JREVersion: string;
begin
if (RegValueExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\JavaSoft\Java Runtime Environment','CurrentVersion')) then 
  begin
  Result := RegQueryStringValue(HKEY_LOCAL_MACHINE, 'Software\JavaSoft\Java Runtime Environment', 'CurrentVersion', JREVersion);
  if Result then
      Result := CompareStr(JREVersion, '{#MinJRE}') <= 0; 
  end
else
  Result := true;

end;
