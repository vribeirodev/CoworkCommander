unit uFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, System.Generics.Collections, uUser, uMembros,
  uEspacos, uManutencoes, uRecursos, uReservas, uRelatorios;

type
  TPanelIndex = (piUsuarios = 1, piMembros = 2, piEspacos = 3, piRecursos = 4, piReservas = 5, piManutencoes = 6, piRelatorios = 7);

  TFormPrincipal = class(TForm)
    pnlFundo: TPanel;
    pnlBot: TPanel;
    pnlBotoes: TPanel;
    pnlBtnUsuarios: TPanel;
    pnlUsuarios: TPanel;
    pnlUsuariosLinha2: TPanel;
    pnlUsuariosLinha4: TPanel;
    pnlUsuariosLinha1: TPanel;
    pnlUsuariosLinha3: TPanel;
    pnlUsuariosFundo: TPanel;
    lblUsuarios: TLabel;
    imgUsuarios: TImage;
    pnlBtnUsuariosBorda1: TPanel;
    pnlBtnUsuariosBorda2: TPanel;
    pnlTop: TPanel;
    pnlSuperior: TPanel;
    btnFechar: TSpeedButton;
    pnlMarginLeft: TPanel;
    lblBemVindo: TLabel;
    pnlBtnMembros: TPanel;
    pnlMembros: TPanel;
    pnlMembrosLinha4: TPanel;
    pnlMembrosLinha3: TPanel;
    pnlMembrosLinha2: TPanel;
    pnlMembrosLinha1: TPanel;
    pnlMembrosFundo: TPanel;
    lblMembros: TLabel;
    imgMembros: TImage;
    pnlBtnMembrosBorda1: TPanel;
    pnlBtnMembrosBorda2: TPanel;
    pnlBtnEspacos: TPanel;
    pnlEspacos: TPanel;
    pnlEspacosLinha1: TPanel;
    pnlEspacosLinha4: TPanel;
    pnlEspacosLinha3: TPanel;
    pnlEspacosLinha2: TPanel;
    pnlEspacosFundo: TPanel;
    lblEspacos: TLabel;
    imgEspacos: TImage;
    pnlBtnEspacosBorda1: TPanel;
    pnlBtnEspacosBorda2: TPanel;
    pnlBtnRecursos: TPanel;
    pnlRecursos: TPanel;
    pnlRecursosLinha1: TPanel;
    pnlRecursosLinha4: TPanel;
    pnlRecursosLinha3: TPanel;
    pnlRecursosLinha2: TPanel;
    pnlRecursosFundo: TPanel;
    lblRecursos: TLabel;
    imgRecursos: TImage;
    pnlBtnRecursosBorda2: TPanel;
    pnlBtnRecursosBorda1: TPanel;
    pnlBtnReservas: TPanel;
    pnlReservas: TPanel;
    pnlReservasLinha1: TPanel;
    pnlReservasLinha4: TPanel;
    pnlReservasLinha3: TPanel;
    pnlReservasLinha2: TPanel;
    pnlReservasFundo: TPanel;
    lblReservas: TLabel;
    imgReservas: TImage;
    pnlBtnReservasBorda1: TPanel;
    pnlBtnReservasBorda2: TPanel;
    pnlBtnManutencoes: TPanel;
    pnlManutencoes: TPanel;
    pnlManutencoesLinha1: TPanel;
    pnlManutencoesLinha4: TPanel;
    pnlManutencoesLinha3: TPanel;
    pnlManutencoesLinha2: TPanel;
    pnlManutencoesFundo: TPanel;
    lblManutencoes: TLabel;
    imgManutencoes: TImage;
    pnlBtnManutencoesBorda1: TPanel;
    pnlBtnManutencoesBorda2: TPanel;
    pnlBtnRelatorios: TPanel;
    pnlRelatorios: TPanel;
    pnlRelatoriosLinha1: TPanel;
    pnlRelatoriosLinha2: TPanel;
    pnlRelatoriosLinha3: TPanel;
    pnlRelatoriosLinha4: TPanel;
    pnlRelatoriosFundo: TPanel;
    lblRelatorios: TLabel;
    imgRelatorios: TImage;
    pnlBtnRelatoriosBorda1: TPanel;
    pnlBtnRelatoriosBorda2: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure pnlUsuariosFundoClick(Sender: TObject);
    procedure imgUsuariosClick(Sender: TObject);
    procedure lblUsuariosClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlMembrosFundoClick(Sender: TObject);
    procedure imgMembrosClick(Sender: TObject);
    procedure lblMembrosClick(Sender: TObject);
    procedure imgEspacosClick(Sender: TObject);
    procedure pnlEspacosFundoClick(Sender: TObject);
    procedure lblEspacosClick(Sender: TObject);
    procedure pnlManutencoesFundoClick(Sender: TObject);
    procedure imgManutencoesClick(Sender: TObject);
    procedure lblManutencoesClick(Sender: TObject);
    procedure pnlRecursosFundoClick(Sender: TObject);
    procedure imgRecursosClick(Sender: TObject);
    procedure lblRecursosClick(Sender: TObject);
    procedure pnlReservasFundoClick(Sender: TObject);
    procedure imgReservasClick(Sender: TObject);
    procedure lblReservasClick(Sender: TObject);
    procedure pnlRelatoriosFundoClick(Sender: TObject);
    procedure imgRelatoriosClick(Sender: TObject);
    procedure lblRelatoriosClick(Sender: TObject);
  private
    PanelList: Array[TPanelIndex] of TPanel;
    procedure AssignCommonProperties(img: TImage; lbl: TLabel; pnl: TPanel; index: TPanelIndex);
    procedure ChangePanelColor(panel: TPanel; color: TColor);
    procedure PositionPanel;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ChangeColorOnMouseEnter(Sender: TObject);
    procedure ChangeColorOnMouseLeave(Sender: TObject);
  end;

