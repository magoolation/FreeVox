{
Por Luciano de Souza
Em 22/07/2012

Codifica uma string  utilizando uma chave
}

program e016;
{$mode objfpc}

uses
{$ifdef windows}
windows,
{$endif}
sysutils, strutils;

var
key: string;
password: string;
encrypted: string;

BEGIN
{$ifdef windows}
SetConsoleCP(1252);
SetConsoleOutputCP(1252);
{$endif}
writeln('Digite uma senha');
readln(password);
key := 'Ouviram do Ipiranga as margens plácidas';
encrypted := xorEncode(key, password);
writeln(encrypted);
readln;
writeln('A senha descodificada é', xorDecode(key, encrypted));
END.