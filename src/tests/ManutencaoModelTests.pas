unit ManutencaoModelTests;

interface

uses
  DUnitX.TestFramework,
  ManutencaoModel;

type
  [TestFixture]
  TManutencaoTests = class(TObject)
  private
    FManutencao: TManutencao;
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

procedure TManutencaoTests.Setup;
begin
  FManutencao := TManutencao.Create;
end;

procedure TManutencaoTests.TearDown;
begin
  FManutencao.Free;
end;

procedure TManutencaoTests.TestValidarDescricao(const Descricao: string);
begin
  if Descricao = '' then
    Assert.WillRaise(
      procedure
      begin
        FManutencao.DescManut := Descricao;
      end, EManutencaoException, 'A descri��o da manuten��o n�o pode ser vazia.')
  else
    Assert.WillNotRaise(
      procedure
      begin
        FManutencao.DescManut := Descricao;
      end);
end;

initialization
  TDUnitX.RegisterTestFixture(TManutencaoTests);
end.

