unit EquipamentoDAO;

interface

uses
  EquipamentoModel,
  FireDAC.Comp.Client,
  System.SysUtils,
  EspacoDAO,
  System.Generics.Collections;

type
  IEquipamentoDAO = interface
    ['{ECF8C37E-C43C-4A0A-B43B-8B3FDED72B2C}']
    function Insert(Equipamento: TEquipamento): Integer;
    function Update(Equipamento: TEquipamento): Boolean;
    function Delete(Equipamento: TEquipamento): Boolean;
    function Select(CodiEquip: Integer): TEquipamento;
    function GetAll: TObjectList<TEquipamento>;
  end;

  TEquipamentoDAO = class(TInterfacedObject, IEquipamentoDAO)
  private
    function EquipamentoFromQuery(Query: TFDQuery): TEquipamento;
  public
    function Insert(Equipamento: TEquipamento): Integer;
    function Update(Equipamento: TEquipamento): Boolean;
    function Delete(Equipamento: TEquipamento): Boolean;
    function Select(CodiEquip: Integer): TEquipamento;
    function GetAll: TObjectList<TEquipamento>;
  end;

implementation

uses
  FDQueryFactory, TipoEquipDAO;

{ TEquipamentoDAO }

function TEquipamentoDAO.Insert(Equipamento: TEquipamento): Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'INSERT INTO CADEQUIP (DESC_EQUIP, DATA_EQUIP, DINSERT, DMANUT, STATUS, TIPO_EQUIP, ESPA_EQUIP) ' +
                        'VALUES (:DESC_EQUIP, :DATA_EQUIP, :DINSERT, :DMANUT, :STATUS, :TIPO_EQUIP, :ESPA_EQUIP) RETURNING CODI_EQUIP';
      Query.ParamByName('DESC_EQUIP').AsString := Equipamento.DescEquip;
      Query.ParamByName('DATA_EQUIP').AsDateTime := Equipamento.DataEquip;
      Query.ParamByName('DINSERT').AsDateTime := Now;
      Query.ParamByName('DMANUT').AsDateTime := Now;
      Query.ParamByName('STATUS').AsString := Equipamento.Status;
      Query.ParamByName('TIPO_EQUIP').AsInteger := Equipamento.TipoEquip.CodiTEquip;
      Query.ParamByName('ESPA_EQUIP').AsInteger := Equipamento.EspaEquip.CodiEsp;
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

function TEquipamentoDAO.Update(Equipamento: TEquipamento): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'UPDATE CADEQUIP SET DESC_EQUIP = :DESC_EQUIP, DATA_EQUIP = :DATA_EQUIP, DMANUT = :DMANUT, STATUS = :STATUS, ' +
                        'TIPO_EQUIP = :TIPO_EQUIP, ESPA_EQUIP = :ESPA_EQUIP WHERE CODI_EQUIP = :CODI_EQUIP';
      Query.ParamByName('CODI_EQUIP').AsInteger := Equipamento.CodiEquip;
      Query.ParamByName('DESC_EQUIP').AsString := Equipamento.DescEquip;
      Query.ParamByName('DATA_EQUIP').AsDateTime := Equipamento.DataEquip;
      Query.ParamByName('DMANUT').AsDateTime := Now;
      Query.ParamByName('STATUS').AsString := Equipamento.Status;
      Query.ParamByName('TIPO_EQUIP').AsInteger := Equipamento.TipoEquip.CodiTEquip;
      Query.ParamByName('ESPA_EQUIP').AsInteger := Equipamento.EspaEquip.CodiEsp;
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

function TEquipamentoDAO.Delete(Equipamento: TEquipamento): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'UPDATE CADEQUIP SET STATUS = ''I'' WHERE CODI_EQUIP = :CODI_EQUIP';
      Query.ParamByName('CODI_EQUIP').AsInteger := Equipamento.CodiEquip;
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

function TEquipamentoDAO.Select(CodiEquip: Integer): TEquipamento;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := 'SELECT * FROM CADEQUIP WHERE CODI_EQUIP = :CODI_EQUIP AND STATUS <> ''I''';
    Query.ParamByName('CODI_EQUIP').AsInteger := CodiEquip;
    Query.Open;
    if not Query.Eof then
      Result := EquipamentoFromQuery(Query)
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

function TEquipamentoDAO.GetAll: TObjectList<TEquipamento>;
var
  Query: TFDQuery;
  Equipamentos: TObjectList<TEquipamento>;
begin
  Equipamentos := TObjectList<TEquipamento>.Create;
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := 'SELECT * FROM CADEQUIP WHERE STATUS <> ''I''';
    Query.Open;
    while not Query.Eof do
    begin
      Equipamentos.Add(EquipamentoFromQuery(Query));
      Query.Next;
    end;
  finally
    Query.Free;
  end;
  Result := Equipamentos;
end;

function TEquipamentoDAO.EquipamentoFromQuery(Query: TFDQuery): TEquipamento;
var
  TipoEquipDAO: TTipoEquipDAO;
  EspacoDAO: TEspacoDAO;
begin
  Result := TEquipamento.Create;
  try
    Result.CodiEquip := Query.FieldByName('CODI_EQUIP').AsInteger;
    Result.DescEquip := Query.FieldByName('DESC_EQUIP').AsString;
    Result.DataEquip := Query.FieldByName('DATA_EQUIP').AsDateTime;
    Result.Dinsert := Query.FieldByName('DINSERT').AsDateTime;
    Result.Dmanut := Query.FieldByName('DMANUT').AsDateTime;
    Result.Status := Query.FieldByName('STATUS').AsString[1];

    TipoEquipDAO := TTipoEquipDAO.Create;
    try
      Result.TipoEquip := TipoEquipDAO.Select(Query.FieldByName('TIPO_EQUIP').AsInteger);
    finally
      TipoEquipDAO.Free;
    end;

    EspacoDAO := TEspacoDAO.Create;
    try
      Result.EspaEquip := EspacoDAO.Select(Query.FieldByName('ESPA_EQUIP').AsInteger);
    finally
      EspacoDAO.Free;
    end;
  except
    Result.Free;
    raise;
  end;
end;

end.
