unit TipoEspacoModel;

interface

uses
  System.SysUtils;

type
  ETipoEspacoException = class(Exception);

  TTipoEspaco = class
  private
    FCodiEsp: Integer;
    FDescEsp: string;
    FQntdEsp: string;
    FDinsert: TDateTime;
    FDmanut: TDateTime;
    FStatus: Char;
    procedure SetDescEsp(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;

    procedure ValidarDados;

    property CodiEsp: Integer read FCodiEsp write FCodiEsp;
    property DescEsp: string read FDescEsp write SetDescEsp;
    property QntdEsp: string read FQntdEsp write FQntdEsp;
    property Dinsert: TDateTime read FDinsert write FDinsert;
    property Dmanut: TDateTime read FDmanut write FDmanut;
    property Status: Char read FStatus write FStatus;
  end;

implementation

{ TTipoEspaco }

constructor TTipoEspaco.Create;
begin
  inherited Create;
end;

destructor TTipoEspaco.Destroy;
begin
  inherited;
end;

procedure TTipoEspaco.SetDescEsp(const Value: string);
begin
  if Trim(Value) = '' then
    raise ETipoEspacoException.Create('A descrição não pode ser vazia.');

  FDescEsp := Value;
end;

procedure TTipoEspaco.ValidarDados;
begin
  SetDescEsp(FDescEsp);
end;

end.
