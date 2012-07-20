{
Por Luciano de Souza
Em 20/07/2012

Armazena ponteiros para procedimentos em uma matriz e sorteia uma ação
}

program e005;
{$mode objfpc}{$H+}

uses
sysutils;

type
TRoutine = function (id: integer): string;

 function product(id: integer):string;
begin
result := 'O ID do produto é ' + IntToStr(id);
end;

function user(id: integer):string;
begin
result := 'O ID do usuário é ' + IntToStr(id);
end;

function purchase(id: integer):string;
begin
result := 'O ID da compra é ' + IntToStr(id);
end;

var
choices: array[0..2] of TRoutine;
n: integer;

BEGIN
choices[0] := @product;
choices[1] := @user;
choices[2] := @purchase;
randomize;
n := random(3);
writeln(choices[n](25));
END.