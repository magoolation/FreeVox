{$mode objfpc}
{$h+}

program DemoSingleton;

uses SysUtils, Classes, Calculadora;

var
	Instancia1: TCalculadora;
	Instancia2: TCalculadora;
	Instancia3: TCalculadora;
begin
	WriteLn('Exemplo de Singleton.');
	{
		Serão criadas 3 instancias da classe Calculadora
		mas na verdade as 3 variáveis apontam para uma instancia unica
		demonstrando o funcionamento do Singleton;
	}
	
	Instancia1 := TCalculadora.Create;
	Instancia2 := TCalculadora.Create;
	Instancia3 := TCalculadora.Create;
	
	{
		Fazemos algumas operações com a Instancia1
	}
	
	Instancia1.Somar(5);
	Instancia1.Somar(10);
	Instancia1.Somar(15);
	
	{
		Vamos imprimir o valor das 3 instancias
		Voce notará que  nos 3 casos o resultadoé o mesmo
	}
	
	WriteLn('Valor da Instancia 1: ' + IntToStr(Instancia1.Valor));
	WriteLn('Valor da Instancia 2: ' + IntToStr(Instancia2.Valor));
	WriteLn('Valor da Instancia 3: ' + IntToStr(Instancia3.Valor));
	
	WriteLn('Pressione ENTER para sair');
	ReadLn();
	
end.