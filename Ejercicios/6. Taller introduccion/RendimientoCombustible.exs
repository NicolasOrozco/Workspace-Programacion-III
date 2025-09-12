defmodule RendimientoCombustible do

  def main() do
    nombre_conductor = "Ingrese su nombre: "
      |> Util.ingresar(:texto)
    distancia_recorrida = "Ingrese la distancia recorrida en kilometros: "
      |> Util.ingresar(:real)
    combustible_consumido = "Ingrese el combustible consumido en litros: "
      |> Util.ingresar(:real)
    rendimiento = calcular_rendimiento(distancia_recorrida, combustible_consumido)
    generar_mensaje(nombre_conductor, rendimiento)
      |>Util.mostrar_mensaje()
  end

  def calcular_rendimiento(distancia_recorrida, combustible_consumido) do
    distancia_recorrida/combustible_consumido
  end

  def generar_mensaje(nombre_conductor,rendimiento) do
    rendimiento_formateado = :erlang.float_to_binary(rendimiento, decimals: 2)
    "Señor(a) #{nombre_conductor}, el rendimiento de su vehiculo es de #{rendimiento_formateado} km/L"
  end

end

RendimientoCombustible.main()
