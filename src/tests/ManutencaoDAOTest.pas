unit ManutencaoDAOTest;

interface

uses
  DUnitX.TestFramework,
  ManutencaoModel, EspacoModel, TipoEspacoModel,
  ManutencaoDAO, EspacoDAO, TipoEspacoDAO,
  System.SysUtils, System.Generics.Collections,
  DBConfig, DBConn;

type
  [TestFixture]
  TManutencaoDAOTest = class(TObject)
  private
    FManutencaoDAO: TManutencaoDAO;
    FEspacoDAO: TEspacoDAO;
    FTipoEspacoDAO: TTipoEspacoDAO;
    FManutencao: TManutencao;
    FEspaco: TEspaco;
    FTipoEspaco: TTipoEspaco;
    DBConfig: TDBConfig;
  public
    [Setup]
    procedure SetUp;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestInsertAndSelect;
    [Test]
    procedure TestUpdate;
    [Test]
    procedure TestDelete;
    [Test]
    procedure TestGetAll;
  end;

implementation

procedure TManutencaoDAOTest.SetUp;
begin
  DBConfig := TDBConfig.Create('C:\Users\Vinicius Ribeiro\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
                               'sysdba',
                               'masterkey',
                               'localhost',
                               '3050');
  TDBConn.SetConfig(DBConfig);

  FTipoEspacoDAO := TTipoEspacoDAO.Create;
  FEspacoDAO := TEspacoDAO.Create;
  FManutencaoDAO := TManutencaoDAO.Create;

  FTipoEspaco := TTipoEspaco.Create;
  FTipoEspaco.DescEsp := 'Tipo Espaço ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  FTipoEspaco.Status := 'A';
  FTipoEspaco.CodiEsp := FTipoEspacoDAO.Insert(FTipoEspaco);

  FEspaco := TEspaco.Create;
  FEspaco.DescEsp := 'Espaço ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  FEspaco.Status := 'A';
  FEspaco.StatEsp := 'L';
  FEspaco.TipoEsp := FTipoEspaco;
  FEspaco.CodiEsp := FEspacoDAO.Insert(FEspaco);

  FManutencao := TManutencao.Create;
  FManutencao.DescManut := 'Manutenção ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  FManutencao.DataManut := Date;
  FManutencao.StatManut := 'P';
  FManutencao.Status := 'A';
  FManutencao.EspaManut := FEspaco;
end;

procedure TManutencaoDAOTest.TearDown;
begin
  FManutencaoDAO.Delete(FManutencao);
  FEspacoDAO.Delete(FEspaco);
  FTipoEspacoDAO.Delete(FTipoEspaco);

  FreeAndNil(FManutencao);
  FreeAndNil(FEspaco);
  FreeAndNil(FTipoEspaco);
  FreeAndNil(FManutencaoDAO);
  FreeAndNil(FEspacoDAO);
  FreeAndNil(FTipoEspacoDAO);
  FreeAndNil(DBConfig);
end;

procedure TManutencaoDAOTest.TestInsertAndSelect;
var
  NewID: Integer;
  RetrievedManutencao: TManutencao;
begin
  NewID := FManutencaoDAO.Insert(FManutencao);
  Assert.IsTrue(NewID > 0, 'Insert failed');

  RetrievedManutencao := FManutencaoDAO.Select(NewID);
  try
    Assert.IsNotNull(RetrievedManutencao, 'Select failed');
    Assert.AreEqual(FManutencao.DescManut, RetrievedManutencao.DescManut, 'DescManut mismatch');
    Assert.AreEqual(FManutencao.StatManut, RetrievedManutencao.StatManut, 'StatManut mismatch');
    Assert.AreEqual(FManutencao.EspaManut.CodiEsp, RetrievedManutencao.EspaManut.CodiEsp, 'EspaManut mismatch');
  finally
    RetrievedManutencao.Free;
  end;
end;

procedure TManutencaoDAOTest.TestUpdate;
var
  NewID: Integer;
begin
  NewID := FManutencaoDAO.Insert(FManutencao);
  FManutencao.CodiManut := NewID;
  FManutencao.DescManut := 'Manutenção Atualizada ' + FormatDateTime('yyyymmddhhnnsszzz', Now);

  Assert.IsTrue(FManutencaoDAO.Update(FManutencao), 'Update failed');

  var UpdatedManutencao := FManutencaoDAO.Select(NewID);
  try
    Assert.AreEqual(FManutencao.DescManut, UpdatedManutencao.DescManut, 'Update did not persist');
  finally
    UpdatedManutencao.Free;
  end;
end;

procedure TManutencaoDAOTest.TestDelete;
var
  NewID: Integer;
begin
  NewID := FManutencaoDAO.Insert(FManutencao);
  FManutencao.CodiManut := NewID;
  Assert.IsTrue(FManutencaoDAO.Delete(FManutencao), 'Delete failed');

  var DeletedManutencao := FManutencaoDAO.Select(NewID);
  try
    Assert.IsNull(DeletedManutencao, 'Delete did not remove the record');
  finally
    DeletedManutencao.Free;
  end;
end;

procedure TManutencaoDAOTest.TestGetAll;
begin
  FManutencaoDAO.Insert(FManutencao);
  var Manutencoes := FManutencaoDAO.GetAll;
  try
    Assert.IsTrue(Manutencoes.Count > 0, 'GetAll returned an empty list');
  finally
    Manutencoes.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TManutencaoDAOTest);

end.
