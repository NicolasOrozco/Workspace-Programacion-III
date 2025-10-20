defmodule ContarElementos do

  def main do
    lista = [4,6,2,4,"x","d","e"]
    contar_elementos(lista)
    |>IO.puts()
  end
  
  def contar_elementos([]), do: 0

  def contar_elementos([cabeza | cola]) do
    1 + contar_elementos(cola)
  end

end

ContarElementos.main()
