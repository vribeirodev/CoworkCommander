object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FormPrincipal'
  ClientHeight = 640
  ClientWidth = 970
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 970
    Height = 640
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnlBot: TPanel
      Left = 0
      Top = 559
      Width = 970
      Height = 81
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnlBotoes: TPanel
      Left = 0
      Top = 401
      Width = 970
      Height = 158
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object pnlBtnUsuarios: TPanel
        Left = 41
        Top = 0
        Width = 209
        Height = 158
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 273
        object pnlUsuarios: TPanel
          Left = 10
          Top = 0
          Width = 189
          Height = 158
          Cursor = crHandPoint
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 0
          object pnlUsuariosLinha2: TPanel
            Left = 188
            Top = 1
            Width = 1
            Height = 156
            Align = alRight
            BevelOuter = bvNone
            Color = 7785472
            ParentBackground = False
            TabOrder = 0
          end
          object pnlUsuariosLinha4: TPanel
            Left = 0
            Top = 1
            Width = 1
            Height = 156
            Align = alLeft
            BevelOuter = bvNone
            Color = 7785472
            ParentBackground = False
            TabOrder = 1
          end
          object pnlUsuariosLinha1: TPanel
            Left = 0
            Top = 0
            Width = 189
            Height = 1
            Align = alTop
            BevelOuter = bvNone
            Color = 7785472
            ParentBackground = False
            TabOrder = 2
          end
          object pnlUsuariosLinha3: TPanel
            Left = 0
            Top = 157
            Width = 189
            Height = 1
            Align = alBottom
            BevelOuter = bvNone
            Color = 7785472
            ParentBackground = False
            TabOrder = 3
          end
          object pnlUsuariosFundo: TPanel
            Tag = 1
            Left = 1
            Top = 1
            Width = 187
            Height = 156
            Align = alClient
            BevelOuter = bvNone
            Color = clWhite
            Padding.Top = 10
            ParentBackground = False
            TabOrder = 4
            OnClick = pnlUsuariosFundoClick
            object lblUsuarios: TLabel
              Tag = 1
              Left = 0
              Top = 99
              Width = 187
              Height = 25
              Cursor = crHandPoint
              Align = alTop
              Alignment = taCenter
              Caption = 'Usu'#225'rios'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 7785472
              Font.Height = -18
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = lblUsuariosClick
              ExplicitWidth = 73
            end
            object imgUsuarios: TImage
              Left = 0
              Top = 10
              Width = 187
              Height = 89
              Cursor = crHandPoint
              Align = alTop
              Center = True
              Picture.Data = {
                0954506E67496D61676589504E470D0A1A0A0000000D49484452000001000000
                010010060000000CE2742500000006624B4744000000000000F943BB7F000000
                0970485973000000600000006000F06B42CF0000000774494D4507E705190122
                071A70AF4B000030564944415478DAED9D099C1D45B5C6BF3B9340C2BE88F840
                20C86E9EC8920490352E3C5014511651144101455120992C8886289215115151
                544440D94444715F40D993C90415444040F1B13C44086B0249A65F7D55D59321
                6492D96E9D5EBEFFFC66BAA7EFCCAD73ABAB4F9DAA3A754E0342082184A81D0D
                6B0184104208911E1900420821440D910120841042D4101900420821440D9101
                20841042D4101900420821440D910120841042D4101900420821440D91012084
                1042D4101900420821440D910120841042D4101900420821440D910120841042
                D4101900420821440D910120841042D410190042949A761C8FA1EED8890DB125
                F8482FC5F6FE950C5BB99F2DEECA86F16FD7F0578135E3EFEB2FF75E4F21A884
                E7FD6F0D7FEC745F4FBA63AB7BA7BFBBE31277BCC7BFEF7FF0A03B8EC205586C
                5D0942887E200340884273074EC1A6EEB8D875F36F467864C7FA5732ECE18F0D
                DFD193A189655B1CE5B8DF4BD1825BE2F5EBFDEF197EEF8EBB60261EB1AC4021
                440FC80010A210CCC738BC1E1C71B7E243FE4A8643FCCF06B6B5166E0050C5DC
                E33F47866B1066242E46300CEEB6164E885A23034088A4B46322D6F567198E8E
                D73E188FA3AC854B086708E6222C495CE2BE976211BEE78EBBE13C3C632D9C10
                B5400680104DA5DD8DEC5F0576742DF824F8C835F0A9F8DAFA0378DFAA4155F4
                2C8241F05D702624C334771C835978CC5A38212A890C002106953F6392EFD817
                BB2EEC74840EED84F8DA9AFD7FDB5A129C11339C0F3A21BE842FBAE3CE38170B
                AC0513A212C80010625068471B0E4318E19F87D0F16F6C2D5485A0AAFA8F3FCB
                701AE843300BDF8AD7336BE1842825320084E817B9D3DE523736FD46BCB6B7B5
                503582AAEB0FF1F871C8A95088BE230340883EC1917EF0D26FE0EBF19AA6F6ED
                A00A5BE8CF324C763F77C52C9C6B2D9410A5400680102BE5569C82E1E01EFBA1
                5D1DCB71D642891EA14AE3AE8261EEAE9DE88E233115CF590B254421910120C4
                0AE176BDCD11B6ABFD1C619D79A4B550A2D750B5DD09EE265882B7BBE3687C09
                FFB2164A88422103408897D18109D801A1C3FF553C6E662D9418108C44D870A6
                C081E012C16CFCD95A20210A810C00213C735DC73F06E191F859BCF62A6BA1C4
                A0C25C078C48F84E704660166EB6164808536400889AB3ACE3CFF03B7FA581B5
                AC85124D24F33E010CB9CCDC0A6330DD472414A27EC8001035A50393B03542B6
                BB7C24F86A6BA144529EF03F5BFDF6CD519886BF590B2444526400889AC135FE
                4DC08E1F5D1DFF086BA184195481740EA4B3E09E90B3A0A8133200444DB81E53
                30CC1DD7C1429FB696CE7D3B5B0B250A45BBFB5ED7B58FBDDC711B9C8717AD05
                12A2A9C800103581017C42E09E868F1C27444F7C055C1298894F5B0B22445391
                01202A4E1EA39F8DFD4A6B6144696871DFEF450831FC236B6184680A32004445
                E9C0386C014EF5B7FA7DDF9CF25FC75A28512A987530C312EC08F906882A2203
                4054947998806B113AFE77590B234A0BB33B5E0D06109A8143AD851162509101
                202A4607DA7000E8D5DDC02FAC851115A2818340DF80195D81A2842837320044
                45C893F6AC86A13E063C47FEAFB3164A548AFBDDF7B3AE95FDB73B8EC5542CB2
                1648880121034054044EF9B72174FC33AD851115A681710833015FB216458801
                210340949C7C7FFFDA78010FF82B0DFC97B550A2B250653EE6BE5FC2623FC3B4
                07CEC1426BA184E817320044C9612CFF4F2234E5F3AC8511B582F124182FE01B
                D68208D12F64008892D28EE331D49FAD87BFC76B9B5B0B256AC53FFCCF05D816
                34042EC0626B8184E813320044499987F138045CF36F51A01661468B53A2DC66
                BA0B66E0A7D6C208D12764008892D28E89B1E3CFBC2120841557212C051C6E2D
                88107D4206802819DCEEB7813B0E755F8FC46BAB5B0B256A0B5528B7030E458B
                CF32B923A6E3296BA184E815320044C9E076BF1311B6FB7DCD5A1821220DD722
                4F002306CEC205D6C208D12B64008892D1EE0C803CC2DF01D6C208D145E67D00
                46390340A1A745399001F00AE6632246B8E312F7BD83BFD289ED116282E75EE6
                6BC6E37ACBFDEF82787C1E5407191EF2BFB5E06FEEE710F77D3798837E46F41E
                167D81FBFD5987EB60219E44980158DB5A28212254A5CFBAEF6730DC2F513152
                E0126BA14A88F46F4A6A6800740F1CF3CE580507C5CA188BD0B16CD664191EEA
                9225701D4288511E156274C5CC758AE14D0853AD375B0B23440F507FEC06660F
                9C8939D6C21410E9DF22510303808162B603EDC00CA7800DAC8123E26BEB0DE0
                7D9B012D58DE92CBDDF752B4E21C771C8369B8D75AB002C0FBF81984FA39D35A
                18217AA481C908A182A75B8B5200A47F8B4C050D80BCC1F1A37D3E5ECBD378B6
                580BD7473AE3E7B812A1414E41D51B64CFCC431B7E8CA0400EB61646881E69E0
                1A0403E03DD6A21820FD5B262A6000E459E086B8AF89086B4593E26B55DB1E96
                471A3BDF7D0F775F1C118FC4543C672D5802E8FDCFB53C4E116E672D8C102BE1
                AF087101465A0B9200E9DF32EBDF121B00F3310EAF07ADB4566FA1B163A8C303
                97C35B770FC203C729354622FB93B5504D2077FE5B1B0BF142BC36D45A282156
                C24B086BCA7456ABAA33A0F46F15F46F090D006E03FB4814FDAB080D6F98B550
                86B01EF26C649F00F721CFC477AD851A44E660B28FB5DE82A5FE8113A21C64D8
                1A615BE0FDD6A20C22D2BF2FA7DCFAB74406001BDEC4782EE79A9EE12D9D81D0
                10270DF4CD0A4007DAFC7EFF4EF7C97E31E07713221519FE07C100F8B5B52883
                80F46FEF2897FE2D8101C086373B9E8FB316A6649C8DB01639DE5A900140E73F
                4EB1D1F9EF726B6184E80387213C7F3FB416640048FFF69FE2EBDF021B00DAF6
                3558947B5B523EE548BE6D2D8C10BD847AEB58946D4A7819D2BF834591F56F01
                0D0066797BBF3FCB706971C52C1519C2089AF53ADA35C4328DA4E9FD7F72FC0C
                E7580B23441FF834C208F02BD682F401E9DFC1A7B8FAB74077763EDAB00DC25A
                6F3B42A5AD632D54A5C8E2769521AE1152314DF3DBEA8A8E4622A28C507F9D8E
                1011F08BD6C2F402E9DF665344FD5B0003A07B8CF7B9080D6F276BA12A0C6FF9
                7C8498E56350FC6D4A1C9104679ACC3D324294038EF8E834C711DF4C6B615682
                F46F5A8AA57F0B6000CC738F099D2498BC6196B5303582F57D2AA8A066157A6A
                9DEDE31351DEAF5A0B2344AF69F8B4D55CFB3DDF5A949520FD6B4331F4AFA101
                D08109D8049C72CAE2FEEE06D6B213A776E4D9CB3267FF33B2DE289C8547AD85
                5A01ED68C387A2C4DFB31646885EC200311F049D006774ADA51709E95F5B8AA1
                7F0D0D007A779F1BCF3F652746ED6113A0054A6FE553AD85590154548CA9CEB8
                DC575B0B2344AF69E0DD083300D75A8BB202A47F8B81ADFE353000DA310EAFF2
                67AD5D7999D7ECF7BB89C180217687BA2E764B777C2366E3716B81BAC138007B
                23ACA9FED15A18217A09A778F74298E22D52FA6AE9DFE261A77F0D0C00797517
                93865358BC2FBB3A857596B530DDB80DA76163D07776091EB31646885EB3141B
                81330067E3096B51BA21FD5B4C6CF4AFC90C401BEE8E856F9FBE78D1036C804C
                73C90658C46C7B9CB27C2A9E172D8FB8103954A94F224CE96E682DCC0A90FE2D
                2636FA37A10140CB734C2CF2F674C58A3EC29CDDDCA7BA8B5360EDD6C2748301
                81D86EB84D698CB53042AC845B110200BDC95A906E48FF9683B4FA37A101C0B5
                DCCF21ACE54E4D57ACE823450D60C27800DF8D127ED85A18217A80DEFF172278
                FF7F64C0EF367848FF9683B4FA37B101703D4203DC2F5DB1A21FFC0E6104F356
                6B41BAA19C00A20C702AF71884A9DC8BAC85E986F46F7948A77F13180057E230
                B4BAE356D832EE7B048637BF583100E895BAABBB4B6B037EBCD0692D10386D39
                DE7BC9B6A2050F580B23440FB46029468053B867E39FD6C240FAB78CA4D3BF09
                0C80B99884D7F9A23A717FF38B138344D114590E67021E8CE723AC8511A21B7F
                4718B96D632D4837A47FCB491AFD9BC40098880311A6C67EDEFCE2C420C1A671
                008237F3AFAC85E90643977E07619FF5B1D6C208D18D0B100C8013AC05E986F4
                6F3949A37F1318005ABB2D2745CD67DE8136FF60306BD92FAC85112242EF6DAE
                D9D27BFB77D6C27443FAB79CA4D1BF090C00E5732F2F45CC679E618A57B6F3B0
                080FC52B9B5A0B256A4C030FBB9F0FB8AF2DDCF1705C85A5D6227543FAB7BC34
                5FFF26590250E4A93252D4ED80390C6812B297357C3633216CC8301D54D4B330
                D95A941520FD5B4ED2E8DF244B00CAE75E468A9ECF7CAEEBF6FF1B6CC22DF88B
                B530A2B6B4BAF1FE4877DC1967E3AFD6C2AC00E9DF729246FF265902503EF772
                528E7CE65470C14926C3FED6C288DA40D549A73AAED1BEC35A989520FD5B5652
                E8DF4406C051080DF092E617270609360DDE372AB8EF5B0BB3123A5CFBDA0721
                AFF91FAC851135A2E1B3545241DF642DCA4A90FE2D2769F46F121F8036EC8910
                22B3C80F8A78396C1A7B2034C0DBAC85E905F476CED305EF6D2D8CA8348CA847
                E7AC375B0BD20BA47FCB491AFD9BC0009883C93E2B16031B14292DA658398BDD
                17EFDB1E38C767372B3AF409E0362CFA04FCC65A185159B8363B16616DF6066B
                617A81F46F3949A37F13E602A0D7F623B1D0FF4A57ACE833615B13A7365F6B2D
                4A3FE04CC0D5F1FC3DD6C2884A7105C2C8FF7DD682F403E9DFB29052FF264D06
                34013F40D8DE7064BA62459FC97029C2B6A60F5A8BD20FE6E2546C0636EDD6E8
                95DDC05AD64289D24215C918FAAD6E44B6833BEEE446640F5B0BD50FA47FCB42
                4AFD9BD4009888E3109C512E4857ACE823BC3F8C1C36DA35C00BAD8519009C09
                9818CFA75B0B234A4C03E31046645FB216650048FF9683B4FA37A101701B4EC3
                C6EE38144BF0BF0896E89074C58B55C0A6B0045C7B1AE2A79E76C759F83F6BA1
                06403B8E776D8DAC8F1BFD31C36ED64289D2C0E7E166F7FD0C86FBF4B96331D5
                3F1F6545FAB7D8D8E8DF8406400EA7A2B87F960DF0C0F4C58B95F0338435CE83
                AC051944F2258116F760CD4768771B5A0B250ACD53084E733BA378D930078AF4
                6F7149AF7F0D0C003AA31C160BBF327DF16225F0BEB001FED05A902630CFB53B
                3E58F4E2FE49BC66D0FC4581C9FCCF060E4198F2BFD65AA02620FD5B5CD2EB5F
                030D78A5FB98ADEEB8154678272D2AE46DD38B21BAC13CE60FE0416C8FE22533
                196C6808CC40687713AC851105A281B3103AFECF588BD244A47F8B879DFE351C
                023140C5B108012ABE632746ED619EF063C08013B37091B53009C8109A3D9DA2
                2E8C573E6C2D94308591D61870855ED76C1B99B5400990FE2D06B6FAD7D00058
                66896E897684876E273B716A0993E83C8BE1D805E57772EA2BB9936003EBF9A9
                5EAD89D68B3C967F8605783738F2BF008BAD854A88F4AF3DF6FAB7008BA04C57
                39268A726BBCD6622D54C5E1C3DE824E1F227417CCEEAAF73AF2278CC79AA007
                6E8B4F2AC4BAD9D35A28D154181277A86BFF07B8E31B5DFB7FDE5A2043A47FD3
                531CFD5B00032087FBB6CF8DE79FB216A6D2347C3D73ADF3646B510AC47D3809
                ABBBE3D3CE22FF41BCA648825522C34FFD710D1FC96F941B71BD602D528190FE
                4D4591F46F810C80650A7898DF7F4BE176B516AA6270AA6F5D2CC45EEEB80DCE
                C38BD60215907C6AF475D8B22B0DE771D642897EC335D68BC1EEFF697C14F59B
                EAEF2DD2BFCDA778FAB7400640CE5C4C72CA374C91DC82305DB2B1B5502586B7
                F831B03E1B3EBBD4CECEF2FC87B55025207716EC401B3EEBAF34F0B978BDD55A
                38D123BC67F4A2E67D9A8AE0DC7726EAE3DC3750A47F079762EBDF021A0039ED
                988837F8B3AC2BCDEB7AD6429508DEDA67DC77A76B7AFB81A125A7FB4038A27F
                CC75ED713FB05E3BE3128192AA148DC7FDCFCC7BF33396FAAFAD052A31D2BF03
                A31CFAB7C006400EF76D33BF7BF7002E6A882B6781FFD9C03B11D69A94077CF0
                98E3DAE36B102CFA4BE3B5B7580B5563A8C298FE992154D9F1973D8475D190FE
                ED3BE5D1BF25300072E6388B742438FD9AE197085353654C57DB3C323C0A5A9C
                C0DBDDF7183702BAC35AA40AB32C9E405BCCDAD570351E78B5B5701586751EF2
                A367F83CE845BD06CEF3D7A7FAB62F9A83F4EFAA28A3FE2D91019073074EC1A6
                E0B6ADA1B82C5EDBDB5A2863384537C48D81DE8FF2A62B2D3BF3F1693F325A8A
                D5FDDA331FAD4F403E038301952AEB93017B3257C3A78223ABB3F184B5603544
                FAF7959457FF96D000C8B91E537C36AB75B010672028DA3CB4EB506BE19A4CEE
                C5CC34B70C24C19150DD02F9149D7C0D955EE8A7C56B8CF52D8360E5E44E7C84
                B1EA3BDD1743F48EC66CDC692D9CE842FAB70AFAB7C406C0F2CCC1641FD3BAD5
                A98FAF2234C8B7590B35C8FCD17FAE4E3FB294422C1779FBA477F5647F25F323
                06B29AB570C6BC148F1CE1738A791AE82D3D0BF7590B267A8DF46F19A99001B0
                3C1C81EDE5CF3AFD942C3FEC9BAD85EA03793E72C6EA66F21A6E1FB90EDACE54
                15FE8C49581F1C4D2CEDCACEF621847BFBA6F837D57C3C33CC8B9FED1270EA34
                F353C98CC8F7B8B56862D090FE2D03D5D4302BA403E3FD3ECCCC8DC172457B44
                7C6D7D43B972A7A6CC7D5D81D0E018B884FB976F33AD31610143B36E87D00E0E
                89D7C6FA9F5954A88C65576C4268DD460C2893E1F76037D08A6B40E7A869B8D7
                5A40911CE9DF225223036079EEC2143FF5FA0216F91117AB622CC23EEF7D10B6
                BD8C8C7FBBD100CB7A1C612D38A4DF6CE99A4AA2625CC37D3116F4486727BF34
                A0524495C9DBEB22D76277436847216741D695CE75078476BC2D8282DD6010CB
                5FA628817BE2B5BFC557EE45786ED8E10F73EDF976A83D8B9523FD5B046A6C00
                F4967CAA761196620B0407AEB511023CACD5EDEFB8B6FB1C8203D3B3A0226CC5
                3FDD71474CC753D61F42D48E5B718A3700866075BF3BA1E15A268F2DB1DDD2B9
                8E472AC4DC31F1F978FD397FBDD5EF675E8217FD710F9C13B7DF09910EE9DF66
                220340082184A8213200841042881A220340082184A8213200841042881A2203
                40082184A8213200841042881A220340082184A8213200841042881A22034008
                2184A8213200841042881A220340082184A8213200841042881A220340082184
                A8213200841042881A220340082184A821320084A824ED381E43DD71356CE0F3
                A62FC4F33E57FA6E380FCF580B27842800153600DA3111EBBA63A7FB90DBBA63
                2B326CE78E99FBDEC6FF458675E2DFAE198FEBADE4FD1A5DAF377A556D99FB5A
                1ACF7385DB198F4FC7F77B2EFEFEAFF81F8FFA9F2D78D8FF6D27FEEE8E63300B
                8F5957A6681AB7E324DF0E5B310C5BBB638B6B192310DAED08FF1719B640682F
                1B21B4DFD72CF7FB06F1BD86C7E3BAF1D83208F2B19C6762390BE2B5FCF87494
                6F01C253B120FEC70284F6BF20BEFEF4CBFE3E1CF9FA53F1FF9E74C745EE789F
                3BEE859978D6F2868841650EDA7C7B6D715F6CDF0DD7B23745D0859B20B4F7CD
                10DA57AE875FDE7E1BFEF7067AD79E33E47A7659BBEB89BC1D3F1FCB792696C3
                76B8D49DDDE3CBCC70AF3B8EC28C55BE5FF928B101F0674CC2FAEEB8D8DDA0B7
                81B7BB13FBC5D7C6C60FB7BDB59083006FD1BF101AF6DC786D4EBCFE07F7BD8B
                53FBE1F7A95D0686B0A71DE3F02A50810CC11E081DDE6EF1B537743BF2BE6E69
                2D6C41605DB05DFF23FEFE177FAD813B1114F13C04C3E877A8AA422E0F19A6F8
                0EB9030BDD2025DCBB7DE36BFC9DF77174BCBE99B5B083C4DDF193DF107FBF1E
                9C616BC56FDD71474CF7066DB928810170976B68AB8153988B706014F983080A
                F5A0F837AB5B0B6908EBE3B17876953F2EC5B7DDCF5D31DB1949A259E423F7A1
                CE007B2BC2A8236F9F7B2328BEEDAC85AC20ACDF2508F57B4BBCF20B84D1218F
                BB38C3E04FD64256907918EF3A39D282E3E2B5C310EEC3C6D6C219F32242BBFC
                29821EB804611E8CED71142E7083D4A2524003A0DD75F86B78D15E880DADE19A
                5E6868AFB516AE44E43304641A6810CCC4AFAC852A217330191B826AAF1387FB
                2B9D38D41F1BBEA32743AD85142FE37EFFB3E10D612EA55D042DA5F5967C1686
                4BA807F8F30C93E26BFB580B5722BACFDCCEF65786FBF6380A535DCF56140A60
                005CEF3AFC21EEB88E1BE37F12A1C24E8BAF6D642D5CC5B81161A4742A38529A
                E91E729193B7C3B55D3B7C77BCF6E178DC3F1ED5D197937C04C6111A9712BEE5
                8E3BBB61C6AFA1A5B39C39AE9BE7947DABAB8D2F23E8E137590B55311E4730A8
                CE02FD6AD6C0D7C0E5EAA97E46CB0643038016E65EFE2CF3154176B413A756E4
                0AEF1BA05D3ADCDD0960A46B88CF0DE03DCBC67C37B2DFC8D7C5527C345EFB38
                AAB566297A86AA8FBE05BCDF531166C8AE8ED7336BE112701326386337388ECE
                8C9FF9846E75239A0F9768B9947D22E82F310B37279720E19D5EB696BF1033E2
                B54FA717432C07EBFE4104E7AAA3C0863823AEAD568BDB709A5FAB1CEAEC6D1A
                3CDD15DE1AD6C2894290FB0E9C8160105C8BEA1904DD075E97C66B5B580B5573
                F26517CEBC0C732619975C38207BA9E92527E8793B30CE37B04EB4E2B2786D8F
                E6172BFA4877E7AAD31114E04C945701DE8A53FCF6B8D55C97FF99F8193E165F
                53872F564DD875C0258393C025B3D9AE4D958FBC7399E73AFE5310A6A067C4EB
                43AC8513AF80F787BBBD96B8E31160DC8ED97E80D6ACD29A463BC6C76D4F2DB8
                2E5E7B55F38A1383049B040D356E2F3C0AE55923CDB725CDC30B5E6E4A3E3BBE
                265F123110F24E9423E6A56E20C38E740CA6E13FD682F541761A0017C62B1FB6
                164AF48AB0ADB08177216C7BBD69D04B688201300F6D7E7B1EF7EF5E11AF69C4
                550EB8BF7A5D2CC43BC06049E7F9ED2D452737341BAEFBA74F0315DE4ED64289
                CAB26CDB6D8693C199B2595D7AAEC8E4912119CEEC27F1DA01D642895EC15D03
                8D3823C0F676DD40DFB08B4134003A3001EF4150C05740534C65814D808184B8
                F6F41614DF19F03E9CE4E33E3CEDE49D12E56F83DA9BB0818A99BE022F61098E
                059737CFF1910D8BCA9F9CC1CC887B8BD1EA0D7E740B50258A4BBE44CB230D01
                EEE2FAD1A0BCEB0069771DFFD8F8563F4750C4C30C2B4AF41E861A5EE2BA4D3A
                05ED8EB3F07FD602AD843C10094325E7CE4B6F18C81B0A31C8FCD3FFECF40A7A
                1466E3766B8156421EA9924BB437FA633522A7561DF6B38B10FAD9B783ED6CA6
                8F48D8FF77EB278CF1CCA9D656F7267F8C02AD6D5D3BA2573C8270DFF604F743
                CFE80ABD5A4468601E8DD054CF476867C307F6964234157A6FB3BD72B709476A
                E7A2B8CEB4DC15B039C24CC6CD50C0B5B290E7E8A0C1C98064FD8BFCDA0F0320
                4FB2937BC992ADAC6B43F40AAEE9773A8B9F0D660CA677E5162812F914FF3318
                E615277D494E18E89B0A6108A76A87BA27EF43EEF846A7A89FB7166805700977
                148201702334935B2642F2A285FEFEF52DDB67BF0C80367C3FFEF3FBAD3FB9E8
                030D1F7082DEA4E75B8BB20296650D6BE09A786D776BA18418341A7149608977
                921E85B3F184B5482B804EDCC72318DEDFB41646F409FADE7149E07DBDFE8F3E
                1800F39C85780C826578A1F527157D20C30FC086310B1FB01665057460A21B15
                716622EBF24EDEDC5A28219A04556E4833DBF05EF8455D82E3D2DB45F1FC686B
                61441FC8FCFDA2BEBF78957FDB0B03200FA832D47DFD2D5ED3BEEAE2932B9A85
                0869398B96677D2EC6FB2C7A8DAE117F036B590B254432323C0A1A022D3E8B64
                D1B21852EFD3D7867A3F0F80F4466BA144AF60CE81C5EE6B07AC6A574A2F0C00
                8EFC99C58823FF8F587F32D12BB8C6D88AA53E2FF7CE381B7FB516A81B73D186
                F72274FCDF8FD7EA9CCE5988A7117C73DE86E2F9E6746012B646C8AA98CBB59E
                B5506295D0A9934B388C1BF0B195FC558FD029841604A3C0DD19AFB5587F2AB1
                4AB876C71BCE98FE455AC36324B2A3A28417211894ADD642095110A88A1959B0
                C519EE4CBB5B34C33DDF8D432EB21646AC12B6A7A508FDF748B03F98E967845F
                F9573D4067BF4BE21F1D65FD6944AFB80DB4F886FBED7D4509E19B8FF8B9E679
                3914B0478855C16DBA4BDDD3CBF81CCD8D05DF776808FC329EFF8FB530A21734
                BCC146E7EF6356F0DA2B60C7BF15C2142DD7FCA5B08B0FB7F771766667847DC7
                775B0B0476FC137C0C6BCAC534AB6A4742F40D06EAA2736CD8B63B2B8620B665
                3E2662048281F2177F45BE3B45268F20B8C4DDAF6DB1BC41B942036082CF0247
                DAACA517ABA4E1D3E084B59ECF5B0B83D0F18F41685A79842AE58210A2FFD039
                70B8FBE28C4051427573BB20D3B973C9F1CBD6C28855427DCC2C90CCF23AE965
                57237936B50E2CF4212D1511AAD8E45EFEEBB8FB45EF5CEBE43DB7633CB604D7
                F55BFC520479B57525095111F8BC73098D0AFC486B61D03DFBE6421F4190286E
                477161FBF95FF77DBF1BFF8F70C7C3711596763700E8EDCF351D76FCBFEC4F09
                2229CC7EC7E43DBB623A7E6F2847F7ED4279BACA5DAC2B47880AC3913703BE7C
                C55A10B0DF98E47410FB8D65BB049A98655E0C02FB23B49FDF74BF539CFACFBD
                C68FB79650F4087D337E0B76FC33FCB6216B14195288B42C46987ADF0F61B7CF
                2DD602210C20AF4218401E6A2D8C5809998F04CB4041272E6F00DC17CFB7B696
                51F4488BB3B4DF048EB2677705E8B080ED258F0BF16DEB4A11A2665075D32930
                C3103FE3360A67F9C04256CCC164EF64C6F82377414EBF45255F3AE652D2F6FC
                6D2E4EC566FE852178C85A3AB152AE4398BA79A7A10CF92E117287FF292F6021
                ACA04267086D2AF483AD858102C79505C608D82C1800137DF2007A935F662D95
                582199FF6EF16B6DA3311DF38D64A0B2E1037E43BCB68F75C5082122190E4798
                DABDCA508AEEE985EF81B20A16152E251F110C80369C112F4CB1964AAC80102B
                9F811CDE63280547FE4746797E605D254288E508B9055AF1125E0FC60439170B
                0CA5914F59B109DBC71BE1465D1E2F1E612D9558216F4698FABF7EC0EFD477EE
                72CD8453FC0BB1282683CAB0A9758508217AE402047D7182A10C7330D187A06D
                71FAE22FF19A7607140966898D06C0BC7849DBB78A0523FA716D8F0F121F9ECC
                40068EFCA7F9B346B700124288A21296EB32EC8B1020EC464359F22543CAB4AF
                75C58897D19E1B007968C011D612896E64F814C29ADE7906A5CF771DFF36800F
                169127835ACDBA4A8410BD820306FA0A3134F8AEB01D401C1625BAD2BA524417
                6C0F0FF0272DB427101AC786D65209CF0B6067DBE22331EE88E978CA40061A86
                97C6F30F58578810A25F305A1F9371D110F89141F9D7638ADF0EC888A51C682A
                C26C71F8773E03B0285E505EF662F02D84353C0BE7990E8CC316601292D6AEB8
                1043AD2B4408D16FB806CF2CA13BC12E4B28D3817F013400329C6E5D21C2F362
                6E00584C0D899EB174FAE3369E90DC23F321478510E5873E01DCEE4D9F802B0C
                CAEF707A85394B98DDF00EEBCA1011190085816B32FF71DFCF384BFD35EE38D6
                59EA4B1296CF98FE1B80A3FD213E199402FC08511D6800DC0B2683F987DF2618
                92C1A4874BCE799AF9EDAC2BA5F6C800280C3400BE83E0F5FF5183F2E9AC737A
                94E40BD6952184680AD63301DA55542464001488060E4208F8F3B384A5768FF0
                F740BC36C2BA2A84104D83593BB9C4B8B741D91D4ECF8C02BC1FC2DC81BE9918
                2032000A4086E7DCCF67B106364298FA5F34D0B7EC030C05CDE4421C19DC3CE0
                771342948186EB82B926BF2B66E3CF09CBED3EE0F847BCB6B97565D416190085
                E0C70816F9210665D33B9779C5E99D7B927545082192C04EF8AB084B8E16CF3D
                FB9D8BE2F9D1D695515B640098C38EF75430C9CF2C9C93B0DC2B71185ADD712B
                6C8987112CF38DAD2B4308918C7FFB9F0B7C68EF51B8008B1396CD1C34C722E4
                A0F98E7545D4161900E63050C76884401DED09CBE57D7F5B3CFFB5752508214C
                E0D21FD38BD329F0BA84E52E4B2BDEC0DFAD2BA1B6C8003064D9DAFFFA48BFED
                8FF7FDDC78FE29EBAA104298F13D8425C80F1B944D5F808710662037B3AE88DA
                2103C00CAEC1FD06610D6E7F83F279DF73E79F3758578610C2843CFEC8FD78D0
                2F01A68E0F400380E9C5D9071D695D19B5430680197CF0CE403000A6262C770E
                26FB9C0F2DEE317F3C5E6BB1AE0C218429F445DA0BC11729E56E20FA029C82E0
                0BF025EB4AA81D3200CC609D1F0C3E7033F19384E5F27E1F1ACFAFB2AE042144
                21A001C081080D803312963B17E3F156B02B6AF133A2222532000CC9B03542BA
                DFFB1396CAFBFDB5787EA2751508210A019D016F4070061C9BB0DCDB709A5F7A
                18822578CCBA126A870C001398EE97D9B9D646FAEC5C5C73639E70DEF39DAC2B
                42085108B824C90064CC45923B25A70C48C67E285F92DCC8BA326A830C000332
                D7098791FFA884A5E679B9D7C642BFFB8028FDB310E2E5746277503FCDC6ED09
                4B653FF4FB789E7206A2DEC800480EA7DA2E46986A4B19016B0E266224E8F097
                E14EEB4A104214968F236C0BFC46C2321591D4021900C9E154DB6908DEFFD312
                96CBC01B4746097E605D09428842C201CA371106281F4B582EF5D3B828C16CEB
                4AA80D32000CC8F07E842580CB1296CAB5FF3311D6FE3F635D05428842C2010A
                B7017280B257C27269001C1625B8D2BA126A830C00031A3E0D27D3FEDE94B0D4
                79EE0163D2A1CC957FB0751508210A4A86471106289B242C950394DD110628B7
                5A57416D9001901C06E01901C6FE3F1BFF4C58AE22FF09217A03FB83A1E8F4BB
                94DE88D9783E41991D4E3FD1E0E08EA887AD2BA036C800480A1BF770FF058CC4
                54BC94B06CDEE727E3F9FAD615218428348C0EFA7A8424657727282FC3145FE6
                3C2CECDA7E38D4BA122A8F0C80A43C82E05DBB69C2326F72F79796FC30708FAF
                1042AC9A16D739EC0B1A0033F0C784E5B23FCA674637B7AE84CA2303202136FB
                FFB5FD4F08D157B81D8F21C3191AF8EA84E52A50594A640024C32AFB5F07DA70
                00B8FCD0C02FAC2B4108510AB81DF00484ED8017242C5701815222032029DCDE
                C22580231296498BFA18048BFA42EB0A104294021A0027231800E7262C970181
                7E883003F15EEB4AA83C320092A1001B4288B2C0EDC213C12580196EC8920EF6
                47F98CC371D695507964002424C374041F80C9094BE5FDFD7C3CFFAC75150821
                4AC3E710662CBF90B04CCE58524FB24F9A685D019547064032AC2C6AC5D81642
                F415EA8BA9084E8067242C9701CB4E43D0975FB4AE84CA230320210D9C881001
                F0FC84A5F2FE5E1ACF3F605D05428852606500B4BB01CBA95182B3AD2BA1F2C8
                0048067D00E88C471F808B1296CBFBFBD3787E90752508214A42C32F1D72C032
                2561A934003EEECF327CDDBA0A2A8F0C8064704A8BD9F8B8047079C27239A576
                7D2C7F3FEB4A104294041B0340BB965222032029872038D5FC386199BCBFB7C4
                F33DAC2B40085112AC660094B63C1D320092C1487C0782A13567E19709CBE5FD
                9D17CF77B1AE04214469A0F73F072C9F4B5826F5D5BBE3F935D6155079640024
                8353F08C6CC525801B1296CB29B53B11A6D4465A578210A21434DCD799A0CFD2
                8CA4DB8715B934253200924103604F0403E09601BF5BEFE1FDBD2F9E6F6D5D09
                428852606500700960FF28C1AFAC2BA1F2C8004848277607A7D466E3F684A572
                06E021841980CDACAB4008510A98BB84FBF099BBE4F484E576387DF51684D4E9
                BFB5AE84CA23032019ACE3DDC01980999893B05CDEDF87E3F926D69520842805
                560600F5559E04E8F7037A27B16A640024A305ECFCE98837D3D5793A64000821
                FA4E036721EC02F84CC252E7A20DFB222C41DC605D0595470640321ACE041805
                5AD4D3BBBCF25320034008D1776C0C000602DACB9F65B8D1BA0A2A8F0C806464
                CE00E036BCD1CE00989FB05C19004288FE300D611BE06909CBECC0781FAFA4D3
                E9CB94CED2F5440640323A5D2DEFEC8E63300B77242C57068010A23F5818005C
                02E06E292E01DC645D01954706404232EC8A900EB82361A9320084107DC7267D
                790726621F8401D31FACABA0F2C8004806A7B4C6803300D39D959B0E6E03FC17
                C22E84D75A578210A224D81800DA0590121900C9E0B61AAE6D715BCD6D09CBE5
                FD7D309E8FB0AE04214429A0BE9A81A0AF26252C772EC6E3AD084ED3BFB1AE84
                CA230320210DEC8DE0559B726D8BF7F7DE78BE8D751508214A819501A0488029
                9101908CCC7DED07EE029895746D8BF7F7AFF17C07EB4A1042948286D3573341
                03601626262C77AE2BEDC058FECFAD2BA1F2C8004806A7B418E292710052AE6D
                F1FEFE299EEF685D09428852606500CC431B0E42C89DF253EB4AA83C320092C2
                A92D6EAB49B9B6A574C04288FE300B415F4D48582603011DECCF32FCD8BA022A
                8F0C8064B4B85AE6D4D62EEEB1FA65C272B90B80C987788FC758578210A22464
                988DB00BA02D61A9F3301E8720044EFB917515541E1900C9E094DA3B11A6D4AE
                4B582E0D003A1DF21EEF695D09428892606300B03F3A349E5F655D0595470640
                421A7837C22E806B13964A03E0060403605FEB2A10429486B3119600C6272C93
                3E004720F8005C6E5D019547064032980DF0BD08D900534E6DCDC344EF73C05D
                086FB5AE04214469B03000E803F07E7F96E1FBD615507964002424C3E108536A
                29A7B63803F07384198003ADAB4008510A1807E04B087100C6252C970396A310
                062C97585742E591019090CC5BB634002E4B582A036BFCC49F35BC0F821042AC
                0A2B0380FAEA435182EF595742E5890640E7B25F45936076AB0F820FD40C5C9A
                B05C4EA9852587CC7BD70A21446FB0F10198806310662C2FB4AE808AB3383700
                9E8F17D6B096A8D264381A6106E0E284A5F2FE5E19CF0FB3AE02214469B0F101
                98808FC4F36F5B5740C5798206002DAE07102CAE2DAD25AA309C5D3916614AED
                BB09CBE5FDE59203EFEFFBAC2B4108511A2C02017117C0F108BB00BE695D0115
                86DBD2E7E606C0CF103A88B75B4B5569321C87300390D2B2E59A5A70A66978E7
                1A2184E80D36910027E063F1FC7CEB0AA838DF0A4B006D38C9FFDAC057AC25AA
                30B4B84E4008047441C272F9405D14CF8FB6AE04214469B099019880131106A4
                5FB3AE800AC3FEE87D3400EEC029D8D45D5882A1F857D78B62F069F886CD4040
                292D5B6EABF90EC2B69A63ADAB4008510AAC92016940DA7CE8F337DC7DBDA67B
                4FCF91629EA6761F6B092B082D5A36ECD1EEB1FA6AC272795FF3B5B4E3AD2B41
                08510A2CB3017E1AC107E0CBD6955049BA87787E9901301EBBF9B316DC1AAF69
                26607061C3E6945A4ACB9616F5D7FD59031FB7AE00214449C8301DA1A3989CB0
                546E5B3E35967FB67515548CA7C0AD7F8BB1B53BEE8173F0E48A7A788E18AF8E
                E7EFB196B842700A9E0D7BB47BA0CE49582E9700BE12CB3FC9BA12841025C1CA
                00688B81871A7EA42A0607CEE89C8C30A3736EB7ABAF608EBBDD1B82F3004B7D
                1A59B295B5F41580818098558B818052366C1A74B9C171B2752508214AC33484
                19CBD3129639D70D58E874C80E6B8675055400F63B1CD0EFE26AF330842E3FEB
                F66A8F74B8DBB0833B324A60BE24B0AEF5A729315CD3E25ADA68772366262C97
                16F52C7FD6481AD04308516E2C0C002E014CF267992F5FF49F76FF73B8CF023B
                0A53F1C22BFEA2178BFC73DDEDD8D9FF69277E1CAF6D6EFDC94A08AB9A0F1203
                01A56CD83400A645092659578210A224347016C2AEA5CF242C954E80D4931C30
                7DD1BA0A4A0AE3FA2CC5429F7B66379C87677AFCCB3E78F9714660138419811F
                C66B7B587FD25291E1B3086B6A67262C95FB6ACF4498F649F9200B21CA0BBB86
                3310062C531396CB25CBCFC6F3CF5B574209E07D5A826030855D1BC37CFD35DC
                5DEBECD57FF7910C537C6EFB0E67611C89D0B1E41DDA08EBDA2830560FD45C67
                519F81B01634C5BA128410A580FA8A6BF1D457B31296CB010BF514FB9533AC2B
                A1E030C91BEB893326DC5E7E4F9FDF6110F6F9DD8793B0BA3B3E8BE1780782B7
                F9C1F1CDDF1105DCD0BAA60A41E603007106E0C484A5D2A2CEF7F14EB7AE0221
                442960D7F0090403E0EB09CBA5BECA9DA453A6212E22B9B3DEBCF8DBB5E00C7C
                0BAE71C7319881BB065C421337FAE73305ED78D1CF0CD087608BF8A1D646F0F2
                5CBD8995B73286C78F3E6C503F6F0B9EF3679D58FCB2571A78C2FD5C84E094B1
                977BA09E4DF859155B5B08D157ACD2975FEFFA0DEAE5B5F0828F4B43393642E8
                2F366862B9EC9716C5F385093FEF321A5800F83E33ECD75F887BB1AA35FC8197
                292A0E9D00F7F7670DFCCA5A182144296871FA82DEE3DC3EF6476B6144939001
                5079E63803E035080FF4A3D6C208214A42C3CFD87217C043D6A288262103A036
                D0B9E66F08535DDB590B2384282CFF44D8FF3FC25A10D1646400D406C5031042
                AC9A860F15CB91BF2287561D1900B5A17B64C7DC7B54B75F0891C3D9413AA18D
                04D7FE67E26E6B814493510F503BB814C0ED247CD8DF652D8C10A210B02BF809
                C2B6BF83AD8511899001503BE6613C76F4672D7E7F290D8121D64209214CE1C8
                7F34C2C8BFDD5A1891081900B5454982841079B638EEF73FD45A1891181900B5
                E52E4CC16A60D08B85B8395E1B652D9410220954FDCFC4237D8338F27FC45A28
                91181900B5A77B92A75BE2B52DAC851242348D2CFEFC004268F2CBAC051246C8
                0010112E096C853025F86B0425F13A6BA18410830A55FE2908CE7E5FB6164618
                2303402C47F7C88157C46BFB580B2584E81754F14F2218F4272004F8F9E1C0DE
                5254061900A207989483BB03D6C10B3E2D281BCBE9088A64B8B57042881E79DE
                FFCC7031B8C36709BEE88E3BE11C3C6C2D9828183200442FE9C038EF1BD08956
                9F7F9A1C1D8F56591D85A82BB9131FD3AFFFC11FC3D2DD10BCE8B3F7ED8C737D
                7639217A460680E827B7E2149F9E732856C311FE4A86B72334A97D10660AD6B1
                16528812C1B4E17C7E1E43787EEE8DBFDF071ADE99FF3D7306F85FC051FEEA98
                EF8E6331D58DF185E80F3200449368C7446C0E36B1CE3873D082B5E2EF6B19C8
                D370E5AFE7CF3A0BD5EC3BBDB745C877BEDE20BDE7BA088F76CB00DE831DD0DA
                F17CB00345E5F53F589F77A0B22C8D9F77C579D733FF3A9D63977F7D49FCBF67
                E3DFBD10DFEFC5F8FAD3F1FA4BFE678B1F9167EE8EFF1B61C4CE0EFF79ACE18F
                EAC8457A8AA4098510420891081900420821440D910120841042D41019004208
                21440D910120841042D4101900420821440D910120841042D410190042082144
                0D910120841042D4101900420821440D910120841042D4101900420821440D91
                0120841042D4101900420821440D910120841042D4101900420821440DF97F4F
                A57BE3781B62F50000002574455874646174653A63726561746500323032332D
                30352D32355430313A33343A30362B30303A30308B44211D0000002574455874
                646174653A6D6F6469667900323032332D30352D32355430313A33343A30362B
                30303A3030FA1999A10000002874455874646174653A74696D657374616D7000
                323032332D30352D32355430313A33343A30362B30303A3030AD0CB87E000000
                0049454E44AE426082}
              Proportional = True
              Transparent = True
              OnClick = imgUsuariosClick
              ExplicitTop = 18
            end
          end
        end
        object pnlBtnUsuariosBorda1: TPanel
          Left = 0
          Top = 0
          Width = 10
          Height = 158
          Align = alLeft
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
        end
        object pnlBtnUsuariosBorda2: TPanel
          Left = 199
          Top = 0
          Width = 10
          Height = 158
          Align = alRight
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 2
        end
      end
      object pnlMarginLeft: TPanel
        Left = 0
        Top = 0
        Width = 41
        Height = 158
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 970
      Height = 401
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object pnlSuperior: TPanel
        Left = 0
        Top = 0
        Width = 970
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        Color = 7785472
        ParentBackground = False
        TabOrder = 0
        object btnFechar: TSpeedButton
          Left = 920
          Top = 1
          Width = 39
          Height = 29
          Cursor = crHandPoint
          Caption = 'X'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7785472
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnFecharClick
        end
      end
    end
  end
end
