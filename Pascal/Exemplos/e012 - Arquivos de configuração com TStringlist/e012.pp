{
Por Luciano de Souza
Em 22/07/2012

Opera sobre um arquivo de configuração utilizando TStringlist
}

program e012;
{$mode objfpc}{$H+}

uses
sysutils, classes;

var
cfg: TStringlist;

BEGIN
cfg := TStringlist.create;
try
cfg.LoadFromFile('e02.cfg');
cfg.values['version'] := '1.1';
writeln(cfg.values['application']);
finally
cfg.free;
end;
END.