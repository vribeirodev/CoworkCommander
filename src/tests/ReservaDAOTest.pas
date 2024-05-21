unit ReservaDAOTest;

interface

uses
  DUnitX.TestFramework,
  ReservaModel, EspacoModel, TipoEspacoModel, MembroModel,
  ReservaDAO, EspacoDAO, TipoEspacoDAO, MembroDAO,
  System.SysUtils, System.Generics.Collections,
  DBConfig, DBConn;

type

  [TestFixture]
  TReservaDAOTest = class(TObject)
  private
    FReservaDAO: TReservaDAO;
    FEspacoDAO: TEspacoDAO;
    FTipoEspacoDAO: TTipoEspacoDAO;
    FMembroDAO: TMembroDAO;
    FReserva: TReserva;
    FEspaco: TEspaco;
    FTipoEspaco: TTipoEspaco;
    FMembro: TMembro;
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

procedure TReservaDAOTest.SetUp;
var
  uniquePart, cpfBase: string;
begin
  uniquePart := FormatDateTime('nnsszzz', Now); // Minutos, segundos e milissegundos
  cpfBase := '123.456.' + Copy(uniquePart, 1, 3) + '-' + Copy(uniquePart, 4, 2); // Gerar CPF único

  DBConfig := TDBConfig.Create('C:\Users\Vinicius Ribeiro\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
                               'sysdba',
                               'masterkey',
                               'localhost',
                               '3050');
  TDBConn.SetConfig(DBConfig);

  FTipoEspacoDAO := TTipoEspacoDAO.Create;
  FEspacoDAO := TEspacoDAO.Create;
  FMembroDAO := TMembroDAO.Create;
  FReservaDAO := TReservaDAO.Create;

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

  FMembro := TMembro.Create;
  FMembro.NomeMemb := 'Membro ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  FMembro.CPFMemb := cpfBase; // CPF único com formato correto
  FMembro.Status := 'A';
  FMembro.CodiMemb := FMembroDAO.Insert(FMembro);

  FReserva := TReserva.Create;
  FReserva.DinicioRes := Now;
  FReserva.DfimRes := Now + 1;
  FReserva.Status := 'A';
  FReserva.EspaRes := FEspaco;
  FReserva.MembRes := FMembro;
end;


procedure TReservaDAOTest.TearDown;
begin
  if Assigned(FReservaDAO) and Assigned(FReserva) then
  begin
    FReservaDAO.Delete(FReserva);
    FreeAndNil(FReserva);
    FreeAndNil(FReservaDAO);
  end;

  if Assigned(FEspacoDAO) and Assigned(FEspaco) then
  begin
    FEspacoDAO.Delete(FEspaco);
    FreeAndNil(FEspacoDAO);
  end;

  if Assigned(FTipoEspacoDAO) and Assigned(FTipoEspaco) then
  begin
    FTipoEspacoDAO.Delete(FTipoEspaco);
    FreeAndNil(FTipoEspaco);
    FreeAndNil(FTipoEspacoDAO);
  end;

  if Assigned(FMembroDAO) and Assigned(FMembro) then
  begin
    FMembroDAO.Delete(FMembro);
    FreeAndNil(FMembroDAO);
  end;

  FreeAndNil(DBConfig);
end;


procedure TReservaDAOTest.TestInsertAndSelect;
var
  NewID: Integer;
  RetrievedReserva: TReserva;
begin
  NewID := FReservaDAO.Insert(FReserva);
  Assert.IsTrue(NewID > 0, 'Insert failed');

  RetrievedReserva := FReservaDAO.Select(NewID);
  try
    Assert.IsNotNull(RetrievedReserva, 'Select failed');
    Assert.AreEqual(FReserva.DinicioRes, RetrievedReserva.DinicioRes, 'DinicioRes mismatch');
    Assert.AreEqual(FReserva.DfimRes, RetrievedReserva.DfimRes, 'DfimRes mismatch');
    Assert.AreEqual(FReserva.EspaRes.CodiEsp, RetrievedReserva.EspaRes.CodiEsp, 'Espaco mismatch');
    Assert.AreEqual(FReserva.MembRes.CodiMemb, RetrievedReserva.MembRes.CodiMemb, 'Membro mismatch');
  finally
    RetrievedReserva.Free;
  end;
end;

procedure TReservaDAOTest.TestUpdate;
var
  NewID: Integer;
begin
  NewID := FReservaDAO.Insert(FReserva);
  FReserva.CodiRes := NewID;
  FReserva.DfimRes := Now + 2; // Update the end date

  Assert.IsTrue(FReservaDAO.Update(FReserva), 'Update failed');

  var UpdatedReserva := FReservaDAO.Select(NewID);
  try
    Assert.AreEqual(FReserva.DfimRes, UpdatedReserva.DfimRes, 'Update did not persist');
  finally
    UpdatedReserva.Free;
  end;
end;

procedure TReservaDAOTest.TestDelete;
var
  NewID: Integer;
begin
  NewID := FReservaDAO.Insert(FReserva);
  FReserva.CodiRes := NewID;
  Assert.IsTrue(FReservaDAO.Delete(FReserva), 'Delete failed');

  var DeletedReserva := FReservaDAO.Select(NewID);
  try
    Assert.IsNull(DeletedReserva, 'Delete did not remove the record');
  finally
    DeletedReserva.Free;
  end;
end;

procedure TReservaDAOTest.TestGetAll;
begin
  FReservaDAO.Insert(FReserva);
  var Reservas := FReservaDAO.GetAll;
  try
    Assert.IsTrue(Reservas.Count > 0, 'GetAll returned an empty list');
  finally
    Reservas.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TReservaDAOTest);

end.

