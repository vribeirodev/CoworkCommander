unit TipoEquipDAOTest;

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  DUnitX.TestFramework,
  TipoEquipModel,
  TipoEquipDAO,
  DBConn,
  DBConfig;

type

  [TestFixture]
  TTipoEquipDAOTest = class(TObject)
  private
    FTipoEquipDAO: TTipoEquipDAO;
    FTipoEquip: TTipoEquip;
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

procedure TTipoEquipDAOTest.SetUp;
begin
  DBConfig := TDBConfig.Create('C:\Users\Vinicius\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
                               'sysdba',
                               'masterkey',
                               'localhost',
                               '3050');
  TDBConn.SetConfig(DBConfig);

  FTipoEquipDAO := TTipoEquipDAO.Create;

  FTipoEquip := TTipoEquip.Create;
  FTipoEquip.DescTEquip := 'TestDescTEquip_' + FormatDateTime('yyyymmddhhnnss', Now);
  FTipoEquip.Status := 'A';
end;

procedure TTipoEquipDAOTest.TearDown;
begin
  FTipoEquipDAO.Free;
  FTipoEquip.Free;
  DBConfig.Free;
end;

procedure TTipoEquipDAOTest.TestInsertAndSelect;
var
  NewTipoEquipID: Integer;
  TipoEquip: TTipoEquip;
begin
  // Test Insert
  NewTipoEquipID := FTipoEquipDAO.Insert(FTipoEquip);
  FTipoEquip.CodiTEquip := NewTipoEquipID;
  Assert.IsTrue(NewTipoEquipID > 0, 'Failed on Insert');

  // Test Select
  TipoEquip := FTipoEquipDAO.Select(NewTipoEquipID);
  try
    Assert.IsNotNull(TipoEquip, 'Failed on Select');
    Assert.AreEqual(FTipoEquip.DescTEquip, TipoEquip.DescTEquip, 'DescTEquip does not match');
  finally
    TipoEquip.Free;
  end;
end;

procedure TTipoEquipDAOTest.TestUpdate;
begin
  FTipoEquip.DescTEquip := 'UpdatedDescTEquip_' + FormatDateTime('yyyymmddhhnnss', Now);
  Assert.IsTrue(FTipoEquipDAO.Update(FTipoEquip), 'Failed on Update');
end;

procedure TTipoEquipDAOTest.TestGetAll;
var
  TipoEquips: TObjectList<TTipoEquip>;
begin
  TipoEquips := FTipoEquipDAO.GetAll;
  try
    Assert.IsTrue(TipoEquips.Count > 0, 'No equipment types found');
  finally
    TipoEquips.Free;
  end;
end;

procedure TTipoEquipDAOTest.TestDelete;
begin
  Assert.IsTrue(FTipoEquipDAO.Delete(FTipoEquip), 'Failed on Delete');
end;

initialization
  TDUnitX.RegisterTestFixture(TTipoEquipDAOTest);

end.

