program SubMQTTbrokertest1;

uses
  Vcl.Forms,
  UnitMQTT in 'UnitMQTT.pas' {FormMQTT};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMQTT, FormMQTT);
  Application.Run;
end.
