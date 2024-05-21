unit TipoEquipControllerTest;

interface

uses
  DUnitX.TestFramework,
  TipoEquipModel, TipoEquipDAO, TipoEquipController,
  DBConfig, DBConn,
  System.SysUtils, System.Generics.Collections;

type
  [TestFixture]
  TTipoEquipControllerTest = class(TObject)
  private
    FController: TTipoEquipController;
    FDAO: TTipoEquipDAO;
    DBConfig: TDBConfig;
  public
    [Setup]
    procedure SetUp;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestInsertTipoEquip;
    [Test]
    procedure TestUpdateTipoEquip;
    [Test]
    procedure TestDeleteTipoEquip;
    [Test]
    procedure TestGetTipoEquip;
    [Test]
    procedure TestGetAllTipoEquip;
  end;

implementation

procedure TTipoEquipControllerTest.SetUp;
begin
  DBConfig := TDBConfig.Create('C:\Users\Vinicius Ribeiro\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
                               'sysdba',
                               'masterkey',
                               'localhost',
                               '3050');
  TDBConn.SetConfig(DBConfig);
  FDAO := TTipoEquipDAO.Create;
  FController := TTipoEquipController.Create(FDAO);
end;

procedure TTipoEquipControllerTest.TearDown;
begin
  FController.Free;
  FDAO.Free;
  DBConfig.Free;
end;

procedure TTipoEquipControllerTest.TestInsertTipoEquip;
var
  CodiTEquip: Integer;
begin
  CodiTEquip := FController.InsertTipoEquip('Teste Tipo Equipamento', 'A');
  Assert.IsTrue(CodiTEquip > 0, 'Falha ao inserir TipoEquip');
end;

procedure TTipoEquipControllerTest.TestUpdateTipoEquip;
var
  NewID: Integer;
  TipoEquipToUpdate: TTipoEquip;
  Updated: Boolean;
begin
  NewID := FController.InsertTipoEquip('Tipo Equipamento Para Atualizar', 'A');
  TipoEquipToUpdate := FController.GetTipoEquip(NewID);
  TipoEquipToUpdate.DescTEquip := 'Tipo Equipamento Atualizado';
  Updated := FController.UpdateTipoEquip(TipoEquipToUpdate);
  Assert.IsTrue(Updated, 'Falha ao atualizar TipoEquip');
  TipoEquipToUpdate.Free;
end;

procedure TTipoEquipControllerTest.TestDeleteTipoEquip;
var
  NewID: Integer;
  Deleted: Boolean;
begin
  NewID := FController.InsertTipoEquip('Tipo Equipamento Para Deletar', 'A');
  Deleted := FController.DeleteTipoEquip(NewID);
  Assert.IsTrue(Deleted, 'Falha ao deletar TipoEquip');
end;

procedure TTipoEquipControllerTest.TestGetTipoEquip;
var
  NewID: Integer;
  TipoEquip: TTipoEquip;
begin
  NewID := FController.InsertTipoEquip('Tipo Equipamento Para Buscar', 'A');
  TipoEquip := FController.GetTipoEquip(NewID);
  Assert.IsNotNull(TipoEquip, 'Falha ao obter TipoEquip');
  Assert.AreEqual(NewID, TipoEquip.CodiTEquip, 'O ID do TipoEquip obtido não corresponde ao esperado');
  TipoEquip.Free;
end;

procedure TTipoEquipControllerTest.TestGetAllTipoEquip;
var
  Lista: TObjectList<TTipoEquip>;
begin
  FController.InsertTipoEquip('Tipo Equipamento Para Lista', 'A');
  Lista := FController.GetAllTipoEquip;
  try
    Assert.IsTrue(Lista.Count > 0, 'Falha ao obter lista de TipoEquip');
  finally
    Lista.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTipoEquipControllerTest);

end.
