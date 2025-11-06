defmodule Laboratorio do
@moduledoc """
Modulo que multiplica la suma de los elementos
bajo la digonal de una matriz por el promedio
de elementos por encima de la diagonal
"""

  @doc """
  Lógica principal del programa
  """
  def main do
    matriz = [[1,2,3],
              [4,5,6],
              [7,8,9]]

    t1 = Task.async(fn -> suma_bajo_diagonal(matriz) end)
    t2 = Task.async(fn -> promedio_sobre_diagonal(matriz) end)

    a = Task.await(t1)
    IO.puts(a)
    b = Task.await(t2)
    IO.puts(b)
    c = a*b
    IO.puts(c)
  end

  def suma_bajo_diagonal(matriz) do
    suma_bajo_diagonal(matriz, 0, 0)
  end

  def suma_bajo_diagonal([], _, acc) do
    acc
  end

  def suma_bajo_diagonal([cabeza | cola], indice, acc) do
    suma_fila = cabeza
    |>Enum.take(indice)
    |>Enum.sum

    suma_bajo_diagonal(cola, indice+1,acc+suma_fila)
  end

  def promedio_sobre_diagonal(matriz) do
    promedio_sobre_diagonal(matriz, 1, 0, 0)
  end

  def promedio_sobre_diagonal([], _, acc, count) do
    acc/count
  end

  def promedio_sobre_diagonal([cabeza | cola], indice, acc, count) do
    operables = cabeza
    |>Enum.drop(indice)

    count_nuevo = length(operables)

    suma_fila = Enum.sum(operables)

    promedio_sobre_diagonal(cola, indice+1, acc+suma_fila, count+count_nuevo)
  end
end

Laboratorio.main()
