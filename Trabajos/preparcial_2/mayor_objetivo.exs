defmodule MayorObjetivo do
  def main do
    lista = [3, 10, 5, 8, 1, 12]
    numero = 6
    resultado = contar_mayores(lista, numero)
    IO.puts("Hay #{resultado} numeros mayores que el #{numero}")
  end

  def contar_mayores([], _), do: 0

  def contar_mayores([cabeza | cola], numero) do
    if cabeza > numero do
      1 + contar_mayores(cola, numero)
    else
      contar_mayores(cola, numero)
    end
  end

end


MayorObjetivo.main()
