{
Por Josiel Santos
Em 22/07/2012

Implementa uma pilha de inteiros utilizando orientação a objetos.
}

program e009;

uses 
windows, sysutils, dvcrt, dvwin, dvform, dvlenum, dvhora;

const MAXSTACKSIZE=50;

type stack=class
    public
        constructor create;
        procedure push(n: integer);
        function pop: integer;
        function top: integer;
        function empty: boolean;
        function full: boolean;
    private
        max, fTop: integer;
        men: array[1..MAXSTACKSIZE] of integer;
end;

constructor stack.create;
begin
    max:=MAXSTACKSIZE;
    fTop:=0;
end;

procedure stack.push(n: integer);
begin
    if not full then
    begin
        inc(fTop);
        men[fTop]:=n;
    end
    else
    begin
        sintWriteLn('stack cheia; impossível inserir');
        exit;
    end;
end;

function stack.pop: integer;
begin
    if not empty then
    begin
        result:=men[fTop];
        dec(fTop);
    end
    else
    begin
        sintWriteLn('stack vazia; impossível remover');
        exit;
    end;
end;

function stack.top: integer;
begin
    if not empty then
        result:=men[fTop]
    else
        exit;
end;

function stack.empty: boolean;
begin
    result:=fTop=0;
end;

function stack.full: boolean;
begin
    result:=fTop=max;
end;

var
    p: stack;
    num: integer;

begin
    sintInic(0, '');
    p:=stack.create;
    sintWrite('Número positivo:');
    sintReadInt(num);
    while num > 0 do
    begin
        p.push(num mod 2);
        num:=num div 2;
    end;
    sintWriteLn('Binário:');
    while not p.empty do
    begin
        sintWrite(inttostr(p.pop));
    end;
end.
