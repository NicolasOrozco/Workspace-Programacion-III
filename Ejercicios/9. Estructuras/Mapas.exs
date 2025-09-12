defmodule Mapas do

  def main do

    #Creacion de mapas
    mi_mapa0 = %{"nombre" => "Elixir", "version" => 1.15}
    IO.inspect(mi_mapa0)

    #Creacion de mapas con átomos como claves
    mi_mapa = %{nombre: "Elixir", version: 1.15}
    IO.inspect(mi_mapa)

    #Obtención de elementos
    IO.puts(Map.get(mi_mapa, :nombre))
    

  end

end

Mapas.main()
