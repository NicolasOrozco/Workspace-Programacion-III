defmodule Peaje do

  def main() do
    placa = "Ingrese la placa del vehiculo: "
    |> Util.ingresar(:texto)
    tipo = "Ingrese su tipo de vehiculo: "
    |> Util.ingresar(:texto)
    peso = "Ingrese el peso de su vehiculo en toneladas: "
    |> Util.ingresar(:real)
    tarifa_final = calcular_tarifa(tipo, peso)
    tupla_info = {placa, tipo, tarifa_final}
    generar_mensaje(tupla_info)
    |> Util.mostrar_mensaje()
  end

  def calcular_tarifa(tipo, peso) do
    case tipo do
      "carro" -> 10000
      "moto" -> 5000
      "camion" -> 20000 + (2000*(peso-75)) #Teniendo en cuenta que una mula pesa 75 toneladas aprox.
    end
  end

  def generar_mensaje({placa, tipo, tarifa_final}) do
    "Vehículo #{placa} (#{tipo}) debe pagar #{tarifa_final}"
  end

end

Peaje.main()
