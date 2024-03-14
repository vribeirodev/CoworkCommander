unit UserController;

interface

uses
  UserModel,
  UserDAO,
  UserDAOIntf,
  UserValidator,
  UserFactoryIntf,
  System.Hash,
  System.Classes,
  System.SysUtils,
  FireDAC.Comp.UI,
  System.Generics.Collections;

type
  TUserController = class
  private
    FDAO          : IUserDAO;
    FUserFactory  : IUserFactory;
  public
    constructor Create(const DAO: IUserDAO; const UserFactory: IUserFactory);
    destructor  Destroy; override;

    function CreateUser(const NOME_USU, USER_USU, PASS_USU, STATUS: String): Integer;
    function UpdateUser(User: TUser): Boolean;
    function DeleteUser(User: TUser): Boolean;
    function GetUser(UserID: Integer): TUser;
    function GetAllUsers: TObjectList<TUser>;

    function AuthenticateUser(User: TUser): Boolean;
  end;

implementation

constructor TUserController.Create(const DAO: IUserDAO; const UserFactory: IUserFactory);
begin
  FDAO := DAO;
  FUserFactory := UserFactory;
end;

destructor TUserController.Destroy;
begin
  inherited;
end;

function TUserController.GetAllUsers: TObjectList<TUser>;
begin
  Result := FDAO.GetAll;
end;

function TUserController.CreateUser(const NOME_USU, USER_USU, PASS_USU, STATUS: string): Integer;
var
  ValidationResult: string;
  User: TUser;
begin
  ValidationResult := TUserValidator.Validate(USER_USU, PASS_USU);
  if ValidationResult <> '' then
    raise Exception.Create(ValidationResult);

  User := FUserFactory.CreateUser(NOME_USU, USER_USU, PASS_USU, 'A', 0);
  try
    Result := FDAO.Insert(User);
  finally
    User.Free;
  end;
end;

function TUserController.UpdateUser(User: TUser): Boolean;
begin
  Result := FDAO.Update(User);
end;

function TUserController.DeleteUser(User: TUser): Boolean;
begin
  Result := FDAO.Delete(User);
end;

function TUserController.GetUser(UserID: Integer): TUser;
begin
  Result := FDAO.Select(UserID);
end;

function TUserController.AuthenticateUser(User: TUser): Boolean;
var
  UserDB: TUser;
begin
  UserDB := FDAO.SelectByUsername(User.USER_USU);
  if Assigned(UserDB) then
  try
    Result := UserDB.CheckPassword(User.PASS_USU);
  finally
    UserDB.Free;
  end
  else
    Result := False;
end;

end.

