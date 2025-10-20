defmodule SumaSucesiva do

  def main do
    numero = "Ingrese un entero: "
    |>Util.ingresar(:entero)
    resultado = sumar_sucesivo(numero)
    mensaje = generar_mensaje(numero, resultado)
    Util.mostrar_mensaje(mensaje)
  end

  def sumar_sucesivo(1), do: 1

  def sumar_sucesivo(n) do
    n + sumar_sucesivo(n-1)
  end

  def generar_mensaje(n, resultado) do
    "La suma de los números del 1 al #{n} es: #{resultado}."
  end

end

SumaSucesiva.main()
