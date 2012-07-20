{
Por Luciano de Souza
Em 23/07/2012

Imprime contador a cada 1 segundo até que o usuário pressione qualquer tecla.
}

program e018;
{$mode objfpc}

uses
crt, sysutils, classes, fptimer;

type
TAction = class(TObject)
private
FCounter: integer;

public
constructor create;
procedure print(sender: TObject);
end;

constructor TAction.create;
begin
FCounter := 0;
end;

procedure TAction.print(sender: TObject);
begin
writeln(FCounter);
inc(FCounter);
end;

var
action: TAction;
timer: TFPTimer;

BEGIN
action := TAction.create;
timer := TFPTimer.create(nil);
try
with timer do
begin
interval := 200;
OnTimer := @action.print;
enabled := true;
while not keypressed do
begin
CheckSynchronize;
sleep(800);
end;
end;
finally
timer.free;
action.free;
end;
END.