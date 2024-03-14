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
        FEquip.DescTEquip := Descricao; // Isso invocar� SetDescTEquip e potencialmente lan�ar� a exce��o
      end, ETipoEquipException, 'A descri��o do tipo de equipamento n�o pode ser vazia.')
  else
    Assert.WillNotRaise(
      procedure
      begin
        FEquip.DescTEquip := Descricao; // Como a descri��o � v�lida, n�o esperamos que uma exce��o seja lan�ada
      end);
end;

initialization
  TDUnitX.RegisterTestFixture(TTipoEquipTests);
end.
