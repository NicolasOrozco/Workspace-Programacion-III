defmodule ConversionTemperatura do

  def main do
    nombre = "Ingese su nombre: "
    |> Util.ingresar(:texto)
    temperatura_celsius = "Ingrese la temperatura en °C: "
    |> Util.ingresar(:real)
    temperatura_farenheit = conversion_farenheit(temperatura_celsius)
    temperatura_kelvin = conversion_kelvin(temperatura_celsius)
    generar_mensaje(nombre, temperatura_farenheit, temperatura_kelvin)
    |> Util.mostrar_mensaje()
  end

  def conversion_farenheit(temperatura_celsius) do
    convertida = ((temperatura_celsius * 9)/5) + 32
    :erlang.float_to_binary(convertida, decimals: 1)
  end

  def conversion_kelvin(temperatura_celsius) do
    convertida = temperatura_celsius + 273.15
    :erlang.float_to_binary(convertida, decimals: 1)
  end

  def generar_mensaje(nombre, temperatura_farenheit, temperatura_kelvin) do
    "#{nombre}, la temperatura es:\n-#{temperatura_farenheit} °F\n-#{temperatura_kelvin} °K "
  end

end

ConversionTemperatura.main()
