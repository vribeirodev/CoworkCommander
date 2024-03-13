unit UserDAOTest;

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  DUnitX.TestFramework,
  UserModel,
  UserDAO,
  DBConn,
  DBConfig;

type

  [TestFixture]
  TUserDAOTest = class(TObject)
  private
    FUserDAO: TUserDAO;
    FUser: TUser;
    DBConfig: TDBConfig;
  public
    [Setup]
    procedure SetUp;
    [TearDown]
    procedure TearDown;
  published
    [Test]
    procedure TestInsertAndSelect;
    [Test]
    procedure TestUpdate;
    [Test]
    procedure TestGetAll;
    [Test]
    procedure TestDelete;
  end;

implementation

procedure TUserDAOTest.SetUp;
var
  UserTest: String;
  UserUsuTest: String;
begin
  DBConfig := TDBConfig.Create('C:\Users\Vinicius\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
                               'sysdba',
                                'masterkey',
                                'localhost',
                                '3050');
  TDBConn.SetConfig(DBConfig);


  FUserDAO := TUserDAO.Create;

  UserTest := 'testNOME_USU_' + FormatDateTime('yyyymmddhhnnss', Now);
  UserUsuTest := 'testUSER_USU_' + FormatDateTime('yyyymmddhhnnss', Now);

  FUser := TUser.Create(UserTest, UserUsuTest, 'tespass', 'A', 0);
end;

procedure TUserDAOTest.TearDown;
begin
  FUserDAO.Free;
  FUser.Free;
  DBConfig.Free;
end;

procedure TUserDAOTest.TestInsertAndSelect;
var
  NewUserID: Integer;
  User: TUser;
begin
  // Test Insert
  NewUserID := FUserDAO.Insert(FUser);
  FUser.CODI_USU := NewUserID;
  Assert.IsTrue(NewUserID > 0, 'Failed on Insert');

  // Test Select
  User := FUserDAO.Select(NewUserID);
  try
    Assert.IsNotNull(User, 'Failed on Select');
    Assert.AreEqual(FUser.NOME_USU, User.NOME_USU, 'NOME_USU does not match');
    Assert.IsTrue(User.CheckPassword(FUser.PASS_USU), 'PASS_USU does not match');
  finally
    User.Free;
  end;
end;

procedure TUserDAOTest.TestUpdate;
begin
  Assert.IsTrue(FUserDAO.Update(FUser), 'Failed on Update');
end;

procedure TUserDAOTest.TestGetAll;
var
  Users: TObjectList<TUser>;
begin
  Users := FUserDAO.GetAll;
  try
    Assert.IsTrue(Users.Count > 0, 'No users found');
  finally
    Users.Free;
  end;
end;

procedure TUserDAOTest.TestDelete;
begin
  Assert.IsTrue(FUserDAO.Delete(FUser), 'Failed on Delete');
end;

initialization
  TDUnitX.RegisterTestFixture(TUserDAOTest);

end.
