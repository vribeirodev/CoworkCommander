program CoworkingCommander;

uses
  Vcl.Forms,
  System.SysUtils,
  DBConn in 'services\DBConn.pas',
  LogUtils in 'services\LogUtils.pas',
  uLogin in 'views\uLogin.pas' {FormLogin},
  uLayout in 'views\uLayout.pas' {FormLayout},
  uDBConfig in 'views\uDBConfig.pas' {FormDBConfig},
  DBConfig in 'services\DBConfig.pas' {$R *.res},
  DBConfigController in 'controllers\DBConfigController.pas',
  DBConfigFileHandler in 'services\DBConfigFileHandler.pas',
  DBConfigValidator in 'validators\DBConfigValidator.pas',
  UserModel in 'models\UserModel.pas',
  UserDAO in 'dao\UserDAO.pas',
  FDQueryFactory in 'services\FDQueryFactory.pas',
  UserController in 'controllers\UserController.pas',
  UserValidator in 'validators\UserValidator.pas',
  Security in 'services\Security.pas',
  UserDAOIntf in 'dao\UserDAOIntf.pas',
  FireDAC.Comp.UI,
  FireDAC.VCLUI.Wait,
  UserFactoryIntf in 'services\UserFactoryIntf.pas',
  UserFactory in 'services\UserFactory.pas',
  uFormPrincipal in 'uFormPrincipal.pas' {FormPrincipal},
  uUser in 'views\uUser.pas' {FormUser},
  MembroModel in 'models\MembroModel.pas',
  TipoEquipModel in 'models\TipoEquipModel.pas',
  EquipamentoModel in 'models\EquipamentoModel.pas',
  TipoEspacoModel in 'models\TipoEspacoModel.pas',
  EspacoModel in 'models\EspacoModel.pas',
  ManutencaoModel in 'models\ManutencaoModel.pas',
  ReservaModel in 'models\ReservaModel.pas',
  MembroDAO in 'dao\MembroDAO.pas',
  TipoEquipDAO in 'dao\TipoEquipDAO.pas',
  EquipamentoDAO in 'dao\EquipamentoDAO.pas',
  EspacoDAO in 'dao\EspacoDAO.pas',
  TipoEspacoDAO in 'dao\TipoEspacoDAO.pas',
  ReservaDAO in 'dao\ReservaDAO.pas',
  ManutencaoDAO in 'dao\ManutencaoDAO.pas',
  TipoEquipController in 'controllers\TipoEquipController.pas',
  TipoEspacoController in 'controllers\TipoEspacoController.pas',
  EspacoController in 'controllers\EspacoController.pas',
  EquipamentoController in 'controllers\EquipamentoController.pas',
  MembroController in 'controllers\MembroController.pas',
  ManutencaoController in 'controllers\ManutencaoController.pas',
  ReservaController in 'controllers\ReservaController.pas',
  uMembros in 'views\uMembros.pas' {FormMembros},
  uEspacos in 'views\uEspacos.pas' {FormEspacos},
  uBuscaTipoEspaco in 'views\uBuscaTipoEspaco.pas' {FormBuscaTipoEspaco},
  uManutencoes in 'views\uManutencoes.pas' {FormManutencoes},
  uBuscaEspaco in 'views\uBuscaEspaco.pas' {FormBuscaEspaco},
  uRecursos in 'views\uRecursos.pas' {FormRecursos},
  uBuscaTipoRecurso in 'views\uBuscaTipoRecurso.pas' {FormBuscaTipoRecurso},
  uBuscaMembros in 'views\uBuscaMembros.pas' {FormBuscarMembros},
  uReservas in 'views\uReservas.pas' {FormReservas},
  uRelatorios in 'views\uRelatorios.pas' {FormRelatorios},
  uRelatorioMembros in 'views\uRelatorioMembros.pas' {FormRelatorioMembro},
  uRelatorioData in 'views\uRelatorioData.pas' {FormRelatorioData};

{$R *.res}

var
  DBConfigFileHandler: TDBConfigFileHandler;
  DBConfig: TDBConfig;
begin
  Application.Initialize;
  TFDGUIxWaitCursor.Create(nil);

  DBConfigFileHandler := TDBConfigFileHandler.Create;
  try
    DBConfig := DBConfigFileHandler.LoadFromFile;
    TDBConn.SetConfig(DBConfig);
  except
    on E: Exception do
    begin
      Application.ShowException(E);
      Halt(1);
    end;
  end;

  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormUser, FormUser);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormMembros, FormMembros);
  Application.CreateForm(TFormEspacos, FormEspacos);
  Application.CreateForm(TFormBuscaTipoEspaco, FormBuscaTipoEspaco);
  Application.CreateForm(TFormManutencoes, FormManutencoes);
  Application.CreateForm(TFormBuscaEspaco, FormBuscaEspaco);
  Application.CreateForm(TFormRecursos, FormRecursos);
  Application.CreateForm(TFormBuscaTipoRecurso, FormBuscaTipoRecurso);
  Application.CreateForm(TFormBuscarMembros, FormBuscarMembros);
  Application.CreateForm(TFormReservas, FormReservas);
  Application.CreateForm(TFormRelatorios, FormRelatorios);
  Application.CreateForm(TFormRelatorioData, FormRelatorioData);
  Application.Run;
end.

