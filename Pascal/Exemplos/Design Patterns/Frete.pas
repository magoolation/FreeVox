{$mode objfpc}
{$h+}

unit Frete;

interface
	uses SysUtils, Classes;
	
	Type
	
		TPedido = class; // para uso posterior
		
		{
			Nossa classe base que  será derivada para implementar
			os diferentes comportamentos
		}		
		TFrete = class
		protected
			FPedido: TPedido;
		public
			constructor Create(APedido: TPedido);
			function CalcularFrete: double; virtual; abstract;
		end;
		
		{
			Definimos uma classe que fornecerá o comportamento para
			Frete Grátis
		}
		TFreteGratis = class(TFrete)
		public
			function CalcularFrete: double; override;
		end;
		
		{
			Simula o comportamento de calculo do SEDEX
		}
		TFreteSedex = class(TFrete)
		public
			function CalcularFrete: double; override;
		end;
		
		{
			Simula o envio por Motoboy
		}
		TFreteMotoboy = class(TFrete)
		public
			function CalcularFrete: double; override;
		end;
		
		{
			Nossa classe de Pedidos
		}
		TPedido = class
		private
			FPeso: double;
			FFrete: TFrete;
		public			
			constructor Create(AFrete: string; APeso: double);
			function ValorFrete: double;
			property Frete: TFrete read FFrete;
			property Peso: double read FPeso;
		end;
		
implementation

constructor TFrete.Create(APedido: TPedido);
begin
	FPedido := APedido;
end;

constructor TPedido.Create(AFrete: string; APeso: double);
begin
	inherited Create;
	FPeso := APeso;
	case AFrete of
		'Gratis': FFrete := TFreteGratis.Create(Self); 
		'Sedex': FFrete := TFreteSedex.Create(Self); 
		'Motoboy': FFrete := TFreteMotoboy.Create(Self); 
	end;
end;

function TPedido.ValorFrete: double;
begin
	Result := FFrete.CalcularFrete;
end;

function TFreteGratis.CalcularFrete: double;
begin
	Result := 0;
end;

function TFreteSedex.CalcularFrete: double;
var
	ValorFrete : double = 15;
begin
	Result := FPedido.Peso * ValorFrete;
end;

function TFreteMotoboy.CalcularFrete: double;
var
	ValorFrete: double = 8;
begin
	Result := FPedido.Peso  * ValorFrete;
end;

end.