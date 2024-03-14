unit TipoEquipModel;

interface

uses
  System.SysUtils;

type
  ETipoEquipException = class(Exception);

  TTipoEquip = class
  private
    FCodiTEquip: Integer;
    FDescTEquip: string;
    FDinsert: TDateTime;
    FDmanut: TDateTime;
    FStatus: Char;
    procedure SetDescTEquip(const Value: string);
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure ValidarDados;

    property CodiTEquip: Integer read FCodiTEquip write FCodiTEquip;
    property DescTEquip: string read FDescTEquip write SetDescTEquip;
    property Dinsert: TDateTime read FDinsert write FDinsert;
    property Dmanut: TDateTime read FDmanut write FDmanut;
    property Status: Char read FStatus write FStatus;
  end;

implementation

{ TTipoEquip }

constructor TTipoEquip.Create;
begin
  inherited Create;
  // Inicializa��o padr�o
end;

destructor TTipoEquip.Destroy;
begin
  inherited;
end;

procedure TTipoEquip.SetDescTEquip(const Value: string);
begin
  if Trim(Value) = '' then
    raise ETipoEquipException.Create('A descri��o do tipo de equipamento n�o pode ser vazia.');

  FDescTEquip := Value;
end;

procedure TTipoEquip.ValidarDados;
begin
  // Implementa��o b�sica da valida��o
  SetDescTEquip(FDescTEquip); // Isso ir� validar a descri��o
end;

end.
