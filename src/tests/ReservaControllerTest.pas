unit ReservaControllerTest;

interface

uses
  DUnitX.TestFramework,
  ReservaModel, ReservaController, EspacoModel, EspacoDAO, TipoEspacoModel, TipoEspacoDAO,
  MembroModel, MembroDAO,
  System.SysUtils, System.Generics.Collections, DBConfig, DBConn;

type
  [TestFixture]
  TReservaControllerTest = class(TObject)
  private
    FController: TReservaController;
    FEspacoDAO: TEspacoDAO;
    FTipoEspacoDAO: TTipoEspacoDAO;
    FMembroDAO: TMembroDAO;
    DBConfig: TDBConfig;

    function CreateTestEspaco: TEspaco;
    function CreateTestMembro: TMembro;
    function CreateTestReserva(Espaco: TEspaco; Membro: TMembro): TReserva;
  public
    [Setup]
    procedure SetUp;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestInsertReserva;
    [Test]
    procedure TestUpdateReserva;
    [Test]
    procedure TestDeleteReserva;
    [Test]
    procedure TestGetReserva;
    [Test]
    procedure TestGetAllReservas;
  end;

implementation

procedure TReservaControllerTest.SetUp;
begin
  DBConfig := TDBConfig.Create('C:\Users\Vinicius\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
                               'sysdba',
                                'masterkey',
                                'localhost',
                                '3050');
  TDBConn.SetConfig(DBConfig);

  FTipoEspacoDAO := TTipoEspacoDAO.Create;
  FEspacoDAO := TEspacoDAO.Create;
  FMembroDAO := TMembroDAO.Create;
  FController := TReservaController.Create;
end;

procedure TReservaControllerTest.TearDown;
begin

end;

function TReservaControllerTest.CreateTestEspaco: TEspaco;
var
  TipoEspaco: TTipoEspaco;
begin
  TipoEspaco := TTipoEspaco.Create;
  TipoEspaco.DescEsp := 'Tipo Espaço Teste ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  TipoEspaco.Status := 'A';
  TipoEspaco.CodiEsp := FTipoEspacoDAO.Insert(TipoEspaco);

  Result := TEspaco.Create;
  Result.DescEsp := 'Espaço Teste ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  Result.Status := 'A';
  Result.StatEsp := 'L';
  Result.TipoEsp := TipoEspaco;
  Result.CodiEsp := FEspacoDAO.Insert(Result);
end;

function TReservaControllerTest.CreateTestMembro: TMembro;
var
  uniquePart, cpfBase: String;
begin
  uniquePart := FormatDateTime('nnsszzz', Now); // Minutos, segundos e milissegundos
  cpfBase := '123.456.' + Copy(uniquePart, 1, 3) + '-' + Copy(uniquePart, 4, 2); // Gerar CPF único

  Result := TMembro.Create;
  Result.NomeMemb := 'Membro Teste ' + FormatDateTime('yyyymmddhhnnsszzz', Now);
  Result.CpfMemb := cpfBase;
  Result.EmailMemb := 'teste@membro.com';
  Result.TeleMemb := '(00) 0000-0000';
  Result.DnascMemb := EncodeDate(1990, 1, 1);
  Result.Status := 'A';
  Result.CodiMemb := FMembroDAO.Insert(Result);
end;

function TReservaControllerTest.CreateTestReserva(Espaco: TEspaco; Membro: TMembro): TReserva;
begin
  Result := TReserva.Create;
  Result.DinicioRes := Now;
  Result.DfimRes := Now + 1;
  Result.EspaRes := Espaco;
  Result.MembRes := Membro;
  Result.Status := 'A';
end;

procedure TReservaControllerTest.TestInsertReserva;
var
  Espaco: TEspaco;
  Membro: TMembro;
  Reserva: TReserva;
  CodiRes: Integer;
begin
  Espaco := CreateTestEspaco;
  Membro := CreateTestMembro;
  Reserva := CreateTestReserva(Espaco, Membro);
  try
    CodiRes := FController.InsertReserva(Reserva);
    Assert.IsTrue(CodiRes > 0, 'Falha ao inserir reserva');
  finally
  end;
end;

procedure TReservaControllerTest.TestUpdateReserva;
var
  Espaco: TEspaco;
  Membro: TMembro;
  Reserva: TReserva;
  Updated: Boolean;
begin
  Espaco := CreateTestEspaco;
  Membro := CreateTestMembro;
  Reserva := CreateTestReserva(Espaco, Membro);
  try
    Reserva.CodiRes := FController.InsertReserva(Reserva);
    Reserva.DinicioRes := Now + 1; // Alterar a data de início para atualizar
    Updated := FController.UpdateReserva(Reserva);
    Assert.IsTrue(Updated, 'Falha ao atualizar reserva');
  finally
  end;
end;

procedure TReservaControllerTest.TestDeleteReserva;
var
  Espaco: TEspaco;
  Membro: TMembro;
  Reserva: TReserva;
  Deleted: Boolean;
begin
  Espaco := CreateTestEspaco;
  Membro := CreateTestMembro;
  Reserva := CreateTestReserva(Espaco, Membro);
  try
    Reserva.CodiRes := FController.InsertReserva(Reserva);
    Deleted := FController.DeleteReserva(Reserva.CodiRes);
    Assert.IsTrue(Deleted, 'Falha ao deletar reserva');
  finally
  end;
end;

procedure TReservaControllerTest.TestGetReserva;
var
  Espaco: TEspaco;
  Membro: TMembro;
  Reserva, RetrievedReserva: TReserva;
begin
  Espaco := CreateTestEspaco;
  Membro := CreateTestMembro;
  Reserva := CreateTestReserva(Espaco, Membro);
  try
    Reserva.CodiRes := FController.InsertReserva(Reserva);
    RetrievedReserva := FController.GetReserva(Reserva.CodiRes);
    try
      Assert.IsNotNull(RetrievedReserva, 'Reserva não encontrada');
      Assert.AreEqual(Reserva.DinicioRes, RetrievedReserva.DinicioRes, 'A reserva recuperada difere da reserva inserida');
    finally
      RetrievedReserva.Free;
    end;
  finally
  end;
end;

procedure TReservaControllerTest.TestGetAllReservas;
var
  Espaco: TEspaco;
  Membro: TMembro;
  Reservas: TObjectList<TReserva>;
begin
  Espaco := CreateTestEspaco;
  Membro := CreateTestMembro;
  CreateTestReserva(Espaco, Membro); // Cria uma reserva para garantir que a lista não estará vazia
  try
    Reservas := FController.GetAllReservas;
    try
      Assert.IsTrue(Reservas.Count > 0, 'Lista de reservas está vazia');
    finally
      Reservas.Free;
    end;
  finally
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TReservaControllerTest);
end.

