defmodule Listas do
  def main do

    #Creacion de la lista
    IO.puts("CREACION DE LISTAS")
    comidas = ["Hamburguesa", "Burrito", "Papitas"]
    IO.inspect(comidas)
    IO.puts("\n")

    #Separación Cabeza/Cola
    IO.puts("SEPARACION CABEZA/COLA")
    [ h | t] = comidas
    IO.puts(h)
    IO.inspect(t)
    IO.puts("\n")

    #Agregar elementos a la cabeza
    IO.puts("AGREGAR ELEMENTOS A LA CABEZA (O(1))")
    comidas_nuevas = [ "Pizza" | comidas ]
    IO.inspect(comidas_nuevas)
    IO.puts("\n")

    #Agregar elementos a la cola
    IO.puts("AGREGAR ELEMENTOS A LA COLA (O(n))")
    comidas_nuevas1 = comidas ++ ["Spaghetti"]
    IO.inspect(comidas_nuevas1)
    IO.puts("\n")
  end
end

Listas.main()
