defmodule CostoEnvio do

  def main() do
    cliente = "Ingrese su nombre:"
    |> Util.ingresar(:texto)
    peso = "Ingrese el peso del paquete en kg: "
    |> Util.ingresar(:real)
    tipo_envio = "Ingrese el tipo de envío (Economico, Express, Internacional)"
    |> Util.ingresar(:texto)
    costo_total = calcular_costo(peso, tipo_envio)
    tupla_info = {cliente, peso, tipo_envio, costo_total}
    generar_mensaje(tupla_info)
    |> Util.mostrar_mensaje()
  end

  def calcular_costo(peso, tipo_envio) do
    case tipo_envio do
      "economico" ->  peso * 5000
      "express" -> peso * 8000
      "internacional" ->
        cond do
          peso <= 5 -> peso * 15000
          peso > 5 -> peso * 12000
      end
      _ -> 0
    end
  end

  def generar_mensaje({cliente, peso, tipo_envio, costo_total}) do
    "Estimado #{cliente}, para su paquete de #{peso} kg, con envío #{tipo_envio}, el costo total sería de #{costo_total}"
  end

end

CostoEnvio.main()
