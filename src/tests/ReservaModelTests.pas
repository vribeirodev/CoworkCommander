unit ReservaModelTests;

interface

uses
  DUnitX.TestFramework, ReservaModel, System.SysUtils;

type
  [TestFixture]
  TReservaTests = class(TObject)
  private
    FReserva: TReserva;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestDinicioResBeforeDfimRes;
    [Test]
    procedure TestEspacoMembroAssigned;
  end;

implementation

procedure TReservaTests.Setup;
begin
  FReserva := TReserva.Create;
end;

procedure TReservaTests.TearDown;
begin
  FreeAndNil(FReserva);
end;

procedure TReservaTests.TestDinicioResBeforeDfimRes;
begin
  FReserva.DinicioRes := Now;
  FReserva.DfimRes := Now + 1; // Assume que a reserva termina 1 dia ap�s o in�cio
  Assert.IsTrue(FReserva.DinicioRes < FReserva.DfimRes, 'Data de in�cio deve ser anterior � data de fim');
end;

procedure TReservaTests.TestEspacoMembroAssigned;
begin
  Assert.IsNotNull(FReserva.EspaRes, 'Inst�ncia de Espa�o n�o foi criada corretamente');
  Assert.IsNotNull(FReserva.MembRes, 'Inst�ncia de Membro n�o foi criada corretamente');
end;

initialization
  TDUnitX.RegisterTestFixture(TReservaTests);
end.
