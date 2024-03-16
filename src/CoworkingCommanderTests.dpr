
program CoworkingCommanderTests;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  {$ENDIF }
  DUnitX.TestFramework,
  UserModelTests in 'tests\UserModelTests.pas',
  UserDAOTest in 'tests\UserDAOTest.pas',
  UserValidatorTest in 'tests\UserValidatorTest.pas',
  SecurityTests in 'tests\SecurityTests.pas',
  UserControllerTests in 'tests\UserControllerTests.pas',
  MembroModelTests in 'tests\MembroModelTests.pas',
  TipoEquipModelTests in 'tests\TipoEquipModelTests.pas',
  EquipamentoModelTests in 'tests\EquipamentoModelTests.pas',
  TipoEspacoModelTests in 'tests\TipoEspacoModelTests.pas',
  EspacoModelTests in 'tests\EspacoModelTests.pas',
  ManutencaoModelTests in 'tests\ManutencaoModelTests.pas',
  ReservaModelTests in 'tests\ReservaModelTests.pas',
  MembroDAOTest in 'tests\MembroDAOTest.pas',
  TipoEquipDAOTest in 'tests\TipoEquipDAOTest.pas',
  TipoEspacoDAOTest in 'tests\TipoEspacoDAOTest.pas',
  EspacoDAOTest in 'tests\EspacoDAOTest.pas',
  EquipamentoDAOTest in 'tests\EquipamentoDAOTest.pas',
  ReservaDAOTest in 'tests\ReservaDAOTest.pas',
  ManutencaoDAOTest in 'tests\ManutencaoDAOTest.pas',
  TipoEquipControllerTest in 'tests\TipoEquipControllerTest.pas',
  TipoEspacoControllerTest in 'tests\TipoEspacoControllerTest.pas',
  EspacoControllerTest in 'tests\EspacoControllerTest.pas',
  EquipamentoControllerTest in 'tests\EquipamentoControllerTest.pas',
  MembroControllerTest in 'tests\MembroControllerTest.pas',
  ManutencaoControllerTest in 'tests\ManutencaoControllerTest.pas',
  ReservaControllerTest in 'tests\ReservaControllerTest.pas';

{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := False;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    TDUnitX.Options.ExitBehavior := TDUnitXExitBehavior.Pause;
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
end.
