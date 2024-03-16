unit EquipamentoController;

interface

uses
  EquipamentoModel,
  EquipamentoDAO,
  TipoEquipDAO,
  EspacoDAO,
  TipoEquipModel,
  EspacoModel,
  System.SysUtils,
  System.Generics.Collections;

type
  TEquipamentoController = class
  private
    FEquipamentoDAO: TEquipamentoDAO;
    FTipoEquipDAO: TTipoEquipDAO;
    FEspacoDAO: TEspacoDAO;
  public
    constructor Create(const EquipamentoDAO: TEquipamentoDAO; const TipoEquipDAO: TTipoEquipDAO; const EspacoDAO: TEspacoDAO);
    destructor Destroy; override;

    function InsertEquipamento(const DescEquip: string; const DataEquip: TDateTime; const TipoEquip: TTipoEquip; const EspaEquip: TEspaco): Integer;
    function UpdateEquipamento(Equipamento: TEquipamento): Boolean;
    function DeleteEquipamento(CodiEquip: Integer): Boolean;
    function GetEquipamento(CodiEquip: Integer): TEquipamento;
    function GetAllEquipamentos: TObjectList<TEquipamento>;
  end;

implementation

{ TEquipamentoController }

constructor TEquipamentoController.Create(const EquipamentoDAO: TEquipamentoDAO; const TipoEquipDAO: TTipoEquipDAO; const EspacoDAO: TEspacoDAO);
begin
  inherited Create;
  FEquipamentoDAO := EquipamentoDAO;
  FTipoEquipDAO := TipoEquipDAO;
  FEspacoDAO := EspacoDAO;
end;

destructor TEquipamentoController.Destroy;
begin
  inherited;
end;

function TEquipamentoController.InsertEquipamento(const DescEquip: string; const DataEquip: TDateTime; const TipoEquip: TTipoEquip; const EspaEquip: TEspaco): Integer;
var
  Equipamento: TEquipamento;
begin
  Equipamento := TEquipamento.Create;
  try
    Equipamento.DescEquip := DescEquip;
    Equipamento.DataEquip := DataEquip;
    Equipamento.TipoEquip := TipoEquip;
    Equipamento.EspaEquip := EspaEquip;
    Equipamento.Dinsert := Now;
    Equipamento.Dmanut := Now;
    Equipamento.Status := 'A';
    Equipamento.ValidarDados;

    Result := FEquipamentoDAO.Insert(Equipamento);
  finally
  end;
end;

function TEquipamentoController.UpdateEquipamento(Equipamento: TEquipamento): Boolean;
begin
  Equipamento.Dmanut := Now;
  Equipamento.ValidarDados;

  Result := FEquipamentoDAO.Update(Equipamento);
end;

function TEquipamentoController.DeleteEquipamento(CodiEquip: Integer): Boolean;
var
  Equipamento: TEquipamento;
begin
  Equipamento := FEquipamentoDAO.Select(CodiEquip);
  if Assigned(Equipamento) then
  try
    Result := FEquipamentoDAO.Delete(Equipamento);
  finally
    Equipamento.Free;
  end
  else
    Result := False;
end;

function TEquipamentoController.GetEquipamento(CodiEquip: Integer): TEquipamento;
begin
  Result := FEquipamentoDAO.Select(CodiEquip);
end;

function TEquipamentoController.GetAllEquipamentos: TObjectList<TEquipamento>;
begin
  Result := FEquipamentoDAO.GetAll;
end;

end.
