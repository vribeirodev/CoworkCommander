unit ManutencaoControllerTest;

interface

uses
  DUnitX.TestFramework,
  ManutencaoModel, ManutencaoController, EspacoModel, EspacoDAO, TipoEspacoModel, TipoEspacoDAO,
  System.SysUtils, System.Generics.Collections, DBConfig, DBConn;

type
  [TestFixture]
  TManutencaoControllerTest = class(TObject)
  private
    FController: TManutencaoController;
    FTipoEspacoDAO: TTipoEspacoDAO;
    FEspacoDAO: TEspacoDAO;
    DBConfig: TDBConfig;

    function CreateTestEspaco: TEspaco;
    function CreateTestManutencao(Espaco: TEspaco): TManutencao;
  public
    [Setup]
    procedure SetUp;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestInsertManutencao;
    [Test]
    procedure TestUpdateManutencao;
    [Test]
    procedure TestDeleteManutencao;
    [Test]
    procedure TestGetManutencao;
    [Test]
    procedure TestGetAllManutencoes;
  end;

implementation

procedure TManutencaoControllerTest.SetUp;
begin
  DBConfig := TDBConfig.Create('C:\Users\Vinicius Ribeiro\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
                               'sysdba',
                               'masterkey',
                               'localhost',
                               '3050');
  TDBConn.SetConfig(DBConfig);


  FTipoEspacoDAO := TTipoEspacoDAO.Create;
  FEspacoDAO := TEspacoDAO.Create;
  FController := TManutencaoController.Create;
end;

procedure TManutencaoControllerTest.TearDown;
begin
  FController.Free;
  FEspacoDAO.Free;
  FTipoEspacoDAO.Free;
end;

function TManutencaoControllerTest.CreateTestEspaco: TEspaco;
var
  TipoEspaco: TTipoEspaco;
begin
  TipoEspaco := TTipoEspaco.Create;
  TipoEspaco.DescEsp := 'Tipo Espaço Teste' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  TipoEspaco.Status := 'A';
  TipoEspaco.CodiEsp := FTipoEspacoDAO.Insert(TipoEspaco);

  Result := TEspaco.Create;
  Result.DescEsp := 'Espaço Teste' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  Result.Status := 'A';
  Result.StatEsp := 'L';
  Result.TipoEsp := TipoEspaco;
  Result.CodiEsp := FEspacoDAO.Insert(Result);
end;

function TManutencaoControllerTest.CreateTestManutencao(Espaco: TEspaco): TManutencao;
begin
  Result := TManutencao.Create;
  Result.DescManut := 'Manutenção Teste' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  Result.DataManut := Date;
  Result.StatManut := 'P'; // Pendente
  Result.EspaManut := Espaco;
  Result.Status := 'A';
end;

procedure TManutencaoControllerTest.TestInsertManutencao;
var
  Espaco: TEspaco;
  Manutencao: TManutencao;
  CodiManut: Integer;
begin
  Espaco := CreateTestEspaco;
  Manutencao := CreateTestManutencao(Espaco);
  try
    CodiManut := FController.InsertManutencao(Manutencao);
    Assert.IsTrue(CodiManut > 0, 'Falha ao inserir manutenção');
  finally
    Manutencao.Free;
    FEspacoDAO.Delete(Espaco); // Limpa o espaço de teste criado
    Espaco.Free;
  end;
end;

procedure TManutencaoControllerTest.TestUpdateManutencao;
var
  Espaco: TEspaco;
  Manutencao: TManutencao;
  Updated: Boolean;
begin
  Espaco := CreateTestEspaco;
  Manutencao := CreateTestManutencao(Espaco);
  try
    Manutencao.CodiManut := FController.InsertManutencao(Manutencao);
    Manutencao.DescManut := 'Manutenção Atualizada' + FormatDateTime('yyyymmddhhnnsszzz', Now);
    Updated := FController.UpdateManutencao(Manutencao);
    Assert.IsTrue(Updated, 'Falha ao atualizar manutenção');
  finally
    Manutencao.Free;
    FEspacoDAO.Delete(Espaco); // Limpa o espaço de teste criado
    Espaco.Free;
  end;
end;

procedure TManutencaoControllerTest.TestDeleteManutencao;
var
  Espaco: TEspaco;
  Manutencao: TManutencao;
  Deleted: Boolean;
begin
  Espaco := CreateTestEspaco;
  Manutencao := CreateTestManutencao(Espaco);
  try
    Manutencao.CodiManut := FController.InsertManutencao(Manutencao);
    Deleted := FController.DeleteManutencao(Manutencao.CodiManut);
    Assert.IsTrue(Deleted, 'Falha ao deletar manutenção');
  finally
    Manutencao.Free;
    FEspacoDAO.Delete(Espaco); // Limpa o espaço de teste criado
    Espaco.Free;
  end;
end;

procedure TManutencaoControllerTest.TestGetManutencao;
var
  Espaco: TEspaco;
  Manutencao, RetrievedManutencao: TManutencao;
begin
  Espaco := CreateTestEspaco;
  Manutencao := CreateTestManutencao(Espaco);
  try
    Manutencao.CodiManut := FController.InsertManutencao(Manutencao);
    RetrievedManutencao := FController.GetManutencao(Manutencao.CodiManut);
    try
      Assert.IsNotNull(RetrievedManutencao, 'Manutenção não encontrada');
      Assert.AreEqual(Manutencao.DescManut, RetrievedManutencao.DescManut, 'A manutenção recuperada é diferente do esperado');
    finally
      RetrievedManutencao.Free;
    end;
  finally
    Manutencao.Free;
    FEspacoDAO.Delete(Espaco); // Limpa o espaço de teste criado
    Espaco.Free;
  end;
end;

procedure TManutencaoControllerTest.TestGetAllManutencoes;
var
  Espaco: TEspaco;
  Manutencoes: TObjectList<TManutencao>;
begin
  Espaco := CreateTestEspaco;
  try
    CreateTestManutencao(Espaco); // Garante que haja pelo menos uma manutenção para recuperar
    Manutencoes := FController.GetAllManutencoes;
    try
      Assert.IsTrue(Manutencoes.Count > 0, 'Lista de manutenções está vazia');
    finally
      Manutencoes.Free;
    end;
  finally
    FEspacoDAO.Delete(Espaco); // Limpa o espaço de teste criado
    Espaco.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TManutencaoControllerTest);
end.
