object Form1: TForm1
  Left = 298
  Top = 92
  Caption = 'Form1'
  ClientHeight = 356
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 231
    Width = 23
    Height = 25
    Hint = #1055#1091#1090#1100' '#1082' exe '#1092#1072#1081#1083#1091
    Caption = 'A'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 8
    Top = 262
    Width = 23
    Height = 25
    Hint = #1055#1091#1090#1100' '#1082' exe '#1092#1072#1081#1083#1091
    Caption = 'L'
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 8
    Top = 293
    Width = 23
    Height = 25
    Hint = #1055#1091#1090#1100' '#1082' exe '#1092#1072#1081#1083#1091
    Caption = 'Z'
    OnClick = SpeedButton3Click
  end
  object Label18: TLabel
    Left = 141
    Top = 236
    Width = 22
    Height = 13
    Caption = 'RAM'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label19: TLabel
    Left = 141
    Top = 267
    Width = 22
    Height = 13
    Caption = 'RAM'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label20: TLabel
    Left = 141
    Top = 298
    Width = 22
    Height = 13
    Caption = 'RAM'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object Button1: TButton
    Left = 274
    Top = 147
    Width = 135
    Height = 25
    Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1089' '#1047#1086#1085#1099
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 274
    Top = 187
    Width = 135
    Height = 25
    Hint = #1042#1089#1077' '#1091#1082#1072#1079#1072#1085#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1074#1089#1090#1091#1087#1103#1090' '#1074' '#1089#1080#1083#1091' !'
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 127
    Height = 217
    Caption = #1054#1073#1099#1095#1085#1099#1077' '#1072#1082#1082#1072#1091#1085#1090#1099
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 30
      Height = 13
      Caption = #1044#1088#1086#1087':'
    end
    object Label2: TLabel
      Left = 8
      Top = 52
      Width = 29
      Height = 13
      Caption = #1056#1091#1076#1072':'
    end
    object Label3: TLabel
      Left = 8
      Top = 77
      Width = 37
      Height = 13
      Caption = #1057#1082#1080#1083#1099':'
    end
    object Label4: TLabel
      Left = 8
      Top = 105
      Width = 20
      Height = 13
      Caption = #1055#1058' :'
    end
    object Label5: TLabel
      Left = 8
      Top = 130
      Width = 48
      Height = 13
      Caption = #1040#1085#1080#1084#1091#1089#1099':'
    end
    object Label6: TLabel
      Left = 8
      Top = 158
      Width = 25
      Height = 13
      Caption = 'EXP :'
    end
    object Label7: TLabel
      Left = 8
      Top = 184
      Width = 40
      Height = 13
      Hint = #1055#1086#1090#1077#1088#1103' '#1045#1082#1089#1087#1099' '#1087#1088#1080' '#1089#1084#1077#1088#1090#1080
      Caption = 'DieEXP :'
    end
    object SpinEdit1: TSpinEdit
      Left = 60
      Top = 21
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 0
      Value = 1
      OnChange = SpinEdit1Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit2: TSpinEdit
      Left = 60
      Top = 49
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 1
      Value = 1
      OnChange = SpinEdit2Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit3: TSpinEdit
      Left = 60
      Top = 74
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 2
      Value = 1
      OnChange = SpinEdit3Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit4: TSpinEdit
      Left = 60
      Top = 102
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 3
      Value = 1
      OnChange = SpinEdit4Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit5: TSpinEdit
      Left = 60
      Top = 127
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 4
      Value = 1
      OnChange = SpinEdit5Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit6: TSpinEdit
      Left = 60
      Top = 155
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 5
      Value = 1
      OnChange = SpinEdit6Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit7: TSpinEdit
      Left = 60
      Top = 181
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 6
      Value = 1
      OnChange = SpinEdit7Change
      OnKeyPress = SpinEdit1KeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 141
    Top = 8
    Width = 127
    Height = 217
    Caption = #1055#1088#1077#1084#1080#1091#1084' '#1072#1082#1082#1072#1091#1085#1090#1099
    TabOrder = 3
    object Label8: TLabel
      Left = 8
      Top = 24
      Width = 30
      Height = 13
      Caption = #1044#1088#1086#1087':'
    end
    object Label9: TLabel
      Left = 8
      Top = 52
      Width = 29
      Height = 13
      Caption = #1056#1091#1076#1072':'
    end
    object Label10: TLabel
      Left = 8
      Top = 77
      Width = 37
      Height = 13
      Caption = #1057#1082#1080#1083#1099':'
    end
    object Label11: TLabel
      Left = 8
      Top = 105
      Width = 20
      Height = 13
      Caption = #1055#1058' :'
    end
    object Label12: TLabel
      Left = 8
      Top = 130
      Width = 48
      Height = 13
      Caption = #1040#1085#1080#1084#1091#1089#1099':'
    end
    object Label13: TLabel
      Left = 8
      Top = 158
      Width = 25
      Height = 13
      Caption = 'EXP :'
    end
    object Label14: TLabel
      Left = 8
      Top = 184
      Width = 40
      Height = 13
      Hint = #1055#1086#1090#1077#1088#1103' '#1045#1082#1089#1087#1099' '#1087#1088#1080' '#1089#1084#1077#1088#1090#1080
      Caption = 'DieEXP :'
    end
    object SpinEdit8: TSpinEdit
      Left = 60
      Top = 21
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 0
      Value = 1
      OnChange = SpinEdit8Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit9: TSpinEdit
      Left = 60
      Top = 49
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 1
      Value = 1
      OnChange = SpinEdit9Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit10: TSpinEdit
      Left = 60
      Top = 74
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 2
      Value = 1
      OnChange = SpinEdit10Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit11: TSpinEdit
      Left = 60
      Top = 102
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 3
      Value = 1
      OnChange = SpinEdit11Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit12: TSpinEdit
      Left = 60
      Top = 127
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 4
      Value = 1
      OnChange = SpinEdit12Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit13: TSpinEdit
      Left = 60
      Top = 155
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 5
      Value = 1
      OnChange = SpinEdit13Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit14: TSpinEdit
      Left = 60
      Top = 183
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 6
      Value = 1
      OnChange = SpinEdit14Change
      OnKeyPress = SpinEdit1KeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 274
    Top = 8
    Width = 135
    Height = 133
    Caption = #1044#1088#1091#1075#1086#1077'..'
    TabOrder = 4
    object Label15: TLabel
      Left = 11
      Top = 24
      Width = 50
      Height = 13
      Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1083#1080#1087#1086#1074
      Caption = 'SleepTerm'
    end
    object Label16: TLabel
      Left = 11
      Top = 52
      Width = 52
      Height = 13
      Hint = #1044#1083#1080#1085#1085#1072' '#1089#1083#1080#1087#1086#1074
      Caption = 'SleepValue'
    end
    object Label17: TLabel
      Left = 11
      Top = 77
      Width = 52
      Height = 13
      Hint = #1048#1075#1085#1086#1088' '#1089#1083#1080#1087#1086#1074
      Caption = 'SleepIgnor'
    end
    object Label21: TLabel
      Left = 11
      Top = 105
      Width = 47
      Height = 13
      Caption = 'DarkHole:'
    end
    object SpinEdit15: TSpinEdit
      Left = 70
      Top = 21
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 0
      Value = 1
      OnChange = SpinEdit15Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit16: TSpinEdit
      Left = 70
      Top = 49
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 1
      Value = 1
      OnChange = SpinEdit16Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit17: TSpinEdit
      Left = 70
      Top = 74
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 2
      Value = 1
      OnChange = SpinEdit17Change
      OnKeyPress = SpinEdit1KeyPress
    end
    object SpinEdit18: TSpinEdit
      Left = 70
      Top = 102
      Width = 55
      Height = 22
      MaxValue = 65500
      MinValue = 1
      TabOrder = 3
      Value = 1
      OnChange = SpinEdit18Change
      OnKeyPress = SpinEdit1KeyPress
    end
  end
  object Button5: TButton
    Left = 34
    Top = 231
    Width = 95
    Height = 25
    Caption = 'Account'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 34
    Top = 262
    Width = 95
    Height = 25
    Caption = 'Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 34
    Top = 293
    Width = 95
    Height = 25
    Caption = 'Zone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 234
    Top = 231
    Width = 60
    Height = 25
    Caption = #1057#1082#1088#1099#1090#1100
    TabOrder = 8
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 234
    Top = 262
    Width = 60
    Height = 25
    Caption = #1057#1082#1088#1099#1090#1100
    TabOrder = 9
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 234
    Top = 293
    Width = 60
    Height = 25
    Caption = #1057#1082#1088#1099#1090#1100
    TabOrder = 10
    OnClick = Button10Click
  end
  object Memo1: TMemo
    Left = 300
    Top = 233
    Width = 109
    Height = 89
    TabOrder = 11
  end
  object Edit1: TEdit
    Left = 8
    Top = 328
    Width = 329
    Height = 21
    TabOrder = 12
  end
  object Button3: TButton
    Left = 343
    Top = 328
    Width = 66
    Height = 21
    Caption = 'System MSG'
    TabOrder = 13
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Ctl3D = False
    Filter = #1048#1089#1087#1086#1083#1085#1103#1077#1084#1099#1081' '#1092#1072#1081#1083' '#1089#1077#1088#1074#1077#1088#1072'|*.exe'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofNoReadOnlyReturn, ofEnableSizing]
    Left = 168
    Top = 257
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 201
    Top = 257
  end
end
