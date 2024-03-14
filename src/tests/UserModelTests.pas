unit UserModelTests;

interface

uses
  DUnitX.TestFramework, UserModel, Security;

type

  [TestFixture]
  TUserModelTests = class(TObject)
  public
    [Test]
    procedure TestCreateUser;
    [Test]
    procedure TestSetAndGetNOME_USU;
    [Test]
    procedure TestSetAndGetPASS_USU;
    [Test]
    procedure TestSetAndGetCODI_USU;
  end;

implementation

procedure TUserModelTests.TestCreateUser;
var
  User: TUser;
begin
  User := TUser.Create('testUSER_USU', 'testPASS_USU');
  try
    Assert.IsNotNull(User);
  finally
    User.Free;
  end;
end;

procedure TUserModelTests.TestSetAndGetNOME_USU;
var
  User: TUser;
  NOME_USU: string;
begin
  User := TUser.Create('testNOME_USU', 'testUSER_USU', 'testPASS_USU', 'A', 0);
  try
    NOME_USU := 'newNOME_USU';
    User.NOME_USU := NOME_USU;
    Assert.AreEqual(NOME_USU, User.NOME_USU);
  finally
    User.Free;
  end;
end;

procedure TUserModelTests.TestSetAndGetPASS_USU;
var
  User: TUser;
  Password: string;
begin
  User := TUser.Create('testUsername', 'testPassword');
  try
    Password := 'newPassword';
    User.PASS_USU := Password;
    Assert.IsTrue(User.CheckPassword(User.PASS_USU), 'The password does not match');
  finally
    User.Free;
  end;
end;
procedure TUserModelTests.TestSetAndGetCODI_USU;
var
  User: TUser;
  CODI_USU: integer;
begin
  User := TUser.Create('testNOME_USU', 'testUSER_USU', 'testPASS_USU', 'A', 123);
  try
    CODI_USU := 456;
    User.CODI_USU := CODI_USU;
    Assert.AreEqual(CODI_USU, User.CODI_USU);
  finally
    User.Free;
  end;
end;

procedure TestSetPasswordWithHash;
var
  User: TUser;
  Password, PasswordHash: string;
begin
  Password := 'newPassword';
  PasswordHash := TSecurityService.HashPassword(Password);

  User := TUser.Create('testUsername', 'testPassword');
  try
    User.PASS_USU := PasswordHash;

    // Verifica se a senha armazenada   o hash e n o o texto original
    Assert.AreEqual(PasswordHash, User.PASS_USU);

    // Verifica se a senha ainda pode ser verificada corretamente
    Assert.IsTrue(User.CheckPassword(Password), 'The password does not match');
  finally
    User.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TUserModelTests);

end.

