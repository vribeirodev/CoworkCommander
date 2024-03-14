unit UserModel;

interface

uses
  System.Hash, System.SysUtils, Security;

type
  TUser = class(TObject)
  private
    FCODI_USU : integer;
    FNOME_USU : string;
    FUSER_USU : string;
    FPASS_USU : string;
    FDINSERT  : TDateTime;
    FDMANUT   : TDateTime;
    FSTATUS   : string;

    function GetCODI_USU : integer;
    function GetNOME_USU : string;
    function GetUSER_USU : string;
    function GetPASS_USU : string;
    function GetDINSERT  : TDateTime;
    function GetDMANUT   : TDateTime;
    function GetSTATUS   : String;

    procedure SetCODI_USU (const Value: integer);
    procedure SetNOME_USU (const Value: string);
    procedure SetUSER_USU (const Value: string);
    procedure SetPASS_USU (const Value: string);
    procedure SetDINSERT  (const Value: TDateTime);
    procedure SetDMANUT   (const Value: TDateTime);
    procedure SetSTATUS   (const Value: string);
  public
    property CODI_USU : integer   read GetCODI_USU  write SetCODI_USU;
    property NOME_USU : string    read GetNOME_USU  write SetNOME_USU;
    property USER_USU : string    read GetUSER_USU  write SetUSER_USU;
    property PASS_USU : string    read GetPASS_USU  write SetPASS_USU;
    property DINSERT  : TDateTime read GetDINSERT   write SetDINSERT;
    property DMANUT   : TDateTime read GetDMANUT    write SetDMANUT;
    property STATUS   : string      read GetSTATUS    write SetSTATUS;

    constructor Create(const NOME_USU, USER_USU, PASS_USU, STATUS: String; CODI_USU: integer); overload;
    constructor Create(const USER_USU, PASS_USU: string); overload;

    function CheckPassword(const Password: string): boolean;
  end;

implementation

constructor TUser.Create(const NOME_USU, USER_USU, PASS_USU, STATUS: String; CODI_USU: integer);
begin
  try
    Self.CODI_USU  := CODI_USU;
    Self.NOME_USU  := NOME_USU;
    Self.USER_USU  := USER_USU;
    Self.PASS_USU  := PASS_USU;
    Self.STATUS    := STATUS;
  except
    on E: Exception do
      raise Exception.Create('Erro ao criar usuário: ' + E.Message);
  end;
end;

constructor TUser.Create(const USER_USU, PASS_USU : string);
begin
  try
    Self.USER_USU := USER_USU;
    Self.PASS_USU := PASS_USU;
  except
    on E: Exception do
      raise Exception.Create('Erro ao criar usuário: ' + E.Message);
  end;
end;

function TUser.GetCODI_USU: integer;
begin
  Result := Self.FCODI_USU;
end;

function TUser.GetDINSERT: TDateTime;
begin
  Result := Self.FDINSERT;
end;

function TUser.GetDMANUT: TDateTime;
begin
  Result := Self.FDMANUT;
end;

function TUser.GetNOME_USU: string;
begin
  Result := Self.FNOME_USU;
end;

function TUser.GetPASS_USU: string;
begin
  Result := Self.FPASS_USU;
end;

function TUser.GetSTATUS: String;
begin
  Result := Self.FSTATUS;
end;

function TUser.GetUSER_USU: string;
begin
  Result := Self.FUSER_USU;
end;

procedure TUser.SetCODI_USU(const Value: integer);
begin
  Self.FCODI_USU := Value;
end;

procedure TUser.SetDINSERT(const Value: TDateTime);
begin
  Self.FDINSERT := Value;
end;

procedure TUser.SetDMANUT(const Value: TDateTime);
begin
  Self.FDMANUT := Value;
end;

procedure TUser.SetNOME_USU(const Value: string);
begin
  Self.FNOME_USU := value;
end;

procedure TUser.SetPASS_USU(const Value: string);
begin
  if not TSecurityService.IsHash(Value) then
    FPASS_USU := TSecurityService.HashPassword(Value)
  else
    FPASS_USU := Value;
end;

procedure TUser.SetSTATUS(const Value: String);
begin
  Self.FSTATUS := Value;
end;

procedure TUser.SetUSER_USU(const Value: string);
begin
  Self.FUSER_USU := Value;
end;

function TUser.CheckPassword(const Password: string): boolean;
begin
  Result := Password = FPASS_USU;
end;

end.

