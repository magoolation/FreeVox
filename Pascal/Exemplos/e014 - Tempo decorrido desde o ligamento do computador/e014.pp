{
Por Luciano de Souza
Em 22/07/2012

Obtém o tempo decorrido desde o ligamento do computador.
}

program e014;
{$mode objfpc}{$H+}

uses
sysutils, windows;

function GetTikCount:word; external 'user32.dll';

function GetTime:string;
var
time: longint;
hour, minute: byte;
begin
time := GetTickCount;
hour := time div (60*60*1000);
minute := hour mod 60;
result := format('%d:%2.2d', [hour, minute]);
end;

BEGIN
writeln(GetTime);
END.