unit EquipamentoModel;

interface

uses
  System.SysUtils,
  TipoEquipModel,
  EspacoModel;

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
    FTipoEquip: TTipoEquip;
    FEspaEquip: TEspaco;
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
    property EspaEquip: TEspaco read FEspaEquip write FEspaEquip;
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
    raise EEquipamentoException.Create('A descrição do equipamento não pode ser vazia.');

  FDescEquip := Value;
end;

procedure TEquipamento.ValidarDados;
begin
  SetDescEquip(FDescEquip); // Valida a descrição
end;

end.

