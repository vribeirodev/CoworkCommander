unit UserControllerTests;

interface

uses
  DUnitX.TestFramework,
  Delphi.Mocks,
  UserController,
  UserDAOIntf,
  UserFactoryIntf,
  UserModel,
  System.Generics.Collections;

type

  [TestFixture]
  TUserControllerTest = class(TObject)
  private
    FUserController: TUserController;
    FUserDAOMock: TMock<IUserDAO>;
    FUserFactoryMock: TMock<IUserFactory>;
    TestUser: TUser;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure UpdateUser_WithValidParameters_ShouldReturnTrue;
    [Test]
    procedure DeleteUser_WithValidParameters_ShouldReturnTrue;
    [Test]
    procedure GetUser_WithValidID_ShouldReturnUser;
    [Test]
    procedure GetAllUsers_ShouldReturnList;
    [Test]
    procedure AuthenticateUser_WithValidCredentials_ShouldReturnTrue;
  end;

implementation

procedure TUserControllerTest.Setup;
var
  TestUserID: Integer;
  TestUserList: TObjectList<TUser>;
begin
  FUserDAOMock := TMock<IUserDAO>.Create;
  FUserFactoryMock := TMock<IUserFactory>.Create;

  TestUserID := 1;
  TestUser := TUser.Create('TestName', 'TestUsername', 'TestPassword', 'A', TestUserID);


  FUserFactoryMock.Setup.WillReturn(TestUser).When.CreateUser(TestUser.NOME_USU, TestUser.USER_USU, TestUser.PASS_USU, TestUser.STATUS, TestUserID);
  FUserFactoryMock.Setup.WillReturn(TestUser).When.CreateUser(TestUser.USER_USU, TestUser.PASS_USU);


  TestUserList := TObjectList<TUser>.Create;
  TestUserList.Add(TestUser);
  FUserDAOMock.Setup.WillReturn(TestUserList).When.GetAll;

  FUserDAOMock.Setup.WillReturn(TestUserID).When.Insert(TestUser);
  FUserDAOMock.Setup.WillReturn(TestUser).When.Select(TestUserID);
  FUserDAOMock.Setup.WillReturn(True).When.Update(TestUser);
  FUserDAOMock.Setup.WillReturn(True).When.Delete(TestUser);

  FUserController := TUserController.Create(FUserDAOMock.Instance, FUserFactoryMock.Instance);
end;

procedure TUserControllerTest.TearDown;
begin
  FUserController.Free;
  FUserDAOMock.Free;
  FUserFactoryMock.Free;
end;

procedure TUserControllerTest.UpdateUser_WithValidParameters_ShouldReturnTrue;
var
  Result: Boolean;
begin
  Result := FUserController.UpdateUser(TestUser);
  Assert.IsTrue(Result);
end;

procedure TUserControllerTest.DeleteUser_WithValidParameters_ShouldReturnTrue;
var
  Result: Boolean;
begin
  Result := FUserController.DeleteUser(TestUser);
  Assert.IsTrue(Result);
end;

procedure TUserControllerTest.GetUser_WithValidID_ShouldReturnUser;
var
  ResultUser: TUser;
begin
  ResultUser := FUserController.GetUser(1);
  Assert.AreEqual(TestUser.NOME_USU, ResultUser.NOME_USU);
  Assert.AreEqual(TestUser.USER_USU, ResultUser.USER_USU);
end;

procedure TUserControllerTest.GetAllUsers_ShouldReturnList;
var
  Users: TObjectList<TUser>;
begin
  Users := FUserController.GetAllUsers;
  try
    Assert.IsTrue(Users.Count > 0);
  finally
    Users.Free;
  end;
end;

procedure TUserControllerTest.AuthenticateUser_WithValidCredentials_ShouldReturnTrue;
var
  Result: Boolean;
begin
  FUserDAOMock.Setup.WillReturn(TestUser).When.SelectByUsername(TestUser.USER_USU);
  Result := FUserController.AuthenticateUser(TestUser);
  Assert.IsTrue(Result);
end;

initialization
  TDUnitX.RegisterTestFixture(TUserControllerTest);
end.

