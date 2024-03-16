unit MembroControllerTest;

interface

uses
  DUnitX.TestFramework,
  MembroModel, MembroDAO, MembroController,
  System.SysUtils, System.Generics.Collections, DBConfig, DBConn;

type

  [TestFixture]
  TMembroControllerTest = class(TObject)
  private
    FMembroController: TMembroController;
    DBConfig: TDBconfig;
    function CreateTestMembro: TMembro;
  public
    [Setup]
    procedure SetUp;
    [TearDown]
    procedure TearDown;

    [Test]
    [TestCase('TestInsertMembro','')]
    procedure TestInsertMembro;

    [Test]
    [TestCase('TestUpdateMembro','')]
    procedure TestUpdateMembro;

    [Test]
    [TestCase('TestDeleteMembro','')]
    procedure TestDeleteMembro;

    [Test]
    [TestCase('TestGetMembro','')]
    procedure TestGetMembro;

    [Test]
    [TestCase('TestGetAllMembros','')]
    procedure TestGetAllMembros;
  end;

implementation

procedure TMembroControllerTest.SetUp;
begin
  DBConfig := TDBConfig.Create('C:\Users\Vinicius\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
                               'sysdba',
                               'masterkey',
                               'localhost',
                               '3050');
  FMembroController := TMembroController.Create;
end;

procedure TMembroControllerTest.TearDown;
begin
  FMembroController.Free;
end;

function TMembroControllerTest.CreateTestMembro: TMembro;
var
  uniquePart, cpfBase: String;
begin
  uniquePart := FormatDateTime('nnsszzz', Now); // Minutos, segundos e milissegundos
  cpfBase := '123.456.' + Copy(uniquePart, 1, 3) + '-' + Copy(uniquePart, 4, 2); // Gerar CPF único
  DBConfig := TDBConfig.Create('C:\Users\Vinicius\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
                               'sysdba',
                               'masterkey',
                               'localhost',
                               '3050');
  TDBConn.SetConfig(DBConfig);

  Result := TMembro.Create;
  Result.NomeMemb := 'Teste Membro';
  Result.CpfMemb := cpfBase;
  Result.EmailMemb := 'teste@membro.com';
  Result.TeleMemb := '(00) 0000-0000';
  Result.DnascMemb := EncodeDate(1990, 1, 1);
  Result.Status := 'A';
end;

procedure TMembroControllerTest.TestInsertMembro;
var
  Membro: TMembro;
  CodiMemb: Integer;
begin
  Membro := CreateTestMembro;
  try
    CodiMemb := FMembroController.InsertMembro(Membro);
    Assert.IsTrue(CodiMemb > 0, 'Falha ao inserir membro');
  finally
    Membro.Free;
  end;
end;

procedure TMembroControllerTest.TestUpdateMembro;
var
  Membro: TMembro;
  Updated: Boolean;
begin
  Membro := CreateTestMembro;
  try
    Membro.CodiMemb := FMembroController.InsertMembro(Membro);
    Membro.NomeMemb := 'Membro Atualizado';
    Updated := FMembroController.UpdateMembro(Membro);
    Assert.IsTrue(Updated, 'Falha ao atualizar membro');
  finally
    Membro.Free;
  end;
end;

procedure TMembroControllerTest.TestDeleteMembro;
var
  Membro: TMembro;
  Deleted: Boolean;
begin
  Membro := CreateTestMembro;
  try
    Membro.CodiMemb := FMembroController.InsertMembro(Membro);
    Deleted := FMembroController.DeleteMembro(Membro.CodiMemb);
    Assert.IsTrue(Deleted, 'Falha ao deletar membro');
  finally
    Membro.Free;
  end;
end;

procedure TMembroControllerTest.TestGetMembro;
var
  Membro, RetrievedMembro: TMembro;
begin
  Membro := CreateTestMembro;
  try
    Membro.CodiMemb := FMembroController.InsertMembro(Membro);
    RetrievedMembro := FMembroController.GetMembro(Membro.CodiMemb);
    try
      Assert.IsNotNull(RetrievedMembro, 'Membro não encontrado');
      Assert.AreEqual(Membro.NomeMemb, RetrievedMembro.NomeMemb, 'O membro recuperado é diferente do esperado');
    finally
      RetrievedMembro.Free;
    end;
  finally
    Membro.Free;
  end;
end;

procedure TMembroControllerTest.TestGetAllMembros;
var
  Membros: TObjectList<TMembro>;
begin
  CreateTestMembro; // Garante que haja pelo menos um membro para recuperar
  Membros := FMembroController.GetAllMembros;
  try
    Assert.IsTrue(Membros.Count > 0, 'Lista de membros está vazia');
  finally
    Membros.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TMembroControllerTest);
end.
