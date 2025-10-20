defmodule EntradaDatos do

  def main do
    "Ingrese nombre del empleado: "
    |> Util.ingresarGUI(:texto)
    |> generar_mensaje()
    |> Util.mostrar_mensajeGUI()
  end

  defp generar_mensaje(nombre) do
    "Bienvenido #{nombre} a la empresa Once Ltda"
  end

end

EntradaDatos.main()
