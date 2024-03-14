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
    [TestCase('Descri��o V�lida', 'Descri��o V�lida')]
    [TestCase('Descri��o Vazia', '')]
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
      end, EEspacoException, 'A descri��o do espa�o n�o pode ser vazia.')
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

