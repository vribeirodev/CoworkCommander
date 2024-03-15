unit TipoEquipDAO;

interface

uses
  TipoEquipModel,
  FireDAC.Comp.Client,
  System.SysUtils,
  System.Generics.Collections;

type
  ITipoEquipDAO = interface
    ['{4CE2CEC2-4ABC-41BE-ABEA-88648B02E64D}']
    function Insert(TipoEquip: TTipoEquip): Integer;
    function Update(TipoEquip: TTipoEquip): Boolean;
    function Delete(TipoEquip: TTipoEquip): Boolean;
    function Select(CodiTEquip: Integer): TTipoEquip;
    function GetAll: TObjectList<TTipoEquip>;
  end;

  TTipoEquipDAO = class(TInterfacedObject, ITipoEquipDAO)
  private
    function TipoEquipFromQuery(Query: TFDQuery): TTipoEquip;
  public
    function Insert(TipoEquip: TTipoEquip): Integer;
    function Update(TipoEquip: TTipoEquip): Boolean;
    function Delete(TipoEquip: TTipoEquip): Boolean;
    function Select(CodiTEquip: Integer): TTipoEquip;
    function GetAll: TObjectList<TTipoEquip>;
  end;

implementation

uses
  FDQueryFactory;

{ TTipoEquipDAO }

function TTipoEquipDAO.Insert(TipoEquip: TTipoEquip): Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'INSERT INTO CADTIPOEQUIP (DESC_TEQUIP, DINSERT, DMANUT, STATUS) ' +
                        'VALUES (:DESC_TEQUIP, :DINSERT, :DMANUT, :STATUS) RETURNING CODI_TEQUIP';
      Query.ParamByName('DESC_TEQUIP').AsString := TipoEquip.DescTEquip;
      Query.ParamByName('DINSERT').AsDateTime := Now;
      Query.ParamByName('DMANUT').AsDateTime := Now;
      Query.ParamByName('STATUS').AsString := TipoEquip.Status;
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

function TTipoEquipDAO.Update(TipoEquip: TTipoEquip): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'UPDATE CADTIPOEQUIP SET DESC_TEQUIP = :DESC_TEQUIP, DMANUT = :DMANUT, STATUS = :STATUS ' +
                        'WHERE CODI_TEQUIP = :CODI_TEQUIP';
      Query.ParamByName('CODI_TEQUIP').AsInteger := TipoEquip.CodiTEquip;
      Query.ParamByName('DESC_TEQUIP').AsString := TipoEquip.DescTEquip;
      Query.ParamByName('DMANUT').AsDateTime := Now;
      Query.ParamByName('STATUS').AsString := TipoEquip.Status;
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

function TTipoEquipDAO.Delete(TipoEquip: TTipoEquip): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'UPDATE CADTIPOEQUIP SET STATUS = ''I'' WHERE CODI_TEQUIP = :CODI_TEQUIP';
      Query.ParamByName('CODI_TEQUIP').AsInteger := TipoEquip.CodiTEquip;
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

function TTipoEquipDAO.Select(CodiTEquip: Integer): TTipoEquip;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := 'SELECT * FROM CADTIPOEQUIP WHERE CODI_TEQUIP = :CODI_TEQUIP AND STATUS <> ''I''';
    Query.ParamByName('CODI_TEQUIP').AsInteger := CodiTEquip;
    Query.Open;
    if not Query.Eof then
      Result := TipoEquipFromQuery(Query)
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

function TTipoEquipDAO.GetAll: TObjectList<TTipoEquip>;
var
  Query: TFDQuery;
  TipoEquips: TObjectList<TTipoEquip>;
begin
  TipoEquips := TObjectList<TTipoEquip>.Create;
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := 'SELECT * FROM CADTIPOEQUIP WHERE STATUS <> ''I''';
    Query.Open;
    while not Query.Eof do
    begin
      TipoEquips.Add(TipoEquipFromQuery(Query));
      Query.Next;
    end;
  finally
    Query.Free;
  end;
  Result := TipoEquips;
end;

function TTipoEquipDAO.TipoEquipFromQuery(Query: TFDQuery): TTipoEquip;
begin
  Result := TTipoEquip.Create;
  try
    Result.CodiTEquip := Query.FieldByName('CODI_TEQUIP').AsInteger;
    Result.DescTEquip := Query.FieldByName('DESC_TEQUIP').AsString;
    Result.Dinsert := Query.FieldByName('DINSERT').AsDateTime;
    Result.Dmanut := Query.FieldByName('DMANUT').AsDateTime;
    Result.Status := Query.FieldByName('STATUS').AsString[1];
  except
    Result.Free;
    raise;
  end;
end;

end.
