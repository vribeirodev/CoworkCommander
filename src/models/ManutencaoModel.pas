unit ManutencaoModel;

interface

uses
  System.SysUtils, EspacoModel;

type
  EManutencaoException = class(Exception);

  TManutencao = class
  private
    FCodiManut: Integer;
    FDescManut: string;
    FDataManut: TDate;
    FStatManut: Char;
    FDinsert: TDateTime;
    FDmanut: TDateTime;
    FStatus: Char;
    FEspaManut: TEspaco;
    procedure SetDescManut(const Value: string);
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure ValidarDados;

    property CodiManut: Integer read FCodiManut write FCodiManut;
    property DescManut: string read FDescManut write SetDescManut;
    property DataManut: TDate read FDataManut write FDataManut;
    property StatManut: Char read FStatManut write FStatManut;
    property Dinsert: TDateTime read FDinsert write FDinsert;
    property Dmanut: TDateTime read FDmanut write FDmanut;
    property Status: Char read FStatus write FStatus;
    property EspaManut: TEspaco read FEspaManut write FEspaManut;
  end;

implementation

{ TManutencao }

constructor TManutencao.Create;
begin
  inherited Create;
end;

destructor TManutencao.Destroy;
begin
  inherited;
end;

procedure TManutencao.SetDescManut(const Value: string);
begin
  if Trim(Value) = '' then
    raise EManutencaoException.Create('A descrição da manutenção não pode ser vazia.');

  FDescManut := Value;
end;

procedure TManutencao.ValidarDados;
begin
  SetDescManut(FDescManut);
end;

end.
