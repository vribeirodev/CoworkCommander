unit EquipamentoModelTests;

interface

uses
  DUnitX.TestFramework,
  System.SysUtils,
  EquipamentoModel;

type
  [TestFixture]
  TEquipamentoTests = class(TObject)
  private
    FEquipamento: TEquipamento;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    // Testes
    [Test]
    [TestCase('Descricao Valida', 'Descricao Valida')]
    [TestCase('Descricao Vazia', '')]
    procedure TestValidarDescricao(const Descricao: string);
  end;

implementation

procedure TEquipamentoTests.Setup;
begin
  FEquipamento := TEquipamento.Create;
end;

procedure TEquipamentoTests.TearDown;
begin
  FreeAndNil(FEquipamento);
end;

procedure TEquipamentoTests.TestValidarDescricao(const Descricao: string);
begin
  if Descricao = '' then
    Assert.WillRaise(
      procedure
      begin
        FEquipamento.DescEquip := Descricao; // Isso invocará SetDescEquip e potencialmente lançará a exceção
      end, EEquipamentoException, 'A descrição do equipamento não pode ser vazia.')
  else
    Assert.WillNotRaise(
      procedure
      begin
        FEquipamento.DescEquip := Descricao; // Como a descrição é válida, não esperamos que uma exceção seja lançada
      end);
end;

initialization
  TDUnitX.RegisterTestFixture(TEquipamentoTests);
end.

