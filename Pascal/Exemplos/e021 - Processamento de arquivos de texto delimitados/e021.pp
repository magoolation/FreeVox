{
Por Luciano de Souza
Em 24/07/2012

Lê um arquivo de texto, com dois campos, "nome" e "idade", delimitados por barra vertical, exibindo os registros na tela.
}

program e021;
{$mode objfpc}{$h+}

uses
db, sdfdata, Sysutils;

var
sdf: TSDFDataset;
name: string;
age: byte;

BEGIN
sdf := TSDFDataset.create(nil);
try
sdf.delimiter := '|';
sdf.filename := 'e021.txt';
sdf.FirstLineAsSchema := false;
sdf.schema.add('name');
sdf.schema.add('age');
sdf.open;
while not sdf.eof do
begin
name := sdf.FieldByName('name').AsString;
age := sdf.FieldByName('age').AsInteger;
writeln(name, ' - ', age);
sdf.next;
end;
finally
sdf.free;
end;
END.