var
  FormPrincipal: TFormPrincipal;

const
  PanelMouseEnterColor = clBtnFace;
  PanelMouseLeaveColor = clWhite;

implementation

{$R *.dfm}

procedure TFormPrincipal.PositionPanel;
begin
  if Assigned(pnlFundo) then
  begin
    pnlFundo.Align := alNone;

    OutputDebugString(PChar('Form Width: ' + IntToStr(FormPrincipal.ClientWidth)));
    OutputDebugString(PChar('Form Height: ' + IntToStr(FormPrincipal.ClientHeight)));
    OutputDebugString(PChar('Panel Width: ' + IntToStr(pnlFundo.Width)));
    OutputDebugString(PChar('Panel Height: ' + IntToStr(pnlFundo.Height)));

    pnlFundo.Left := (ClientWidth - pnlFundo.Width) div 2;
    pnlFundo.Top := (ClientHeight - pnlFundo.Height) div 2;

    OutputDebugString(PChar('Panel Left: ' + IntToStr(pnlFundo.Left)));
    OutputDebugString(PChar('Panel Top: ' + IntToStr(pnlFundo.Top)));
  end;
end;


procedure TFormPrincipal.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormPrincipal.AssignCommonProperties(img: TImage; lbl: TLabel; pnl: TPanel; index: TPanelIndex);
var
  TagValue: Integer;
begin
  TagValue := Ord(index);

  img.Tag := TagValue;
  lbl.Tag := TagValue;
  pnl.Tag := TagValue;

  img.OnMouseEnter := ChangeColorOnMouseEnter;
  img.OnMouseLeave := ChangeColorOnMouseLeave;
  lbl.OnMouseEnter := ChangeColorOnMouseEnter;
  lbl.OnMouseLeave := ChangeColorOnMouseLeave;
  pnl.OnMouseEnter := ChangeColorOnMouseEnter;
  pnl.OnMouseLeave := ChangeColorOnMouseLeave;
end;

constructor TFormPrincipal.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  PanelList[piUsuarios] := pnlUsuariosFundo;
  PanelList[piMembros]  := pnlMembrosFundo;
  PanelList[piEspacos]  := pnlEspacosFundo;
  PanelList[piRecursos]  := pnlRecursosFundo;
  PanelList[piReservas]  := pnlReservasFundo;
  PanelList[piManutencoes]  := pnlManutencoesFundo;
  PanelList[piRelatorios]  := pnlRelatoriosFundo;


  AssignCommonProperties(imgUsuarios, lblUsuarios, pnlUsuariosFundo, piUsuarios);
  AssignCommonProperties(imgMembros, lblMembros, pnlMembrosFundo, piMembros);
  AssignCommonProperties(imgEspacos, lblEspacos, pnlEspacosFundo, piEspacos);
  AssignCommonProperties(imgRecursos, lblRecursos, pnlRecursosFundo, piRecursos);
  AssignCommonProperties(imgReservas, lblReservas, pnlReservasFundo, piReservas);
  AssignCommonProperties(imgManutencoes, lblManutencoes, pnlManutencoesFundo, piManutencoes);
  AssignCommonProperties(imgRelatorios, lblRelatorios, pnlRelatoriosFundo, piRelatorios);

end;


procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  PositionPanel;
end;

procedure TFormPrincipal.FormResize(Sender: TObject);
begin
  PositionPanel;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  PositionPanel;
end;

procedure TFormPrincipal.imgEspacosClick(Sender: TObject);
begin
  pnlEspacosFundoClick(Sender);
