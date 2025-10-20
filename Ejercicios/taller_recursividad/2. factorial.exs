defmodule Factorial do

  def main do
    numero = "Ingrese un entero: "
    |>Util.ingresar(:entero)
    resultado = calcular_factorial(numero)
    mensaje = generar_mensaje(numero, resultado)
    Util.mostrar_mensaje(mensaje)
  end

  def calcular_factorial(n) when n==1, do: 1

  def calcular_factorial(n) do
    n * calcular_factorial(n-1)
  end

  def generar_mensaje(n, resultado) do
    "El factorial de #{n} es: #{resultado}."
  end

end

Factorial.main()
