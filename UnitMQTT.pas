(*****************************************************************************)
{    Project MQTT Dashboard
VCL Application to tets a connection with a broker MQTT using the TMS MQTT component
extracted from https://www.tmssoftware.com/site/tmsmqtt.asp
    There must be chosen a free MQTT broker, as
    "test.mosquitto.org"; //"broker.hivemq.com";  //"iot.eclipse.com";
    //"mqtt.fluux.io"; //"test.mosca.io"; //"broker.mqttdashboard.com";,
    and the port is the open MQTT port 1883 (without SSL criptography) or 8883 (with SSL criptography).
    This application is able to publish a message in a determinated topic, to subscribe to
    desired topics end to write in the memo log window the payload receiveid in the topics subscribed.

   }
    //      Copyright: Fernando Pazos
    //      may 2023
(*****************************************************************************)

unit UnitMQTT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TMS.MQTT.Global, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Menus, ShellApi, Vcl.ToolWin, Vcl.ComCtrls,
  Vcl.Grids, Vcl.ValEdit, TMS.MQTT.Client;

type
  TFormMQTT = class(TForm)
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
    LabelConnect: TLabel;
    EditTopic: TEdit;
    LabelTopic: TLabel;
    EditPayload: TEdit;
    LabelPayload: TLabel;
    PublishBtn: TButton;
    publishpanel: TPanel;
    Splitter1: TSplitter;
    EditTopicsubs: TEdit;
    PanelTopic: TPanel;
    Splitter2: TSplitter;
    LabelTopic2Subs: TLabel;
    EditTopicSubsBox: TEdit;
    ButtonSubs: TButton;
    TopicsSubscribedListBox: TListBox;
    TMSMQTTClient1: TTMSMQTTClient;
    LabelQos: TLabel;
    QoScombobox: TComboBox;
    RetFlag: TCheckBox;
    SSLFlag: TCheckBox;
    LabelLWT: TLabel;
    procedure MemoLogChange(Sender: TObject);
    procedure ConnectBtnClick(Sender: TObject);
    procedure DisconnectBtnClick(Sender: TObject);
    procedure BrokerBoxNameChange(Sender: TObject);
    procedure WeblabelClick(Sender: TObject);
    procedure WeblabelMouseEnter(Sender: TObject);
    procedure WeblabelMouseLeave(Sender: TObject);
    procedure SaveMemoItemClick(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure PublishBtnClick(Sender: TObject);
    procedure EditTopicSubsBoxChange(Sender: TObject);
    procedure ButtonSubsClick(Sender: TObject);
    procedure TopicsSubscribedListBoxClick(Sender: TObject);
    procedure TMSMQTTClient1ConnectedStatusChanged(ASender: TObject;
      const AConnected: Boolean; AStatus: TTMSMQTTConnectionStatus);
    procedure TMSMQTTClient1PublishReceived(ASender: TObject; APacketID: Word;
      ATopic: string; APayload: TArray<System.Byte>);

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

var
  BrokerConnected: boolean =false;




(*********************************************************************************)
(*                                                                               *)
(*          Functions to connect the application to a MQTT broker                *)
(*                                                                               *)
(*********************************************************************************)

//event executed when a broker URL is selected from the list box
procedure TFormMQTT.BrokerBoxNameChange(Sender: TObject);
begin
    EditPassword.Clear;
    EditName.Clear;
end;


//Event executed when the Connect button is pressed
procedure TFormMQTT.ConnectBtnClick(Sender: TObject);
begin
    TMSMQTTClient1.BrokerHostName:=BrokerBoxName.Text;
    TMSMQTTClient1.Credentials.Username:=EditName.text;
    TMSMQTTClient1.Credentials.Password:=EditPassword.Text;
    TMSMQTTClient1.UseSSL:=SSLFlag.Checked;
    TMSMQTTClient1.BrokerPort:=StrToInt(PortComboBox.Text);
    TMSMQTTClient1.LastWillSettings.Topic:=EditTopic.Text;
    TMSMQTTClient1.LastWillSettings.WillMessage:=EditPayload.Text;
    TMSMQTTClient1.LastWillSettings.Retain:=RetFlag.Checked;
    case QoScombobox.Text[1] of
      '0': TMSMQTTClient1.LastWillSettings.QoS:=qosAtMostOnce;
      '1': TMSMQTTClient1.LastWillSettings.QoS:=qosAtLeastOnce;
      '2': TMSMQTTClient1.LastWillSettings.QoS:=qosExactlyOnce;
    end;
    TMSMQTTClient1.Connect();
end;

//Event executed when the disconnect button is pressed
procedure TFormMQTT.DisconnectBtnClick(Sender: TObject);
begin
     TMSMQTTClient1.Disconnect();
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
begin
    if (AConnected) then
      begin
        BrokerConnected:=true;
        ConnectBtn.Enabled:=False;
        BrokerBoxName.Enabled:=False;
        DisconnectBtn.Enabled:=True;
        EditName.Enabled:=false;
        EditPassword.Enabled:=false;
        PortComboBox.Enabled:=false;
        SSLFlag.Enabled:=false;
        PublishBtn.Enabled:=true;
        labelLWT.Visible:=False;
        EditTopic.Clear;
        EditPayload.Clear;
        (*SubTopicsMemo.Enabled:=false;
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
              end;  *)
        LedShape.Brush.Color:=clRed;
        MemoLog.Lines.Add('Client connected to server '+TMSMQTTClient1.BrokerHostName+' at '+FormatDateTime('hh:nn:ss', Now));
      end
      else
      begin
        BrokerConnected:=false;
        ConnectBtn.Enabled:=True;
        BrokerBoxName.Enabled:=True;
        DisconnectBtn.Enabled:=False;
        EditName.Enabled:=true;
        EditPassword.Enabled:=true;
        PortComboBox.Enabled:=true;
        SSLFlag.Enabled:=true;
        PublishBtn.Enabled:=false;
        labelLWT.Visible:=True;
        //SubTopicsMemo.Enabled:=true;
        LedShape.Brush.Color:=clMaroon;
        EditTopic.Clear;
        EditPayload.Clear;
        TopicsSubscribedListBox.Clear;
        EditTopicSubsBox.Clear;
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
   //TMSMQTTClient1.Publish(EditTopic.Text,EditPayload.Text,RetFlag.Checked,StrToInt(QoScombobox.Text));
    case QoScombobox.Text[1] of
      '0': TMSMQTTClient1.Publish(EditTopic.Text,EditPayload.Text,qosAtMostOnce,RetFlag.Checked);
      '1': TMSMQTTClient1.Publish(EditTopic.Text,EditPayload.Text,qosAtLeastOnce,RetFlag.Checked);
      '2': TMSMQTTClient1.Publish(EditTopic.Text,EditPayload.Text,qosExactlyOnce,RetFlag.Checked);
    end;
    MemoLog.Lines.Add('Message published in the topic ['+EditTopic.Text+']: '+EditPayload.Text);
    EditPayload.Clear;
end;



(*********************************************************************************)
(*                                                                               *)
(*          Functions to subscribe and unsubscribe a topic                       *)
(*                                                                               *)
(*********************************************************************************)

//event executed when a topic to be subscribed is written or deleted from the
//topic edit box
procedure TFormMQTT.EditTopicSubsBoxChange(Sender: TObject);
begin
    if (EditTopicSubsBox.Text<>'') then
          ButtonSubs.Enabled:=True;
end;

//event executed when Subscribe Button is pressed
procedure TFormMQTT.ButtonSubsClick(Sender: TObject);
begin
    if (BrokerConnected) and (EditTopicSubsBox.Text<>'') and (ButtonSubs.Caption='Subscribe') then
      try
         TMSMQTTClient1.Subscribe(EditTopicSubsBox.Text);
         MemoLog.Lines.Add('Topic subscribed: '+EditTopicSubsBox.Text);
         TopicsSubscribedListBox.Items.Add(EditTopicSubsBox.Text);
         EditTopicSubsBox.Clear;
         ButtonSubs.Enabled:=false;
      except
        MemoLog.Lines.Add('Failed to subscribe topic: '+EditTopicSubsBox.Text)
      end;
    if  (BrokerConnected) and (EditTopicSubsBox.Text<>'') and (ButtonSubs.Caption='Unsubscribe') then
      try
        TMSMQTTClient1.Unsubscribe(EditTopicSubsBox.Text);
        MemoLog.Lines.Add('Topic unsubscribed: '+EditTopicSubsBox.Text);
        TopicsSubscribedListBox.DeleteSelected;
        EditTopicSubsBox.Clear;
        ButtonSubs.Caption:='Subscribe';
        ButtonSubs.Enabled:=false;
        TopicsSubscribedListBox.ClearSelection;
      except
        MemoLog.Lines.Add('Failed to unsubscribe topic '+EditTopicSubsBox.Text);
        EditTopicSubsBox.Clear;
        ButtonSubs.Caption:='Subscribe';
        ButtonSubs.Enabled:=false;
        TopicsSubscribedListBox.ClearSelection;
      end;
end;

//event executed when an item from the topics list box is selected to be unsubscribed
procedure TFormMQTT.TopicsSubscribedListBoxClick(Sender: TObject);
begin
    if TopicsSubscribedListBox.ItemIndex>=0 then
      begin
         with TopicsSubscribedListBox do
            EditTopicSubsBox.Text:=Items[ItemIndex];
         ButtonSubs.Caption:='Unsubscribe';
         ButtonSubs.Enabled:=True
      end;
end;

(*********************************************************************************)
(*                                                                               *)
(*          Miscelaneous functions                                               *)
(*                                                                               *)
(*********************************************************************************)

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


(**************************************************************************************)
{             Procedures to handle the web site                                       }
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
