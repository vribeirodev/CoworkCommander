inherited FormUser: TFormUser
  Caption = 'FormUser'
  ClientHeight = 519
  ClientWidth = 567
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  ExplicitWidth = 567
  ExplicitHeight = 519
  TextHeight = 15
  inherited pnlBackground: TPanel
    Width = 567
    Height = 519
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 567
    ExplicitHeight = 519
    inherited pnlMarginRight: TPanel
      Left = 566
      Height = 517
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 566
      ExplicitHeight = 517
    end
    inherited pnlMarginBot: TPanel
      Top = 518
      Width = 567
      StyleElements = [seFont, seClient, seBorder]
      ExplicitTop = 518
      ExplicitWidth = 567
    end
    inherited pnlMarginLeft: TPanel
      Height = 517
      StyleElements = [seFont, seClient, seBorder]
      ExplicitHeight = 517
    end
    inherited pnlMargimTop: TPanel
      Width = 567
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 567
    end
    inherited pnlMain: TPanel
      Width = 565
      Height = 517
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 565
      ExplicitHeight = 517
      inherited btnClose: TSpeedButton
        Left = 522
        ExplicitLeft = 522
      end
      object lblNOME_USU: TLabel
        Left = 32
        Top = 43
        Width = 51
        Height = 23
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblPASS_USU: TLabel
        Left = 296
        Top = 106
        Width = 51
        Height = 23
        Caption = 'Senha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblUSER_USU: TLabel
        Left = 32
        Top = 106
        Width = 62
        Height = 23
        Caption = 'Usu'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtNOME_USU: TEdit
        Left = 32
        Top = 72
        Width = 489
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtPASS_USU: TEdit
        Left = 296
        Top = 135
        Width = 225
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 2
      end
      object grdUsers: TStringGrid
        Left = 33
        Top = 216
        Width = 488
        Height = 185
        TabOrder = 5
        OnSelectCell = grdUsersSelectCell
      end
      object btnExcluir: TButton
        Left = 237
        Top = 440
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 4
        OnClick = btnExcluirClick
      end
      object btnNovo: TButton
        Left = 318
        Top = 440
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 6
        OnClick = btnNovoClick
      end
      object btnAlterar: TButton
        Left = 156
        Top = 440
        Width = 75
        Height = 25
        Caption = 'Alterar'
        TabOrder = 3
        OnClick = btnAlterarClick
      end
      object edtUSER_USU: TEdit
        Left = 33
        Top = 136
        Width = 225
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
end
