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
    function GerarCPF: string;
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
  DBConfig := TDBConfig.Create('C:\Users\Vinicius Ribeiro\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
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

function TMembroControllerTest.GerarCPF: string;
var
  i, j, soma, resto, digito1, digito2: Integer;
  cpfParcial: string;
  cpfArray: array[1..9] of Integer;
begin
  Randomize;
  for i := 1 to 9 do
    cpfArray[i] := Random(10);

  soma := 0;
  for i := 1 to 9 do
    soma := soma + (cpfArray[i] * (11 - i));

  resto := soma mod 11;
  if (resto = 0) or (resto = 1) then
    digito1 := 0
  else
    digito1 := 11 - resto;

  cpfParcial := '';
  for i := 1 to 9 do
    cpfParcial := cpfParcial + IntToStr(cpfArray[i]);

  cpfParcial := cpfParcial + IntToStr(digito1);

  soma := 0;
  for i := 1 to 10 do
    soma := soma + (StrToInt(cpfParcial[i]) * (12 - i));

  resto := soma mod 11;
  if (resto = 0) or (resto = 1) then
    digito2 := 0
  else
    digito2 := 11 - resto;

  Result := cpfParcial + IntToStr(digito2);

  // Formatar o CPF no estilo xxx.xxx.xxx-xx
  Result := Copy(Result, 1, 3) + '.' + Copy(Result, 4, 3) + '.' + Copy(Result, 7, 3) + '-' + Copy(Result, 10, 2);
end;


function TMembroControllerTest.CreateTestMembro: TMembro;
var
  uniquePart1, uniquePart2, cpfBase: String;
begin
  uniquePart1 := FormatDateTime('nnsszzz', Now); // Minutos, segundos e milissegundos
  uniquePart2 := FormatDateTime('nnsszzz', Now); // Minutos, segundos e milissegundos
  cpfBase := GerarCPF;
  DBConfig := TDBConfig.Create('C:\Users\Vinicius Ribeiro\Documents\Projetos\CoworkCommander\Database\CCDB.FDB',
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
