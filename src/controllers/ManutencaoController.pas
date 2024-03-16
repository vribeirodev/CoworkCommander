unit ManutencaoController;

interface

uses
  ManutencaoModel, ManutencaoDAO, System.SysUtils, System.Generics.Collections;

type
  TManutencaoController = class
  private
    FManutencaoDAO: TManutencaoDAO;
  public
    constructor Create; // Ajustado para não incluir parâmetros
    destructor Destroy; override;

    function InsertManutencao(Manutencao: TManutencao): Integer;
    function UpdateManutencao(Manutencao: TManutencao): Boolean;
    function DeleteManutencao(CodiManut: Integer): Boolean;
    function GetManutencao(CodiManut: Integer): TManutencao;
    function GetAllManutencoes: TObjectList<TManutencao>;
  end;

implementation

{ TManutencaoController }

constructor TManutencaoController.Create;
begin
  inherited Create;
  FManutencaoDAO := TManutencaoDAO.Create;
end;

destructor TManutencaoController.Destroy;
begin
  FManutencaoDAO.Free;
  inherited;
end;

function TManutencaoController.InsertManutencao(Manutencao: TManutencao): Integer;
begin
  Manutencao.ValidarDados;
  Result := FManutencaoDAO.Insert(Manutencao);
end;

function TManutencaoController.UpdateManutencao(Manutencao: TManutencao): Boolean;
begin
  Manutencao.ValidarDados;
  Result := FManutencaoDAO.Update(Manutencao);
end;

function TManutencaoController.DeleteManutencao(CodiManut: Integer): Boolean;
var
  Manutencao: TManutencao;
begin
  Manutencao := FManutencaoDAO.Select(CodiManut);
  if Assigned(Manutencao) then
  try
    Result := FManutencaoDAO.Delete(Manutencao);
  finally
  end
  else
    Result := False;
end;

function TManutencaoController.GetManutencao(CodiManut: Integer): TManutencao;
begin
  Result := FManutencaoDAO.Select(CodiManut);
end;

function TManutencaoController.GetAllManutencoes: TObjectList<TManutencao>;
begin
  Result := FManutencaoDAO.GetAll;
end;

end.
