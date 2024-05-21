object FormLogin: TFormLogin
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 721
  ClientWidth = 909
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnResize = FormResize
  TextHeight = 15
  object pnlFundo: TPanel
    Left = 20
    Top = 31
    Width = 857
    Height = 657
    BevelOuter = bvNone
    Color = 7785472
    ParentBackground = False
    TabOrder = 0
    object lblCredenciais: TLabel
      Left = 486
      Top = 56
      Width = 343
      Height = 31
      Caption = 'Digite suas Credenciais de acesso'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -23
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object btnFechar: TSpeedButton
      Left = 821
      Top = 14
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Caption = 'x'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnFecharClick
    end
    object pnlLateral: TPanel
      Left = 0
      Top = 0
      Width = 441
      Height = 657
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object lblBemVindo: TLabel
        Left = 34
        Top = 56
        Width = 380
        Height = 31
        Caption = 'Bem vindo ao CoworkingCommander'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11645361
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblRodape: TLabel
        Left = 66
        Top = 560
        Width = 310
        Height = 46
        Alignment = taCenter
        Caption = 'DESENVOLVIDO POR VINICIUS RIBEIRO TODOS OS DIREITOS RESERVADOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11645361
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
    object pnlUsuario: TPanel
      Left = 530
      Top = 241
      Width = 265
      Height = 79
      BevelOuter = bvNone
      Color = 7785472
      ParentBackground = False
      TabOrder = 1
      object lblUsuario: TLabel
        Left = 0
        Top = 0
        Width = 265
        Height = 31
        Align = alTop
        Caption = 'Nome de usu'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 180
      end
      object pnlLinhaUsuario: TPanel
        Left = 0
        Top = 78
        Width = 265
        Height = 1
        Align = alBottom
        BevelOuter = bvNone
        Color = clGray
        ParentBackground = False
        TabOrder = 0
      end
      object edtUsuario: TEdit
        Left = 0
        Top = 39
        Width = 265
        Height = 39
        Align = alBottom
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = 7785472
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object pnlSenha: TPanel
      Left = 530
      Top = 326
      Width = 265
      Height = 75
      BevelOuter = bvNone
      Color = 7785472
      ParentBackground = False
      TabOrder = 2
      object lblSeha: TLabel
        Left = 0
        Top = 0
        Width = 265
        Height = 31
        Align = alTop
        Caption = 'Senha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 67
      end
      object pnlLinhaSenha: TPanel
        Left = 0
        Top = 74
        Width = 265
        Height = 1
        Align = alBottom
        BevelOuter = bvNone
        Color = clGray
        ParentBackground = False
        TabOrder = 0
      end
      object edtSenha: TEdit
        Left = 0
        Top = 35
        Width = 265
        Height = 39
        Align = alBottom
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = 7785472
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 1
        OnKeyPress = edtSenhaKeyPress
      end
    end
    object pnlConfirmar: TPanel
      Left = 570
      Top = 453
      Width = 185
      Height = 53
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
      object btnConfirmar: TSpeedButton
        Left = 0
        Top = 0
        Width = 185
        Height = 53
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Confirmar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11645361
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnConfirmarClick
        ExplicitLeft = 112
        ExplicitTop = 16
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlConfig: TPanel
      Left = 803
      Top = 608
      Width = 38
      Height = 34
      BevelOuter = bvNone
      TabOrder = 4
      object imgConfig: TImage
        Left = 0
        Top = 0
        Width = 38
        Height = 34
        Align = alClient
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000400000
          0040100400000050F0651600000002624B47440000AA8D233200000009704859
          73000000600000006000F06B42CF0000000774494D4507E7051E01120A2650DD
          BC000006534944415478DAED5A696C1555143E0FD90C6E7121221129C10588A1
          0644A98AE28282D5288B880868222AEE41D41849AAC585A811302A412901B754
          0B252E88A62EA8808458951837DC2AD61FC4254451830AE3F7CD9DB633F366B9
          336FDEBB82EF24DFE9EBCC9D73CFF9EEDC3BE7DC999CFCCF2567DA01D35226C0
          B403A6A54C8069074C4B9900D30E98963201591BB46436F405BEA3DB81F3D0D9
          6F990760C960E869006DDF893E2CD7B96ED033819771FCE3E21360492FE816A0
          6BC0D91A74569B71F015D0DFB88E3C065C679360C97E76E022A7D82D451EC5F1
          EB8B4D408D701482E547E00874F86786FD71F43FF21D7D1A580F4C054E741D5F
          87BE4F2E1E0196EC05FD1DD03BA2D57474B83843022AA13FD46CBD017D0F2F26
          01E78ABAE5A264133AACCC9000DED20F6BB66E46DF43931160490FE83A601BF0
          0CB0D6B3C878DB2E871EA7E1C849B0B13EC4C600E8AB840BA6C85CB47BC277FE
          21E8635D47CE880BC1270B440DD20EE0676073F8D596EC03BD0A18E13AFA25C0
          5B78092EFCC969C7957682435457899777852B734EDE77AEEF045D0DDC048CF4
          782018E11C162FF5DF51D09F019D12041C27970413A056D0D54055C88564B001
          D82AEA1174708ACE9B9D3E26024786B4210937C3C979F8752D7E3F12637313B0
          12F81D381D181DD3FEAD7C02D488F0163DA1106A331692C429F6BC844FB385A2
          EE989DAE58A6402F93F069F26CD81DF029F400D351BBE44C38FA06FCEA82DFF5
          C058DFF956A03FDAEC0888858FC5C901361BECE32104DC027DBFE9A85DC1F56D
          1F59CB5E205FF4B5A9C7F94981575B98E76A0177CB1A87D49D61041CE874BCB7
          E9E845A5B777B97C7B50B82E786515DA548710C069F0A4EFE832B4BFCCFE15F1
          14605A39C370F07F031570F28788E029AC0306A25D6B401C2B247FCAB036A946
          FBB7A308E807FD05D0D920015CA4263BFEDC083D3FA22D17EE89ED24A8CC9453
          F9BE90F6EA491193083D077D91410286C3C10D8E2F936C42A28577C23BC02FC0
          30E0E898F6EBE208E0DC9992C271163EBC7B78ABF51495BD754961E734FB3655
          BE30E1FA16E8959ACE7CB9326A0AD0F12D40B70406DF04E608472127BB5CB60E
          80BE14B803383481BDE5B033C1E75777518B338BAED780C312D86B14553E33CB
          657A5F1B45C0DD8EC33AC26067D9195B945876C6C884E6544DBBFF0095B0FB49
          883DA6CFF3346D75AC276EC9790DD241D6D1D38163B47915B915861ED06AA90A
          2CD603C769DAB69CF69C8E0DE8E757D79959D07AFD8ADC836B67071360C910E8
          1B44A59C496E790A17A9AAD02A31382496C4AC059216365CB9B9302FB48B29CB
          F67981EB3CD708D60C7C722D12EF7AE1CD27DA09B0E405FC393FA1236E190BC3
          2B135F65D995E69802FAE56836014B45A5ED4CDF47C3972D8EFD41D0AF8B5A73
          3838DC8CA90B22407FE4F28573747F18FE230501D78838A56E3AA943BF57C00E
          6FE2B3808DF8B5CDD7477F113B15E6FCFF2AD04A81047C0FC37D525D69C9D9D0
          AF164C40A1522001AD70E2F094049C236A3F60B726C0FC14C88080AFF1A75F01
          26C6C191C61404BC22F13B3661C247E10CF41B971A6B11C07DBC8B456D4656A5
          30B151B8FF9EEC31C81C807B82491F832DA2EE9AC5790B5E6A02BC8E0D149508
          316DED9DC0CCED3034573378A6A16B81C19AB639CDF8C87C5CB868BA53ECCC09
          E8709223732F709BA6995D76DB9C5DAF4705CFFA825B5123748C3AC10F82DDCD
          99061D4B4087B3498B21566EB5F65FEFE6247798DA8AA19E09ECE51743252340
          399EB61C663DFEB9A8FA9C9918B3B2341B2B23E1E01A93042C81BEBCA80E44CB
          2838D86486004B0E113505BA1B24A0090E8E3245008B8D3906836F932170F283
          D212A03614595AA64B73B395A7E0E4D4521310F4F2C194FC05F481A35B4B4980
          E9DD60BFCC8CDD6ECB98006E361677F1492657C3D145A52420EEF538333FEE24
          B5884A9D0F4AD1356B014E33EE460D0D69C3FA82A33F5FDB6A2604A8AE833E90
          6015B654F8594ACEAE22DBB6A9C78BCAD575DE25BE27EA3576B3ABAFE385A3AC
          F6247BB882EFF840A2E4042817E84CA313185F33736B697B485BDDA4690C6CAC
          0EB1B1AFA8AF4DF89DE14B799FC8949C8024A24ADCB8E7B5F755F77F4132FE4E
          905BE4515F96F04D4C8DE9988B4900E7707DC85996B61581AFB0F7200258F1F1
          4BB2BE016757A0B3F1A6E32D2E018A840B25F89DE2B4D0777C7B1401BB9B9409
          30ED8069291360DA01D35226C0B403A6A54C8069074CCBBF83EB7D74940BF9C2
          0000002574455874646174653A63726561746500323032332D30352D33305430
          313A31383A31302B30303A30309B915BA30000002574455874646174653A6D6F
          6469667900323032332D30352D33305430313A31383A31302B30303A3030EACC
          E31F0000002874455874646174653A74696D657374616D7000323032332D3035
          2D33305430313A31383A31302B30303A3030BDD9C2C00000000049454E44AE42
          6082}
        Proportional = True
        ExplicitLeft = 40
        ExplicitTop = -16
        ExplicitWidth = 121
        ExplicitHeight = 105
      end
      object btnConfig: TSpeedButton
        Left = 0
        Top = 0
        Width = 38
        Height = 34
        Cursor = crHandPoint
        Align = alClient
        Flat = True
        OnClick = btnConfigClick
        ExplicitLeft = 8
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
  end
end
