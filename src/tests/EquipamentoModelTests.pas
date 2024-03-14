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
        FEquipamento.DescEquip := Descricao; // Isso invocar� SetDescEquip e potencialmente lan�ar� a exce��o
      end, EEquipamentoException, 'A descri��o do equipamento n�o pode ser vazia.')
  else
    Assert.WillNotRaise(
      procedure
      begin
        FEquipamento.DescEquip := Descricao; // Como a descri��o � v�lida, n�o esperamos que uma exce��o seja lan�ada
      end);
end;

initialization
  TDUnitX.RegisterTestFixture(TEquipamentoTests);
end.

