{
Por Luciano de Souza
Em 23/07/2012

Classe simples para a exibição de números de códigos de versionamento. 
Apresenta o uso de enumeradores e exercita propriedades de classes.
}

program e020;
{$mode objfpc}{$h+}

uses
Sysutils;

type
TVersionType = (vtMajor, vtMinor, vtRelease);
TVersion = class
private
FMajor: byte;
FMinor: byte;
FRelease: byte;
FStyle: ShortString;

function GetValue:string;

public
constructor create(AMajor: byte = 0; AMinor: byte = 0; ARelease: byte = 0);
 procedure increment(ALevel: TVersionType);

 property major: byte read FMajor write FMajor;
 property minor: byte read FMinor write FMinor;
 property release: byte read FRelease write FRelease;
 property style: ShortString read FStyle write FStyle;
property value: string read GetValue;
end;

constructor TVersion.create(AMajor: byte = 0; AMinor: byte = 0; ARelease: byte = 0);
begin
FMajor := AMajor;
FMinor := AMinor;
FRelease := ARelease;
FStyle := '%d.%d.%d';
end;

function TVersion.GetValue:string;
begin
result := format(FStyle, [FMajor, FMinor, Frelease]);
end;

procedure TVersion.increment(ALevel: TVersionType);
begin
if ALevel = vtMajor then
begin
inc(FMajor);
FMinor := 0;
FRelease := 0;
end
else if ALevel = vtMinor then
begin
inc(FMinor);
FRelease := 0;
end
else if ALevel = vtRelease then
inc(FRelease);
end;

var
version: TVersion;

BEGIN
version := TVersion.create(5, 4, 1);
version.increment(vtRelease);
writeln(version.value);
version.minor := 5;
writeln(version.value);
version.style := '%d.%2.2d.%2.2d';
writeln(version.value);
version.free;
END.