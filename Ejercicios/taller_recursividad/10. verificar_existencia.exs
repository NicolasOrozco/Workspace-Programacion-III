defmodule VerificarExistencia do

  def main do
    lista = [45,23,46,12,3]
    numero = 23
    verificar_existencia(lista, numero)
    |> generar_mensaje
  end

  def verificar_existencia([x], n) when x != n, do: :false

  def verificar_existencia(lista, n) do
    [cabeza | cola] = lista
    if cabeza == n do
      :true
    else
      verificar_existencia(cola, n)
    end
  end

  def generar_mensaje(:true), do: IO.puts("El número está en la lista.")
  def generar_mensaje(:false), do: IO.puts("El número NO está en la lista.")

end

VerificarExistencia.main()
