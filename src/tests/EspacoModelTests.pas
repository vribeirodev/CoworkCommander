unit EspacoModelTests;

interface

uses
  DUnitX.TestFramework,
  EspacoModel;

type
  [TestFixture]
  TEspacoTests = class(TObject)
  private
    FEspaco: TEspaco;
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

procedure TEspacoTests.Setup;
begin
  FEspaco := TEspaco.Create;
end;

procedure TEspacoTests.TearDown;
begin
  FEspaco.Free;
end;

procedure TEspacoTests.TestValidarDescricao(const Descricao: string);
begin
  if Descricao = '' then
    Assert.WillRaise(
      procedure
      begin
        FEspaco.DescEsp := Descricao;
      end, EEspacoException, 'A descrição do espaço não pode ser vazia.')
  else
    Assert.WillNotRaise(
      procedure
      begin
        FEspaco.DescEsp := Descricao;
      end);
end;

initialization
  TDUnitX.RegisterTestFixture(TEspacoTests);
end.

