defmodule RevertirLista do

  def main do
    lista = [1,2,3,4]
    revertir_lista(lista)
    |>IO.inspect()
  end

  def revertir_lista([]), do: []

  def revertir_lista([x]), do: [x]

  def revertir_lista([cabeza | cola]) do
    revertir_lista(cola) ++ [cabeza]
  end

end

RevertirLista.main()
