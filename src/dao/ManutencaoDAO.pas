unit ManutencaoDAO;

interface

uses
  ManutencaoModel, FireDAC.Comp.Client, System.SysUtils, System.Generics.Collections, EspacoDAO;

type
  IManutencaoDAO = interface
    ['{778D7F20-746F-499D-B16B-A4C5388D2A8B}']
    function Insert(Manutencao: TManutencao): Integer;
    function Update(Manutencao: TManutencao): Boolean;
    function Delete(Manutencao: TManutencao): Boolean;
    function Select(CodiManut: Integer): TManutencao;
    function GetAll: TObjectList<TManutencao>;
  end;

  TManutencaoDAO = class(TInterfacedObject, IManutencaoDAO)
  private
    function ManutencaoFromQuery(Query: TFDQuery): TManutencao;
  public
    function Insert(Manutencao: TManutencao): Integer;
    function Update(Manutencao: TManutencao): Boolean;
    function Delete(Manutencao: TManutencao): Boolean;
    function Select(CodiManut: Integer): TManutencao;
    function GetAll: TObjectList<TManutencao>;
  end;

implementation

uses
  FDQueryFactory;

{ TManutencaoDAO }

function TManutencaoDAO.Insert(Manutencao: TManutencao): Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'INSERT INTO CADMANUT (DESC_MANUT, DATA_MANUT, STAT_MANUT, DINSERT, DMANUT, STATUS, ESPA_MANUT) ' +
                        'VALUES (:DESC_MANUT, :DATA_MANUT, :STAT_MANUT, :DINSERT, :DMANUT, :STATUS, :ESPA_MANUT) RETURNING CODI_MANUT';
      Query.ParamByName('DESC_MANUT').AsString := Manutencao.DescManut;
      Query.ParamByName('DATA_MANUT').AsDate := Manutencao.DataManut;
      Query.ParamByName('STAT_MANUT').AsString := Manutencao.StatManut;
      Query.ParamByName('DINSERT').AsDateTime := Now;
      Query.ParamByName('DMANUT').AsDateTime := Now;
      Query.ParamByName('STATUS').AsString := Manutencao.Status;
      Query.ParamByName('ESPA_MANUT').AsInteger := Manutencao.EspaManut.CodiEsp;
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

function TManutencaoDAO.Update(Manutencao: TManutencao): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'UPDATE CADMANUT SET DESC_MANUT = :DESC_MANUT, DATA_MANUT = :DATA_MANUT, STAT_MANUT = :STAT_MANUT, ' +
                        'DMANUT = :DMANUT, STATUS = :STATUS, ESPA_MANUT = :ESPA_MANUT WHERE CODI_MANUT = :CODI_MANUT';
      Query.ParamByName('CODI_MANUT').AsInteger := Manutencao.CodiManut;
      Query.ParamByName('DESC_MANUT').AsString := Manutencao.DescManut;
      Query.ParamByName('DATA_MANUT').AsDate := Manutencao.DataManut;
      Query.ParamByName('STAT_MANUT').AsString := Manutencao.StatManut;
      Query.ParamByName('DMANUT').AsDateTime := Now;
      Query.ParamByName('STATUS').AsString := Manutencao.Status;
      Query.ParamByName('ESPA_MANUT').AsInteger := Manutencao.EspaManut.CodiEsp;
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

function TManutencaoDAO.Delete(Manutencao: TManutencao): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'UPDATE CADMANUT SET STATUS = ''I'' WHERE CODI_MANUT = :CODI_MANUT';
      Query.ParamByName('CODI_MANUT').AsInteger := Manutencao.CodiManut;
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

function TManutencaoDAO.Select(CodiManut: Integer): TManutencao;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := 'SELECT * FROM CADMANUT WHERE CODI_MANUT = :CODI_MANUT AND STATUS <> ''I''';
    Query.ParamByName('CODI_MANUT').AsInteger := CodiManut;
    Query.Open;
    if not Query.Eof then
      Result := ManutencaoFromQuery(Query)
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

function TManutencaoDAO.GetAll: TObjectList<TManutencao>;
var
  Query: TFDQuery;
  Manutencoes: TObjectList<TManutencao>;
begin
  Manutencoes := TObjectList<TManutencao>.Create;
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := 'SELECT * FROM CADMANUT WHERE STATUS <> ''I''';
    Query.Open;
    while not Query.Eof do
    begin
      Manutencoes.Add(ManutencaoFromQuery(Query));
      Query.Next;
    end;
  finally
    Query.Free;
  end;
  Result := Manutencoes;
end;

function TManutencaoDAO.ManutencaoFromQuery(Query: TFDQuery): TManutencao;
var
  EspacoDAO: TEspacoDAO;
begin
  Result := TManutencao.Create;
  try
    Result.CodiManut := Query.FieldByName('CODI_MANUT').AsInteger;
    Result.DescManut := Query.FieldByName('DESC_MANUT').AsString;
    Result.DataManut := Query.FieldByName('DATA_MANUT').AsDateTime;
    Result.StatManut := Query.FieldByName('STAT_MANUT').AsString[1];
    Result.Dinsert := Query.FieldByName('DINSERT').AsDateTime;
    Result.Dmanut := Query.FieldByName('DMANUT').AsDateTime;
    Result.Status := Query.FieldByName('STATUS').AsString[1];

    EspacoDAO := TEspacoDAO.Create;
    try
      Result.EspaManut := EspacoDAO.Select(Query.FieldByName('ESPA_MANUT').AsInteger);
    finally
      EspacoDAO.Free;
    end;
  except
    Result.Free;
    raise;
  end;
end;

end.
