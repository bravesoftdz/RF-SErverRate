unit Unit2;
interface

uses
  Unit1, psAPI,WinApi.Windows,System.SysUtils,Web.Win.Sockets;

type
  TpData = array [0 .. 65336] of Byte;

  Tpacket = record
    data: TpData;
    size: Word;
    ptype: Word;
  end;

type
  TServStrt = class(TObject)
    procedure RamA;
    procedure RamL;
    procedure RamZ;
    function formpacket(packet: string): Tpacket;
    function StrToHex(Source: string): String;
    procedure SysMsgSend;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

procedure TServStrt.RamA;
var
  pmc: PPROCESS_MEMORY_COUNTERS;
  cb: Integer;
begin
  cb := sizeof(_PROCESS_MEMORY_COUNTERS);
  GetMem(pmc, cb);
  pmc^.cb := cb;
  GetProcessMemoryInfo(ProcInfoAC.hProcess, pmc, cb);
  Form1.Label18.Caption := 'RAM: ' +
    IntToStr(pmc^.WorkingSetSize div 1024 div 1024) + 'Mb';
  FreeMem(pmc);
  if WaitforSingleObject(ProcInfoAC.hProcess, 500) = 0 then
  begin
    CloseHandle(ProcInfoAC.hProcess);
    CloseHandle(ProcInfoAC.hThread);
    Form1.Button5.Caption:='Account';
    Form1.Button5Click(nil);
    Form1.Memo1.Lines.Add('Account failed');
  end;
end;

 procedure TServStrt.RamL;
var
  pmc: PPROCESS_MEMORY_COUNTERS;
  cb: Integer;
begin
  cb := sizeof(_PROCESS_MEMORY_COUNTERS);
  GetMem(pmc, cb);
  pmc^.cb := cb;
  GetProcessMemoryInfo(ProcInfoLG.hProcess, pmc, cb);
  Form1.Label19.Caption := 'RAM: ' +
    IntToStr(pmc^.WorkingSetSize div 1024 div 1024) + 'Mb';
  FreeMem(pmc);
  if WaitforSingleObject(ProcInfoLG.hProcess, 500) = 0 then
  begin
    CloseHandle(ProcInfoLG.hProcess);
    CloseHandle(ProcInfoLG.hThread);
    Form1.Button6.Caption:='Login';
    Form1.Button6Click(nil);
    Form1.Memo1.Lines.Add('Login failed');
  end;
end;

procedure TServStrt.RamZ;
var
  pmc: PPROCESS_MEMORY_COUNTERS;
  cb: Integer;
begin
  cb := sizeof(_PROCESS_MEMORY_COUNTERS);
  GetMem(pmc, cb);
  pmc^.cb := cb;
  GetProcessMemoryInfo(ProcInfoZO.hProcess, pmc, cb);
  Form1.Label20.Caption := 'RAM: ' +
    IntToStr(pmc^.WorkingSetSize div 1024 div 1024) + 'Mb';
  FreeMem(pmc);
  if WaitforSingleObject(ProcInfoZO.hProcess, 500) = 0 then
  begin
    CloseHandle(ProcInfoZO.hProcess);
    CloseHandle(ProcInfoZO.hThread);
    Form1.Button7.Caption:='Zone';
    Form1.Button7Click(nil);
    Form1.Memo1.Lines.Add('Zone failed');
  end;
end;




function TServStrt.formpacket(packet: string): Tpacket;
var
  i, j: Integer;
begin
  Result.size := round(length(packet) / 2);
  i := 0;
  j := 0;
  while i < length(packet) do
  begin
    Result.data[j] := StrToInt('$' + packet[i + 1] + packet[i + 2]);
    i := i + 2;
    j := j + 1;
  end;
  Result.ptype := StrToInt('$' + IntToHex(Result.data[3], 2) +
    IntToHex(Result.data[2], 2));
end;

function TServStrt.StrToHex(Source: string): String;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to length(Source) do
    Result := Result + IntToHex(Ord(Source[1]), 2);
end;

procedure TServStrt.SysMsgSend;
Var
  str, bl: string[255];
  packetStr: string;
  pack, pk: Tpacket;
  i: Integer;
  Tcp:TTcpClient;
begin
Tcp:= TTcpClient.Create(nil);
  Tcp.RemoteHost:='127.0.0.1';
  Tcp.RemotePort:='28000';
  Tcp.BlockMode:=bmBlocking;
  Tcp.Connect;
  if Tcp.Connected then
  begin
    packetStr := '14003201630455466915B9618B2FB020857BD8450500650100';
    pack := formpacket(packetStr);
    Tcp.SendBuf(pack.data, pack.size);
    // Подключились как Control
    str := Form1.Edit1.Text;
    packetStr := '0032070000FFFFFFFF00';
    packetStr := packetStr + IntToHex(length(str), 2);
    packetStr := packetStr + '00';
    packetStr := packetStr + StrToHex(str);
    packetStr := packetStr + '0000';
    packetStr := IntToHex(length(packetStr) div 2 + 1, 2) + packetStr;
    pack := formpacket(packetStr);
    Tcp.SendBuf(pack.data, pack.size);
  end;
  Tcp.Disconnect;
  Tcp.Free;
end;




end.
