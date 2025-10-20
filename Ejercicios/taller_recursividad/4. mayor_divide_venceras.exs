defmodule NumeroMayor do

  def main do
    lista = [8,5,6,9,1,10]
    hallar_mayor(lista)
    |> IO.puts()
  end

  def hallar_mayor([x]), do: x

  def hallar_mayor(lista) do
    {izquierda, derecha} = Enum.split(lista, div(length(lista), 2))
    mayor_izquierda = hallar_mayor(izquierda)
    mayor_derecha = hallar_mayor(derecha)
    max(mayor_izquierda, mayor_derecha)
  end

end

NumeroMayor.main()
