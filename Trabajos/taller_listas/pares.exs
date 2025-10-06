defmodule Pares do

  def main do
    lista = [2,5,8,4,1]
    pares = contarPares(lista)
    IO.puts("La lista tiene #{pares} números pares.\n")
  end

  def contarPares([]), do: 0

  def contarPares([cabeza | cola]) do
    if rem(cabeza, 2) == 0 do
      1 + contarPares(cola)
    else
      contarPares(cola)
    end
  end

end

Pares.main()
