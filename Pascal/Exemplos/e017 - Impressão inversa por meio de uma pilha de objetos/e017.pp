{
Por Luciano de Souza
Em 23/07/2012

Imprime nome e idade na ordem invertida do informado utilizando pilha.
}

program e017;
{$mode objfpc}

uses
sysutils, contnrs;

type
TPerson = class(TObject)
private
FName: string;
FAge: byte;

public

property name: string read FName write FName;
property age: byte read FAge write FAge;
end;

var
person: TPerson;
stack: TObjectStack;
response: string;
i: byte;

BEGIN
stack := TObjectStack.create;
try
for i := 1 to 3 do
begin
person := TPerson.create;
writeln('Nome:');
readln(response);
person.name := response;
writeln('Idade:');
readln(response);
person.age := StrToInt(response);
stack.push(person);
end;
for i := 1 to stack.count do
begin
person := TPerson(stack.pop);
writeln(person.name, ' - ', person.age);
person.free;
end;
finally
stack.free;
end;
END.