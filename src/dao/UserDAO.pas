unit UserDAO;

interface

uses
  UserModel,
  UserDAOIntf,
  FDQueryFactory,
  FireDAC.Comp.Client,
  FireDAC.Comp.UI,
  System.SysUtils,
  System.Generics.Collections;

const
  SQL_INSERT_USER             = 'INSERT INTO CADUSU (NOME_USU, USER_USU, PASS_USU, STATUS) VALUES (:NOME_USU, :USER_USU, :PASS_USU, :STATUS) RETURNING CODI_USU';
  SQL_UPDATE_USER             = 'UPDATE CADUSU SET NOME_USU = :NOME_USU, USER_USU = :USER_USU, PASS_USU = :PASS_USU, STATUS = :STATUS WHERE CODI_USU = :CODI_USU';
  SQL_DELETE_USER             = 'UPDATE CADUSU SET STATUS = ''I'' WHERE CODI_USU = :CODI_USU';
  SQL_SELECT_USER             = 'SELECT * FROM CADUSU WHERE CODI_USU = :CODI_USU AND STATUS <> ''I''';
  SQL_SELECT_ALL_USERS        = 'SELECT * FROM CADUSU WHERE STATUS <> ''I''';
  SQL_SELECT_USER_BY_USERNAME = 'SELECT * FROM CADUSU WHERE USER_USU = :USER_USU AND STATUS <> ''I''';

type
   TUserDAO = class(TInterfacedObject, IUserDAO)
  private
    function UserFromQuery(Query: TFDQuery): TUser;
  public
    function Insert(User: TUser): Integer;
    function Update(User: TUser): Boolean;
    function Delete(User: TUser): Boolean;
    function Select(UserID: Integer): TUser;
    function SelectByUsername(const Username: string): TUser;
    function GetAll: TObjectList<TUser>;
  end;

implementation

function TUserDAO.Insert(User: TUser): Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := SQL_INSERT_USER;
      Query.ParamByName('NOME_USU').AsString := User.NOME_USU;
      Query.ParamByName('USER_USU').AsString := User.USER_USU;
      Query.ParamByName('PASS_USU').AsString := User.PASS_USU;
      Query.ParamByName('STATUS').AsAnsiString := User.STATUS;
      Query.Open;
      Result := Query.Fields[0].AsInteger;
      Query.Connection.Commit;
    except
      on E: Exception do
      begin
        Query.Connection.Rollback;
        raise Exception.Create('Erro ao inserir o usuário: ' + E.Message);
      end;
    end;
  finally
    Query.Free;
  end;
end;

function TUserDAO.Update(User: TUser): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := SQL_UPDATE_USER;
      Query.ParamByName('NOME_USU').AsString := User.NOME_USU;
      Query.ParamByName('USER_USU').AsString := User.USER_USU;
      Query.ParamByName('PASS_USU').AsString := User.PASS_USU;
      Query.ParamByName('STATUS').AsAnsiString := User.STATUS;
      Query.ParamByName('CODI_USU').AsInteger := User.CODI_USU;
      Query.ExecSQL;
      Query.Connection.Commit;
      Result := True;
    except
      on E: Exception do
      begin
        Query.Connection.Rollback;
        raise Exception.Create('Erro ao atualizar o usuário: ' + E.Message);
      end;
    end;
  finally
    Query.Free;
  end;
end;

function TUserDAO.Delete(User: TUser): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.Connection.StartTransaction;
    try
      Query.SQL.Text := SQL_DELETE_USER;
      Query.ParamByName('CODI_USU').AsInteger := User.CODI_USU;
      Query.ExecSQL;
      Query.Connection.Commit;
      Result := True;
    except
      on E: Exception do
      begin
        Query.Connection.Rollback;
        raise Exception.Create('Erro ao deletar o usuário: ' + E.Message);
      end;
    end;
  finally
    Query.Free;
  end;
end;

function TUserDAO.Select(UserID: Integer): TUser;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    try
      Query.SQL.Text := SQL_SELECT_USER;
      Query.ParamByName('CODI_USU').AsInteger := UserID;
      Query.Open;
      if not Query.Eof then
        Result := UserFromQuery(Query)
      else
        Result := nil;
    except
      on E: Exception do
        raise Exception.Create('Erro ao buscar o usuário: ' + E.Message);
    end;
  finally
    Query.Free;
  end;
end;

function TUserDAO.SelectByUsername(const Username: string): TUser;
var
  Query: TFDQuery;
begin
  Query := TFDQueryFactory.CreateQuery;
  try
    try
      Query.SQL.Text := SQL_SELECT_USER_BY_USERNAME;
      Query.ParamByName('USER_USU').AsString := Username;
      Query.Open;
      if not Query.Eof then
        Result := UserFromQuery(Query)
      else
        Result := nil;
    except
      on E: Exception do
        raise Exception.Create('Erro ao buscar o usuário: ' + E.Message);
    end;
  finally
    Query.Free;
  end;
end;

function TUserDAO.GetAll: TObjectList<TUser>;
var
  Query: TFDQuery;
  Users: TObjectList<TUser>;
begin
  Users := TObjectList<TUser>.Create;
  Query := TFDQueryFactory.CreateQuery;
  try
    Query.SQL.Text := SQL_SELECT_ALL_USERS;
    Query.Open;
    while not Query.Eof do
    begin
      Users.Add(UserFromQuery(Query));
      Query.Next;
    end;
  finally
    Query.Free;
  end;
  Result := Users;
end;

function TUserDAO.UserFromQuery(Query: TFDQuery): TUser;
begin
  Result := TUser.Create(Query.FieldByName('NOME_USU').AsString,
                         Query.FieldByName('USER_USU').AsString,
                         Query.FieldByName('PASS_USU').AsString,
                         Query.FieldByName('STATUS').AsString,
                         Query.FieldByName('CODI_USU').AsInteger);
end;

end.

