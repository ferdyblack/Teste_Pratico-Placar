object FrmPlacar: TFrmPlacar
  Left = 0
  Top = 0
  Caption = 'Tabela Pontua'#231#245'es'
  ClientHeight = 401
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblplacar: TLabel
    Left = 176
    Top = 24
    Width = 39
    Height = 13
    Caption = 'lblplacar'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lbljogo: TLabel
    Left = 508
    Top = 97
    Width = 55
    Height = 13
    Caption = 'Placar Jogo'
  end
  object btnInsercao: TButton
    Left = 624
    Top = 368
    Width = 89
    Height = 25
    Caption = 'Inser'#231#227'oJogos'
    TabOrder = 0
    OnClick = btnInsercaoClick
  end
  object Placar: TStringGrid
    Left = 96
    Top = 123
    Width = 537
    Height = 190
    ColCount = 6
    TabOrder = 1
  end
  object CbPlacar: TComboBox
    Left = 569
    Top = 94
    Width = 48
    Height = 21
    TabOrder = 2
    Text = '0'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20'
      '21'
      '22'
      '23'
      '24'
      '25'
      '26'
      '27'
      '28'
      '29'
      '30'
      '31'
      '32'
      '33'
      '34'
      '35'
      '36'
      '37'
      '38'
      '39'
      '40'
      '41'
      '42'
      '43'
      '44'
      '45'
      '46'
      '47'
      '48'
      '49'
      '50'
      '51'
      '52'
      '53'
      '54'
      '55'
      '56'
      '57'
      '58'
      '59'
      '60'
      '61'
      '62'
      '63'
      '64'
      '65'
      '66'
      '67'
      '68'
      '69'
      '70'
      '71'
      '72'
      '73'
      '74'
      '75'
      '76'
      '77'
      '78'
      '79'
      '80'
      '81'
      '82'
      '83'
      '84'
      '85'
      '86'
      '87'
      '88'
      '89'
      '90'
      '91'
      '92'
      '93'
      '94'
      '95'
      '96'
      '97'
      '98'
      '99'
      '100')
  end
  object btnPontuacao: TButton
    Left = 623
    Top = 92
    Width = 97
    Height = 25
    Caption = 'Inserir pontua'#231#227'o'
    TabOrder = 3
    OnClick = btnPontuacaoClick
  end
end
