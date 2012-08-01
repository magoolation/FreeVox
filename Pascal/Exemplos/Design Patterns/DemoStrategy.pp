{$mode objfpc}
{$h+}

program DemoStrategy;

	uses SysUtils, Classes, Frete;
	
var
	Pedido1: TPedido;
	Pedido2: TPedido;
	Pedido3: TPedido;
begin
	Pedido1 := TPedido.Create('Gratis', 10);
	Pedido2 := TPedido.Create('Sedex', 10);
	Pedido3 := TPedido.Create('Motoboy', 10);
	
	WriteLn('Exemplo do padrão Strategy');
	WriteLn('Para um pedido de 10kg o frete do pedido será de: ');
	Write('Pedido1: ');
	WriteLn(Pedido1.ValorFrete);
	Write('Pedido2: ');
	WriteLn(Pedido2.ValorFrete);
	Write('Pedido3 ');
	WriteLn(Pedido3.ValorFrete);
	WriteLn;
	WriteLn('Preesione enter para sair');
	ReadLn;
end.
	