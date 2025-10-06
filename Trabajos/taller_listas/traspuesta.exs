defmodule Traspuesta do

  def main do
    matriz =
      [[3,0,4],
       [1,1,2],
       [6,6,6]]
    traspuesta = transponer_matriz(matriz)
    IO.inspect(traspuesta)
  end

  def transponer_matriz([]), do: []

  def transponer_matriz([[] | _]), do: []

  def transponer_matriz(matriz) do
    primera_columna = for [x | _] <- matriz, do: x
    resto_matriz = for [_ | y] <- matriz, do: y
    [primera_columna | transponer_matriz(resto_matriz)]
  end

end

Traspuesta.main()
