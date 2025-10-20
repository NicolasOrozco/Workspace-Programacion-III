defmodule MayorLista do

  def main do
    lista = [2,5,6,9,1]
    hallar_mayor(lista)
    |>IO.puts()
  end

  def hallar_mayor([x]), do: x

  def hallar_mayor([cabeza | cola]) do
    if cabeza > hallar_mayor(cola) do
      cabeza
    else
      hallar_mayor(cola)
    end
  end

end

MayorLista.main()
