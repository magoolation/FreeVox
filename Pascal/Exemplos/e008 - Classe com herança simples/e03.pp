{
Por Luciano de Souza
Em 20/07/2012

Implementa uma classe com herança
}

program e008;
{$mode objfpc}{$H+}

uses
sysutils;

type
TUser = class(TObject)
private
FName: string;
FPassword: string;

public
constructor create;
function login:boolean;
procedure logout;

property name: string read FName write FName;
property password: string read FPassword write FPassword;
end;

TClient = class(TUser)
procedure buy(id: integer);
end;

{TUser}
constructor TUser.create;
begin
writeln('Bem vindo ao exemplo e03');
end;

function TUser.login:boolean;
begin
if FPassword = 'freevox' then
result := true
else
result := false;
end;

procedure TUser.logout;
begin
writeln('Seção encerrada');
end;

{TClient}
procedure TClient.buy(id: integer);
begin
writeln('Item ', id, ' comprado.');
end;

var
client: TClient;

BEGIN
client := Tclient.create;
client.name := 'José';
client.password := 'freevox';
if client.login then
begin
client.buy(53);
client.logout;
end
else
writeln('Falha de autenticação');
client.free;
END.