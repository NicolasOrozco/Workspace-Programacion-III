defmodule NumeroMayor do

  def main do
    #Input de ejemplo
    lista = [2,6,3,8]
    mayor = obtener_mayor(lista)
    IO.puts(mayor)
  end

  def obtener_mayor([x]), do: x

  def obtener_mayor(lista) do
    {izquierda, derecha} = Enum.split(lista, div(length(lista), 2))
    mayor_izquierda = obtener_mayor(izquierda)
    mayor_derecha = obtener_mayor(derecha)
    max(mayor_izquierda, mayor_derecha)
  end


end

NumeroMayor.main()
