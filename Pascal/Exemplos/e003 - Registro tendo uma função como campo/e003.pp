{
Por Luciano de Souza
Em 20/07/2012

Implementa um registro tendo uma função como um de seus campos
}

program e003;
{$mode objfpc}{$H+}

uses
sysutils;

type
TNumber = record
n1: integer;
n2: integer;
calculate: function (n1, n2: integer):integer;
end;

function sum(n1, n2: integer):integer;
begin
result := n1 + n2;
end;

function deduct(n1, n2: integer):integer;
begin
result := n1 - n2;
end;

var
number: TNumber;

BEGIN
with number do
begin
n1 := 25;
n2 := 13;
calculate := @sum;
writeln(calculate(n1, n2));
calculate := @deduct;
writeln(calculate(n1, n2));
end;
end.