unit TipoEspacoDAO;

interface

uses
  TipoEspacoModel, FireDAC.Comp.Client, System.SysUtils, System.Generics.Collections;

type
  ITipoEspacoDAO = interface
    ['{08462674-F3FE-4A4C-B0FB-266119B4597F}']
    function Insert(TipoEspaco: TTipoEspaco): Integer;
    function Update(TipoEspaco: TTipoEspaco): Boolean;
    function Delete(TipoEspaco: TTipoEspaco): Boolean;
    function Select(CodiEsp: Integer): TTipoEspaco;
    function GetAll: TObjectList<TTipoEspaco>;
  end;

  TTipoEspacoDAO = class(TInterfacedObject, ITipoEspacoDAO)
  private
    function TipoEspacoFromQuery(Query: TFDQuery): TTipoEspaco;
  public
    function Insert(TipoEspaco: TTipoEspaco): Integer;
    function Update(TipoEspaco: TTipoEspaco): Boolean;
    function Delete(TipoEspaco: TTipoEspaco): Boolean;
    function Select(CodiEsp: Integer): TTipoEspaco;
    function GetAll: TObjectList<TTipoEspaco>;
  end;

implementation

uses
  FDQueryFactory;

{ TTipoEspacoDAO }

function TTipoEspacoDAO.Insert(TipoEspaco: TTipoEspaco): Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'INSERT INTO CADTIPOESP (DESC_TESP, QNTD_TESP, DINSERT, DMANUT, STATUS) ' +
                        'VALUES (:DESC_TESP, :QNTD_TESP, :DINSERT, :DMANUT, :STATUS) RETURNING CODI_TESP';
      Query.ParamByName('DESC_TESP').AsString := TipoEspaco.DescEsp;
      Query.ParamByName('QNTD_TESP').AsString := TipoEspaco.QntdEsp;
      Query.ParamByName('DINSERT').AsDateTime := Now;
      Query.ParamByName('DMANUT').AsDateTime := Now;
      Query.ParamByName('STATUS').AsString := TipoEspaco.Status;
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

function TTipoEspacoDAO.Update(TipoEspaco: TTipoEspaco): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'UPDATE CADTIPOESP SET DESC_TESP = :DESC_TESP, QNTD_TESP = :QNTD_TESP, DMANUT = :DMANUT, STATUS = :STATUS ' +
                        'WHERE CODI_TESP = :CODI_TESP';
      Query.ParamByName('CODI_TESP').AsInteger := TipoEspaco.CodiEsp;
      Query.ParamByName('DESC_TESP').AsString := TipoEspaco.DescEsp;
      Query.ParamByName('QNTD_TESP').AsString := TipoEspaco.QntdEsp;
      Query.ParamByName('DMANUT').AsDateTime := Now;
      Query.ParamByName('STATUS').AsString := TipoEspaco.Status;
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

function TTipoEspacoDAO.Delete(TipoEspaco: TTipoEspaco): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'UPDATE CADTIPOESP SET STATUS = ''I'' WHERE CODI_TESP = :CODI_TESP';
      Query.ParamByName('CODI_TESP').AsInteger := TipoEspaco.CodiEsp;
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

function TTipoEspacoDAO.Select(CodiEsp: Integer): TTipoEspaco;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := 'SELECT * FROM CADTIPOESP WHERE CODI_TESP = :CODI_TESP AND STATUS <> ''I''';
    Query.ParamByName('CODI_TESP').AsInteger := CodiEsp;
    Query.Open;
    if not Query.Eof then
      Result := TipoEspacoFromQuery(Query)
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

function TTipoEspacoDAO.GetAll: TObjectList<TTipoEspaco>;
var
  Query: TFDQuery;
  TipoEspacos: TObjectList<TTipoEspaco>;
begin
  TipoEspacos := TObjectList<TTipoEspaco>.Create;
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := 'SELECT * FROM CADTIPOESP WHERE STATUS <> ''I''';
    Query.Open;
    while not Query.Eof do
    begin
      TipoEspacos.Add(TipoEspacoFromQuery(Query));
      Query.Next;
    end;
  finally
    Query.Free;
  end;
  Result := TipoEspacos;
end;

function TTipoEspacoDAO.TipoEspacoFromQuery(Query: TFDQuery): TTipoEspaco;
begin
  Result := TTipoEspaco.Create;
  try
    Result.CodiEsp := Query.FieldByName('CODI_TESP').AsInteger;
    Result.DescEsp := Query.FieldByName('DESC_TESP').AsString;
    Result.QntdEsp := Query.FieldByName('QNTD_TESP').AsString;
    Result.Dinsert := Query.FieldByName('DINSERT').AsDateTime;
    Result.Dmanut := Query.FieldByName('DMANUT').AsDateTime;
    Result.Status := Query.FieldByName('STATUS').AsString[1];
  except
    Result.Free;
    raise;
  end;
end;

end.

