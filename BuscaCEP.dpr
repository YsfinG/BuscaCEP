program BuscaCEP;

uses
  Vcl.Forms,
  View.Cliente in 'view\View.Cliente.pas' {ClienteView},
  Util.Telefone in 'util\Util.Telefone.pas',
  Util.ViaCEP in 'util\Util.ViaCEP.pas',
  Util.XML in 'util\Util.XML.pas',
  View.Email in 'view\View.Email.pas' {EmailView},
  Util.Email in 'util\Util.Email.pas';

{$R *.res}

begin
   Application.Initialize;
   Application.MainFormOnTaskbar := True;
   Application.CreateForm(TClienteView, ClienteView);
  Application.Run;
end.

