unit EspacoDAOTest;

interface

uses
  DUnitX.TestFramework,
  EspacoModel,
  EspacoDAO,
  TipoEspacoModel,
  TipoEspacoDAO,
  System.SysUtils,
  DBConfig,
  DBConn,
  System.Generics.Collections;

type

  [TestFixture]
  TEspacoDAOTest = class(TObject)
  private
    FEspacoDAO: TEspacoDAO;
    FTipoEspacoDAO: TTipoEspacoDAO;
    FEspaco: TEspaco;
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

procedure TEspacoDAOTest.SetUp;
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
  FEspacoDAO := TEspacoDAO.Create;

  FTipoEspaco := TTipoEspaco.Create;
  FTipoEspaco.DescEsp :=  'Teste Desc ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  FTipoEspaco.QntdEsp := '1';
  FTipoEspaco.Status := 'A';
  FTipoEspaco.CodiEsp := FTipoEspacoDAO.Insert(FTipoEspaco);

  FEspaco := TEspaco.Create;
  FEspaco.DescEsp :=  'Teste Desc ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  FEspaco.StatEsp := 'A';
  FEspaco.Status := 'A';
  FEspaco.TipoEsp := FTipoEspaco;
end;

procedure TEspacoDAOTest.TearDown;
begin
  FEspacoDAO.Delete(FEspaco);
  FTipoEspacoDAO.Delete(FTipoEspaco);
  FreeAndNil(FEspaco);
  FreeAndNil(FTipoEspaco);
  FreeAndNil(FEspacoDAO);
  FreeAndNil(FTipoEspacoDAO);
  FreeAndNil(DBConfig);
end;

procedure TEspacoDAOTest.TestInsert;
begin
  var NewId := FEspacoDAO.Insert(FEspaco);
  Assert.IsTrue(NewId > 0);
end;

procedure TEspacoDAOTest.TestSelect;
begin
  var NewId := FEspacoDAO.Insert(FEspaco);
  var Espaco := FEspacoDAO.Select(NewId);
  try
    Assert.IsNotNull(Espaco);
    Assert.AreEqual(FEspaco.DescEsp, Espaco.DescEsp);
    Assert.AreEqual(FEspaco.TipoEsp.CodiEsp, Espaco.TipoEsp.CodiEsp);
  finally
    Espaco.Free;
  end;
end;

procedure TEspacoDAOTest.TestUpdate;
begin
  var NewId := FEspacoDAO.Insert(FEspaco);
  FEspaco.CodiEsp := NewId;
  FEspaco.DescEsp := 'Espaço Atualizado';
  Assert.IsTrue(FEspacoDAO.Update(FEspaco));

  var UpdatedEspaco := FEspacoDAO.Select(NewId);
  try
    Assert.AreEqual('Espaço Atualizado', UpdatedEspaco.DescEsp);
  finally
    UpdatedEspaco.Free;
  end;
end;

procedure TEspacoDAOTest.TestDelete;
begin
  var NewId := FEspacoDAO.Insert(FEspaco);
  FEspaco.CodiEsp := NewId;
  Assert.IsTrue(FEspacoDAO.Delete(FEspaco));
  var DeletedEspaco := FEspacoDAO.Select(NewId);
  try
    Assert.IsNull(DeletedEspaco);
  finally
    DeletedEspaco.Free;
  end;
end;

procedure TEspacoDAOTest.TestGetAll;
begin
  FEspacoDAO.Insert(FEspaco);
  var Lista := FEspacoDAO.GetAll;
  try
    Assert.IsTrue(Lista.Count > 0);
  finally
    Lista.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TEspacoDAOTest);

end.

