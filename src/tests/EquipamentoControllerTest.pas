unit EquipamentoControllerTest;

interface

uses
  DUnitX.TestFramework,
  EquipamentoModel, EquipamentoDAO, EquipamentoController,
  TipoEquipModel, TipoEquipDAO,
  EspacoModel, EspacoDAO,
  TipoEspacoModel, TipoEspacoDAO,
  DBConfig, DBConn,
  System.SysUtils, System.Generics.Collections;

type
  [TestFixture]
  TEquipamentoControllerTest = class(TObject)
  private
    FController: TEquipamentoController;
    FEquipamentoDAO: TEquipamentoDAO;
    FTipoEquipDAO: TTipoEquipDAO;
    FEspacoDAO: TEspacoDAO;
    FTipoEspacoDAO: TTipoEspacoDAO;
    DBConfig: TDBConfig;

    function InsertTestEquipamento: TEquipamento;
  public
    [Setup]
    procedure SetUp;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestInsertEquipamento;
    [Test]
    procedure TestUpdateEquipamento;
    [Test]
    procedure TestDeleteEquipamento;
    [Test]
    procedure TestGetEquipamento;
    [Test]
    procedure TestGetAllEquipamentos;
  end;

implementation

procedure TEquipamentoControllerTest.SetUp;
begin
  DBConfig := TDBConfig.Create('C:\Users\Vinicius Ribeiro\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
                               'sysdba',
                               'masterkey',
                               'localhost',
                               '3050');
  TDBConn.SetConfig(DBConfig);

  FEquipamentoDAO := TEquipamentoDAO.Create;
  FTipoEquipDAO := TTipoEquipDAO.Create;
  FEspacoDAO := TEspacoDAO.Create;
  FTipoEspacoDAO := TTipoEspacoDAO.Create;
  FController := TEquipamentoController.Create(FEquipamentoDAO, FTipoEquipDAO, FEspacoDAO);
end;

procedure TEquipamentoControllerTest.TearDown;
begin

end;

procedure TEquipamentoControllerTest.TestInsertEquipamento;
var
  Equipamento: TEquipamento;
  CodiEquip: Integer;
begin
  Equipamento := InsertTestEquipamento;
  try
    CodiEquip := Equipamento.CodiEquip;
    Assert.IsTrue(CodiEquip > 0, 'Falha ao inserir equipamento');
  finally

  end;
end;

procedure TEquipamentoControllerTest.TestUpdateEquipamento;
var
  Equipamento: TEquipamento;
  Updated: Boolean;
begin
  Equipamento := InsertTestEquipamento;
  try
    Equipamento.DescEquip := 'Equipamento Atualizado ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
    Updated := FController.UpdateEquipamento(Equipamento);
    Assert.IsTrue(Updated, 'Falha ao atualizar o equipamento');
  finally

  end;
end;

procedure TEquipamentoControllerTest.TestDeleteEquipamento;
var
  Equipamento: TEquipamento;
  Deleted: Boolean;
begin
  Equipamento := InsertTestEquipamento;
  try
    Deleted := FController.DeleteEquipamento(Equipamento.CodiEquip);
    Assert.IsTrue(Deleted, 'Falha ao deletar o equipamento');
  finally

  end;
end;

procedure TEquipamentoControllerTest.TestGetEquipamento;
var
  NewEquipamento: TEquipamento;
  RetrievedEquipamento: TEquipamento;
begin
  NewEquipamento := InsertTestEquipamento;
  try
    RetrievedEquipamento := FController.GetEquipamento(NewEquipamento.CodiEquip);
    try
      Assert.IsNotNull(RetrievedEquipamento, 'Equipamento não encontrado');
      Assert.AreEqual(NewEquipamento.DescEquip, RetrievedEquipamento.DescEquip, 'O equipamento recuperado é diferente do esperado');
    finally

    end;
  finally

  end;
end;

procedure TEquipamentoControllerTest.TestGetAllEquipamentos;
var
  Equipamentos: TObjectList<TEquipamento>;
begin
  InsertTestEquipamento; // Garante que haja pelo menos um equipamento para recuperar
  Equipamentos := FController.GetAllEquipamentos;
  try
    Assert.IsTrue(Equipamentos.Count > 0, 'Lista de equipamentos está vazia');
  finally

  end;
end;

function TEquipamentoControllerTest.InsertTestEquipamento: TEquipamento;
var
  TipoEspaco: TTipoEspaco;
  Espaco: TEspaco;
  TipoEquip: TTipoEquip;
  Equipamento: TEquipamento;
begin
  TipoEspaco := TTipoEspaco.Create;
  TipoEspaco.DescEsp := 'Tipo Espaço Teste' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  TipoEspaco.Status := 'A';
  TipoEspaco.CodiEsp := FTipoEspacoDAO.Insert(TipoEspaco);

  Espaco := TEspaco.Create;
  Espaco.DescEsp := 'Espaço Teste' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  Espaco.Status := 'A';
  Espaco.StatEsp := 'L';
  Espaco.TipoEsp := TipoEspaco;
  Espaco.CodiEsp := FEspacoDAO.Insert(Espaco);

  TipoEquip := TTipoEquip.Create;
  TipoEquip.DescTEquip := 'Tipo Equipamento Teste' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  TipoEquip.Status := 'A';
  TipoEquip.CodiTEquip := FTipoEquipDAO.Insert(TipoEquip);

  Equipamento := TEquipamento.Create;
  Equipamento.DescEquip := 'Equipamento Teste' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  Equipamento.Status := 'A';
  Equipamento.TipoEquip := TipoEquip;
  Equipamento.EspaEquip := Espaco;

  Equipamento.CodiEquip := FController.InsertEquipamento(Equipamento.DescEquip, Now, Equipamento.TipoEquip, Equipamento.EspaEquip);
  Result := Equipamento;
end;

initialization
  TDUnitX.RegisterTestFixture(TEquipamentoControllerTest);

end.

