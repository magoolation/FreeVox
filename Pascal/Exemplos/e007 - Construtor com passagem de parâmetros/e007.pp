{
Por Luciano de Souza
Em 20/07/2012

Implementa uma classe passando argumentos para o construtor
}

program e007;
{$mode objfpc}{$H+}

uses
sysutils;

type
TUser = class(TObject)
private
FName: string;
FPassword: string;

public
constructor create(Aname, APassword: string);
function login:boolean;
procedure logout;

property name: string read FName write FName;
property password: string read FPassword write FPassword;
end;

constructor TUser.create(Aname, APassword: string);
begin
writeln('Bem vindo ao exemplo e02');
Fname := Aname;
FPassword := APassword;
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

var
user: TUser;

BEGIN
user := TUser.create('João', 'freevox');
user.login;
if user.login then
writeln('Usuário autenticado')
else
writeln('Usuário não autenticado');
user.logout;
user.free;
END.