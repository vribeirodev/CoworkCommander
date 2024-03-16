unit TipoEquipController;

interface

uses
  TipoEquipModel, TipoEquipDAO, System.SysUtils, System.Generics.Collections;

type
  TTipoEquipController = class
  private
    FDao: TTipoEquipDAO;
  public
    constructor Create(Dao: TTipoEquipDAO);
    destructor Destroy; override;

    function InsertTipoEquip(const DescTEquip: string; const Status: Char): Integer;
    function UpdateTipoEquip(TipoEquip: TTipoEquip): Boolean;
    function DeleteTipoEquip(CodiTEquip: Integer): Boolean;
    function GetTipoEquip(CodiTEquip: Integer): TTipoEquip;
    function GetAllTipoEquip: TObjectList<TTipoEquip>;
  end;

implementation

{ TTipoEquipController }

constructor TTipoEquipController.Create(Dao: TTipoEquipDAO);
begin
  inherited Create;
  FDao := Dao;
end;

destructor TTipoEquipController.Destroy;
begin
  inherited;
end;

function TTipoEquipController.InsertTipoEquip(const DescTEquip: string; const Status: Char): Integer;
var
  TipoEquip: TTipoEquip;
begin
  TipoEquip := TTipoEquip.Create;
  try
    TipoEquip.DescTEquip := DescTEquip;
    TipoEquip.Status := Status;
    TipoEquip.Dinsert := Now;
    TipoEquip.Dmanut := Now;

    TipoEquip.ValidarDados;
    Result := FDao.Insert(TipoEquip);
  finally
    TipoEquip.Free;
  end;
end;

function TTipoEquipController.UpdateTipoEquip(TipoEquip: TTipoEquip): Boolean;
begin
  TipoEquip.ValidarDados;
  Result := FDao.Update(TipoEquip);
end;

function TTipoEquipController.DeleteTipoEquip(CodiTEquip: Integer): Boolean;
var
  TipoEquip: TTipoEquip;
begin
  TipoEquip := FDao.Select(CodiTEquip);
  try
    if Assigned(TipoEquip) then
      Result := FDao.Delete(TipoEquip)
    else
      Result := False;
  finally
    TipoEquip.Free;
  end;
end;

function TTipoEquipController.GetTipoEquip(CodiTEquip: Integer): TTipoEquip;
begin
  Result := FDao.Select(CodiTEquip);
end;

function TTipoEquipController.GetAllTipoEquip: TObjectList<TTipoEquip>;
begin
  Result := FDao.GetAll;
end;

end.

