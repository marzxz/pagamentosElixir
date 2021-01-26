defmodule Carteira do
	defstruct usuario: Usuario, moeda: nil, saldo: 100

	def cadastrar(usuario, moeda) do
		%Carteira{usuario: usuario, moeda: moeda}
	end

	def buscaUsuario(carteiras, nome) do
		
		if Enum.find(carteiras, fn carteira -> carteira.usuario.nome == nome end) do

			true

		else

			false	

		end

	end


	def deposito(carteiras, nome, valor) do

		if buscaUsuario(carteiras, nome) do
				
			usuario = Enum.find(carteiras, fn carteira -> carteira.usuario.nome == nome end)

			usuario = %Carteira{usuario | saldo: usuario.saldo + valor}

			{:ok, "Deposito realizado com sucesso", usuario}

		  else

		  	{:error, "Usuario nao encontrado"}

		end

	end



	def saque(carteiras, nome, valor) do

		if buscaUsuario(carteiras, nome) do
				
			usuario = Enum.find(carteiras, fn carteira -> carteira.usuario.nome == nome end)

			usuario = %Carteira{usuario | saldo: usuario.saldo - valor}

			{:ok, "Saque realizado com sucesso", usuario}


		  else

		  	
		  	{:error, "Usuario nao encontrado"}

		end
		
	end

	
	def split(carteiras, origem, destino, valor_rateio) do 

		if valor_rateio < 0 do 

			{:error, "Valor de rateio é invalido"}


		else 

			divisao_rateio = valor_rateio/2

			origem = Enum.find(carteiras, fn carteira -> carteira.usuario.nome == origem end)

			destino = Enum.find(carteiras, fn carteira -> carteira.usuario.nome == destino end)

			origem = %Carteira{origem | saldo: origem.saldo + divisao_rateio}

			destino = %Carteira{destino | saldo: destino.saldo + divisao_rateio}

			{:ok, "Split realizado com sucesso"}

	     end

	end
	     

	def convertMoeda(carteiras, nome, moeda) do

		cotacoes = %{"gbp" => 7.47, "eur" => 6.71, "usd" => 5.47}

		if cotacoes[moeda] == nil do 


			{:error, "A moeda selecionada não esta cadastrada"}

		
		 else

		    if buscaUsuario(carteiras, nome) do
				
			usuario = Enum.find(carteiras, fn carteira -> carteira.usuario.nome == nome end)

			usuario = %Carteira{usuario | saldo: usuario.saldo * cotacoes[moeda]}

			usuario = %Carteira{usuario | moeda: moeda}
 			
 			{:ok, "Conversão de moeda realizada com sucesso", usuario}
			
			else

			{:error, "Usuario nao encontrado"}

			end
		  

		end
	
		
	end

end