unit Util.Telefone;

interface

uses
   Vcl.Mask;

type
   TMaskEdit = class(Vcl.Mask.TMaskEdit)
   private
      vTelefone: Boolean;
   private
      procedure GetTelefone(const Value: Boolean);
      function SetTelefone: Boolean;
   protected
      procedure DoEnter; override;
      procedure DoExit; override;
   published
      property Telefone: Boolean read SetTelefone write GetTelefone default False;
   end;

implementation

{ TMaskEdit }

procedure TMaskEdit.DoEnter;
begin
   inherited;

   if Telefone then
   begin
      if Length(Self.Text) > 10 then
         Self.EditMask := '(99) 99999-9999;0;_'
      else
         Self.EditMask := '(99) 9999-99999;0;_';
   end;
end;

procedure TMaskEdit.DoExit;
begin
   inherited;

   if Telefone then
   begin
      if Length(Self.Text) > 10 then
         Self.EditMask := '(99) 99999-9999;0;_'
      else
      if Length(Self.Text) = 10 then
         Self.EditMask := '(99) 9999-9999;0;_'
      else
         Self.EditMask := '(99) 9999-99999;0;_';
   end;
end;

procedure TMaskEdit.GetTelefone(const Value: Boolean);
begin
   vTelefone := Value;
end;

function TMaskEdit.SetTelefone: Boolean;
begin
   Result := vTelefone;
end;

end.
