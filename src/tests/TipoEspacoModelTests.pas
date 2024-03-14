unit TipoEspacoModelTests;

interface

uses
  DUnitX.TestFramework,
  TipoEspacoModel;

type
  [TestFixture]
  TTipoEspacoTests = class(TObject)
  private
    FEspaco: TTipoEspaco;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    [TestCase('Descri��o V�lida', 'Descri��o V�lida')]
    [TestCase('Descri��o Vazia', '')]
    procedure TestValidarDescricao(const Descricao: string);
  end;

implementation

procedure TTipoEspacoTests.Setup;
begin
  FEspaco := TTipoEspaco.Create;
end;

procedure TTipoEspacoTests.TearDown;
begin
  FEspaco.Free;
end;

procedure TTipoEspacoTests.TestValidarDescricao(const Descricao: string);
begin
  if Descricao = '' then
    Assert.WillRaise(
      procedure
      begin
        FEspaco.DescEsp := Descricao; // Isso invocar� SetDescTEquip e potencialmente lan�ar� a exce��o
      end, ETipoEspacoException, 'A descri��o do tipo de equipamento n�o pode ser vazia.')
  else
    Assert.WillNotRaise(
      procedure
      begin
        FEspaco.DescEsp := Descricao; // Como a descri��o � v�lida, n�o esperamos que uma exce��o seja lan�ada
      end);
end;

initialization
  TDUnitX.RegisterTestFixture(TTipoEspacoTests);
end.
