unit Util.ViaCEP;

interface

uses
  System.Classes, Rest.Json.Types;

type
   {
      "JSONNameAttribute" funciona como um identificador para a classe TJson.
      Através dessa declaração a classe identifica qual valor do Json deve
      preencher a propriedade.
   }
   TEndereco = class
   private
      [JSONNameAttribute('cep')]
      vCEP: String;
      [JSONNameAttribute('logradouro')]
      vLogradouro: String;
      vNumero: String;
      [JSONNameAttribute('complemento')]
      vComplemento: String;
      [JSONNameAttribute('bairro')]
      vBairro: String;
      [JSONNameAttribute('localidade')]
      vCidade: String;
      [JSONNameAttribute('uf')]
      vEstado: String;
      vPais: String;
   public
      constructor Create;
   published
      property CEP        : String read vCEP         write vCEP;
      property Logradouro : String read vLogradouro  write vLogradouro;
      property Numero     : String read vNumero      write vNumero;
      property Complemento: String read vComplemento write vComplemento;
      property Bairro     : String read vBairro      write vBairro;
      property Cidade     : String read vCidade      write vCidade;
      property Estado     : String read vEstado      write vEstado;
      property Pais       : String read vPais        write vPais;
   end;

   TViaCEPUtil = class
   public
      class function GetEndereco(pCEP: String): TEndereco;
   end;

implementation

uses
   System.SysUtils, System.JSON, Data.DBXJSON, DBXJSONReflect, idHTTP,
   IdSSLOpenSSL, Rest.Json;

{ TViaCEPUtil }

class function TViaCEPUtil.GetEndereco(pCEP: String): TEndereco;
var
   xHTTP        : TIdHTTP;
   xIDSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
   xResponse    : TStringStream;
begin
   Result        := Nil;
   xHTTP         := TIdHTTP.Create;
   xIDSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create;

   try
      xHTTP.IOHandler := xIDSSLHandler;
      xResponse := TStringStream.Create;
      xHTTP.Get('https://viacep.com.br/ws/' + pCEP + '/json', xResponse);

      if (xHTTP.ResponseCode = 200) and
         (not (Utf8ToAnsi(xResponse.DataString) = '{'#$A'  "erro": true'#$A'}')) then
         Result :=
            TJson.JsonToObject<TEndereco>(
               UTF8ToString(PAnsiChar(AnsiString(xResponse.DataString))));
   finally
      FreeAndNil(xHTTP);
      FreeAndNil(xIDSSLHandler);
      xResponse.Destroy;
   end;

   if Result = Nil then
      raise Exception.Create('O CEP informado não foi encontrado.');
end;

{ TEndereco }

constructor TEndereco.Create;
begin
   Self.vCEP         := '';
   Self.vLogradouro  := '';
   Self.vNumero      := '';
   Self.vComplemento := '';
   Self.vBairro      := '';
   Self.vCidade      := '';
   Self.vEstado      := '';
   Self.vPais        := '';
end;

end.
