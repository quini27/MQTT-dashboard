(*****************************************************************************)
{    Project MQTT Dashboard
    VCL Application to test a connection with a MQTT Broker
    There must be chosen a free MQTT broker, as
    "test.mosquitto.org"; //"broker.hivemq.com";  //"iot.eclipse.com";
    //"mqtt.fluux.io"; //"test.mosca.io"; //"broker.mqttdashboard.com";,
    and the port is the open MQTT port 1883 (without SSL criptography) or 8883 (with SSL criptography).
    This application is able to publish a message in a determinated topic, to subscribe to
    desired topics end to write in the memo log window the payload receiveid in the topics subscribed.

   }
    //      Copyright: Fernando Pazos
    //      may 2022
(*****************************************************************************)

unit UnitMQTT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TMS.MQTT.Global, Vcl.StdCtrls,
  TMS.MQTT.Client, Vcl.ExtCtrls, Vcl.Menus, ShellApi, Vcl.ToolWin, Vcl.ComCtrls,
  Vcl.Grids, Vcl.ValEdit;

type
  TFormMQTT = class(TForm)
    TMSMQTTClient1: TTMSMQTTClient;
    MemoLog: TMemo;
    ConnectBtn: TButton;
    LedSha2: TShape;
    LabelConn: TLabel;
    LedShape: TShape;
    DisconnectBtn: TButton;
    LabelBroker: TLabel;
    LabelPort: TLabel;
    BrokerBoxName: TComboBox;
    Weblabel: TLabel;
    SaveDialog1: TSaveDialog;
    LabelCredentials: TLabel;
    LabelUserName: TLabel;
    LabelPassword: TLabel;
    EditName: TEdit;
    EditPassword: TEdit;
    MainMenu1: TMainMenu;
    SaveMemoItem: TMenuItem;
    About1: TMenuItem;
    Panel1: TPanel;
    PortComboBox: TComboBox;
    LabelQos: TLabel;
    QoScombobox: TComboBox;
    LabelSSL: TLabel;
    RadioButtonSSL: TRadioButton;
    LabelConnect: TLabel;
    EditTopic: TEdit;
    LabelTopic: TLabel;
    EditPayload: TEdit;
    LabelPayload: TLabel;
    PublishBtn: TButton;
    publishpanel: TPanel;
    Splitter1: TSplitter;
    SubTopicsMemo: TMemo;
    EditTopicsubs: TEdit;
    PanelTopic: TPanel;
    Splitter2: TSplitter;
    procedure MemoLogChange(Sender: TObject);
    procedure ConnectBtnClick(Sender: TObject);
    procedure TMSMQTTClient1ConnectedStatusChanged(ASender: TObject;
      const AConnected: Boolean; AStatus: TTMSMQTTConnectionStatus);
    procedure TMSMQTTClient1PublishReceived(ASender: TObject; APacketID: Word;
      ATopic: string; APayload: TArray<System.Byte>);
    procedure DisconnectBtnClick(Sender: TObject);
    procedure BrokerBoxNameChange(Sender: TObject);
    procedure WeblabelClick(Sender: TObject);
    procedure WeblabelMouseEnter(Sender: TObject);
    procedure WeblabelMouseLeave(Sender: TObject);
    procedure PortComboBoxChange(Sender: TObject);
    procedure EditPasswordChange(Sender: TObject);
    procedure EditNameChange(Sender: TObject);
    procedure SaveMemoItemClick(Sender: TObject);
    procedure RadioButtonSSLClick(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure PublishBtnClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMQTT: TFormMQTT;

implementation

{$R *.dfm}

//type
//  tQos=set of (qosAtMostOnce,qosAtLeastOnce,qosExactlyOnce);






(*********************************************************************************)
(*                                                                               *)
(*          Functions to connect the application to a MQTT broker                *)
(*                                                                               *)
(*********************************************************************************)

//event executed when a broker URL is selected from the list box
procedure TFormMQTT.BrokerBoxNameChange(Sender: TObject);
begin
    TMSMQTTClient1.BrokerHostName:=BrokerBoxName.Text;
    EditPassword.Text:='';
    EditName.Text:='';
end;

//event executed when the password is changed
procedure TFormMQTT.EditNameChange(Sender: TObject);
begin
  TMSMQTTClient1.Credentials.Username:=EditName.Text;
end;
//event executed when the username is changed
procedure TFormMQTT.EditPasswordChange(Sender: TObject);
begin
  TMSMQTTClient1.Credentials.Password:=EditPassword.Text;
end;

//event executed when the port number is changed
procedure TFormMQTT.PortComboBoxChange(Sender: TObject);
begin
    TMSMQTTClient1.BrokerPort:=StrToInt(PortComboBox.Text);
end;


//event executed when the SSL check box os clicked
procedure TFormMQTT.RadioButtonSSLClick(Sender: TObject);
begin
    TMSMQTTClient1.UseSSL:=RadioButtonSSL.Checked;
end;

//Event executed when the Connect button is pressed
procedure TFormMQTT.ConnectBtnClick(Sender: TObject);
begin
    TMSMQTTClient1.Connect();
end;

//Event executed when the disconnect button is pressed
procedure TFormMQTT.DisconnectBtnClick(Sender: TObject);
begin
    TMSMQTTClient1.Disconnect();
end;

(*********************************************************************************)
(*                                                                               *)
(*          Functions to scroll the memo log window                              *)
(*                                                                               *)
(*********************************************************************************)
//EVENT executed when MemoLog is on change to scroll the memoLog until the last row
procedure TFormMQTT.MemoLogChange(Sender: TObject);
begin
  SendMessage(MemoLog.Handle, EM_LINESCROLL, 0,MemoLog.Lines.Count);
end;

(*********************************************************************************)
(*                                                                               *)
(*          Functions of the TMSMQTT client                                      *)
(*                                                                               *)
(*********************************************************************************)

//Event executed when the Connection state changes
//It toggles the connect and disconnect enabled status, and put on/off the drawn led
//prints on the memo log window the connection status.
//when connected, subscribes to the topics Estado/Led, Estado/Botao and TopicIoTboard71
procedure TFormMQTT.TMSMQTTClient1ConnectedStatusChanged(ASender: TObject;
  const AConnected: Boolean; AStatus: TTMSMQTTConnectionStatus);
  var i:byte;
begin
    if (AConnected) then
      begin
        ConnectBtn.Enabled:=False;
        BrokerBoxName.Enabled:=False;
        DisconnectBtn.Enabled:=True;
        EditName.Enabled:=false;
        EditPassword.Enabled:=false;
        PublishBtn.Enabled:=true;
        SubTopicsMemo.Enabled:=false;
        if SubTopicsMemo.Lines.Count>0 then
          for i:=0 to  SubTopicsMemo.Lines.count-1 do
              begin
                MemoLog.Lines.Add('Topic subscribed: '+SubTopicsMemo.Lines[i]);
                case QoScombobox.Text[1] of
                  '0': TMSMQTTClient1.Subscribe(SubTopicsMemo.Lines[i],qosAtMostOnce);
                  '1': TMSMQTTClient1.Subscribe(SubTopicsMemo.Lines[i],qosAtLeastOnce);
                  '2': TMSMQTTClient1.Subscribe(SubTopicsMemo.Lines[i],qosExactlyOnce);
                  end;
                  {case QoScombobox.Text[1] of
                  '0':  MemoLog.Lines.Add(SubTopicsMemo.Lines[i]+', QoS 0');
                  '1':  MemoLog.Lines.Add(SubTopicsMemo.Lines[i]+', QoS 1');
                  '2':  MemoLog.Lines.Add(SubTopicsMemo.Lines[i]+', QoS 2');
                end;  }
              end;
        LedShape.Brush.Color:=clRed;
        MemoLog.Lines.Add('Client connected to server '+TMSMQTTClient1.BrokerHostName+' at '+FormatDateTime('hh:nn:ss', Now));
      end
      else
      begin
        ConnectBtn.Enabled:=True;
        BrokerBoxName.Enabled:=True;
        DisconnectBtn.Enabled:=False;
        EditName.Enabled:=true;
        EditPassword.Enabled:=true;
        PublishBtn.Enabled:=false;
        SubTopicsMemo.Enabled:=true;
        LedShape.Brush.Color:=clMaroon;
        MemoLog.Lines.Add('Client disconnected from server '+TMSMQTTClient1.BrokerHostName+' at '+FormatDateTime('hh:nn:ss', Now));
        case AStatus of
          csNotConnected: MemoLog.Lines.Add('Client not connected');
          csConnectionRejected_InvalidProtocolVersion: MemoLog.Lines.Add('Invalid Protocol Version');
          csConnectionRejected_InvalidIdentifier: MemoLog.Lines.Add('Invalid identifier');
          csConnectionRejected_ServerUnavailable: MemoLog.Lines.Add('Server Unavailable');
          csConnectionRejected_InvalidCredentials: MemoLog.Lines.Add('Invalid credentials');
          csConnectionRejected_ClientNotAuthorized: MemoLog.Lines.Add('Client not authorized');
          csConnectionLost: MemoLog.Lines.Add('Connection lost');
          //csConnecting: ;
          //csReconnecting: ;
          //csConnected: ;
        end;
      end;

end;


//Event executed when a message is received from the publisher (IoT board)
//It prints the received message on the Memo Log window
procedure TFormMQTT.TMSMQTTClient1PublishReceived(ASender: TObject;
  APacketID: Word; ATopic: string; APayload: TArray<System.Byte>);
  var msg:string;
begin
  msg := TEncoding.UTF8.GetString(APayload);
  MemoLog.Lines.Add('Message received from the publisher ['+ATopic+']: '+msg);
end;

//event to publish the message written in the payload edit box in the topic written in
//the topic edit box
procedure TFormMQTT.PublishBtnClick(Sender: TObject);
begin
    case QoScombobox.Text[1] of
      '0': TMSMQTTClient1.Publish(EditTopic.Text,EditPayload.Text,qosAtMostOnce);
      '1': TMSMQTTClient1.Publish(EditTopic.Text,EditPayload.Text,qosAtLeastOnce);
      '2': TMSMQTTClient1.Publish(EditTopic.Text,EditPayload.Text,qosExactlyOnce);
    end;
    MemoLog.Lines.Add('Message published in the topic ['+EditTopic.Text+']: '+EditPayload.Text);
    EditPayload.Clear;
end;


//procedure to save the memo log window on a file
procedure TFormMQTT.SaveMemoItemClick(Sender: TObject);
var ToF:textfile;
begin
    if SaveDialog1.Execute then
         begin
            AssignFile(ToF, SaveDialog1.FileName);	{ Open output file. }
            rewrite(ToF);
            write(ToF,MemoLog.Text);
            CloseFile(ToF)
         end;
end;



//event to move the payload label as the edit box payload is resized
procedure TFormMQTT.Splitter1Moved(Sender: TObject);
begin
    LabelPayload.Left:=PublishPanel.Left+ EditPayload.Left;
end;

(**************************************************************************************)
{Procedures to handle the web site}
(**************************************************************************************)
//Open the web site
procedure TFormMQTT.WeblabelClick(Sender: TObject);
begin
   ShellExecute(Handle, 'open', 'http://quiniautomatizacion.mobirisesite.com',nil,nil, SW_SHOWNORMAL) ;
end;

procedure TFormMQTT.WeblabelMouseEnter(Sender: TObject);
begin
  Weblabel.Font.Color:= clBlue;
  Weblabel.Cursor:=      crHandPoint;
  //Weblabel.Font.Style:=[fsBold];
end;

procedure TFormMQTT.WeblabelMouseLeave(Sender: TObject);
begin
     Weblabel.Font.Color:= clAqua;
end;

end.
