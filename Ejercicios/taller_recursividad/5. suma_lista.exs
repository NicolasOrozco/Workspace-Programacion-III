defmodule SumaLista do

  def main do
    lista = [1,2,3,4,5]
    sumar_lista(lista)
    |>IO.puts()
  end

  def sumar_lista([x]), do: x

  def sumar_lista([cabeza | cola]) do
    cabeza + sumar_lista(cola)
  end

end

SumaLista.main()
