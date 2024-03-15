unit TipoEspacoDAOTest;

interface

uses
  DUnitX.TestFramework,
  TipoEspacoModel,
  TipoEspacoDAO,
  System.SysUtils,
  DBConfig,
  DBConn,
  System.Generics.Collections;

type

  [TestFixture]
  TTipoEspacoDAOTest = class(TObject)
  private
    FTipoEspacoDAO: TTipoEspacoDAO;
    FTipoEspaco: TTipoEspaco;
    DBConfig: TDBConfig;
  public
    [Setup]
    procedure SetUp;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestInsert;
    [Test]
    procedure TestSelect;
    [Test]
    procedure TestUpdate;
    [Test]
    procedure TestDelete;
    [Test]
    procedure TestGetAll;
  end;

implementation

procedure TTipoEspacoDAOTest.SetUp;
begin
  // Configuração do banco de dados
  DBConfig := TDBConfig.Create('C:\Users\Vinicius\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
                               'sysdba',
                               'masterkey',
                               'localhost',
                               '3050');
  TDBConn.SetConfig(DBConfig);

  // Criação e configuração do DAO e do modelo
  FTipoEspacoDAO := TTipoEspacoDAO.Create;
  FTipoEspaco := TTipoEspaco.Create;
  FTipoEspaco.DescEsp := 'Teste Desc ' + FormatDateTime('yyyymmddhhnnsszzz', Now); // Usando timestamp para evitar duplicatas
  FTipoEspaco.QntdEsp := 'Teste Qntd';
  FTipoEspaco.Status := 'A';
end;


procedure TTipoEspacoDAOTest.TearDown;
begin
  if Assigned(FTipoEspaco) then
  begin
    FTipoEspacoDAO.Delete(FTipoEspaco);
    FreeAndNil(FTipoEspaco);
  end;

  FreeAndNil(FTipoEspacoDAO);
  FreeAndNil(DBConfig);
end;


procedure TTipoEspacoDAOTest.TestInsert;
begin
  var NewId := FTipoEspacoDAO.Insert(FTipoEspaco);
  Assert.IsTrue(NewId > 0);
end;

procedure TTipoEspacoDAOTest.TestSelect;
begin
  var NewId := FTipoEspacoDAO.Insert(FTipoEspaco);
  var TipoEspaco := FTipoEspacoDAO.Select(NewId);
  try
    Assert.IsNotNull(TipoEspaco);
    Assert.AreEqual(FTipoEspaco.DescEsp, TipoEspaco.DescEsp);
    Assert.AreEqual(FTipoEspaco.QntdEsp, TipoEspaco.QntdEsp);
  finally
    TipoEspaco.Free;
  end;
end;

procedure TTipoEspacoDAOTest.TestUpdate;
begin
  var NewId := FTipoEspacoDAO.Insert(FTipoEspaco);
  FTipoEspaco.CodiEsp := NewId;
  FTipoEspaco.DescEsp := 'Desc Updated';
  Assert.IsTrue(FTipoEspacoDAO.Update(FTipoEspaco));

  var UpdatedTipoEspaco := FTipoEspacoDAO.Select(NewId);
  try
    Assert.AreEqual('Desc Updated', UpdatedTipoEspaco.DescEsp);
  finally
    UpdatedTipoEspaco.Free;
  end;
end;

procedure TTipoEspacoDAOTest.TestDelete;
begin
  var NewId := FTipoEspacoDAO.Insert(FTipoEspaco);
  FTipoEspaco.CodiEsp := NewId;
  Assert.IsTrue(FTipoEspacoDAO.Delete(FTipoEspaco));
  var DeletedTipoEspaco := FTipoEspacoDAO.Select(NewId);
  try
    Assert.IsNull(DeletedTipoEspaco);
  finally
    DeletedTipoEspaco.Free;
  end;
end;

procedure TTipoEspacoDAOTest.TestGetAll;
begin
  FTipoEspacoDAO.Insert(FTipoEspaco);
  var Lista := FTipoEspacoDAO.GetAll;
  try
    Assert.IsTrue(Lista.Count > 0);
  finally
    Lista.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTipoEspacoDAOTest);

end.
