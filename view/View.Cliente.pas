unit View.Cliente;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
   Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Util.Telefone, Vcl.Buttons,
   Util.ViaCEP;

type
   TCliente = class
   private
      vNome,
      vIdentidade,
      vCPF,
      vTelefone,
      vEmail   : String;
      vEndereco: TEndereco;
   public
      constructor Create;
   published
      property Nome      : String    read vNome       write vNome;
      property Identidade: String    read vIdentidade write vIdentidade;
      property CPF       : String    read vCPF        write vCPF;
      property Telefone  : String    read vTelefone   write vTelefone;
      property Email     : String    read vEmail      write vEmail;
      property Endereco  : TEndereco read vEndereco   write vEndereco;
   end;

   TClienteView = class(TForm)
      edtNome: TLabeledEdit;
      edtIdentidade: TLabeledEdit;
      edtCPF: TMaskEdit;
      lblCPF: TLabel;
      edtTelefone: TMaskEdit;
      lblTelefone: TLabel;
      edtEmail: TLabeledEdit;
      grpEndereco: TGroupBox;
      edtCEP: TMaskEdit;
      lblCEP: TLabel;
      edtLogradouro: TLabeledEdit;
      edtNumero: TLabeledEdit;
      edtComplemento: TLabeledEdit;
      edtBairro: TLabeledEdit;
      edtCidade: TLabeledEdit;
      edtEstado: TLabeledEdit;
      edtPais: TLabeledEdit;
      pnlBar: TPanel;
      btnEnviarEmail: TBitBtn;
      procedure FormCreate(Sender: TObject);
      procedure edtCEPExit(Sender: TObject);
      procedure edtCEPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure btnEnviarEmailClick(Sender: TObject);
   private
      vCliente: TCliente;
      procedure CarregaEndereco(pCEP: String);
    { Private declarations }
   public
    { Public declarations }
   end;

var
   ClienteView: TClienteView;

implementation

uses
   Vcl.Dialogs, Util.XML, XMLDoc, XMLIntf, View.Email;

{$R *.dfm}

procedure TClienteView.edtCEPExit(Sender: TObject);
begin
   CarregaEndereco(edtCEP.Text);
end;

procedure TClienteView.edtCEPKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if Key = VK_RETURN then
      CarregaEndereco(edtCEP.Text);
end;

procedure TClienteView.btnEnviarEmailClick(Sender: TObject);
var
   xXMLDocument: IXMLDocument;
begin
   vCliente.Nome       := edtNome.Text;
   vCliente.Identidade := edtIdentidade.Text;
   vCliente.CPF        := edtCPF.Text;
   vCliente.Telefone   := edtTelefone.Text;
   vCliente.Email      := edtEmail.Text;

   if vCliente.Endereco <> Nil then
   begin
      vCliente.Endereco.Numero      := edtNumero.Text;
      vCliente.Endereco.Complemento := edtComplemento.Text;
      vCliente.Endereco.Pais        := edtPais.Text;
   end;

   xXMLDocument := TXMLUtil.ObjectToXML(vCliente);
   xXMLDocument.SaveToFile('XML.xml');

   try
      EmailView := TEmailView.Create(Application);
      EmailView.ShowModal;

      if FileExists('XML.xml') then
         DeleteFile('XML.xml');
   finally
      if EmailView <> Nil then
         FreeAndNil(EmailView);
   end;
end;

procedure TClienteView.CarregaEndereco(pCEP: String);
begin
   if Trim(pCEP) = '' then
      Exit;

   try
      vCliente.Endereco   := TViaCEPUtil.GetEndereco(pCEP);
      edtLogradouro.Text  := vCliente.Endereco.Logradouro;
      edtComplemento.Text := vCliente.Endereco.Complemento;
      edtBairro.Text      := vCliente.Endereco.Bairro;
      edtCidade.Text      := vCliente.Endereco.Cidade;
      edtEstado.Text      := vCliente.Endereco.Estado;
      edtPais.Text        := 'Brasil';
   except
      on E: Exception do
         MessageDlg(E.Message, mtWarning, [mbOk], 0);
   end;
end;

procedure TClienteView.FormCreate(Sender: TObject);
begin
   vCliente := TCliente.Create;

   edtTelefone.Telefone  := True;
end;

{ TCliente }

constructor TCliente.Create;
begin
   Self.vNome       := '';
   Self.vIdentidade := '';
   Self.vCPF        := '';
   Self.vTelefone   := '';
   Self.vEmail      := '';
   Self.vEndereco   := Nil;
end;

end.

