unit EspacoControllerTest;

interface

uses
  DUnitX.TestFramework,
  EspacoModel, EspacoDAO, EspacoController, TipoEspacoModel, TipoEspacoDAO,
  DBConfig, DBConn,
  System.SysUtils, System.Generics.Collections;

type
  [TestFixture]
  TEspacoControllerTest = class(TObject)
  private
    FController: TEspacoController;
    FDAO: TEspacoDAO;
    FTipoEspacoDAO: TTipoEspacoDAO;
    DBConfig: TDBConfig;
  public
    [Setup]
    procedure SetUp;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestInsertEspaco;
    [Test]
    procedure TestUpdateEspaco;
    [Test]
    procedure TestDeleteEspaco;
    [Test]
    procedure TestGetEspaco;
    [Test]
    procedure TestGetAllEspaco;
  end;

implementation

procedure TEspacoControllerTest.SetUp;
begin
  DBConfig := TDBConfig.Create('C:\Users\Vinicius Ribeiro\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
                               'sysdba',
                               'masterkey',
                               'localhost',
                               '3050');
  TDBConn.SetConfig(DBConfig);

  FDAO := TEspacoDAO.Create;
  FTipoEspacoDAO := TTipoEspacoDAO.Create;
  FController := TEspacoController.Create(FDAO);
end;

procedure TEspacoControllerTest.TearDown;
begin
  FController.Free;
  FDAO.Free;
  FTipoEspacoDAO.Free;
  DBConfig.Free;
end;

procedure TEspacoControllerTest.TestInsertEspaco;
var
  Espaco: TEspaco;
  TipoEspaco: TTipoEspaco;
  CodiEsp: Integer;
begin
  TipoEspaco := TTipoEspaco.Create;
  try
    TipoEspaco.DescEsp := 'Teste Tipo Espaço ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
    TipoEspaco.Status := 'A';
    TipoEspaco.CodiEsp := FTipoEspacoDAO.Insert(TipoEspaco);

    Espaco := TEspaco.Create;
    try
      Espaco.DescEsp := 'Teste Espaço ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
      Espaco.StatEsp := 'L';
      Espaco.Status := 'A';
      Espaco.TipoEsp := TipoEspaco;

      CodiEsp := FController.InsertEspaco(Espaco);
      Assert.IsTrue(CodiEsp > 0, 'Falha ao inserir Espaco');
    finally
      Espaco.Free;
    end;
  finally
    TipoEspaco.Free;
  end;
end;

procedure TEspacoControllerTest.TestUpdateEspaco;
var
  Espaco: TEspaco;
  TipoEspaco: TTipoEspaco;
  Updated: Boolean;
begin
  TipoEspaco := TTipoEspaco.Create;
  try
    TipoEspaco.DescEsp := 'Teste Tipo Espaço ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
    TipoEspaco.Status := 'A';
    TipoEspaco.CodiEsp := FTipoEspacoDAO.Insert(TipoEspaco);

    Espaco := TEspaco.Create;
    try
      Espaco.DescEsp := 'Espaço para Update ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
      Espaco.StatEsp := 'L';
      Espaco.Status := 'A';
      Espaco.TipoEsp := TipoEspaco;
      Espaco.CodiEsp := FDAO.Insert(Espaco);
      Espaco.DescEsp := 'Espaço Atualizado' + FormatDateTime('yyyymmddhhnnsszzz', Now);
      Updated := FController.UpdateEspaco(Espaco);
      Assert.IsTrue(Updated, 'Falha ao atualizar Espaco');
    finally
      Espaco.Free;
    end;
  finally
    TipoEspaco.Free;
  end;
end;

procedure TEspacoControllerTest.TestDeleteEspaco;
var
  Espaco: TEspaco;
  TipoEspaco: TTipoEspaco;
  Deleted: Boolean;
begin
  TipoEspaco := TTipoEspaco.Create;
  try
    TipoEspaco.DescEsp := 'Teste Tipo Espaço ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
    TipoEspaco.Status := 'A';
    TipoEspaco.CodiEsp := FTipoEspacoDAO.Insert(TipoEspaco);

    Espaco := TEspaco.Create;
    try
      Espaco.DescEsp := 'Espaço para Delete ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
      Espaco.StatEsp := 'L';
      Espaco.TipoEsp := TipoEspaco;
      Espaco.CodiEsp := FDAO.Insert(Espaco);

      Deleted := FController.DeleteEspaco(Espaco);
      Assert.IsTrue(Deleted, 'Falha ao deletar Espaco');
    finally
      Espaco.Free;
    end;
  finally
    TipoEspaco.Free;
  end;
end;

procedure TEspacoControllerTest.TestGetEspaco;
var
  Espaco: TEspaco;
  TipoEspaco: TTipoEspaco;
  CodiEsp: Integer;
begin
  TipoEspaco := TTipoEspaco.Create;
  try
    TipoEspaco.DescEsp := 'Teste Tipo Espaço ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
    TipoEspaco.Status := 'A';
    TipoEspaco.CodiEsp := FTipoEspacoDAO.Insert(TipoEspaco);

    Espaco := TEspaco.Create;
    try
      Espaco.DescEsp := 'Espaço para Get ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
      Espaco.StatEsp := 'L';
      Espaco.Status := 'A';
      Espaco.TipoEsp := TipoEspaco;
      CodiEsp := FDAO.Insert(Espaco);

      Espaco := FController.GetEspaco(CodiEsp);
      Assert.IsNotNull(Espaco, 'Falha ao obter Espaco');
      Assert.AreEqual(CodiEsp, Espaco.CodiEsp, 'O ID do Espaco obtido não corresponde ao esperado');
    finally
      Espaco.Free;
    end;
  finally
    TipoEspaco.Free;
  end;
end;

procedure TEspacoControllerTest.TestGetAllEspaco;
var
  Lista: TObjectList<TEspaco>;
  Espaco: TEspaco;
  TipoEspaco: TTipoEspaco;
begin
  TipoEspaco := TTipoEspaco.Create;
  try
    TipoEspaco.DescEsp := 'Teste Tipo Espaço ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
    TipoEspaco.Status := 'A';
    TipoEspaco.CodiEsp := FTipoEspacoDAO.Insert(TipoEspaco);

    Espaco := TEspaco.Create;
    try
      Espaco.DescEsp := 'Espaço para GetAll ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
      Espaco.StatEsp := 'L';
      Espaco.TipoEsp := TipoEspaco;
      Espaco.Dinsert := Now;
      Espaco.Dmanut := Now;
      Espaco.Status := 'A';
      FController.InsertEspaco(Espaco);
    finally
      Espaco.Free;
    end;

    Lista := FController.GetAllEspaco;
    try
      Assert.IsTrue(Lista.Count > 0, 'Falha ao obter lista de Espaco');
    finally
      Lista.Free;
    end;
  finally
    TipoEspaco.Free;
  end;
end;


initialization
  TDUnitX.RegisterTestFixture(TEspacoControllerTest);

end.
