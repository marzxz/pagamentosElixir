defmodule Usuario do 
 	defstruct nome: nil
  	
  	def cadastrar(nome) do
    	%Usuario{nome: nome}  
  	end

end 	