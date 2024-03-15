unit EspacoDAO;

interface

uses
  EspacoModel, FireDAC.Comp.Client, System.SysUtils, System.Generics.Collections, TipoEspacoDAO;

type
  IEspacoDAO = interface
    ['{4507ACD4-2889-4016-BD3E-367D0E08801F}']
    function Insert(Espaco: TEspaco): Integer;
    function Update(Espaco: TEspaco): Boolean;
    function Delete(Espaco: TEspaco): Boolean;
    function Select(CodiEsp: Integer): TEspaco;
    function GetAll: TObjectList<TEspaco>;
  end;

  TEspacoDAO = class(TInterfacedObject, IEspacoDAO)
  private
    function EspacoFromQuery(Query: TFDQuery): TEspaco;
  public
    function Insert(Espaco: TEspaco): Integer;
    function Update(Espaco: TEspaco): Boolean;
    function Delete(Espaco: TEspaco): Boolean;
    function Select(CodiEsp: Integer): TEspaco;
    function GetAll: TObjectList<TEspaco>;
  end;

implementation

uses
  FDQueryFactory;

{ TEspacoDAO }

function TEspacoDAO.Insert(Espaco: TEspaco): Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'INSERT INTO CADESP (DESC_ESP, STAT_ESP, DINSERT, DMANUT, STATUS, TIPO_ESP) ' +
                        'VALUES (:DESC_ESP, :STAT_ESP, :DINSERT, :DMANUT, :STATUS, :TIPO_ESP) RETURNING CODI_ESP';
      Query.ParamByName('DESC_ESP').AsString := Espaco.DescEsp;
      Query.ParamByName('STAT_ESP').AsString := Espaco.StatEsp;
      Query.ParamByName('DINSERT').AsDateTime := Now;
      Query.ParamByName('DMANUT').AsDateTime := Now;
      Query.ParamByName('STATUS').AsString := Espaco.Status;
      Query.ParamByName('TIPO_ESP').AsInteger := Espaco.TipoEsp.CodiEsp;
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

function TEspacoDAO.Update(Espaco: TEspaco): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'UPDATE CADESP SET DESC_ESP = :DESC_ESP, STAT_ESP = :STAT_ESP, DMANUT = :DMANUT, STATUS = :STATUS, TIPO_ESP = :TIPO_ESP ' +
                        'WHERE CODI_ESP = :CODI_ESP';
      Query.ParamByName('CODI_ESP').AsInteger := Espaco.CodiEsp;
      Query.ParamByName('DESC_ESP').AsString := Espaco.DescEsp;
      Query.ParamByName('STAT_ESP').AsString := Espaco.StatEsp;
      Query.ParamByName('DMANUT').AsDateTime := Now;
      Query.ParamByName('STATUS').AsString := Espaco.Status;
      Query.ParamByName('TIPO_ESP').AsInteger := Espaco.TipoEsp.CodiEsp;
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

function TEspacoDAO.Delete(Espaco: TEspaco): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'UPDATE CADESP SET STATUS = ''I'' WHERE CODI_ESP = :CODI_ESP';
      Query.ParamByName('CODI_ESP').AsInteger := Espaco.CodiEsp;
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

function TEspacoDAO.Select(CodiEsp: Integer): TEspaco;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := 'SELECT * FROM CADESP WHERE CODI_ESP = :CODI_ESP AND STATUS <> ''I''';
    Query.ParamByName('CODI_ESP').AsInteger := CodiEsp;
    Query.Open;
    if not Query.Eof then
      Result := EspacoFromQuery(Query)
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

function TEspacoDAO.GetAll: TObjectList<TEspaco>;
var
  Query: TFDQuery;
  Espacos: TObjectList<TEspaco>;
begin
  Espacos := TObjectList<TEspaco>.Create;
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := 'SELECT * FROM CADESP WHERE STATUS <> ''I''';
    Query.Open;
    while not Query.Eof do
    begin
      Espacos.Add(EspacoFromQuery(Query));
      Query.Next;
    end;
  finally
    Query.Free;
  end;
  Result := Espacos;
end;

function TEspacoDAO.EspacoFromQuery(Query: TFDQuery): TEspaco;
var
  TipoEspacoDAO: TTipoEspacoDAO;
begin
  Result := TEspaco.Create;
  try
    Result.CodiEsp := Query.FieldByName('CODI_ESP').AsInteger;
    Result.DescEsp := Query.FieldByName('DESC_ESP').AsString;
    Result.StatEsp := Query.FieldByName('STAT_ESP').AsString[1];
    Result.Dinsert := Query.FieldByName('DINSERT').AsDateTime;
    Result.Dmanut := Query.FieldByName('DMANUT').AsDateTime;
    Result.Status := Query.FieldByName('STATUS').AsString[1];

    // Carregar TipoEsp associado
    TipoEspacoDAO := TTipoEspacoDAO.Create;
    try
      Result.TipoEsp := TipoEspacoDAO.Select(Query.FieldByName('TIPO_ESP').AsInteger);
    finally
      TipoEspacoDAO.Free;
    end;
  except
    Result.Free;
    raise;
  end;
end;

end.

