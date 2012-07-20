{
Por Luciano de Souza
Em 21/07/2012

Opera sobre um arquivo de configuração do tipo ini.
}

program e011;
{$mode objfpc}{$H+}

uses
inifiles;

var
ini: TInifile;
path: string;

BEGIN
ini := TInifile.create('e01.ini');
try
with ini do
begin
WriteString('freevox', 'voice', 'dosvox');
WriteString('freevox', 'path', 'c:\arquivos de programas\freevox\freevox.dll');
WriteString('freevox', 'LastUpdate', '21/07/2012');
WriteInteger('version', 'value', 5);
WriteBool('version', 'stable', true);

path := ReadString('freevox', 'path', '');
writeln(path);
end;
finally
ini.free;
end;
END.