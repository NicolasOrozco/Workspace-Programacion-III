defmodule Fibonacci do

  def main do
    numero = "Ingrese un entero: "
    |>Util.ingresar(:entero)
    resultado = hallar_fibonacci(numero)
    mensaje = generar_mensaje(numero, resultado)
    Util.mostrar_mensaje(mensaje)
  end

  def hallar_fibonacci(n) when n==1, do: 0

  def hallar_fibonacci(n) when n==2, do: 1

  def hallar_fibonacci(n) do
    hallar_fibonacci(n-1) + hallar_fibonacci(n-2)
  end

  def generar_mensaje(n, resultado) do
    "El #{n}° número en la sucesión de Fibonacci es: #{resultado}."
  end

end

Fibonacci.main()
