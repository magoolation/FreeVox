{$mode objfpc}
{$h+}

unit Calculadora;

interface
	uses SysUtils, Classes;
	
	Type
		{
			Definimos a nossa classe Singleton
		}
		TCalculadora = class
		private
			FValor: integer;
			{
				Um Singleton tem seu construtor definido como privado de forma a 
				não poder ser construído fora do escopo da classe.
				Infelizmente este comportamento não é respeitado pelo FPC
				por isso damos outro nome ao nosso Construtor
			}
			constructor Init;
		public
			property Valor: integer read FVAlor;
			procedure Somar(AValor: integer);
			{
				Para "enganar" os programadores definimos uma função de classe que
				irá nos retornar sempre a mesma instancia.
			}
			class function Create: TCalculadora;
		end;
		
	implementation
	
	{
		Aqui definimos uma variável que é visível apenas dentro deste bloco implementation
		com isso não sujamos o programa com variáveis globais e
		só colocamos o objeto na memória após o primeiro uso
	}
	var
		Singleton: TCalculadora = nil;
		
	{
		Um construtor normal. Chamaos o construtor padrão de TObject
		e inicializamos o atributo de valor
	}
	constructor TCalculadora.Init;
	begin
		inherited Create;
		FValor := 0;
	end;
	
	{
		Aqui acontece a magica: se a instancia ainda não foi inicializada
		a inicializamos e sempre retornamos esse mesmo objeto
	}
	class function TCalculadora.Create: TCalculadora;
	begin
		if Singleton = nil Then
			Singleton := TCalculadora.Init;
		Result := Singleton;
	end;
	
	{
		Método simples de soma para demonstrar que a classe está funcionando
	}
	procedure  TCalculadora.Somar(AValor: integer);
	begin
		Inc(FValor, AValor);
	end;
	
	end.