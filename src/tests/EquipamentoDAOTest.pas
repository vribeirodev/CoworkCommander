unit EquipamentoDAOTest;

interface

uses
  DUnitX.TestFramework,
  EquipamentoModel, TipoEquipModel, EspacoModel,
  EquipamentoDAO, TipoEquipDAO, EspacoDAO, TipoEspacoDAO,
  System.SysUtils, System.Generics.Collections,   DBConfig, DBConn, TipoEspacoModel;

type

  [TestFixture]
  TEquipamentoDAOTest = class(TObject)
  private
    FEquipamentoDAO: TEquipamentoDAO;
    FTipoEquipDAO: TTipoEquipDAO;
    FTipoEspacoDAO: TTipoEspacoDAO;
    FEspacoDAO: TEspacoDAO;
    FEquipamento: TEquipamento;
    FTipoEquip: TTipoEquip;
    FTipoEspaco: TTipoEspaco;
    FEspaco: TEspaco;
    DBConfig : TDBConfig;
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

procedure TEquipamentoDAOTest.SetUp;
begin
  // Database configuration
  DBConfig := TDBConfig.Create('C:\Users\Vinicius Ribeiro\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
                               'sysdba',
                               'masterkey',
                               'localhost',
                               '3050');
  TDBConn.SetConfig(DBConfig);

  // DAOs initialization
  FTipoEquipDAO := TTipoEquipDAO.Create;
  FTipoEspacoDAO := TTipoEspacoDAO.Create;
  FEspacoDAO := TEspacoDAO.Create;
  FEquipamentoDAO := TEquipamentoDAO.Create;

  // Creating and inserting a TipoEquip
  FTipoEquip := TTipoEquip.Create;
  FTipoEquip.DescTEquip := 'Tipo Equip ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  FTipoEquip.Status := 'A';
  FTipoEquip.CodiTEquip := FTipoEquipDAO.Insert(FTipoEquip);

  // Creating and inserting a TipoEspaco
  FTipoEspaco := TTipoEspaco.Create;
  FTipoEspaco.DescEsp := 'Tipo Espaço ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  FTipoEspaco.Status := 'A';
  FTipoEspaco.CodiEsp := FTipoEspacoDAO.Insert(FTipoEspaco);

  // Creating and inserting an Espaco
  FEspaco := TEspaco.Create;
  FEspaco.DescEsp := 'Espaço ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  FEspaco.Status := 'A';
  FEspaco.StatEsp := 'L';
  FEspaco.TipoEsp := FTipoEspaco;
  FEspaco.CodiEsp := FEspacoDAO.Insert(FEspaco);

  // Creating an Equipamento
  FEquipamento := TEquipamento.Create;
  FEquipamento.DescEquip := 'Equipamento ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  FEquipamento.DataEquip := Now;
  FEquipamento.Status := 'A';
  FEquipamento.TipoEquip := FTipoEquip;
  FEquipamento.EspaEquip := FEspaco;
end;

procedure TEquipamentoDAOTest.TearDown;
begin
  if Assigned(FEquipamentoDAO) then
  begin
    FEquipamentoDAO.Delete(FEquipamento);
    FreeAndNil(FEquipamentoDAO);
  end;

  if Assigned(FEspacoDAO) then
  begin
    FEspacoDAO.Delete(FEspaco);
    FreeAndNil(FEspacoDAO);
  end;

  if Assigned(FTipoEquipDAO) then
  begin
    FTipoEquipDAO.Delete(FTipoEquip);
    FreeAndNil(FTipoEquipDAO);
  end;

  if Assigned(FTipoEspacoDAO) then
  begin
    FTipoEspacoDAO.Delete(FTipoEspaco);
    FreeAndNil(FTipoEspacoDAO);
  end;

  if Assigned(FEquipamento) then
  begin
    FreeAndNil(FEquipamento);
  end;

  if Assigned(FEspaco) then
  begin
    FreeAndNil(FEspaco);
  end;

  if Assigned(FTipoEspaco) then
  begin
    FreeAndNil(FTipoEspaco);
  end;

  if Assigned(DBConfig) then
  begin
    FreeAndNil(DBConfig);
  end;
end;


procedure TEquipamentoDAOTest.TestInsertAndSelect;
var
  NewID: Integer;
  RetrievedEquipamento: TEquipamento;
begin
  NewID := FEquipamentoDAO.Insert(FEquipamento);
  Assert.IsTrue(NewID > 0, 'Insert failed');

  RetrievedEquipamento := FEquipamentoDAO.Select(NewID);
  try
    Assert.IsNotNull(RetrievedEquipamento, 'Select failed');
    Assert.AreEqual(FEquipamento.DescEquip, RetrievedEquipamento.DescEquip, 'DescEquip mismatch');
    Assert.AreEqual(FEquipamento.TipoEquip.CodiTEquip, RetrievedEquipamento.TipoEquip.CodiTEquip, 'TipoEquip mismatch');
    Assert.AreEqual(FEquipamento.EspaEquip.CodiEsp, RetrievedEquipamento.EspaEquip.CodiEsp, 'Espaco mismatch');
  finally
    RetrievedEquipamento.Free;
  end;
end;

procedure TEquipamentoDAOTest.TestUpdate;
var
  NewID: Integer;
begin
  NewID := FEquipamentoDAO.Insert(FEquipamento);
  FEquipamento.CodiEquip := NewID;
  FEquipamento.DescEquip := 'Updated ' + FormatDateTime('yyyymmddhhnnsszzz', Now);

  Assert.IsTrue(FEquipamentoDAO.Update(FEquipamento), 'Update failed');

  var UpdatedEquipamento := FEquipamentoDAO.Select(NewID);
  try
    Assert.AreEqual(FEquipamento.DescEquip, UpdatedEquipamento.DescEquip, 'Update did not persist');
  finally
    UpdatedEquipamento.Free;
  end;
end;

procedure TEquipamentoDAOTest.TestDelete;
var
  NewID: Integer;
begin
  NewID := FEquipamentoDAO.Insert(FEquipamento);
  FEquipamento.CodiEquip := NewID;
  Assert.IsTrue(FEquipamentoDAO.Delete(FEquipamento), 'Delete failed');

  var DeletedEquipamento := FEquipamentoDAO.Select(NewID);
  try
    Assert.IsNull(DeletedEquipamento, 'Delete did not remove the record');
  finally
    DeletedEquipamento.Free;
  end;
end;

procedure TEquipamentoDAOTest.TestGetAll;
begin
  FEquipamentoDAO.Insert(FEquipamento);
  var Equipamentos := FEquipamentoDAO.GetAll;
  try
    Assert.IsTrue(Equipamentos.Count > 0, 'GetAll returned an empty list');
  finally
    Equipamentos.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TEquipamentoDAOTest);

end.
