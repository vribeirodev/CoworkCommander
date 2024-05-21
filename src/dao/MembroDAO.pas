unit MembroDAO;

interface

uses
  MembroModel,
  FireDAC.Comp.Client,
  System.SysUtils,
  System.Generics.Collections;

type
  IMembroDAO = interface
    ['{8CC1BF1B-3BF4-4DF3-AA33-8713A1406DF0}']
    function Insert(Membro: TMembro): Integer;
    function Update(Membro: TMembro): Boolean;
    function Delete(Membro: TMembro): Boolean;
    function Select(CodiMemb: Integer): TMembro;
    function GetAll: TObjectList<TMembro>;
  end;

  TMembroDAO = class(TInterfacedObject, IMembroDAO)
  private
    function MembroFromQuery(Query: TFDQuery): TMembro;
  public
    function Insert(Membro: TMembro): Integer;
    function Update(Membro: TMembro): Boolean;
    function Delete(Membro: TMembro): Boolean;
    function Select(CodiMemb: Integer): TMembro;
    function GetAll: TObjectList<TMembro>;
  end;

implementation

uses
  FDQueryFactory;

{ TMembroDAO }

function TMembroDAO.Insert(Membro: TMembro): Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'INSERT INTO CADMEMB (NOME_MEMB, CPF_MEMB, EMAIL_MEMB, TELE_MEMB, DNASC_MEMB, DINSERT, DMANUT, STATUS) ' +
                        'VALUES (:NOME_MEMB, :CPF_MEMB, :EMAIL_MEMB, :TELE_MEMB, :DNASC_MEMB, :DINSERT, :DMANUT, :STATUS) RETURNING CODI_MEMB';
      Query.ParamByName('NOME_MEMB').AsString := Membro.NomeMemb;
      Query.ParamByName('CPF_MEMB').AsString := Membro.CpfMemb;
      Query.ParamByName('EMAIL_MEMB').AsString := Membro.EmailMemb;
      Query.ParamByName('TELE_MEMB').AsString := Membro.TeleMemb;
      Query.ParamByName('DNASC_MEMB').AsDate := Membro.DnascMemb;
      Query.ParamByName('DINSERT').AsDateTime := Now;
      Query.ParamByName('DMANUT').AsDateTime := Now;
      Query.ParamByName('STATUS').AsString := Membro.Status;
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

function TMembroDAO.Update(Membro: TMembro): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'UPDATE CADMEMB SET NOME_MEMB = :NOME_MEMB, CPF_MEMB = :CPF_MEMB, EMAIL_MEMB = :EMAIL_MEMB, ' +
                        'TELE_MEMB = :TELE_MEMB, DNASC_MEMB = :DNASC_MEMB, DMANUT = :DMANUT, STATUS = :STATUS ' +
                        'WHERE CODI_MEMB = :CODI_MEMB';
      Query.ParamByName('CODI_MEMB').AsInteger := Membro.CodiMemb;
      Query.ParamByName('NOME_MEMB').AsString := Membro.NomeMemb;
      Query.ParamByName('CPF_MEMB').AsString := Membro.CpfMemb;
      Query.ParamByName('EMAIL_MEMB').AsString := Membro.EmailMemb;
      Query.ParamByName('TELE_MEMB').AsString := Membro.TeleMemb;
      Query.ParamByName('DNASC_MEMB').AsDate := Membro.DnascMemb;
      Query.ParamByName('DMANUT').AsDateTime := Now;
      Query.ParamByName('STATUS').AsString := Membro.Status;
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

function TMembroDAO.Delete(Membro: TMembro): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := 'UPDATE CADMEMB SET STATUS = ''I'' WHERE CODI_MEMB = :CODI_MEMB';
      Query.ParamByName('CODI_MEMB').AsInteger := Membro.CodiMemb;
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

function TMembroDAO.Select(CodiMemb: Integer): TMembro;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := 'SELECT * FROM CADMEMB WHERE CODI_MEMB = :CODI_MEMB AND STATUS <> ''I''';
    Query.ParamByName('CODI_MEMB').AsInteger := CodiMemb;
    Query.Open;
    if not Query.Eof then
      Result := MembroFromQuery(Query)
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

function TMembroDAO.GetAll: TObjectList<TMembro>;
var
  Query: TFDQuery;
  Membros: TObjectList<TMembro>;
begin
  Membros := TObjectList<TMembro>.Create;
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := 'SELECT * FROM CADMEMB WHERE STATUS <> ''I''';
    Query.Open;
    while not Query.Eof do
    begin
      Membros.Add(MembroFromQuery(Query));
      Query.Next;
    end;
  finally
    Query.Free;
  end;
  Result := Membros;
end;

function TMembroDAO.MembroFromQuery(Query: TFDQuery): TMembro;
begin
  Result := TMembro.Create;
  try
    Result.CodiMemb := Query.FieldByName('CODI_MEMB').AsInteger;
    Result.NomeMemb := Query.FieldByName('NOME_MEMB').AsString;
    Result.CpfMemb := Query.FieldByName('CPF_MEMB').AsString;
    Result.EmailMemb := Query.FieldByName('EMAIL_MEMB').AsString;
    Result.TeleMemb := Query.FieldByName('TELE_MEMB').AsString;
    Result.DnascMemb := Query.FieldByName('DNASC_MEMB').AsDateTime;
    Result.Dinsert := Query.FieldByName('DINSERT').AsDateTime;
    Result.Dmanut := Query.FieldByName('DMANUT').AsDateTime;
    Result.Status := Query.FieldByName('STATUS').AsString;
  except
    Result.Free;
    raise;
  end;
end;

end.

