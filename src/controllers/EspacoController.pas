unit EspacoController;

interface

uses
  EspacoModel, EspacoDAO, TipoEspacoModel, System.SysUtils, System.Generics.Collections;

type
  TEspacoController = class
  private
    FDao: TEspacoDAO;
  public
    constructor Create(Dao: TEspacoDAO);
    destructor Destroy; override;

    function InsertEspaco(Espaco: TEspaco): Integer;
    function UpdateEspaco(Espaco: TEspaco): Boolean;
    function DeleteEspaco(Espaco: TEspaco): Boolean;
    function GetEspaco(CodiEsp: Integer): TEspaco;
    function GetAllEspaco: TObjectList<TEspaco>;
  end;

implementation

{ TEspacoController }

constructor TEspacoController.Create(Dao: TEspacoDAO);
begin
  inherited Create;
  FDao := Dao;
end;

destructor TEspacoController.Destroy;
begin
  inherited;
end;

function TEspacoController.InsertEspaco(Espaco: TEspaco): Integer;
begin
  Espaco.ValidarDados;
  Result := FDao.Insert(Espaco);
end;

function TEspacoController.UpdateEspaco(Espaco: TEspaco): Boolean;
begin
  Espaco.ValidarDados;
  Result := FDao.Update(Espaco);
end;

function TEspacoController.DeleteEspaco(Espaco: TEspaco): Boolean;
begin
  Result := FDao.Delete(Espaco);
end;

function TEspacoController.GetEspaco(CodiEsp: Integer): TEspaco;
begin
  Result := FDao.Select(CodiEsp);
end;

function TEspacoController.GetAllEspaco: TObjectList<TEspaco>;
begin
  Result := FDao.GetAll;
end;

end.
