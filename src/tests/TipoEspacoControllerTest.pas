unit TipoEspacoControllerTest;

interface

uses
  DUnitX.TestFramework,
  TipoEspacoModel, TipoEspacoDAO, TipoEspacoController,
  DBConfig, DBConn,
  System.SysUtils, System.Generics.Collections;

type
  [TestFixture]
  TTipoEspacoControllerTest = class(TObject)
  private
    FController: TTipoEspacoController;
    FDAO: TTipoEspacoDAO;
    DBConfig: TDBConfig;
  public
    [Setup]
    procedure SetUp;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestInsertTipoEspaco;
    [Test]
    procedure TestUpdateTipoEspaco;
    [Test]
    procedure TestDeleteTipoEspaco;
    [Test]
    procedure TestGetTipoEspaco;
    [Test]
    procedure TestGetAllTipoEspaco;
  end;

implementation

procedure TTipoEspacoControllerTest.SetUp;
begin
  DBConfig := TDBConfig.Create('C:\Users\Vinicius\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
                               'sysdba',
                               'masterkey',
                               'localhost',
                               '3050');
  TDBConn.SetConfig(DBConfig);
  FDAO := TTipoEspacoDAO.Create;
  FController := TTipoEspacoController.Create(FDAO);
end;

procedure TTipoEspacoControllerTest.TearDown;
begin
  FController.Free;
  FDAO.Free;
  DBConfig.Free;
end;

procedure TTipoEspacoControllerTest.TestInsertTipoEspaco;
var
  CodiEsp: Integer;
begin
  CodiEsp := FController.InsertTipoEspaco('Teste Tipo Espaço', 'Quantidade Teste', 'A');
  Assert.IsTrue(CodiEsp > 0, 'Falha ao inserir TipoEspaco');
end;

procedure TTipoEspacoControllerTest.TestUpdateTipoEspaco;
var
  NewID: Integer;
  TipoEspacoToUpdate: TTipoEspaco;
  Updated: Boolean;
begin
  NewID := FController.InsertTipoEspaco('Tipo Espaço Para Atualizar', 'Quantidade Teste', 'A');
  TipoEspacoToUpdate := FController.GetTipoEspaco(NewID);
  try
    TipoEspacoToUpdate.DescEsp := 'Tipo Espaço Atualizado';
    Updated := FController.UpdateTipoEspaco(TipoEspacoToUpdate);
    Assert.IsTrue(Updated, 'Falha ao atualizar TipoEspaco');
  finally
    TipoEspacoToUpdate.Free;
  end;
end;

procedure TTipoEspacoControllerTest.TestDeleteTipoEspaco;
var
  NewID: Integer;
  Deleted: Boolean;
begin
  NewID := FController.InsertTipoEspaco('Tipo Espaço Para Deletar', 'Quantidade Teste', 'A');
  Deleted := FController.DeleteTipoEspaco(NewID);
  Assert.IsTrue(Deleted, 'Falha ao deletar TipoEspaco');
end;

procedure TTipoEspacoControllerTest.TestGetTipoEspaco;
var
  NewID: Integer;
  TipoEspaco: TTipoEspaco;
begin
  NewID := FController.InsertTipoEspaco('Tipo Espaço Para Buscar', 'Quantidade Teste', 'A');
  TipoEspaco := FController.GetTipoEspaco(NewID);
  try
    Assert.IsNotNull(TipoEspaco, 'Falha ao obter TipoEspaco');
    Assert.AreEqual(NewID, TipoEspaco.CodiEsp, 'O ID do TipoEspaco obtido não corresponde ao esperado');
  finally
    TipoEspaco.Free;
  end;
end;

procedure TTipoEspacoControllerTest.TestGetAllTipoEspaco;
var
  Lista: TObjectList<TTipoEspaco>;
begin
  FController.InsertTipoEspaco('Tipo Espaço Para Lista', 'Quantidade Teste', 'A');
  Lista := FController.GetAllTipoEspaco;
  try
    Assert.IsTrue(Lista.Count > 0, 'Falha ao obter lista de TipoEspaco');
  finally
    Lista.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTipoEspacoControllerTest);

end.
