unit ReservaController;

interface

uses
  ReservaModel, ReservaDAO, System.SysUtils, System.Generics.Collections;

type
  TReservaController = class
  private
    FReservaDAO: TReservaDAO;
  public
    constructor Create;
    destructor Destroy; override;

    function InsertReserva(Reserva: TReserva): Integer;
    function UpdateReserva(Reserva: TReserva): Boolean;
    function DeleteReserva(CodiRes: Integer): Boolean;
    function GetReserva(CodiRes: Integer): TReserva;
    function GetAllReservas: TObjectList<TReserva>;
  end;

implementation

{ TReservaController }

constructor TReservaController.Create;
begin
  inherited Create;
  FReservaDAO := TReservaDAO.Create;
end;

destructor TReservaController.Destroy;
begin
  FReservaDAO.Free;
  inherited;
end;

function TReservaController.InsertReserva(Reserva: TReserva): Integer;
begin
  // Aqui você pode adicionar validações ou regras de negócios antes de inserir a reserva
  Result := FReservaDAO.Insert(Reserva);
end;

function TReservaController.UpdateReserva(Reserva: TReserva): Boolean;
begin
  // Aqui você pode adicionar validações ou regras de negócios antes de atualizar a reserva
  Result := FReservaDAO.Update(Reserva);
end;

function TReservaController.DeleteReserva(CodiRes: Integer): Boolean;
var
  Reserva: TReserva;
begin
  Reserva := FReservaDAO.Select(CodiRes);
  if Assigned(Reserva) then
  try
    Result := FReservaDAO.Delete(Reserva);
  finally
    Reserva.Free;
  end
  else
    Result := False;
end;

function TReservaController.GetReserva(CodiRes: Integer): TReserva;
begin
  Result := FReservaDAO.Select(CodiRes);
end;

function TReservaController.GetAllReservas: TObjectList<TReserva>;
begin
  Result := FReservaDAO.GetAll;
end;

end.

