unit EquipamentoModel;

interface

uses
  System.SysUtils,
  TipoEquipModel; // Assume que esta � a unit onde TTipoEquip est� definida

type
  EEquipamentoException = class(Exception);

  TEquipamento = class
  private
    FCodiEquip: Integer;
    FDescEquip: string;
    FDataEquip: TDateTime;
    FDinsert: TDateTime;
    FDmanut: TDateTime;
    FStatus: Char;
    FTipoEquip: TTipoEquip; // Agora usando a classe TTipoEquip
    FEspaEquip: Integer; // Assumindo que ainda n�o temos uma classe para espa�os de equipamento
    procedure SetDescEquip(const Value: string);
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure ValidarDados;

    property CodiEquip: Integer read FCodiEquip write FCodiEquip;
    property DescEquip: string read FDescEquip write SetDescEquip;
    property DataEquip: TDateTime read FDataEquip write FDataEquip;
    property Dinsert: TDateTime read FDinsert write FDinsert;
    property Dmanut: TDateTime read FDmanut write FDmanut;
    property Status: Char read FStatus write FStatus;
    property TipoEquip: TTipoEquip read FTipoEquip write FTipoEquip; // Propriedade atualizada
    property EspaEquip: Integer read FEspaEquip write FEspaEquip;
  end;

implementation

{ TEquipamento }

constructor TEquipamento.Create;
begin
  inherited Create;
  FTipoEquip := TTipoEquip.Create;
end;

destructor TEquipamento.Destroy;
begin
  FTipoEquip.Free;
  inherited;
end;

procedure TEquipamento.SetDescEquip(const Value: string);
begin
  if Trim(Value) = '' then
    raise EEquipamentoException.Create('A descri��o do equipamento n�o pode ser vazia.');

  FDescEquip := Value;
end;

procedure TEquipamento.ValidarDados;
begin
  SetDescEquip(FDescEquip); // Valida a descri��o
end;

end.

