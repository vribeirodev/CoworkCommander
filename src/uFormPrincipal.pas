unit uFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, System.Generics.Collections, uUser;

type
  TPanelIndex = (piConfig = 1);

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
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label1: TLabel;
    Image1: TImage;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Label2: TLabel;
    Image2: TImage;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Label3: TLabel;
    Image3: TImage;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Label4: TLabel;
    Image4: TImage;
    Panel35: TPanel;
    Panel36: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure pnlUsuariosFundoClick(Sender: TObject);
    procedure imgUsuariosClick(Sender: TObject);
    procedure lblUsuariosClick(Sender: TObject);
  private
    PanelList: Array[TPanelIndex] of TPanel;
    procedure AssignCommonProperties(img: TImage; lbl: TLabel; pnl: TPanel; index: TPanelIndex);
    procedure ChangePanelColor(panel: TPanel; color: TColor);
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

  PanelList[piConfig]  := pnlUsuariosFundo;


  AssignCommonProperties(imgUsuarios, lblUsuarios, pnlUsuariosFundo, piConfig);
end;


procedure TFormPrincipal.imgUsuariosClick(Sender: TObject);
begin
  pnlUsuariosFundoClick(Sender);
end;

procedure TFormPrincipal.lblUsuariosClick(Sender: TObject);
begin
  pnlUsuariosFundoClick(Sender);
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


end.
