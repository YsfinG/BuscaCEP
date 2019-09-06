object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 262
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    324
    262)
  PixelsPerInch = 96
  TextHeight = 13
  object LabeledEdit1: TLabeledEdit
    Left = 8
    Top = 24
    Width = 265
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'Servidor SMTP'
    TabOrder = 0
    ExplicitWidth = 194
  end
  object LabeledEdit2: TLabeledEdit
    Left = 279
    Top = 24
    Width = 37
    Height = 21
    Anchors = [akTop, akRight]
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Caption = 'Porta'
    TabOrder = 1
    ExplicitLeft = 208
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 51
    Width = 308
    Height = 158
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Seguran'#231'a e autentica'#231#227'o'
    Padding.Left = 8
    Padding.Right = 8
    TabOrder = 2
    ExplicitWidth = 237
    DesignSize = (
      308
      158)
    object Label1: TLabel
      Left = 11
      Top = 15
      Width = 110
      Height = 13
      Align = alCustom
      Caption = 'Seguran'#231'a da conex'#227'o'
    end
    object Label2: TLabel
      Left = 11
      Top = 63
      Width = 106
      Height = 13
      Align = alCustom
      Caption = 'Modo de autentica'#231#227'o'
    end
    object ComboBox1: TComboBox
      Left = 11
      Top = 31
      Width = 286
      Height = 21
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'ComboBox1'
      Items.Strings = (
        'Nenhuma'
        'STARTTLS'
        'SSL/TLS')
      ExplicitWidth = 215
    end
    object ComboBox2: TComboBox
      Left = 11
      Top = 79
      Width = 286
      Height = 21
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Text = 'ComboBox1'
      Items.Strings = (
        'Sem autentica'#231#227'o'
        'Padr'#227'o'
        'SALS')
    end
    object LabeledEdit3: TLabeledEdit
      Left = 11
      Top = 127
      Width = 184
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 80
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome de usu'#225'rio'
      TabOrder = 2
    end
    object LabeledEdit4: TLabeledEdit
      Left = 201
      Top = 127
      Width = 96
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'Senha'
      PasswordChar = '*'
      TabOrder = 3
    end
  end
  object pnlBar: TPanel
    Left = 0
    Top = 216
    Width = 324
    Height = 46
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'pnlBar'
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    ShowCaption = False
    TabOrder = 3
    ExplicitTop = 205
    ExplicitWidth = 253
    object btnEnviarEmail: TBitBtn
      Left = 197
      Top = 3
      Width = 120
      Height = 36
      Align = alRight
      Caption = 'Confirmar'
      TabOrder = 0
      ExplicitLeft = 577
      ExplicitTop = 10
      ExplicitHeight = 41
    end
  end
end
