unit UserFactory;

interface

uses
  UserModel,
  UserFactoryIntf;

type
  TUserFactory = class(TInterfacedObject, IUserFactory)
  public
    function CreateUser(const NOME_USU, USER_USU, PASS_USU, STATUS: String; CODI_USU: integer): TUser; overload;
    function CreateUser(const NOME_USU, USER_USU: string): TUser; overload;
  end;

implementation

function TUserFactory.CreateUser(const NOME_USU, USER_USU, PASS_USU: string; const STATUS: String; CODI_USU: integer): TUser;
begin
  Result := TUser.Create(NOME_USU, USER_USU, PASS_USU, STATUS, CODI_USU);
end;

function TUserFactory.CreateUser(const NOME_USU, USER_USU: string): TUser;
begin
  Result := TUser.Create(NOME_USU, USER_USU);
end;

end.

