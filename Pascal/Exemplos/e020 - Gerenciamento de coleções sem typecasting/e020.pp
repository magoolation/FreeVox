{
Por Luciano de Souza
Em 23/07/2012

Gerenciamento de coleções em lista sem typecasting utilizando TCollection e TCollectionItem.
}

program e021;
{$mode objfpc}{$h+}
uses
Sysutils, Classes;

type    
TAuthorItem = class(TCollectionItem)
private
FName: String;

public
property name: string read FName write Fname;
end;

TAuthors = class(TCollection)
private
    function GetItem(AIndex: Integer): TAuthorItem;
    procedure SetItem(AIndex: Integer; const AValue: TAuthorItem);
	
	public
  constructor Create;
    function Add: TAuthorItem;
	
	property Items[AIndex: Integer]: TAuthorItem read GetItem write SetItem; default;
end;

constructor TAuthors.create;
begin
inherited create(TAuthorItem);
end;

function TAuthors.GetItem(AIndex: Integer): TAuthorItem;
begin
result := inherited GetItem(AIndex) as TAuthorItem;
end;

    procedure TAuthors.SetItem(AIndex: Integer; const AValue: TAuthorItem);
	begin
	inherited SetItem(AIndex, AValue);
	end;
	
	function TAuthors.Add: TAuthorItem;
	begin
	result := inherited add as TAuthorItem;
	end;
	
	var
	authors: TAuthors;
	author: TAuthorItem;
	i: byte;
	
BEGIN
authors := TAuthors.create;
try
author := authors.add;
author.name := 'Machado de Assis';
author := authors.add;
author.name := 'José Saramago';
author := authors.add;
author.name := 'Cecília Meirelles';
for i := 0 to pred(authors.count) do
writeln(authors[i].name);
finally
authors.free;
end;
END.