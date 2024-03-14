unit TipoEquipModelTests;

interface

uses
  DUnitX.TestFramework,
  TipoEquipModel;

type

  [TestFixture]
  TTipoEquipTests = class(TObject)
  private
    FEquip: TTipoEquip;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    // Testes
    [Test]
    [TestCase('Descricao Valida','Descricao Valida')]
    [TestCase('Descricao Vazia','')]
    procedure TestValidarDescricao(const Descricao: string);
  end;

implementation

procedure TTipoEquipTests.Setup;
begin
  FEquip := TTipoEquip.Create;
end;

procedure TTipoEquipTests.TearDown;
begin
  FEquip.Free;
end;

procedure TTipoEquipTests.TestValidarDescricao(const Descricao: string);
begin
  if Descricao = '' then
    Assert.WillRaise(
      procedure
      begin
        FEquip.DescTEquip := Descricao; // Isso invocará SetDescTEquip e potencialmente lançará a exceção
      end, ETipoEquipException, 'A descrição do tipo de equipamento não pode ser vazia.')
  else
    Assert.WillNotRaise(
      procedure
      begin
        FEquip.DescTEquip := Descricao; // Como a descrição é válida, não esperamos que uma exceção seja lançada
      end);
end;

initialization
  TDUnitX.RegisterTestFixture(TTipoEquipTests);
end.
