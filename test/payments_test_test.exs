defmodule PaymentsTestTest do
  
  use ExUnit.Case
 

  test "busca usuario" do

	  array_carteira = [
	  %Carteira{
	    moeda: BLR,
	    saldo: 100,
	    usuario: %Usuario{nome: "Max1"}
	  },
	  %Carteira{
	    moeda: BLR,
	    saldo: 100,
	    usuario: %Usuario{nome: "Max2"}
	  }
	]

  	usuario = Carteira.buscaUsuario(array_carteira, "Max1")

  	assert usuario == true

  end


test "split com valor invalido" do

	  array_carteira = [
	  %Carteira{
	    moeda: BLR,
	    saldo: 100,
	    usuario: %Usuario{nome: "Max1"}
	  },
	  %Carteira{
	    moeda: BLR,
	    saldo: 100,
	    usuario: %Usuario{nome: "Max2"}
	  }
	]

  	split = Carteira.split(array_carteira, "Max1", "Max2", -50)

  	assert split == {:error, "Valor de rateio é invalido"}

  end

test "Conveter com codigo invalido de moeda" do
	
	  array_carteira = [
	  %Carteira{
	    moeda: BLR,
	    saldo: 100,
	    usuario: %Usuario{nome: "Max1"}
	  },
	  %Carteira{
	    moeda: BLR,
	    saldo: 100,
	    usuario: %Usuario{nome: "Max2"}
	  }
	]

  	valorconvertido = Carteira.convertMoeda(array_carteira, "Max1", "aud")

  	assert valorconvertido == {:error, "A moeda selecionada não esta cadastrada"}

end



end
