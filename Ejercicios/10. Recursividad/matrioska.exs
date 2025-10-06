defmodule Matrioska do

  def main do
    numero = "Добро пожаловать!\n Сколько матрёшек вы хотите?: "
    |> Util.ingresar(:entero)
    abrir_matrioska(numero)
  end

  def abrir_matrioska(numero) when numero == 0 do
    Util.mostrar_mensaje("Все матрёшки открыты!")
  end

  def abrir_matrioska(numero) do
    Util.mostrar_mensaje("Открытие матрёшки N° #{numero}")
    abrir_matrioska(numero-1)
    Util.mostrar_mensaje("Закрывающая матрешка N° #{numero}")
  end

end

Matrioska.main()
