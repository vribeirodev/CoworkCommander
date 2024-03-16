unit MembroController;

interface

uses
  MembroModel, MembroDAO, System.SysUtils, System.Generics.Collections;

type
  TMembroController = class
  private
    FMembroDAO: TMembroDAO;
  public
    constructor Create;
    destructor Destroy; override;

    function InsertMembro(Membro: TMembro): Integer;
    function UpdateMembro(Membro: TMembro): Boolean;
    function DeleteMembro(CodiMemb: Integer): Boolean;
    function GetMembro(CodiMemb: Integer): TMembro;
    function GetAllMembros: TObjectList<TMembro>;
  end;

implementation

{ TMembroController }

constructor TMembroController.Create;
begin
  inherited Create;
  FMembroDAO := TMembroDAO.Create;
end;

destructor TMembroController.Destroy;
begin
  FMembroDAO.Free;
  inherited;
end;

function TMembroController.InsertMembro(Membro: TMembro): Integer;
begin
  Membro.ValidarDados;
  Result := FMembroDAO.Insert(Membro);
end;

function TMembroController.UpdateMembro(Membro: TMembro): Boolean;
begin
  Membro.ValidarDados;
  Result := FMembroDAO.Update(Membro);
end;

function TMembroController.DeleteMembro(CodiMemb: Integer): Boolean;
var
  Membro: TMembro;
begin
  Membro := FMembroDAO.Select(CodiMemb);
  if Assigned(Membro) then
  try
    Result := FMembroDAO.Delete(Membro);
  finally
    Membro.Free;
  end
  else
    Result := False;
end;

function TMembroController.GetMembro(CodiMemb: Integer): TMembro;
begin
  Result := FMembroDAO.Select(CodiMemb);
end;

function TMembroController.GetAllMembros: TObjectList<TMembro>;
begin
  Result := FMembroDAO.GetAll;
end;

end.
