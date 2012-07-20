{
Por Luciano de Souza
Em 22/07/2012

Implementa uma matriz e itera sobre os seus elementos
}

program e002;

uses
sysutils;

var
a: array[1..3] of integer;
i: integer;

BEGIN
a[1] := 12;
a[2] := 15;
a[3] := 25;
for i := 1 to 3 do
writeln(a[i]);
END.