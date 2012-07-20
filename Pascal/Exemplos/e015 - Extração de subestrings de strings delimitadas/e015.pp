{
Por Luciano de Souza
Em 22/07/2012

Desliga o computador após tempo escolhido pelo usuário.
}

program e015;
{$mode objfpc}

uses
sysutils, strutils;

var
cities: string;
position: integer;

BEGIN
cities := 'São Paulo|Rio de Janeiro|Salvador|Brasília|Belo Horizonte';

{Extrai a terceira substring de uma string delimitada por barra vertical}
writeln(ExtractDelimited(3, cities, ['|']));

{Localiza a primeira substring delimitada por barra vertical}
writeln(ExtractSubstr(cities, position, ['|']));

{Informa onde o cursor foi parar após a extração realizada no passo anterior}
writeln(position);
END.