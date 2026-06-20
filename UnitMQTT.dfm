object FormMQTT: TFormMQTT
  Left = 290
  Top = 196
  Margins.Left = 10
  Caption = 'MQTT Dashboard'
  ClientHeight = 620
  ClientWidth = 1151
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  Position = poDesigned
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
    Width = 1151
    Height = 6
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 355
    ExplicitWidth = 1034
  end
  object LabelLWT: TLabel
    Left = 24
    Top = 253
    Width = 145
    Height = 17
    Caption = 'Last Will and Testament'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = 17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 34
    Top = 42
    Width = 535
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
      Left = 29
      Top = 109
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
      Left = 29
      Top = 153
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
      Top = 64
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
      Left = 29
      Top = 131
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
    object LabelConn: TLabel
      Left = 378
      Top = 72
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
      Left = 420
      Top = 40
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
      Left = 423
      Top = 43
      Width = 16
      Height = 16
      Brush.Color = clMaroon
      Shape = stCircle
    end
    object LabelConnect: TLabel
      Left = 198
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
    object EditName: TEdit
      Left = 102
      Top = 126
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object EditPassword: TEdit
      Left = 102
      Top = 153
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object BrokerBoxName: TComboBox
      Left = 70
      Top = 38
      Width = 196
      Height = 21
      ItemIndex = 0
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
      Left = 70
      Top = 65
      Width = 58
      Height = 21
      ItemIndex = 0
      TabOrder = 3
      Text = '1883'
      Items.Strings = (
        '1883'
        '8883'
        '')
    end
    object ConnectBtn: TButton
      Left = 283
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
      TabOrder = 4
      OnClick = ConnectBtnClick
    end
    object DisconnectBtn: TButton
      Left = 394
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
      TabOrder = 5
      OnClick = DisconnectBtnClick
    end
    object SSLFlag: TCheckBox
      Left = 184
      Top = 65
      Width = 57
      Height = 17
      BiDiMode = bdRightToLeft
      Caption = 'SSL'
      ParentBiDiMode = False
      TabOrder = 6
    end
  end
  object MemoLog: TMemo
    Left = 0
    Top = 367
    Width = 1151
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
    ExplicitTop = 358
    ExplicitWidth = 1028
  end
  object publishpanel: TPanel
    Left = 24
    Top = 300
    Width = 1089
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
    object LabelQos: TLabel
      AlignWithMargins = True
      Left = 848
      Top = 4
      Width = 29
      Height = 16
      Margins.Left = 10
      Align = alRight
      Caption = 'QoS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 720
      ExplicitTop = 1
      ExplicitHeight = 22
    end
    object EditPayload: TEdit
      Left = 194
      Top = 1
      Width = 644
      Height = 22
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 680
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
      Left = 1013
      Top = 1
      Width = 75
      Height = 22
      Margins.Left = 10
      Align = alRight
      Caption = 'Publish'
      Enabled = False
      TabOrder = 2
      OnClick = PublishBtnClick
      ExplicitLeft = 874
    end
    object QoScombobox: TComboBox
      Left = 880
      Top = 1
      Width = 38
      Height = 24
      Margins.Right = 10
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 3
      Text = '0'
      Items.Strings = (
        '0'
        '1'
        '2')
      ExplicitLeft = 307
      ExplicitTop = 0
    end
    object RetFlag: TCheckBox
      AlignWithMargins = True
      Left = 918
      Top = 4
      Width = 85
      Height = 16
      Margins.Left = 0
      Margins.Right = 10
      Align = alRight
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight, akBottom]
      BiDiMode = bdLeftToRight
      Caption = '   Retain flag'
      ParentBiDiMode = False
      TabOrder = 4
      StyleElements = [seClient]
      ExplicitLeft = 928
    end
  end
  object PanelTopic: TPanel
    Left = 700
    Top = 40
    Width = 337
    Height = 205
    Caption = 'PanelTopic'
    TabOrder = 3
    object LabelTopic2Subs: TLabel
      Left = 8
      Top = 136
      Width = 89
      Height = 13
      Caption = 'Topic To Subscribe'
    end
    object EditTopicsubs: TEdit
      Left = 1
      Top = 1
      Width = 335
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
      Text = 'Topics subscribed. Click on an item to unsubscribe'
      ExplicitWidth = 298
    end
    object EditTopicSubsBox: TEdit
      Left = 16
      Top = 155
      Width = 225
      Height = 21
      TabOrder = 1
      OnChange = EditTopicSubsBoxChange
    end
    object ButtonSubs: TButton
      Left = 240
      Top = 155
      Width = 75
      Height = 25
      Caption = 'Subscribe'
      Enabled = False
      TabOrder = 2
      OnClick = ButtonSubsClick
    end
    object TopicsSubscribedListBox: TListBox
      Left = 1
      Top = 22
      Width = 335
      Height = 97
      Align = alTop
      ItemHeight = 13
      TabOrder = 3
      OnClick = TopicsSubscribedListBoxClick
      ExplicitWidth = 298
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'text files|*.txt'
    Left = 628
    Top = 84
  end
  object MainMenu1: TMainMenu
    Left = 602
    Top = 218
    object SaveMemoItem: TMenuItem
      Caption = 'Save Memo'
      OnClick = SaveMemoItemClick
    end
    object About1: TMenuItem
      Caption = 'About'
    end
  end
  object TMSMQTTClient1: TTMSMQTTClient
    ClientID = 'MyUniqueClientID'
    LastWillSettings.Topic = 'MessFromClient71'
    LastWillSettings.WillMessage = 'Broker died'
    Version = '2.0.8.0'
    OnConnectedStatusChanged = TMSMQTTClient1ConnectedStatusChanged
    OnPublishReceived = TMSMQTTClient1PublishReceived
    Left = 784
    Top = 402
  end
end
