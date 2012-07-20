
{
Por Luciano de Souza
Em 20/07/2012

Itera sobre um diretório utilizando uma função de callback
}
program e004;
{$mode objfpc}{$H+}

uses
sysutils;

type
TScanProc = procedure (search: TSearchRec);

var
search: TSearchRec;


procedure ShowDir(search: TSearchRec);
begin
writeln(search.name);
writeln(search.size);
end;

procedure ScanDir(ScanProc: TScanProc);
begin
if findfirst('*', faAnyFile, search) = 0 then
begin
repeat
ScanProc(search);
until findnext(search) <> 0;
end;
end;

BEGIN
ScanDir(@ShowDir);
END.