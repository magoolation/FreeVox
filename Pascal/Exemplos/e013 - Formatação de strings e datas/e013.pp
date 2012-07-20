{
Por Luciano de Souza
Em 22/07/2012

Formata uma string e uma data
}

program e013;
{$mode objfpc}{$H+}

uses
sysutils;

var
d: TDatetime;

BEGIN
writeln(format('%s tem %d anos', ['Maria', 25]));
writeln(format('O código do produto é %6.6d', [731]));
d := EncodeDate(2012, 7, 22);
writeln(FormatDatetime('dd/mm/yyyy', d));
writeln('Hoje é ', FormatDatetime('dddd', now), ' e o mês é ', FormatDatetime('mmmm', now));
END.