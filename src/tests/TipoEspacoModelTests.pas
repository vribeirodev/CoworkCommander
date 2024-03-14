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
    [TestCase('Descrição Válida', 'Descrição Válida')]
    [TestCase('Descrição Vazia', '')]
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
        FEspaco.DescEsp := Descricao; // Isso invocará SetDescTEquip e potencialmente lançará a exceção
      end, ETipoEspacoException, 'A descrição do tipo de equipamento não pode ser vazia.')
  else
    Assert.WillNotRaise(
      procedure
      begin
        FEspaco.DescEsp := Descricao; // Como a descrição é válida, não esperamos que uma exceção seja lançada
      end);
end;

initialization
  TDUnitX.RegisterTestFixture(TTipoEspacoTests);
end.
