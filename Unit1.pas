unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,tlhelp32, Vcl.Buttons,System.UITypes,IniFiles,SHFolder,
  Vcl.ExtCtrls, Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    SpinEdit5: TSpinEdit;
    SpinEdit6: TSpinEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    SpinEdit8: TSpinEdit;
    SpinEdit9: TSpinEdit;
    SpinEdit10: TSpinEdit;
    SpinEdit11: TSpinEdit;
    SpinEdit12: TSpinEdit;
    SpinEdit13: TSpinEdit;
    SpinEdit14: TSpinEdit;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    SpinEdit15: TSpinEdit;
    Label16: TLabel;
    SpinEdit16: TSpinEdit;
    Label17: TLabel;
    SpinEdit17: TSpinEdit;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    SpinEdit7: TSpinEdit;
    Label7: TLabel;
    OpenDialog1: TOpenDialog;
    Timer1: TTimer;
    Memo1: TMemo;
    SpinEdit18: TSpinEdit;
    Label21: TLabel;
    Edit1: TEdit;
    Button3: TButton;
    function Find(s: string): hWnd;
    procedure ReadData;
    procedure RefData;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit4Change(Sender: TObject);
    procedure SpinEdit5Change(Sender: TObject);
    procedure SpinEdit6Change(Sender: TObject);
    procedure SpinEdit18Change(Sender: TObject);
    procedure SpinEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
    procedure Dir(i:integer);
    function ExecAndWait(const FileName, Params: ShortString;
  const WinState: Word): TProcessInformation; export;
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure SpinEdit8Change(Sender: TObject);
    procedure SpinEdit9Change(Sender: TObject);
    procedure SpinEdit10Change(Sender: TObject);
    procedure SpinEdit11Change(Sender: TObject);
    procedure SpinEdit12Change(Sender: TObject);
    procedure SpinEdit13Change(Sender: TObject);
    procedure SpinEdit14Change(Sender: TObject);
    procedure SpinEdit7Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpinEdit15Change(Sender: TObject);
    procedure SpinEdit16Change(Sender: TObject);
    procedure SpinEdit17Change(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    function GetSpecialFolderPath(folder : integer) : string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Drop,MineS,Skill,PT,Anim,EXP,DH,DieEXP,PMineS,PEXP,PAnim,PPT,PSkill,PDrop,PDieExp:Single;
  SleepTrm,SleepVlu,SleepIgn:integer;
  hProc : DWORD;
  ProcInfoAC, ProcInfoLG, ProcInfoZO: TProcessInformation;
  Acc,Log,Zon:String;
  Type
  TEnumData = Record
    hW: HWND;
    pID: DWORD;
  End;

implementation

Uses Unit2;

{$R *.dfm}

function TForm1.GetSpecialFolderPath(folder : integer) : string;
const
SHGFP_TYPE_CURRENT = 0;
var
path: array [0..MAX_PATH] of char;
begin
if SUCCEEDED(SHGetFolderPath(0,folder,0,SHGFP_TYPE_CURRENT,@path[0])) then
Result := path
else
Result := '';
end;

function TForm1.ExecAndWait(const FileName, Params: ShortString;
  const WinState: Word): TProcessInformation; export;
var
  StartInfo: TStartupInfo;
  CmdLine: ShortString;
  ProcInfo: TProcessInformation;
begin
  { Помещаем имя файла между кавычками, с соблюдением всех пробелов в именах Win9x }
  CmdLine := '"' + FileName + '" ' + Params;
  FillChar(StartInfo, sizeof(StartInfo), #0);
  with StartInfo do
  begin
    cb := sizeof(StartInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WinState;
  end;
  CreateProcess(nil, PCHAR(String(CmdLine)), nil, nil, False,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
    PCHAR(ExtractFilePath(FileName)), StartInfo, ProcInfo);
  Result := ProcInfo;
  ZeroMemory(@StartInfo, sizeof(StartInfo));
end;


function TForm1.Find(s: string): hWnd;
var
  Wnd: hWnd;
  buff: array [0 .. 127] of Char;
begin
  Find := 0;
  Wnd := GetWindow(Handle, gw_HWndFirst);
  while Wnd <> 0 do
  begin
    if (Wnd <> Application.Handle){ and IsWindowVisible(Wnd)} and
      (GetWindow(Wnd, gw_Owner) = 0) and
      (GetWindowText(Wnd, buff, sizeof(buff)) <> 0) then
    begin
      GetWindowText(Wnd, buff, sizeof(buff));
      if pos(s, StrPas(buff)) > 0 then
      begin
        Find := Wnd;
        Break;
      end;
    end;
    Wnd := GetWindow(Wnd, gw_hWndNext);
  end;
end;

Function EnumProc( hw: HWND; Var data: TEnumData ): Bool; stdcall;
  Var
    pID: DWORD;
  Begin
    Result := True;
    If (GetWindowLong(hw, GWL_HWNDPARENT) = 0)
    Then Begin
      GetWindowThreadProcessID( hw, @pID );
      If pID = data.pID Then Begin
        data.hW := hW;
        Result := False;
      End; { If }
    End; { If }
  End;

Function WindowFromProcessID( pID: DWORD ): HWND;
  Var
    data: TEnumData;
  Begin
    data.pID := pID;
    data.hW := 0;
    EnumWindows( @EnumProc, longint(@data) );
    Result := data.hW;
  End; { WindowFromProcessID }

function PID (s:string):integer;
var
  hSnap:THandle;
  pe:TProcessEntry32;
begin
 pe.dwSize:=SizeOf(pe);
 hSnap:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
  If Process32First(hSnap,pe) then
    While Process32Next(hSnap,pe) do
      if ExtractFileName(pe.szExeFile)=s then
        Result:=pe.th32ProcessID;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
if (Button5.Caption='Account') or (Sender=nil) then
 begin
  if Acc<>'' then
   begin
   ProcInfoAC := ExecAndWait(Acc, '',SW_MINIMIZE);
   Timer1.Enabled:=True;
   Button5.Caption:='Stop Account';
   SpeedButton1.Enabled:=False;
   end
  else
   Dir(1);
 end
 else
 begin
 PostMessage(WindowFromProcessID(ProcInfoAC.dwProcessId),WM_QUIT, 0, 0);
 ProcInfoAC.dwProcessId:=0; //Обнуляем PID для красоты вывода RAM (Timer1)
 Button5.Caption:='Account';
 SpeedButton1.Enabled:=True;
 end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
if (Button6.Caption='Login') or (Sender=nil) then
 begin
  if Log<>'' then
   begin
   ProcInfoLG := ExecAndWait(Log, '',SW_MINIMIZE);
   Timer1.Enabled:=True;
   Button6.Caption:='Stop Login';
   SpeedButton2.Enabled:=False;
   end
  else
   Dir(2);
 end
 else
 begin
 PostMessage(WindowFromProcessID(ProcInfoLG.dwProcessId),WM_QUIT, 0, 0);  //Находим по Имени exe PID и закрываем
 ProcInfoLG.dwProcessId:=0; //Обнуляем PID для красоты вывода RAM (Timer1)
 Button6.Caption:='Login';
 SpeedButton2.Enabled:=True;
 end;
end;

procedure TForm1.Button7Click(Sender: TObject);
Var
  Wnd, cwnd: hWnd;
begin
if (Button7.Caption='Zone') or (Sender=nil) then
 begin
  if Zon<>'' then
   begin
   ProcInfoZO := ExecAndWait(Zon, 'cjdrnrwkd',SW_MINIMIZE);
   Timer1.Enabled:=True;
   Button7.Caption:='Stop Zone';
   SpeedButton3.Enabled:=False;
   end
  else
   Dir(3);
 end
 else
 begin
 PostMessage(WindowFromProcessID(ProcInfoZO.dwProcessId),WM_QUIT, 0, 0);  //Находим по Имени exe PID и закрываем
 ProcInfoZO.dwProcessId:=0; //Обнуляем PID для красоты вывода RAM (Timer1)
 Button7.Caption:='Zone';
 SpeedButton3.Enabled:=True;
 end;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
 if Button8.Caption='Скрыть' then
  begin
   ShowWindow(WindowFromProcessID(ProcInfoAC.dwProcessId), SW_HIDE);
   Button8.Caption:='Показать';
  end
    else
  begin
   ShowWindow(WindowFromProcessID(ProcInfoAC.dwProcessId), SW_RESTORE);
   Button8.Caption:='Скрыть';
  end;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
 if Button9.Caption='Скрыть' then
  begin
   ShowWindow(WindowFromProcessID(ProcInfoLG.dwProcessId), SW_HIDE);
   Button9.Caption:='Показать';
  end
    else
  begin
   ShowWindow(WindowFromProcessID(ProcInfoLG.dwProcessId), SW_RESTORE);
   Button9.Caption:='Скрыть';
  end;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
 if Button10.Caption='Скрыть' then
  begin
   ShowWindow(WindowFromProcessID(ProcInfoZO.dwProcessId), SW_HIDE);
   Button10.Caption:='Показать';
  end
    else
  begin
   ShowWindow(WindowFromProcessID(ProcInfoZO.dwProcessId), SW_RESTORE);
   Button10.Caption:='Скрыть';
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
Var
userResponse:integer;
begin
if (ProcInfoZO.dwProcessId<>0) or (ProcInfoLG.dwProcessId<>0) or (ProcInfoAC.dwProcessId<>0) then
 begin
    userResponse := MessageDlg('Сервер будет отключен ! Вы уверены ?', mtWarning, [mbYes,mbCancel], 0);
     if userResponse=idYes then
      begin
       if ProcInfoZO.dwProcessId<>0 then PostMessage(WindowFromProcessID(ProcInfoZO.dwProcessId),WM_QUIT, 0, 0);
       if ProcInfoLG.dwProcessId<>0 then PostMessage(WindowFromProcessID(ProcInfoLG.dwProcessId),WM_QUIT, 0, 0);
       if ProcInfoAC.dwProcessId<>0 then PostMessage(WindowFromProcessID(ProcInfoAC.dwProcessId),WM_QUIT, 0, 0);
      end else
       Action:=caNone;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
Var
Ini:TIniFile;
begin
if FileExists(GetSpecialFolderPath(CSIDL_PERSONAL)+'\PRJ1_config.ini') then
 begin
  Ini:=TIniFile.Create(GetSpecialFolderPath(CSIDL_PERSONAL)+'\PRJ1_config.ini');
  Acc:=Ini.ReadString('Files','Account','');
  Log:=Ini.ReadString('Files','Login','');
  Zon:=Ini.ReadString('Files','Zone','');
  Ini.Free;
 end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
CloseHandle(hProc);
end;

procedure TForm1.Dir(i:integer);
Var
Ini:TIniFile;
Fold:String;
begin
Ini:=TIniFile.Create(GetSpecialFolderPath(CSIDL_PERSONAL)+'\PRJ1_config.ini');
if openDialog1.Execute then
  if openDialog1.FileName<>'' then
  begin
    case i of
     1:Acc:=openDialog1.FileName;
     2:Log:=openDialog1.FileName;
     3:Zon:=openDialog1.FileName;
    end;
if Acc<>'' then Ini.WriteString('Files','Account',Acc);
if Log<>'' then Ini.WriteString('Files','Login',Log);
if Zon<>'' then Ini.WriteString('Files','Zone',Zon);
   Ini.Free;
  end;
end;


procedure TForm1.SpinEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if not(key in ['0'..'9']) then key:=#0 else
if (TSpinEdit(Sender).Value<TSpinEdit(Sender).MinValue) or (TSpinEdit(Sender).Value>TSpinEdit(Sender).MaxValue) then
   TSpinEdit(Sender).Value:=TSpinEdit(Sender).MinValue;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  RefData;
  Button1.Enabled:=False;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
Dir(1);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
Dir(2);
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
Dir(3);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if ProcInfoAC.dwProcessId<>0 then    TServStrt.Create.RamA else  Label18.Caption:='Not Running';
if ProcInfoLG.dwProcessId<>0 then     TServStrt.Create.RamL else  Label19.Caption:='Not Running';
if ProcInfoZO.dwProcessId<>0 then    TServStrt.Create.RamZ else  Label20.Caption:='Not Running';
end;




procedure TForm1.Timer2Timer(Sender: TObject);
begin

end;

//////////////              ЧТЕНИЕ     ЗАПИСЬ В ПАМЯТЬ          //////////////////////////////



procedure TForm1.RefData;
Begin
  ReadData;
  SpinEdit1.Value:=trunc(Drop);
  SpinEdit2.Value:=trunc(MineS);
  SpinEdit3.Value:=trunc(Skill);
  SpinEdit4.Value:=trunc(PT);
  SpinEdit5.Value:=trunc(Anim);
  SpinEdit6.Value:=trunc(EXP);
  SpinEdit7.Value:=trunc(DieExp);

  SpinEdit18.Value:=trunc(DH);

  SpinEdit8.Value:=trunc(PDrop);
  SpinEdit9.Value:=trunc(PMineS);
  SpinEdit10.Value:=trunc(PSkill);
  SpinEdit11.Value:=trunc(PPT);
  SpinEdit12.Value:=trunc(PAnim);
  SpinEdit13.Value:=trunc(PEXP);
  SpinEdit14.Value:=trunc(PDieExp);


    SpinEdit15.Value:=SleepTrm;
    SpinEdit16.Value:=SleepVlu;
    SpinEdit17.Value:=SleepIgn;
End;



procedure TForm1.ReadData;
var
  ipBase: pointer;
  numberRead: NativeUInt;
  hWnd: THandle;
  PID: DWORD;
begin
  hWnd := WindowFromProcessID(ProcInfoZO.dwProcessId);
  if hWnd<>0 then
  begin
  GetWindowThreadProcessId(hWnd, @PID);
  hProc := OpenProcess(PROCESS_ALL_ACCESS, False, PID);

  ipBase:=Pointer($14096DFF0);
  ReadProcessMemory(hProc, ipBase, Addr(Drop), 4, numberRead);

  ipBase:=Pointer($14096DFF4);
  ReadProcessMemory(hProc, ipBase, Addr(MineS), 4, numberRead);

  ipBase:=Pointer($14096DFF8);
  ReadProcessMemory(hProc, ipBase, Addr(Skill), 4, numberRead);

  ipBase:=Pointer($14096DFFC);
  ReadProcessMemory(hProc, ipBase, Addr(PT), 4, numberRead);

  ipBase:=Pointer($14096E000);
  ReadProcessMemory(hProc, ipBase, Addr(Anim), 4, numberRead);

  ipBase:=Pointer($14096E004);
  ReadProcessMemory(hProc, ipBase, Addr(EXP), 4, numberRead);

  ipBase:=Pointer($14096E008);
  ReadProcessMemory(hProc, ipBase, Addr(DH), 4, numberRead);

  ipBase:=Pointer($14096E00C);
  ReadProcessMemory(hProc, ipBase, Addr(DieEXP), 4, numberRead);

  ipBase:=Pointer($14096E010);
  ReadProcessMemory(hProc, ipBase, Addr(PMineS), 4, numberRead);


  ipBase:=Pointer($14096E014);
  ReadProcessMemory(hProc, ipBase, Addr(PEXP), 4, numberRead);


  ipBase:=Pointer($14096E018);
  ReadProcessMemory(hProc, ipBase, Addr(PAnim), 4, numberRead);


  ipBase:=Pointer($14096E01C);
  ReadProcessMemory(hProc, ipBase, Addr(PPT), 4, numberRead);

  ipBase:=Pointer($14096E020);
  ReadProcessMemory(hProc, ipBase, Addr(PSkill), 4, numberRead);


  ipBase:=Pointer($14096E024);
  ReadProcessMemory(hProc, ipBase, Addr(PDrop), 4, numberRead);


  ipBase:=Pointer($14096E02C);
  ReadProcessMemory(hProc, ipBase, Addr(PDieExp), 4, numberRead);

 //Частота Зоны

  ipBase:=Pointer($1799C9AD0);
  ReadProcessMemory(hProc, ipBase, Addr(SleepTrm), 4, numberRead);

  ipBase:=Pointer($1799C9AD4);
  ReadProcessMemory(hProc, ipBase, Addr(SleepVlu), 4, numberRead);

  ipBase:=Pointer($1799C9AD8);
  ReadProcessMemory(hProc, ipBase, Addr(SleepIgn), 4, numberRead);

 //Конец частоты Зоны
   Button2.Enabled:=True;
  end else
  ShowMessage('Start ZoneServer..Запустите ZoneServer..');
end;




procedure TForm1.Button2Click(Sender: TObject);
var
  ipBase: pointer;
  numberRead: NativeUInt;
  userResponse:integer;
begin
   userResponse := MessageDlg('Все данные которые вы указали'+#10#13+'будут установленны в ZoneServer.'+#10#13+'Вы уверены ?', mtWarning, [mbYes,mbCancel], 0);
    if userResponse=idYes then
 begin
if hProc <> 0 then
  begin
  ipBase:=Pointer($14096DFF0);
  WriteProcessMemory(hProc, ipBase, Addr(Drop), 4, numberRead);

  ipBase:=Pointer($14096DFF4);
  WriteProcessMemory(hProc, ipBase, Addr(MineS), 4, numberRead);

  ipBase:=Pointer($14096DFF8);
  WriteProcessMemory(hProc, ipBase, Addr(Skill), 4, numberRead);

  ipBase:=Pointer($14096DFFC);
  WriteProcessMemory(hProc, ipBase, Addr(PT), 4, numberRead);

  ipBase:=Pointer($14096E000);
  WriteProcessMemory(hProc, ipBase, Addr(Anim), 4, numberRead);

  ipBase:=Pointer($14096E004);
  WriteProcessMemory(hProc, ipBase, Addr(EXP), 4, numberRead);

  ipBase:=Pointer($14096E008);
  WriteProcessMemory(hProc, ipBase, Addr(DH), 4, numberRead);

  ipBase:=Pointer($14096E00C);
  WriteProcessMemory(hProc, ipBase, Addr(DieEXP), 4, numberRead);

  ipBase:=Pointer($14096E010);
  WriteProcessMemory(hProc, ipBase, Addr(PMineS), 4, numberRead);


  ipBase:=Pointer($14096E014);
  WriteProcessMemory(hProc, ipBase, Addr(PEXP), 4, numberRead);


  ipBase:=Pointer($14096E018);
  WriteProcessMemory(hProc, ipBase, Addr(PAnim), 4, numberRead);


  ipBase:=Pointer($14096E01C);
  WriteProcessMemory(hProc, ipBase, Addr(PPT), 4, numberRead);

  ipBase:=Pointer($14096E020);
  WriteProcessMemory(hProc, ipBase, Addr(PSkill), 4, numberRead);


  ipBase:=Pointer($14096E024);
  WriteProcessMemory(hProc, ipBase, Addr(PDrop), 4, numberRead);


  ipBase:=Pointer($14096E02C);
  WriteProcessMemory(hProc, ipBase, Addr(PDieExp), 4, numberRead);

 //Частота Зоны

  ipBase:=Pointer($1799C9AD0);
  WriteProcessMemory(hProc, ipBase, Addr(SleepTrm), 4, numberRead);

  ipBase:=Pointer($1799C9AD4);
  WriteProcessMemory(hProc, ipBase, Addr(SleepVlu), 4, numberRead);

  ipBase:=Pointer($1799C9AD8);
  WriteProcessMemory(hProc, ipBase, Addr(SleepIgn), 4, numberRead);

 //Конец частоты Зоны

  RefData;
  end;
  Button2.Enabled:=False;
  Button1.Enabled:=True;
 end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
TServStrt.Create.SysMsgSend;
end;

///////////////////////КОНЕЦ ЧТЕНИЯ ------ЗАПИСИ В ПАМЯТЬ///////////////////////




///// ЗАПИСЬ С EDITов в ПЕРЕМЕННЫЕ        /////////////////////////////////////////

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
MineS:=SpinEdit2.Value;
end;

procedure TForm1.SpinEdit15Change(Sender: TObject);
begin
SleepTrm:=SpinEdit15.Value;
end;

procedure TForm1.SpinEdit16Change(Sender: TObject);
begin
SleepVlu:=SpinEdit16.Value;
end;

procedure TForm1.SpinEdit17Change(Sender: TObject);
begin
SleepIgn:=SpinEdit17.Value;
end;

procedure TForm1.SpinEdit3Change(Sender: TObject);
begin
Skill:=SpinEdit3.Value;
end;

procedure TForm1.SpinEdit4Change(Sender: TObject);
begin
PT:=SpinEdit4.Value;
end;

procedure TForm1.SpinEdit5Change(Sender: TObject);
begin
Anim:=SpinEdit5.Value;
end;

procedure TForm1.SpinEdit6Change(Sender: TObject);
begin
EXP:=SpinEdit6.Value;
end;

procedure TForm1.SpinEdit7Change(Sender: TObject);
begin
DieExp:=SpinEdit7.Value;
end;

procedure TForm1.SpinEdit8Change(Sender: TObject);
begin
PDrop:=SpinEdit8.Value;
end;

procedure TForm1.SpinEdit9Change(Sender: TObject);
begin
PMineS:=SpinEdit9.Value;
end;

procedure TForm1.SpinEdit10Change(Sender: TObject);
begin
  PSkill:=SpinEdit10.Value;
end;

procedure TForm1.SpinEdit11Change(Sender: TObject);
begin
 PPT:=SpinEdit11.Value;
end;

procedure TForm1.SpinEdit12Change(Sender: TObject);
begin
 PAnim:=SpinEdit12.Value;
end;

procedure TForm1.SpinEdit13Change(Sender: TObject);
begin
 PEXP:=SpinEdit13.Value;
end;

procedure TForm1.SpinEdit14Change(Sender: TObject);
begin
 PDieExp:=SpinEdit14.Value;
end;

procedure TForm1.SpinEdit18Change(Sender: TObject);
begin
 DH:=SpinEdit18.Value;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
 Drop:=SpinEdit1.Value;
end;

/////////////////////////////////////      КОНЕЦ ЗАПИСИ В ПЕРЕМЕННЫЕ     //////////////////

end.
