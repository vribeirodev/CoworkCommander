unit ReservaDAO;

interface

uses
  ReservaModel, EspacoDAO, MembroDAO, FireDAC.Comp.Client, System.SysUtils, System.Generics.Collections;

type
  IReservaDAO = interface
    ['{ECA02240-C870-4175-BCDC-39A82DE6144F}']
    function Insert(Reserva: TReserva): Integer;
    function Update(Reserva: TReserva): Boolean;
    function Delete(Reserva: TReserva): Boolean;
    function Select(CodiRes: Integer): TReserva;
    function GetAll: TObjectList<TReserva>;
  end;

  TReservaDAO = class(TInterfacedObject, IReservaDAO)
  private
    function ReservaFromQuery(Query: TFDQuery): TReserva;
  public
    function Insert(Reserva: TReserva): Integer;
    function Update(Reserva: TReserva): Boolean;
    function Delete(Reserva: TReserva): Boolean;
    function Select(CodiRes: Integer): TReserva;
    function GetAll: TObjectList<TReserva>;
  end;

implementation

uses
  FDQueryFactory;

{ TReservaDAO }

function TReservaDAO.Insert(Reserva: TReserva): Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'INSERT INTO CABRESERVA (DINICIO_RES, DFIM_RES, DINSERT, DMANUT, STATUS, ESPA_RES, MEMB_RES) ' +
                        'VALUES (:DINICIO_RES, :DFIM_RES, :DINSERT, :DMANUT, :STATUS, :ESPA_RES, :MEMB_RES) RETURNING CODI_RES';
      Query.ParamByName('DINICIO_RES').AsDateTime := Reserva.DinicioRes;
      Query.ParamByName('DFIM_RES').AsDateTime := Reserva.DfimRes;
      Query.ParamByName('DINSERT').AsDateTime := Now;
      Query.ParamByName('DMANUT').AsDateTime := Now;
      Query.ParamByName('STATUS').AsString := Reserva.Status;
      Query.ParamByName('ESPA_RES').AsInteger := Reserva.EspaRes.CodiEsp;
      Query.ParamByName('MEMB_RES').AsInteger := Reserva.MembRes.CodiMemb;
      Query.Open;
      Result := Query.Fields[0].AsInteger;
      Query.Connection.Commit;
    except
      on E: Exception do
      begin
        Query.Connection.Rollback;
        raise;
      end;
    end;
  finally
    Query.Free;
  end;
end;

function TReservaDAO.Update(Reserva: TReserva): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'UPDATE CABRESERVA SET DINICIO_RES = :DINICIO_RES, DFIM_RES = :DFIM_RES, DMANUT = :DMANUT, STATUS = :STATUS, ' +
                        'ESPA_RES = :ESPA_RES, MEMB_RES = :MEMB_RES WHERE CODI_RES = :CODI_RES';
      Query.ParamByName('CODI_RES').AsInteger := Reserva.CodiRes;
      Query.ParamByName('DINICIO_RES').AsDateTime := Reserva.DinicioRes;
      Query.ParamByName('DFIM_RES').AsDateTime := Reserva.DfimRes;
      Query.ParamByName('DMANUT').AsDateTime := Now;
      Query.ParamByName('STATUS').AsString := Reserva.Status;
      Query.ParamByName('ESPA_RES').AsInteger := Reserva.EspaRes.CodiEsp;
      Query.ParamByName('MEMB_RES').AsInteger := Reserva.MembRes.CodiMemb;
      Query.ExecSQL;
      Query.Connection.Commit;
      Result := True;
    except
      on E: Exception do
      begin
        Query.Connection.Rollback;
        raise;
      end;
    end;
  finally
    Query.Free;
  end;
end;

function TReservaDAO.Delete(Reserva: TReserva): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'UPDATE CABRESERVA SET STATUS = ''I'' WHERE CODI_RES = :CODI_RES';
      Query.ParamByName('CODI_RES').AsInteger := Reserva.CodiRes;
      Query.ExecSQL;
      Query.Connection.Commit;
      Result := True;
    except
      on E: Exception do
      begin
        Query.Connection.Rollback;
        raise;
      end;
    end;
  finally
    Query.Free;
  end;
end;

function TReservaDAO.Select(CodiRes: Integer): TReserva;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := 'SELECT * FROM CABRESERVA WHERE CODI_RES = :CODI_RES AND STATUS <> ''I''';
    Query.ParamByName('CODI_RES').AsInteger := CodiRes;
    Query.Open;
    if not Query.Eof then
      Result := ReservaFromQuery(Query)
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

function TReservaDAO.GetAll: TObjectList<TReserva>;
var
  Query: TFDQuery;
  Reservas: TObjectList<TReserva>;
begin
  Reservas := TObjectList<TReserva>.Create;
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := 'SELECT * FROM CABRESERVA WHERE STATUS <> ''I''';
    Query.Open;
    while not Query.Eof do
    begin
      Reservas.Add(ReservaFromQuery(Query));
      Query.Next;
    end;
  finally
    Query.Free;
  end;
  Result := Reservas;
end;

function TReservaDAO.ReservaFromQuery(Query: TFDQuery): TReserva;
var
  EspacoDAO: TEspacoDAO;
  MembroDAO: TMembroDAO;
begin
  Result := TReserva.Create;
  try
    Result.CodiRes := Query.FieldByName('CODI_RES').AsInteger;
    Result.DinicioRes := Query.FieldByName('DINICIO_RES').AsDateTime;
    Result.DfimRes := Query.FieldByName('DFIM_RES').AsDateTime;
    Result.Dinsert := Query.FieldByName('DINSERT').AsDateTime;
    Result.Dmanut := Query.FieldByName('DMANUT').AsDateTime;
    Result.Status := Query.FieldByName('STATUS').AsString[1];

    EspacoDAO := TEspacoDAO.Create;
    try
      Result.EspaRes := EspacoDAO.Select(Query.FieldByName('ESPA_RES').AsInteger);
    finally
      EspacoDAO.Free;
    end;

    MembroDAO := TMembroDAO.Create;
    try
      Result.MembRes := MembroDAO.Select(Query.FieldByName('MEMB_RES').AsInteger);
    finally
      MembroDAO.Free;
    end;
  except
    Result.Free;
    raise;
  end;
end;

end.
