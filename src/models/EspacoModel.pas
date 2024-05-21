unit EspacoModel;

interface

uses
  System.SysUtils, TipoEspacoModel;

type
  EEspacoException = class(Exception);

  TEspaco = class
  private
    FCodiEsp: Integer;
    FDescEsp: string;
    FStatEsp: String;
    FDinsert: TDateTime;
    FDmanut: TDateTime;
    FStatus: String;
    FTipoEsp: TTipoEspaco;
    procedure SetDescEsp(const Value: string);
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure ValidarDados;

    property CodiEsp: Integer read FCodiEsp write FCodiEsp;
    property DescEsp: string read FDescEsp write SetDescEsp;
    property StatEsp: String read FStatEsp write FStatEsp;
    property Dinsert: TDateTime read FDinsert write FDinsert;
    property Dmanut: TDateTime read FDmanut write FDmanut;
    property Status: String read FStatus write FStatus;
    property TipoEsp: TTipoEspaco read FTipoEsp write FTipoEsp;
  end;

implementation

{ TEspaco }

constructor TEspaco.Create;
begin
  inherited Create;
end;

destructor TEspaco.Destroy;
begin
  inherited;
end;

procedure TEspaco.SetDescEsp(const Value: string);
begin
  if Trim(Value) = '' then
    raise EEspacoException.Create('A descrição do espaço não pode ser vazia.');

  FDescEsp := Value;
end;

procedure TEspaco.ValidarDados;
begin
  SetDescEsp(FDescEsp);
end;

end.

