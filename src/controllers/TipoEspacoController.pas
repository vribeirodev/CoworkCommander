unit TipoEspacoController;

interface

uses
  TipoEspacoModel, TipoEspacoDAO, System.SysUtils, System.Generics.Collections;

type
  TTipoEspacoController = class
  private
    FDao: TTipoEspacoDAO;
  public
    constructor Create(Dao: TTipoEspacoDAO);
    destructor Destroy; override;

    function InsertTipoEspaco(const DescEsp, QntdEsp: string; const Status: Char): Integer;
    function UpdateTipoEspaco(TipoEspaco: TTipoEspaco): Boolean;
    function DeleteTipoEspaco(CodiEsp: Integer): Boolean;
    function GetTipoEspaco(CodiEsp: Integer): TTipoEspaco;
    function GetAllTipoEspaco: TObjectList<TTipoEspaco>;
  end;

implementation

{ TTipoEspacoController }

constructor TTipoEspacoController.Create(Dao: TTipoEspacoDAO);
begin
  inherited Create;
  FDao := Dao;
end;

destructor TTipoEspacoController.Destroy;
begin
  inherited;
end;

function TTipoEspacoController.InsertTipoEspaco(const DescEsp, QntdEsp: string; const Status: Char): Integer;
var
  TipoEspaco: TTipoEspaco;
begin
  TipoEspaco := TTipoEspaco.Create;
  try
    TipoEspaco.DescEsp := DescEsp;
    TipoEspaco.QntdEsp := QntdEsp;
    TipoEspaco.Dinsert := Now;
    TipoEspaco.Dmanut := Now;
    TipoEspaco.Status := Status;

    TipoEspaco.ValidarDados;
    Result := FDao.Insert(TipoEspaco);
  finally
    TipoEspaco.Free;
  end;
end;

function TTipoEspacoController.UpdateTipoEspaco(TipoEspaco: TTipoEspaco): Boolean;
begin
  TipoEspaco.ValidarDados;
  Result := FDao.Update(TipoEspaco);
end;

function TTipoEspacoController.DeleteTipoEspaco(CodiEsp: Integer): Boolean;
var
  TipoEspaco: TTipoEspaco;
begin
  TipoEspaco := FDao.Select(CodiEsp);
  try
    if Assigned(TipoEspaco) then
      Result := FDao.Delete(TipoEspaco)
    else
      Result := False;
  finally
    TipoEspaco.Free;
  end;
end;

function TTipoEspacoController.GetTipoEspaco(CodiEsp: Integer): TTipoEspaco;
begin
  Result := FDao.Select(CodiEsp);
end;

function TTipoEspacoController.GetAllTipoEspaco: TObjectList<TTipoEspaco>;
begin
  Result := FDao.GetAll;
end;

end.

