defmodule Tuplas  do
  def main do

    #Creación de tuplas
    mi_tupla = {:ok, "Éxito", 200}

    #Acceder a un elemento mediante el indice
    IO.puts(elem(mi_tupla, 2))

    #Agregar elementos
    nueva_tupla = put_elem(mi_tupla, 2, 404)
    IO.inspect(nueva_tupla)

  end
end

Tuplas.main()
