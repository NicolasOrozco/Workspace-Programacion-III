defmodule InventarioLibreria do

  def main() do
    titulo = "Ingrese el título del libro: "
      |> Util.ingresar(:texto)
    unidades_disponibles = "Ingrese la cantidad de unidades disponibles: "
      |> Util.ingresar(:entero)
    precio_unitario = "Ingrese el precio unitario: "
      |> Util.ingresar(:real)
    valor_total = calcular_valor_total(unidades_disponibles, precio_unitario)
    generar_mensaje(titulo, unidades_disponibles, valor_total)
    |> Util.mostrar_mensaje()
  end

  def calcular_valor_total(unidades_disponibles, precio_unitario) do
    unidades_disponibles*precio_unitario
  end

  def generar_mensaje(titulo, unidades_disponibles, valor_total) do
    #Función propia de erlang, agregada para convertir el valor real (entregado
    #predeterminadamente en notación científica) a notación decimal.
    valor_formateado = :erlang.float_to_binary(valor_total, decimals: 2)
    "El libro '#{titulo}' tiene #{unidades_disponibles} unidades disponibles, con un valor total de $#{valor_formateado}."
  end

end

InventarioLibreria.main()
