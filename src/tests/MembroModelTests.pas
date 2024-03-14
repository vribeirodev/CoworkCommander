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
    [TestCase('Teste CPF Válido','123.456.789-09')]
    [TestCase('Teste CPF Inválido Formato','12345678909')]
    [TestCase('Teste CPF Inválido Caracteres','123.456.789-0x')]
    procedure TestValidarCPF(CPF: string);

    [Test]
    [TestCase('Teste Email Válido','email@teste.com')]
    [TestCase('Teste Email Inválido Formato','email@teste')]
    [TestCase('Teste Email Inválido Caracteres','email@!teste.com')]
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
  // Configurando valores válidos para os outros campos
  FMembro.CodiMemb := 1; // Apenas um exemplo, ajuste conforme necessário
  FMembro.CpfMemb := '123.456.789-09'; // Um CPF no formato válido
  FMembro.EmailMemb := 'email@teste.com'; // Um email válido
  FMembro.TeleMemb := '11999999999'; // Um telefone no formato que você espera
  FMembro.DnascMemb := EncodeDate(2000, 1, 1); // Uma data de nascimento válida
  FMembro.Dinsert := Now; // Data e hora atuais para inserção
  FMembro.Dmanut := Now; // Data e hora atuais para manutenção
  FMembro.Status := 'A'; // Status ativo

  // Configurando o valor que está sendo testado
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