end;

procedure TFormPrincipal.imgManutencoesClick(Sender: TObject);
begin
  pnlManutencoesFundoClick(Sender);
end;

procedure TFormPrincipal.imgMembrosClick(Sender: TObject);
begin
  pnlMembrosFundoClick(Sender);
end;

procedure TFormPrincipal.imgRecursosClick(Sender: TObject);
begin
  pnlRecursosFundoClick(Sender);
end;

procedure TFormPrincipal.imgRelatoriosClick(Sender: TObject);
begin
  pnlRelatoriosFundoClick(Sender);
end;

procedure TFormPrincipal.imgReservasClick(Sender: TObject);
begin
  pnlReservasFundoClick(Sender);
end;

procedure TFormPrincipal.imgUsuariosClick(Sender: TObject);
begin
  pnlUsuariosFundoClick(Sender);
end;

procedure TFormPrincipal.lblEspacosClick(Sender: TObject);
begin
  pnlEspacosFundoClick(Sender);
end;

procedure TFormPrincipal.lblManutencoesClick(Sender: TObject);
begin
  pnlManutencoesFundoClick(Sender);
end;

procedure TFormPrincipal.lblMembrosClick(Sender: TObject);
begin
  pnlMembrosFundoClick(Sender);
end;

procedure TFormPrincipal.lblRecursosClick(Sender: TObject);
begin
  pnlRecursosFundoClick(Sender);
end;

procedure TFormPrincipal.lblRelatoriosClick(Sender: TObject);
begin
  pnlRelatoriosFundoClick(Sender);
end;

procedure TFormPrincipal.lblReservasClick(Sender: TObject);
begin
  pnlReservasFundoClick(Sender);
end;

procedure TFormPrincipal.lblUsuariosClick(Sender: TObject);
begin
  pnlUsuariosFundoClick(Sender);
end;

procedure TFormPrincipal.ChangeColorOnMouseEnter(Sender: TObject);
begin
  if Sender is TComponent then
    ChangePanelColor(PanelList[TPanelIndex((Sender as TComponent).Tag)], PanelMouseEnterColor);
end;

procedure TFormPrincipal.ChangeColorOnMouseLeave(Sender: TObject);
begin
  if Sender is TComponent then
    ChangePanelColor(PanelList[TPanelIndex((Sender as TComponent).Tag)], PanelMouseLeaveColor);
end;

procedure TFormPrincipal.ChangePanelColor(panel: TPanel; color: TColor);
begin
  if Assigned(panel) then
    panel.Color := color;
end;

procedure TFormPrincipal.pnlEspacosFundoClick(Sender: TObject);
var
  FormEspacos: TFormEspacos;
begin
  FormEspacos := TFormEspacos.Create(nil);
  try
    FormEspacos.ShowModal;
  finally
    FormEspacos.Free;
  end;
end;

procedure TFormPrincipal.pnlManutencoesFundoClick(Sender: TObject);
var
  FormManutencoes: TFormManutencoes;
begin
  FormManutencoes := TFormManutencoes.Create(nil);
  try
    FormManutencoes.ShowModal;
  finally
    FormManutencoes.Free;
  end;
end;

procedure TFormPrincipal.pnlMembrosFundoClick(Sender: TObject);
var
  FormMembros: TFormMembros;
begin
  FormMembros := TFormMembros.Create(nil);
  try
    FormMembros.ShowModal;
  finally
    FormMembros.Free;
  end;
end;

procedure TFormPrincipal.pnlRecursosFundoClick(Sender: TObject);
var
  FormRecursos: TFormRecursos;
begin
  FormRecursos := TFormRecursos.Create(nil);
  try
    FormRecursos.ShowModal;
  finally
    FormRecursos.Free;
  end;
end;

procedure TFormPrincipal.pnlRelatoriosFundoClick(Sender: TObject);
var
  FormRelatorios: TFormRelatorios;
begin
  FormRelatorios := TFormRelatorios.Create(nil);
  try
    FormRelatorios.ShowModal;
  finally
    FormRelatorios.Free;
  end;
end;

procedure TFormPrincipal.pnlReservasFundoClick(Sender: TObject);
var
  FormReservas: TFormReservas;
begin
  FormReservas := TFormReservas.Create(nil);
  try
    FormReservas.ShowModal;
  finally
    FormReservas.Free;
  end;
end;

procedure TFormPrincipal.pnlUsuariosFundoClick(Sender: TObject);
var
  FormUser: TFormUser;
begin
  FormUser := TFormUser.Create(nil);
  try
    FormUser.ShowModal;
  finally
    FormUser.Free;
  end;
end;


end.
