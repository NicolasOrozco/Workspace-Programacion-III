defmodule MultiplicacionLista do

  def main do
    lista = [1,2,3,4,5]
    multiplicar_lista(lista)
    |>IO.puts()
  end

  def multiplicar_lista([x]), do: x
  def multiplicar_lista([cabeza | cola]) do
    cabeza * multiplicar_lista(cola)
  end

end

MultiplicacionLista.main()
