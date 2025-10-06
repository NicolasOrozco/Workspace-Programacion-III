defmodule SumaMatriz do

  def main do
    matriz = [[1,2,3], [4,2,2], [1,5,4]]
    total = sumar(matriz)
    IO.puts(total)
  end

  def sumar([]), do: 0

  def sumar([fila | resto]) do
    sumar_fila(fila) + sumar(resto)
  end

  def sumar_fila([]), do: 0

  def sumar_fila([cabeza | cola]) do
    cabeza + sumar_fila(cola)
  end

end

SumaMatriz.main
