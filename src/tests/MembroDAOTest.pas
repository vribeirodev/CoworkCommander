unit MembroDAOTest;

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  DUnitX.TestFramework,
  MembroModel,
  MembroDAO,
  DBConn,
  DBConfig;

type

  [TestFixture]
  TMembroDAOTest = class(TObject)
  private
    FMembroDAO: TMembroDAO;
    FMembro: TMembro;
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

procedure TMembroDAOTest.SetUp;
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

  FMembroDAO := TMembroDAO.Create;

  FMembro := TMembro.Create;
  FMembro.NomeMemb := 'TestNomeMemb_' + FormatDateTime('yyyymmddhhnnss', Now);
  FMembro.CpfMemb := cpfBase;
  FMembro.EmailMemb := 'test@email.com';
  FMembro.TeleMemb := '0000-0000';
  FMembro.DnascMemb := EncodeDate(2000, 1, 1);
  FMembro.Status := 'A';
end;

procedure TMembroDAOTest.TearDown;
begin
  FMembroDAO.Free;
  FMembro.Free;
  DBConfig.Free;
end;

procedure TMembroDAOTest.TestInsertAndSelect;
var
  NewMembroID: Integer;
  Membro: TMembro;
begin
  // Test Insert
  NewMembroID := FMembroDAO.Insert(FMembro);
  FMembro.CodiMemb := NewMembroID;
  Assert.IsTrue(NewMembroID > 0, 'Failed on Insert');

  // Test Select
  Membro := FMembroDAO.Select(NewMembroID);
  try
    Assert.IsNotNull(Membro, 'Failed on Select');
    Assert.AreEqual(FMembro.NomeMemb, Membro.NomeMemb, 'NomeMemb does not match');
    Assert.AreEqual(FMembro.CpfMemb, Membro.CpfMemb, 'CpfMemb does not match');
  finally
    Membro.Free;
  end;
end;

procedure TMembroDAOTest.TestUpdate;
begin
  FMembro.NomeMemb := 'UpdatedNome_' + FormatDateTime('yyyymmddhhnnss', Now);
  Assert.IsTrue(FMembroDAO.Update(FMembro), 'Failed on Update');
end;

procedure TMembroDAOTest.TestGetAll;
var
  Membros: TObjectList<TMembro>;
begin
  Membros := FMembroDAO.GetAll;
  try
    Assert.IsTrue(Membros.Count > 0, 'No members found');
  finally
    Membros.Free;
  end;
end;

procedure TMembroDAOTest.TestDelete;
begin
  Assert.IsTrue(FMembroDAO.Delete(FMembro), 'Failed on Delete');
end;

initialization
  TDUnitX.RegisterTestFixture(TMembroDAOTest);

end.

