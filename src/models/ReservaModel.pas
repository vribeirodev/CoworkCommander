unit ReservaModel;

interface

uses
  System.SysUtils, EspacoModel, MembroModel;

type
  EReservaException = class(Exception);

  TReserva = class
  private
    FCodiRes: Integer;
    FDinicioRes: TDateTime;
    FDfimRes: TDateTime;
    FDinsert: TDateTime;
    FDmanut: TDateTime;
    FStatus: Char;
    FEspaRes: TEspaco; // Relação com a classe TEspaco
    FMembRes: TMembro; // Relação com a classe TMembro
  public
    constructor Create; virtual;
    destructor Destroy; override;

    property CodiRes: Integer read FCodiRes write FCodiRes;
    property DinicioRes: TDateTime read FDinicioRes write FDinicioRes;
    property DfimRes: TDateTime read FDfimRes write FDfimRes;
    property Dinsert: TDateTime read FDinsert write FDinsert;
    property Dmanut: TDateTime read FDmanut write FDmanut;
    property Status: Char read FStatus write FStatus;
    property EspaRes: TEspaco read FEspaRes write FEspaRes;
    property MembRes: TMembro read FMembRes write FMembRes;
  end;

implementation

{ TReserva }

constructor TReserva.Create;
begin
  inherited Create;
  FEspaRes := TEspaco.Create;
  FMembRes := TMembro.Create;
end;

destructor TReserva.Destroy;
begin
  FEspaRes.Free;
  FMembRes.Free;
  inherited;
end;

end.
