defmodule Estructuras do

  def main do
    "\nIngrese los datos del cliente: "
    |> Cliente.ingresar(:clientes)
    |> Cliente.generar_mensaje_clientes(&generar_mensaje/1)
    |> Util.mostrar_mensaje()
  end

  defp generar_mensaje(cliente) do
    altura = cliente.altura |> Float.round(2)
    "Bienvenido #{cliente.nombre}, tu edad es #{cliente.edad} años y tienes una altura de #{altura}\n"
  end

end

Estructuras.main()

#TAREA COMO MANEJAR EXCEPCIONES EN ELIXIR
