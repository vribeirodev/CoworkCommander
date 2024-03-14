unit MembroModelTests;

interface

uses
  DUnitX.TestFramework,
  MembroModel;

type

  [TestFixture]
  TMembroTests = class(TObject)
  private
    FMembro: TMembro;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    // Testes
    [Test]
    [TestCase('Teste CPF V�lido','123.456.789-09')]
    [TestCase('Teste CPF Inv�lido Formato','12345678909')]
    [TestCase('Teste CPF Inv�lido Caracteres','123.456.789-0x')]
    procedure TestValidarCPF(CPF: string);

    [Test]
    [TestCase('Teste Email V�lido','email@teste.com')]
    [TestCase('Teste Email Inv�lido Formato','email@teste')]
    [TestCase('Teste Email Inv�lido Caracteres','email@!teste.com')]
    procedure TestValidarEmail(Email: string);

    [Test]
    [TestCase('Teste Nome Vazio','')]
    [TestCase('Teste Nome Preenchido','Nome Teste')]
    procedure TestValidarNome(Nome: string);
  end;

implementation

uses
  System.SysUtils;

procedure TMembroTests.Setup;
begin
  FMembro := TMembro.Create;
end;

procedure TMembroTests.TearDown;
begin
  FMembro.Free;
end;

procedure TMembroTests.TestValidarCPF(CPF: string);
begin
  FMembro.CpfMemb := CPF;
  if CPF = '123.456.789-09' then
    Assert.WillNotRaiseAny(
      procedure
      begin
        FMembro.ValidarCPF(FMembro.CpfMemb);
      end)
  else
    Assert.WillRaise(
      procedure
      begin
        FMembro.ValidarCPF(FMembro.CpfMemb);
      end, EMembroException);
end;

procedure TMembroTests.TestValidarEmail(Email: string);
begin
  FMembro.EmailMemb := Email;
  if Email = 'email@teste.com' then
    Assert.WillNotRaiseAny(
      procedure
      begin
        FMembro.ValidarEmail(FMembro.EmailMemb);
      end)
  else
    Assert.WillRaise(
      procedure
      begin
        FMembro.ValidarEmail(FMembro.EmailMemb);
      end, EMembroException);
end;

procedure TMembroTests.TestValidarNome(Nome: string);
begin
  // Configurando valores v�lidos para os outros campos
  FMembro.CodiMemb := 1; // Apenas um exemplo, ajuste conforme necess�rio
  FMembro.CpfMemb := '123.456.789-09'; // Um CPF no formato v�lido
  FMembro.EmailMemb := 'email@teste.com'; // Um email v�lido
  FMembro.TeleMemb := '11999999999'; // Um telefone no formato que voc� espera
  FMembro.DnascMemb := EncodeDate(2000, 1, 1); // Uma data de nascimento v�lida
  FMembro.Dinsert := Now; // Data e hora atuais para inser��o
  FMembro.Dmanut := Now; // Data e hora atuais para manuten��o
  FMembro.Status := 'A'; // Status ativo

  // Configurando o valor que est� sendo testado
  FMembro.NomeMemb := Nome;

  // Realizando o teste
  if Nome = '' then
    Assert.WillRaise(FMembro.ValidarDados, EMembroException)
  else
    Assert.WillNotRaiseAny(FMembro.ValidarDados);
end;


initialization
  TDUnitX.RegisterTestFixture(TMembroTests);
end.
