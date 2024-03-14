unit MembroModel;

interface

uses
  System.SysUtils, System.RegularExpressions;

type
  EMembroException = class(Exception);

  TMembro = class
  private
    FCodiMemb: Integer;
    FNomeMemb: string;
    FCpfMemb: string;
    FEmailMemb: string;
    FTeleMemb: string;
    FDnascMemb: TDate;
    FDinsert: TDateTime;
    FDmanut: TDateTime;
    FStatus: Char;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure ValidarCPF(const ACpf: string);
    function FormatarCPF(const ACpf: string): string;
    procedure ValidarEmail(const AEmail: string);
    procedure ValidarDados;

    property CodiMemb: Integer read FCodiMemb write FCodiMemb;
    property NomeMemb: string read FNomeMemb write FNomeMemb;
    property CpfMemb: string read FCpfMemb write FCpfMemb;
    property EmailMemb: string read FEmailMemb write FEmailMemb;
    property TeleMemb: string read FTeleMemb write FTeleMemb;
    property DnascMemb: TDate read FDnascMemb write FDnascMemb;
    property Dinsert: TDateTime read FDinsert write FDinsert;
    property Dmanut: TDateTime read FDmanut write FDmanut;
    property Status: Char read FStatus write FStatus;
  end;

implementation

{ TMembro }

constructor TMembro.Create;
begin
  inherited Create;
end;

destructor TMembro.Destroy;
begin
  inherited;
end;

procedure TMembro.ValidarCPF(const ACpf: string);
var
  Regex: TRegEx;
begin
  Regex := TRegEx.Create('^\d{3}\.\d{3}\.\d{3}-\d{2}$');
  if not Regex.IsMatch(ACpf) then
    raise EMembroException.Create('O CPF fornecido é inválido.');
end;

function TMembro.FormatarCPF(const ACpf: string): string;
begin
  Result := ACpf.Replace('.', '').Replace('-', '');
end;

procedure TMembro.ValidarEmail(const AEmail: string);
var
  Regex: TRegEx;
begin
  Regex := TRegEx.Create('^[\w\.-]+@[\w\.-]+\.\w+$');
  if not Regex.IsMatch(AEmail) then
    raise EMembroException.Create('O e-mail fornecido é inválido.');
end;

procedure TMembro.ValidarDados;
begin
  if Trim(FNomeMemb) = '' then
    raise EMembroException.Create('O nome do membro não pode ser vazio.');

  ValidarCPF(FCpfMemb);
  ValidarEmail(FEmailMemb);
end;

end.
