object FormMQTT: TFormMQTT
  Left = 0
  Top = 0
  Caption = 'MQTT Dashboard'
  ClientHeight = 620
  ClientWidth = 1034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Weblabel: TLabel
    Left = 614
    Top = 5
    Width = 209
    Height = 13
    Caption = 'http://quiniautomatizacion.mobirisesite.com'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clAqua
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    OnClick = WeblabelClick
    OnMouseEnter = WeblabelMouseEnter
    OnMouseLeave = WeblabelMouseLeave
  end
  object LabelTopic: TLabel
    Left = 24
    Top = 280
    Width = 31
    Height = 16
    Caption = 'Topic'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelPayload: TLabel
    Left = 218
    Top = 280
    Width = 44
    Height = 16
    Caption = 'Payload'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 361
    Width = 1034
    Height = 6
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 355
  end
  object Panel1: TPanel
    Left = 58
    Top = 40
    Width = 512
    Height = 201
    TabOrder = 1
    object LabelBroker: TLabel
      Left = 22
      Top = 42
      Width = 42
      Height = 16
      Caption = 'Broker:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelCredentials: TLabel
      Left = 22
      Top = 104
      Width = 64
      Height = 16
      Caption = 'Credentials'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelPassword: TLabel
      Left = 22
      Top = 148
      Width = 60
      Height = 16
      Caption = 'Password:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelPort: TLabel
      Left = 22
      Top = 70
      Width = 28
      Height = 16
      Caption = 'Port:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelUserName: TLabel
      Left = 22
      Top = 126
      Width = 67
      Height = 16
      Caption = 'User name:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelSSL: TLabel
      Left = 128
      Top = 68
      Width = 27
      Height = 16
      Caption = 'SSL:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelConn: TLabel
      Left = 338
      Top = 77
      Width = 101
      Height = 16
      Caption = 'Connection status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LedSha2: TShape
      Left = 380
      Top = 42
      Width = 22
      Height = 22
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Brush.Color = clGray
      Pen.Color = clGray
      Shape = stCircle
    end
    object LedShape: TShape
      Left = 383
      Top = 45
      Width = 16
      Height = 16
      Brush.Color = clMaroon
      Shape = stCircle
    end
    object LabelConnect: TLabel
      Left = 174
      Top = 16
      Width = 126
      Height = 16
      Caption = 'Connection panel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelQos: TLabel
      Left = 202
      Top = 65
      Width = 29
      Height = 16
      Caption = 'QoS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EditName: TEdit
      Left = 95
      Top = 121
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = EditNameChange
    end
    object EditPassword: TEdit
      Left = 95
      Top = 148
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = EditPasswordChange
    end
    object BrokerBoxName: TComboBox
      Left = 70
      Top = 38
      Width = 161
      Height = 21
      TabOrder = 2
      Text = 'test.mosquitto.org'
      OnChange = BrokerBoxNameChange
      Items.Strings = (
        'test.mosquitto.org'
        'broker.hivemq.com'
        'mqttshared.crystalmq.com'
        'mqtt.fluux.io'
        'test.mosca.io'
        'broker.mqttdashboard.com'
        'mqtt.flespi.io'
        'broker.emqx.io'
        'saas.theakiro.com'
        'ioticos.org'
        '')
    end
    object PortComboBox: TComboBox
      Left = 56
      Top = 65
      Width = 47
      Height = 21
      ItemIndex = 0
      TabOrder = 3
      Text = '1883'
      OnChange = PortComboBoxChange
      Items.Strings = (
        '1883'
        '8883')
    end
    object RadioButtonSSL: TRadioButton
      Left = 157
      Top = 66
      Width = 17
      Height = 17
      TabOrder = 4
      OnClick = RadioButtonSSLClick
    end
    object QoScombobox: TComboBox
      Left = 237
      Top = 62
      Width = 38
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 5
      Text = '0'
      Items.Strings = (
        '0'
        '1'
        '2')
    end
    object ConnectBtn: TButton
      Left = 278
      Top = 131
      Width = 113
      Height = 49
      Caption = 'Connect'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = ConnectBtnClick
    end
    object DisconnectBtn: TButton
      Left = 386
      Top = 131
      Width = 106
      Height = 49
      Caption = 'Disconnect'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = DisconnectBtnClick
    end
  end
  object MemoLog: TMemo
    Left = 0
    Top = 367
    Width = 1034
    Height = 253
    Align = alBottom
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo Log')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    OnChange = MemoLogChange
  end
  object publishpanel: TPanel
    Left = 24
    Top = 300
    Width = 950
    Height = 24
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 191
      Top = 1
      Height = 22
      OnMoved = Splitter1Moved
      ExplicitLeft = 168
      ExplicitTop = 0
      ExplicitHeight = 100
    end
    object EditPayload: TEdit
      Left = 194
      Top = 1
      Width = 680
      Height = 22
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 21
    end
    object EditTopic: TEdit
      Left = 1
      Top = 1
      Width = 190
      Height = 22
      Align = alLeft
      TabOrder = 1
      ExplicitHeight = 21
    end
    object PublishBtn: TButton
      Left = 874
      Top = 1
      Width = 75
      Height = 22
      Align = alRight
      Caption = 'Publish'
      Enabled = False
      TabOrder = 2
      OnClick = PublishBtnClick
    end
  end
  object PanelTopic: TPanel
    Left = 700
    Top = 40
    Width = 280
    Height = 209
    Caption = 'PanelTopic'
    TabOrder = 3
    object EditTopicsubs: TEdit
      Left = 1
      Top = 1
      Width = 278
      Height = 21
      Align = alTop
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = 'Topics subscribed'
    end
    object SubTopicsMemo: TMemo
      Left = 1
      Top = 22
      Width = 278
      Height = 186
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  object TMSMQTTClient1: TTMSMQTTClient
    BrokerHostName = 'test.mosquitto.org'
    OnConnectedStatusChanged = TMSMQTTClient1ConnectedStatusChanged
    OnPublishReceived = TMSMQTTClient1PublishReceived
    Version = '1.1.0.2'
    Left = 584
    Top = 112
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'text files|*.txt'
    Left = 592
    Top = 48
  end
  object MainMenu1: TMainMenu
    Left = 584
    Top = 168
    object SaveMemoItem: TMenuItem
      Caption = 'Save Memo'
      OnClick = SaveMemoItemClick
    end
    object About1: TMenuItem
      Caption = 'About'
    end
  end
end
